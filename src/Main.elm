module Main where

import Graphics.Element as Layout
import Signal
import Time
import Keyboard
import Set
import Char

import AnimationFrame
import Math.Vector3 as Vec3
import Math.Matrix4 as Mat4

import Graphics
import Grid
import Constellation
import Scatter
import Planet
import Infix exposing (..)

main : Signal Layout.Element
main =
  let
    startModel =
      { orientation = Mat4.identity
      , position = Vec3.vec3 0 0 0
      , action = inaction
      }
    model =
      Signal.foldp update startModel signal
  in
    Signal.map view model


type alias Model =
  { orientation : Mat4.Mat4
  , position : Vec3.Vec3
  , action : Action
  }


type Update =
  KeyPress Action | TimeDelta Float


type alias Action =
  { forward : Bool
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


inaction : Action
inaction =
  { forward = False
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
        ' ' ->
          { action | forward <- True }
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
      Mat4.transform newOrientation (Vec3.vec3 0 0 0.01)

    newPosition =
      if action.forward
      then Vec3.add model.position thrust
      else model.position
  in
    { model
    | orientation <- newOrientation
    , position <- newPosition
    }


view : Model -> Layout.Element
view model =
  let
    dimensions =
      (600, 600)

    aspect =
      uncurry (./.) dimensions

    skyUniform =
      { perspective = Mat4.makePerspective 90 aspect 0.1 70
      , placement = Mat4.transpose model.orientation
      }

    planetUniform =
      { skyUniform 
      | placement <- Mat4.translate model.position skyUniform.placement }
  in
    Graphics.render dimensions
      [ Constellation.crux skyUniform
      , Constellation.ursaMajor skyUniform
      , Constellation.aquarius skyUniform
      , Scatter.scatter 100 skyUniform
      , Planet.planet planetUniform
      , Grid.grid 2 4 skyUniform
      ]
      