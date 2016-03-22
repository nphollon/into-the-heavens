module Graphics.View (view) where

import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import List.Extra as ListX
import Html exposing (..)
import Html.Attributes exposing (class)
import WebGL exposing (Drawable, Renderable)
import Types exposing (..)
import Math.Vector as Vector
import Math.Matrix as Matrix exposing (Matrix)
import Math.Transform as Transform
import Flight.Util as Util
import Graphics.Background as Background
import Graphics.Foreground as Foreground
import Graphics.Static as Static
import Graphics.Camera as Camera
import Graphics.Format as Format
import Graphics.Explosion as Explosion
import Frame


view : Signal.Address Update -> GameState -> Html
view address model =
  Frame.view
    [ scene 900 600 model
    , log model
    ]
    [ dashboard model
    , instructions
    ]


scene : Int -> Int -> GameState -> Html
scene width height model =
  let
    aspect =
      toFloat width / toFloat height

    player =
      Util.getPlayer model.universe

    camera =
      Camera.at aspect player.body

    body name =
      Dict.get name model.universe

    mesh name =
      Dict.get name model.library

    draw object =
      case object of
        Background meshName ->
          drawBackground camera (mesh meshName)

        Object { bodyName, meshName, shader } ->
          drawObject shader camera (body bodyName) (mesh meshName)

        Explosion { bodyName, meshName } ->
          drawExplosion camera (body bodyName) (mesh meshName)

        Reticule meshName ->
          Maybe.map
            (Static.entity (Camera.ortho aspect))
            (mesh meshName)
            |> MaybeX.maybeToList

        Target meshName ->
          MaybeX.map2
            (\b -> Foreground.entity NoLighting (decorPlacement b camera) camera)
            (body player.cockpit.target)
            (mesh meshName)
            |> MaybeX.maybeToList

        Highlight { filter, meshName } ->
          Maybe.map
            (\m ->
              Dict.values model.universe
                |> List.filter filter
                |> List.map
                    (\b ->
                      Foreground.entity NoLighting (decorPlacement b camera) camera m
                    )
            )
            (mesh meshName)
            |> Maybe.withDefault []

        Shield meshName ->
          if player.cockpit.shields.on then
            Maybe.map
              (Static.entity (Camera.ortho aspect))
              (mesh meshName)
              |> MaybeX.maybeToList
          else
            []

    webgl =
      WebGL.webglWithConfig
        [ WebGL.Enable WebGL.CullFace
        , WebGL.Enable WebGL.DepthTest
        ]
        ( width, height )
  in
    List.concatMap draw model.graphics
      |> webgl
      |> Html.fromElement


drawBackground : Camera -> Maybe (Drawable Vertex) -> List Renderable
drawBackground camera mesh =
  Maybe.map (Background.entity camera) mesh
    |> MaybeX.maybeToList


drawObject : ShaderType -> Camera -> Maybe Body -> Maybe (Drawable Vertex) -> List Renderable
drawObject shader camera body mesh =
  MaybeX.map2
    (\b m -> Foreground.entity shader (objectPlacement b) camera m)
    body
    mesh
    |> MaybeX.maybeToList


drawExplosion : Camera -> Maybe Body -> Maybe (Drawable Vertex) -> List Renderable
drawExplosion camera body mesh =
  MaybeX.map2
    (\b m ->
      Explosion.entity (percentCountdown b) (objectPlacement b) camera m
    )
    body
    mesh
    |> MaybeX.maybeToList


objectPlacement : Body -> Matrix
objectPlacement object =
  Transform.placement
    1
    object.position
    object.orientation


percentCountdown : Body -> Float
percentCountdown object =
  case object.ai of
    Waiting x ->
      x / 3.0

    _ ->
      0.5


decorPlacement : Body -> Camera -> Matrix
decorPlacement object camera =
  let
    direction =
      Vector.direction object.position camera.position

    position =
      Vector.scale 0.1 direction
        |> Vector.add camera.position
  in
    Transform.rotationFor (Vector.vector 0 0 1) direction
      |> Transform.placement 1.0e-2 position


log : GameState -> Html
log model =
  let
    lineHtml ( timestamp, message ) =
      p [] [ text message ]

    cutoffTime =
      model.gameTime - 3
  in
    model.log
      |> ListX.takeWhile (\( t, _ ) -> t > cutoffTime)
      |> List.reverse
      |> List.map lineHtml
      |> div [ class "log" ]


dashboard : GameState -> Html
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

    printPercent label value =
      printInt label (Format.percent value)

    player =
      Util.getPlayer model.universe

    shipPosition =
      player.body.position
  in
    div
      [ class "dashboard" ]
      [ p [] [ printInt "Visitors Destroyed" model.score ]
      , p [] [ printPercent "Shield Power" player.cockpit.shields.value ]
      , p [] [ printNumber "X" shipPosition.x ]
      , p [] [ printNumber "Y" shipPosition.y ]
      , p [] [ printNumber "Z" shipPosition.z ]
      ]


instructions : Html
instructions =
  div
    [ class "dashboard" ]
    [ h3
        []
        [ text "Keyboard Controls"
        ]
    , ul
        []
        [ li [] [ text "Turn Camera : A / D / W / S" ]
        , li [] [ text "Thrust Forward : I" ]
        , li [] [ text "Brake : K" ]
        , li [] [ text "Fire Missile : J" ]
        , li [] [ text "Raise Shields : H" ]
        , li [] [ text "Target Ship : L" ]
        ]
    ]
