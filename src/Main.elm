module Main where

import Graphics.Element as Layout
import Color
import Signal
import Time
import Keyboard
import Set
import Char
import Text
import String
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
  , message = ""
  , worlds =
    Dict.fromList
          [ ("Jupiter", World.world Planet 10 (0, -100, -50))
          , ("Io", World.world Moon 0.2606 (0, -39.68, -50))
          , ("Europa", World.world Moon 0.2233 (0, -4.04, -50))
          , ("Ganymede", World.world Moon 0.3768 (0, 53.1, -50))
          , ("Callisto", World.world Moon 0.3447 (0, 169.3, -50))
          ]
  }


messages : List (String, (Model -> Bool))
messages =
  [ ("Hello Jupiter!", isNear 25 "Jupiter")
  , ("Bonjour Io!", isNear 3 "Io")
  , ("Hola Europa!", isNear 3 "Europa")
  , ("Ohayo Ganymede!", isNear 3 "Ganymede")
  , ("Shalom Callisto", isNear 3 "Callisto")
  , ("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam rhoncus est nunc, non consequat enim ullamcorper vitae. Duis ut tellus velit. Nulla vel sollicitudin neque. Integer at gravida nisi, sed ultrices quam. Proin dictum eu est at malesuada.", always otherwise)
  ]


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
      model
        |> turn (degrees 3)
        |> thrust 0.3
        |> updateMessage messages

              
turn : Float -> Model -> Model
turn delta model =
  { model | orientation <-
            model.orientation
              |> Mat4.rotate (model.action.pitch .* delta) (Vec3.vec3 1 0 0)
              |> Mat4.rotate (model.action.yaw .* delta) (Vec3.vec3 0 1 0)
              |> Mat4.rotate (model.action.roll .* delta) (Vec3.vec3 0 0 1)
  }


thrust : Float -> Model -> Model
thrust delta model =
  { model | position <-
            Vec3.vec3 0 0 (model.action.thrust .* delta)
              |> Mat4.transform model.orientation
              |> Vec3.add model.position
  }

                 
updateMessage : List (String, (Model -> Bool)) -> Model -> Model
updateMessage messages model =
  let
    check (newText, isTrueFor) oldText =
      if (isTrueFor model) then newText else oldText
  in
    { model | message <-
              List.foldr check model.message messages
    }
  

isNear : Float -> String -> Model -> Bool
isNear altitude worldName model =
  Dict.get worldName model.worlds
    |> Maybe.map .position
    |> Maybe.map (Vec3.distance model.position)
    |> Maybe.map (\x -> x < altitude)
    |> Maybe.withDefault False

       
view : Model -> Layout.Element
view model =
  let
    sceneWidth = 600
    sceneHeight = 600
    textBoxWidth = 300
    textBoxHeight = 300
    padding = 20
    instructions =
      String.join "\n"
              [ "Turn the camera - w,a,s,d"
              , "Roll the camera - q,e"
              , "Fly forwards - i"
              , "Fly backwards - m"
              ]
  in
    Layout.flow Layout.right
            [ scene sceneWidth sceneHeight model
            , Layout.spacer padding 1
            , Layout.flow Layout.down
                    [ textBox textBoxWidth textBoxHeight model.message
                    , Layout.spacer textBoxWidth 1
                      |> Layout.color (Color.rgba 204 255 238 0.5)
                    , Layout.spacer 1 padding
                    , textBox textBoxWidth textBoxHeight instructions
                    ]
            ]


scene : Int -> Int -> Model -> Layout.Element
scene width height model =
  let
    aspect =
      width ./. height

    camera =
      { perspective = Mat4.makePerspective 100 aspect 0.1 1000
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
              


textBox : Int -> Int -> String -> Layout.Element
textBox width height message =
  Text.fromString message
    |> Layout.leftAligned
    |> Layout.size width height
