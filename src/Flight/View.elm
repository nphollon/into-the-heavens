module Flight.View (..) where

import Dict
import Html exposing (..)
import Html.Attributes exposing (class)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL
import Flight.Background as Background
import Flight.World as World exposing (Object(..))
import String
import Maybe.Extra as MaybeX
import Update exposing (Update, Data)
import Math.Mechanics exposing (Body)
import Mesh
import Frame


view : Signal.Address Update -> Data -> Html
view address model =
  let
    bodies =
      MaybeX.map3
        (,,)
        (Dict.get "ship" model.universe.bodies)
        (Dict.get "planet" model.universe.bodies)
        (Dict.get "other" model.universe.bodies)
  in
    case bodies of
      Just ( ship, planet, other ) ->
        Frame.view
          [ scene 900 600 ship planet other model.resources ]
          [ dashboard ship
          , instructions
          ]

      Nothing ->
        Frame.view [] []


scene : Int -> Int -> Body -> Body -> Body -> Mesh.Response -> Html
scene width height ship planet other resources =
  let
    aspect =
      (toFloat width) / (toFloat height)

    objectPlacement object =
      placement
        (Vec3.fromRecord object.position)
        (Vec3.fromRecord object.orientation)

    cameraOrientation =
      placement (Vec3.vec3 0 0 0) (Vec3.fromRecord ship.orientation)
        |> Mat4.transpose

    camera =
      { perspective = Mat4.makePerspective 60 aspect 0.1 1000.0
      , cameraPosition = Vec3.fromRecord ship.position
      , cameraOrientation = cameraOrientation
      }

    entities =
      case resources of
        Mesh.Success lib ->
          Dict.toList lib
            |> List.map
                (\( name, mesh ) ->
                  if name == "Background" then
                    Background.toEntity mesh camera
                  else if name == "Sphere" then
                    World.toEntity Planet mesh (objectPlacement planet) camera
                  else
                    World.toEntity Ship mesh (objectPlacement other) camera
                )

        otherwise ->
          []
  in
    WebGL.webgl ( width, height ) entities
      |> Html.fromElement


placement : Vec3 -> Vec3 -> Mat4
placement position orientation =
  if Vec3.length orientation == 0 then
    Mat4.makeTranslate position
  else
    Mat4.makeTranslate position
      |> Mat4.rotate (Vec3.length orientation) orientation


dashboard : Body -> Html
dashboard ship =
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
  in
    div
      [ class "dashboard" ]
      [ p [] [ printNumber "X" ship.position.x ]
      , p [] [ printNumber "Y" ship.position.y ]
      , p [] [ printNumber "Z" ship.position.z ]
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
