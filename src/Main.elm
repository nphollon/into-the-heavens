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
import World


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
  , data = defaultData
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
        [ ("Sphere", "$DOMAIN/data/sphere.json")
        , ("Background", "$DOMAIN/data/background.json")
        ]
    |> Mesh.request
