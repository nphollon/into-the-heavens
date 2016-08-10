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
import Library
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Graphics.AppFrame as AppFrame
import Graphics.Foreground as Foreground
import Graphics.Camera as Camera
import Graphics.Format as Format
import Graphics.Hud as Hud
import Flight.Hostile as Hostile
import Flight.Explosion as Explosion
import Flight.Seeking as Seeking
import Flight.Dumb as Dumb
import Flight.PlayerBullet as PlayerBullet
import Flight.Mechanics as Mechanics


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
    Dict.get Mechanics.playerId universe
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

        background =
            drawBackground camera
                (Library.getMesh "Background" model.library)

        drawFromAi body =
            case body.ai of
                Hostile _ ->
                    Hostile.draw camera model.library body

                Seeking _ ->
                    Seeking.draw camera model.library body

                Explosion lifespan ->
                    Explosion.draw camera model.library body lifespan

                Dumb graphics ->
                    Dumb.draw camera model.library body graphics

                PlayerBullet _ ->
                    PlayerBullet.draw camera model.library body

                PlayerControlled _ ->
                    []
    in
        background :: (List.concatMap drawFromAi (Dict.values model.universe))


drawBackground : Camera -> Drawable Vertex -> Renderable
drawBackground camera mesh =
    let
        p =
            placement camera.position Quaternion.identity
    in
        Foreground.entity (Bright Color.lightBlue) p camera mesh


drawObject : ShaderType -> Camera -> Maybe Body -> Maybe (Drawable Vertex) -> List Renderable
drawObject shader camera body mesh =
    Maybe.map2 (\b m -> Foreground.entity shader (objectPlacement b) camera m)
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
