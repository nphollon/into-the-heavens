module Graphics.View exposing (view)

import Dict exposing (Dict)
import Color
import Maybe.Extra as MaybeX
import List.Extra as ListX
import Html exposing (..)
import Html.Attributes as Attributes exposing (class)
import WebGL exposing (Drawable, Renderable)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Graphics.AppFrame as AppFrame
import Graphics.Foreground as Foreground
import Graphics.Camera as Camera
import Graphics.Format as Format
import Graphics.Explosion as Explosion
import Graphics.Hud as Hud
import Flight.Hostile as Hostile
import Flight.Spawn as Spawn


view : GameState -> Html a
view model =
    case getPlayer model.universe of
        Just player ->
            AppFrame.view
                [ scene 900 600 model player
                , log model
                ]
                [ dashboard model player
                , instructions
                ]

        Nothing ->
            AppFrame.view [] []


getPlayer : Dict Id Body -> Maybe PlayerData
getPlayer universe =
    Dict.get Spawn.playerId universe
        |> flip Maybe.andThen
            (\body ->
                case body.ai of
                    PlayerControlled cockpit ->
                        Just { body = body, cockpit = cockpit }

                    _ ->
                        Nothing
            )


scene : Int -> Int -> GameState -> PlayerData -> Html a
scene width height model player =
    let
        functionCalls =
            [ WebGL.Enable WebGL.CullFace, WebGL.Enable WebGL.DepthTest ]

        attributes =
            [ Attributes.width width, Attributes.height height ]

        aspect =
            toFloat width / toFloat height

        renderables =
            (drawWorld aspect model player)
                ++ (Hud.draw aspect model player)
    in
        WebGL.toHtmlWith functionCalls attributes renderables


drawWorld : Float -> GameState -> PlayerData -> List Renderable
drawWorld aspect model player =
    let
        camera =
            Camera.at aspect player.body

        body =
            flip Dict.get model.universe

        mesh =
            flip Dict.get model.library.meshes

        draw object =
            case object of
                Background meshName ->
                    drawBackground camera (mesh meshName)

                Object { bodyId, meshName, shader } ->
                    drawObject shader camera (body bodyId) (mesh meshName)

                Explosion { bodyId, meshName } ->
                    drawExplosion camera (body bodyId) (mesh meshName)

        drawFromAi body =
            case body.ai of
                Hostile cockpit ->
                    Hostile.draw camera model.library body

                _ ->
                    []
    in
        (List.concatMap draw model.graphics)
            ++ (List.concatMap drawFromAi (Dict.values model.universe))


drawBackground : Camera -> Maybe (Drawable Vertex) -> List Renderable
drawBackground camera mesh =
    let
        p =
            placement camera.position Quaternion.identity
    in
        Maybe.map (Foreground.entity (Bright Color.lightBlue) p camera) mesh
            |> MaybeX.maybeToList


drawObject : ShaderType -> Camera -> Maybe Body -> Maybe (Drawable Vertex) -> List Renderable
drawObject shader camera body mesh =
    Maybe.map2 (\b m -> Foreground.entity shader (objectPlacement b) camera m)
        body
        mesh
        |> MaybeX.maybeToList


drawExplosion : Camera -> Maybe Body -> Maybe (Drawable Vertex) -> List Renderable
drawExplosion camera body mesh =
    Maybe.map2
        (\b m ->
            Explosion.entity (percentCountdown b) (objectPlacement b) camera m
        )
        body
        mesh
        |> MaybeX.maybeToList


objectPlacement : Body -> Mat4
objectPlacement object =
    placement object.position object.orientation


placement : Vector -> Quaternion -> Mat4
placement position orientation =
    Mat4.mul (Mat4.makeTranslate (Vector.toVec3 position))
        (Quaternion.toMat4 orientation)


percentCountdown : Body -> Float
percentCountdown object =
    case object.ai of
        Waiting x ->
            x / 3.0

        _ ->
            0.5


log : GameState -> Html a
log model =
    let
        lineHtml ( timestamp, message ) =
            p [] [ text message ]

        cutoffTime =
            model.gameTime - 6
    in
        model.log
            |> ListX.takeWhile (\( t, _ ) -> t > cutoffTime)
            |> List.reverse
            |> List.map lineHtml
            |> div [ class "log" ]


dashboard : GameState -> PlayerData -> Html a
dashboard model player =
    let
        printNumber label value =
            Format.float value
                |> Format.tag label
                |> text

        printInt label value =
            toString value
                |> Format.tag label
                |> text

        shipPosition =
            player.body.position

        speed =
            Vector.length player.body.velocity
    in
        div [ class "dashboard" ]
            [ p [] [ printInt "Visitors Destroyed" model.score ]
            , p [] [ printNumber "Speed" speed ]
            , p [] [ printNumber "X" shipPosition.x ]
            , p [] [ printNumber "Y" shipPosition.y ]
            , p [] [ printNumber "Z" shipPosition.z ]
            ]


instructions : Html a
instructions =
    div [ class "dashboard" ]
        [ h3 []
            [ text "Keyboard Controls"
            ]
        , ul []
            [ li [] [ text "Turn Camera : A / D / W / S" ]
            , li [] [ text "Thrust Forward : I" ]
            , li [] [ text "Brake : K" ]
            , li [] [ text "Fire Missile : J" ]
            , li [] [ text "Raise Shields : H" ]
            , li [] [ text "Target Ship : L" ]
            ]
        ]
