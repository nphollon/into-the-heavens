module Main where

import Graphics.Element as Layout
import Signal
import Time
import Keyboard
import Set
import Char
import Text

import AnimationFrame
import Math.Vector3 as Vec3
import Math.Matrix4 as Mat4

import Graphics
import Grid
import Constellation
import Scatter
import Infix exposing (..)

main : Signal Layout.Element
main =
  let
    startModel =
      { orientation = Mat4.identity
      , position = Vec3.vec3 0 0 0
      , action = inaction
      , message = "Hello Jupiter!"
      }
    model =
      Signal.foldp update startModel signal
  in
    Signal.map view model


type alias Model =
  { orientation : Mat4.Mat4
  , position : Vec3.Vec3
  , action : Action
  , message : String
  }


type Update =
  KeyPress Action | TimeDelta Float


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


signal : Signal Update
signal =
  Signal.merge keysDown sample


sample : Signal Update
sample =
  Signal.map TimeDelta AnimationFrame.frame


keysDown : Signal Update
keysDown =
  let
    keyAct key action =
      case (Char.fromCode key) of
        'D' ->
          { action | yaw <- action.yaw - 1 }
        'A' ->
          { action | yaw <- action.yaw + 1 }
        'S' ->
          { action | pitch <- action.pitch - 1 }
        'W' ->
          { action | pitch <- action.pitch + 1 }
        'Q' ->
          { action | roll <- action.roll - 1 }
        'E' ->
          { action | roll <- action.roll + 1 }
        'I' ->
          { action | thrust <- action.thrust + 1 }
        'M' ->
          { action | thrust <- action.thrust - 1 }
        otherwise ->
          action

    fullAction =
      Set.foldl keyAct inaction >> KeyPress
  in
    Signal.map fullAction Keyboard.keysDown


update : Update -> Model -> Model
update update model =
  case update of
    KeyPress newAction ->
      { model | action <- newAction }
    TimeDelta _ ->
      move model.action model


move : Action -> Model -> Model
move action model =
  let
    delta =
      degrees 3

    newOrientation =
      model.orientation
      |> Mat4.rotate (action.pitch .* delta) (Vec3.vec3 1 0 0)
      |> Mat4.rotate (action.yaw .* delta) (Vec3.vec3 0 1 0)
      |> Mat4.rotate (action.roll .* delta) (Vec3.vec3 0 0 1)

    thrust =
      Vec3.vec3 0 0 (action.thrust .* 0.1)

    newPosition =
      Mat4.transform newOrientation thrust
      |> Vec3.add model.position 
  in
    { model
    | orientation <- newOrientation
    , position <- newPosition
    }


view : Model -> Layout.Element
view model =
  let
    sceneWidth = 600
    height = 600
    textBoxWidth = 200
    
  in
    Layout.flow Layout.right
            [ scene sceneWidth height model
            , textBox model textBoxWidth height
            ]


scene : Int -> Int -> Model -> Layout.Element
scene width height model =
  let
    aspect =
      width ./. height

    uniform =
      { perspective = Mat4.makePerspective 100 aspect 0.01 210
      , cameraPosition = model.position
      , cameraOrientation = Mat4.transpose model.orientation
      }

    unit = 10

    body r xyz =
      Graphics.place (Vec3.scale unit (Vec3.fromTuple xyz)) (r * unit) uniform
           
  in
    Graphics.render (width, height)
      [ Constellation.crux uniform
      , Constellation.ursaMajor uniform
      , Constellation.aquarius uniform
      , Scatter.scatter 100 uniform
      , Grid.grid 0 2 uniform
      , Graphics.planet (body 1 (0, -10, -5)) {-Jupiter-}
      , Graphics.moon (body 0.02606 (0, -3.968, -5)) {-Io-}
      , Graphics.moon (body 0.02233 (0, -0.404, -5)) {-Europa-}
      , Graphics.moon (body 0.03768 (0, 5.31, -5)) {-Ganymede-}
      , Graphics.moon (body 0.03447 (0, 16.93, -5)) {-Callisto-}
      ]


textBox : Model -> Int -> Int -> Layout.Element
textBox model width height =
  Text.fromString model.message
    |> Layout.rightAligned
    |> Layout.size width height
