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
import Math.Mechanics as Mech
import Frame


view : Signal.Address Update -> GameState -> Html
view address model =
  Frame.view
    [ scene 900 600 model ]
    [ dashboard model.universe
    , instructions
    ]


scene : Int -> Int -> GameState -> Html
scene width height { universe, library, graphics } =
  let
    camera =
      Maybe.map
        (cameraAt (toFloat width / toFloat height))
        (Mech.body "ship" universe)

    draw object =
      case object of
        Background meshName ->
          MaybeX.map2 Background.entity camera (Dict.get meshName library)

        Object { bodyName, meshName, shader } ->
          MaybeX.map3
            (objectPlacement >> Foreground.entity shader)
            (Mech.body bodyName universe)
            camera
            (Dict.get meshName library)

    webgl =
      WebGL.webglWithConfig
        [ WebGL.Enable WebGL.CullFace
        , WebGL.Enable WebGL.DepthTest
        ]
        ( width, height )
  in
    List.filterMap draw graphics
      |> webgl
      |> Html.fromElement


objectPlacement : Body -> Matrix
objectPlacement object =
  Matrix.placement object.position object.orientation


cameraAt : Float -> Body -> Camera
cameraAt aspect object =
  { perspective = Matrix.perspective aspect
  , position = object.position
  , orientation =
      Matrix.placement (Vector.vector 0 0 0) object.orientation
        |> Matrix.transpose
  }


dashboard : Dict String Body -> Html
dashboard universe =
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
      Mech.body "ship" universe
        |> MaybeX.mapDefault (Vector.vector 0 0 0) .position
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
