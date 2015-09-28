module Main where

import Graphics.Element as Layout
import Keyboard
import Dict exposing (Dict)
import Set exposing (Set)
import Signal exposing ((<~))
import Time exposing (Time)
import Task exposing (Task)

import Http
import Math.Matrix4 as Mat4
import Math.Vector3 as Vec3

import Mesh
import Update exposing (..)
import Menu
import Flight
import GameOver
import Background


port hasFocus : Signal Bool

        
type alias Model =
  { mode : Mode
  , data : Data
  }


main : Signal Layout.Element
main =
  view <~ Signal.foldp update init inputs


inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Meshes <~ Mesh.response
          ]

                 
init : Model
init =
  { mode = MenuMode
  , data = { continue = False
           , time = 0
           , resources = Mesh.Waiting
                         
           , orientation = Mat4.identity
           , position = Vec3.vec3 0 0 0
           , speed = 0
           , action = { thrust = 0, pitch = 0, yaw = 0, roll = 0 }
           , message = ""
           , worlds = Dict.empty
           , background = Background.background []
           }
  }

    
update : Update -> Model -> Model
update up model =
  let
    engine =
      chooseEngine model.mode

    data =
      engine.update up model.data

    transition =
      engine.transition data
  in
    case transition of
      Nothing ->
        { model | data <- data }
        
      Just mode ->
        { mode = mode
        , data = .init (chooseEngine mode) data
        }


view : Model -> Layout.Element
view model =
  model.data |> chooseView model.mode
    
      
chooseEngine : Mode -> Engine
chooseEngine mode =
  case mode of
    MenuMode -> Menu.engine
    GameMode -> Flight.engine
    GameOverMode -> GameOver.engine


chooseView : Mode -> Data -> Layout.Element
chooseView mode =
  case mode of
    MenuMode -> Menu.view
    GameMode -> Flight.view
    GameOverMode -> GameOver.view


port getResources : Task Http.Error ()
port getResources =
  Dict.fromList
        [ ("Sphere", "http://$DOMAIN/data/sphere.json")
        , ("Background", "http://$DOMAIN/data/background.json")
        ]
    |> Mesh.request
