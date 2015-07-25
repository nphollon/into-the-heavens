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
      , action = inaction
      }
    model =
      Signal.foldp update startModel signal
  in
    Signal.map view model


type alias Model =
  { orientation : Mat4.Mat4
  , action : Action
  }


type Update =
  KeyPress Action | TimeDelta Float


type alias Action =
  { x : Int
  , y : Int
  }


inaction : Action
inaction =
  { x = 0, y = 0 }


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
        'A' ->
          { action | x <- action.x - 1 }
        'D' ->
          { action | x <- action.x + 1 }
        'S' ->
          { action | y <- action.y - 1 }
        'W' ->
          { action | y <- action.y + 1 }
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

    xAxis =
      Vec3.vec3 1 0 0

    yAxis =
      Vec3.vec3 0 1 0

    newOrientation =
      model.orientation
      |> Mat4.rotate (action.y .* delta) xAxis
      |> Mat4.rotate (negate action.x .* delta) yAxis
  in
    { model | orientation <- newOrientation }


view : Model -> Layout.Element
view model =
  let
    dimensions =
      (600, 600)

    aspect =
      uncurry (./.) dimensions

    uniform =
      { perspective = Mat4.makePerspective 90 aspect 0.1 70
      , placement = Mat4.transpose model.orientation
      }
  in
    Graphics.render dimensions
      [ Constellation.crux uniform
      , Constellation.ursaMajor uniform
      , Constellation.aquarius uniform
      , Scatter.scatter 100 uniform
      , Planet.planet uniform
      , Grid.grid 2 4 uniform
      ]
      