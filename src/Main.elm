module Main where

import Graphics.Element as Layout
import Signal
import Time
import Keyboard
import Set
import Char
import Text
import Dict exposing (Dict)
import Maybe

import AnimationFrame
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)

import Graphics
import Grid
import Constellation
import Scatter
import World exposing (World, WorldStyle(..))
import Infix exposing (..)
import Triple exposing (Triple)

import Debug

main : Signal Layout.Element
main =
  let
    model =
      Signal.foldp update startModel signal
  in
    Signal.map view model


type alias Model =
  { orientation : Mat4
  , position : Vec3
  , action : Action
  , message : String
  , worlds : Dict String World
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


startModel : Model
startModel =
  { orientation = Mat4.identity
  , position = Vec3.vec3 0 0 0
  , action = inaction
  , message = "Hello Jupiter!"
  , worlds =
    Dict.fromList
          [ ("Jupiter", World.world Planet 10 (0, -100, -50))
          , ("Io", World.world Moon 0.2606 (0, -39.68, -50))
          , ("Europa", World.world Moon 0.2233 (0, -4.04, -50))
          , ("Ganymede", World.world Moon 0.3768 (0, 53.1, -50))
          , ("Callisto", World.world Moon 0.3447 (0, 169.3, -50))
          ]
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
          { action | thrust <- action.thrust - 1 }
        'M' ->
          { action | thrust <- action.thrust + 1 }
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
      Vec3.vec3 0 0 (action.thrust .* 0.2)

    newPosition =
      Mat4.transform newOrientation thrust
      |> Vec3.add model.position

    isNearJupiter =
      Dict.get "Jupiter" model.worlds
        |> Maybe.map .position
        |> Maybe.map (Vec3.distance newPosition)
        |> Maybe.map (\x -> x < 25)
        |> Maybe.withDefault False

    newMessage =
      if isNearJupiter then "Hello Jupiter!" else "So lonely..."
  in
    { model
    | orientation <- newOrientation
    , position <- newPosition
    , message <- newMessage
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

    camera =
      { perspective = Mat4.makePerspective 100 aspect 0.01 210
      , cameraPosition = model.position
      , cameraOrientation = Mat4.transpose model.orientation
      }

    background =
      [ Constellation.crux 
      , Constellation.ursaMajor 
      , Constellation.aquarius 
      , Scatter.scatter 100 
      , Grid.grid 0 2 
      ]

    foreground =
      Dict.values model.worlds |> List.map World.toEntity
  in
    Graphics.render (width, height) camera (background ++ foreground)
              


textBox : Model -> Int -> Int -> Layout.Element
textBox model width height =
  Text.fromString model.message
    |> Layout.rightAligned
    |> Layout.size width height
