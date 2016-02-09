module Flight.View (..) where

import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (class)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL exposing (Drawable)
import Flight.Background as Background
import Flight.World as World exposing (Object(..), Camera)
import String
import Maybe.Extra as MaybeX
import Update exposing (Update, Data)
import Math.Mechanics as Mech exposing (Body, State)
import Mesh exposing (Vertex)
import Frame
import Math.Vector as Vector


view : Signal.Address Update -> Data -> Html
view address model =
  Frame.view
    [ scene 900 600 model.universe model.lib ]
    [ dashboard model.universe
    , instructions
    ]


scene : Int -> Int -> State -> Dict String (Drawable Vertex) -> Html
scene width height universe lib =
  let
    aspect =
      (toFloat width) / (toFloat height)

    camera =
      Maybe.map (cameraAt aspect) (Mech.body "ship" universe)

    background meshName =
      MaybeX.map2 Background.toEntity camera (Dict.get meshName lib)

    model bodyName meshName shader =
      MaybeX.map3
        (objectPlacement >> World.toEntity shader)
        (Mech.body bodyName universe)
        camera
        (Dict.get meshName lib)
  in
    List.filterMap
      identity
      [ background "Background"
      , model "other" "Ship" Ship
      , model "planet" "Sphere" Planet
      ]
      |> WebGL.webgl ( width, height )
      |> Html.fromElement


objectPlacement : Body -> Mat4
objectPlacement object =
  placement
    (Vec3.fromRecord object.position)
    (Vec3.fromRecord object.orientation)


cameraAt : Float -> Body -> Camera
cameraAt aspect object =
  { perspective = Mat4.makePerspective 60 aspect 0.1 1000.0
  , cameraPosition = Vec3.fromRecord object.position
  , cameraOrientation =
      placement (Vec3.vec3 0 0 0) (Vec3.fromRecord object.orientation)
        |> Mat4.transpose
  }


placement : Vec3 -> Vec3 -> Mat4
placement position orientation =
  if Vec3.length orientation == 0 then
    Mat4.makeTranslate position
  else
    Mat4.makeTranslate position
      |> Mat4.rotate (Vec3.length orientation) orientation


dashboard : State -> Html
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
