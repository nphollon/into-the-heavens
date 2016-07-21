module Graphics.View exposing (view)

import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import List.Extra as ListX
import Color
import Html exposing (..)
import Html.Attributes as Attributes exposing (class)
import WebGL exposing (Drawable, Renderable)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Math.Transform as Transform
import Flight.Util as Util
import Graphics.AppFrame as AppFrame
import Graphics.Foreground as Foreground
import Graphics.Flat as Flat
import Graphics.Camera as Camera
import Graphics.Format as Format
import Graphics.Explosion as Explosion


view : GameState -> Html a
view model =
    AppFrame.view
        [ scene 900 600 model
        , log model
        ]
        [ dashboard model
        , instructions
        ]


scene : Int -> Int -> GameState -> Html a
scene width height model =
    let
        aspect =
            toFloat width / toFloat height

        player =
            Util.getPlayer model.universe

        camera =
            Camera.at aspect player.body

        body =
            flip Util.fromId model

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

                Reticule meshName ->
                    Maybe.map (Flat.entity (Camera.ortho aspect))
                        (mesh meshName)
                        |> MaybeX.maybeToList

                Target meshName ->
                    Maybe.map2
                        (\b ->
                            Foreground.entity (Bright Color.blue)
                                (decorPlacement b camera)
                                camera
                        )
                        (body player.cockpit.target)
                        (mesh meshName)
                        |> MaybeX.maybeToList

                Highlight { filter, meshName, color } ->
                    Maybe.map
                        (\m ->
                            Dict.values model.universe
                                |> List.filter filter
                                |> List.map
                                    (\b ->
                                        Foreground.entity (Bright color)
                                            (decorPlacement b camera)
                                            camera
                                            m
                                    )
                        )
                        (mesh meshName)
                        |> Maybe.withDefault []

                Shield shieldMesh energyBarMesh ->
                    drawShieldSystem player.cockpit.shields
                        (Camera.ortho aspect)
                        (mesh shieldMesh)
                        (mesh energyBarMesh)
    in
        WebGL.toHtmlWith [ WebGL.Enable WebGL.CullFace, WebGL.Enable WebGL.DepthTest ]
            [ Attributes.width width, Attributes.height height ]
            (List.concatMap draw model.graphics)


drawShieldSystem : DrainSwitch -> Camera -> Maybe (Drawable Vertex) -> Maybe (Drawable Vertex) -> List Renderable
drawShieldSystem switch camera shieldMesh barMesh =
    case ( switch.on, shieldMesh, barMesh ) of
        ( True, Just shield, Just bar ) ->
            [ Flat.entity camera shield
            , Flat.bar switch.value camera bar
            ]

        ( _, _, Just bar ) ->
            [ Flat.bar switch.value camera bar ]

        _ ->
            []


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


decorPlacement : Body -> Camera -> Mat4
decorPlacement object camera =
    let
        direction =
            Vector.direction object.position camera.position
                |> Maybe.withDefault (Vector.vector 0 0 0)

        position =
            Vector.scale 0.1 direction
                |> Vector.add camera.position
    in
        Transform.rotationFor (Vector.vector 0 0 1) direction
            |> placement position
            |> Mat4.scale3 1.0e-2 1.0e-2 1.0e-2


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


dashboard : GameState -> Html a
dashboard model =
    let
        printNumber label value =
            Format.float value
                |> Format.tag label
                |> text

        printInt label value =
            toString value
                |> Format.tag label
                |> text

        player =
            Util.getPlayer model.universe

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
