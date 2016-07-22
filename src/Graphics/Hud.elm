module Graphics.Hud exposing (draw)

import Dict
import Color
import Maybe.Extra as MaybeX
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL exposing (Renderable, Drawable)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform
import Math.Quaternion as Quaternion exposing (Quaternion)
import Flight.Util as Util
import Graphics.Camera as Camera
import Graphics.Flat as Flat
import Graphics.Foreground as Foreground
import Graphics.Guides as Guides


draw : Int -> Int -> GameState -> List Renderable
draw width height model =
    let
        aspect =
            toFloat width / toFloat height

        player =
            Util.getPlayer model.universe

        perspectiveCamera =
            Camera.at aspect player.body

        orthoCamera =
            Camera.ortho aspect

        highlight mesh color body =
            Foreground.entity (Bright color)
                (decorPlacement body perspectiveCamera)
                perspectiveCamera
                mesh

        body =
            flip Util.fromId model

        crosshair =
            [ Flat.entity orthoCamera Guides.crosshair ]

        shield =
            Flat.bar player.cockpit.shields.value orthoCamera Guides.bar
                :: (if player.cockpit.shields.on then
                        [ Flat.entity orthoCamera Guides.shield ]
                    else
                        []
                   )

        target =
            body player.cockpit.target
                |> MaybeX.maybeToList
                |> List.map (highlight Guides.target Color.blue)

        decorateGroup mesh color filter =
            Dict.values model.universe
                |> List.filter filter
                |> List.map (highlight mesh color)
    in
        List.concat
            [ crosshair
            , shield
            , target
            , decorateGroup Guides.incoming Color.red Util.isSeekingPlayer
            , decorateGroup Guides.targetable Color.blue Util.isVisitor
            ]


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


placement : Vector -> Quaternion -> Mat4
placement position orientation =
    Mat4.mul (Mat4.makeTranslate (Vector.toVec3 position))
        (Quaternion.toMat4 orientation)
