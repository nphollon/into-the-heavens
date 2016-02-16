module Flight.View (view) where

import String
import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import Html exposing (..)
import Html.Attributes exposing (class)
import WebGL exposing (Drawable)
import Types exposing (..)
import Math.Vector as Vector
import Math.Matrix as Matrix exposing (Matrix)
import Flight.Background as Background
import Flight.Foreground as Foreground
import Frame


view : Signal.Address Update -> GameState -> Html
view address model =
  Frame.view
    [ scene 900 600 model ]
    [ dashboard model.bodies
    , instructions
    ]


scene : Int -> Int -> GameState -> Html
scene width height { bodies, library } =
  let
    camera =
      Dict.values bodies
        |> List.map selectCamera
        |> Maybe.oneOf
        |> Maybe.map (cameraData (toFloat width / toFloat height))

    draw body =
      case body.bodyType of
        Background { meshName } ->
          MaybeX.map2 Background.entity camera (Dict.get meshName library)

        Inert { meshName, shader } ->
          MaybeX.map2
            (Foreground.entity shader (objectPlacement body.geometry))
            camera
            (Dict.get meshName library)

        Active { meshName, shader } ->
          MaybeX.map2
            (Foreground.entity shader (objectPlacement body.geometry))
            camera
            (Dict.get meshName library)

        Camera _ ->
          Nothing

    webgl =
      WebGL.webglWithConfig
        [ WebGL.Enable WebGL.CullFace
        , WebGL.Enable WebGL.DepthTest
        ]
        ( width, height )
  in
    Dict.values bodies
      |> List.filterMap draw
      |> webgl
      |> Html.fromElement


objectPlacement : Geometry -> Matrix
objectPlacement geometry =
  Matrix.placement geometry.position geometry.orientation


selectCamera : Body -> Maybe Geometry
selectCamera body =
  case body.bodyType of
    Camera _ ->
      Just body.geometry

    otherwise ->
      Nothing


cameraData : Float -> Geometry -> CameraData
cameraData aspect object =
  { perspective = Matrix.perspective aspect
  , position = object.position
  , orientation =
      Matrix.placement (Vector.vector 0 0 0) object.orientation
        |> Matrix.transpose
  }


dashboard : Dict String Body -> Html
dashboard bodies =
  let
    printNumber label value =
      let
        sign =
          if value > -5.0e-3 then
            "+"
          else
            "-"

        intPart =
          floor (abs value)

        centPart =
          round (100 * abs value) - (100 * intPart)

        decimal =
          if centPart < 10 then
            ".0"
          else
            "."
      in
        [ label, ": ", sign, toString intPart, decimal, toString centPart ]
          |> String.concat
          |> text

    shipPosition =
      Dict.get "player" bodies
        |> MaybeX.mapDefault (Vector.vector 0 0 0) (.geometry >> .position)
  in
    div
      [ class "dashboard" ]
      [ p [] [ printNumber "X" shipPosition.x ]
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
        [ li [] [ text "Thrust Forward : I" ]
        , li [] [ text "Brake : M" ]
        , li [] [ text "Turn Camera : A / D / W / S / Q / E" ]
        ]
    ]
