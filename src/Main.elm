module Main where

import Graphics.Element as Layout
import Signal
import Time
import Keyboard

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
    startState =
      { orientation = Mat4.identity
      }

    model =
      Signal.foldp update startState signal
  in
    Signal.map view model


type alias Model =
  { orientation : Mat4.Mat4
  }


type alias Action =
  { x : Int
  , y : Int
  }


signal : Signal Action
signal =
  Signal.sampleOn (Time.every (20 * Time.millisecond)) Keyboard.wasd


update : Action -> Model -> Model
update action model =
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
      