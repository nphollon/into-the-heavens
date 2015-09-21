module Main where

import Keyboard
import Dict exposing (Dict)
import Set exposing (Set)
import Signal exposing ((<~))
import Time exposing (Time)
import Task exposing (Task)

import Http

import Flight
import Menu
import Mesh exposing (Mesh)
import Update exposing (Update(..))


port hasFocus : Signal Bool

                
main =
  view <~ Signal.foldp update init inputs


type Model =
  Start Menu.Model
    | Game Flight.Model

      
init : Model
init =
  Start Menu.init


inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Meshes <~ Mesh.response
          ]
        

update : Update -> Model -> Model
update input model =
  case model of
    Start m ->
      Menu.update input m |> Start

    Game m ->
      Flight.update input m |> Game


view model =
  case model of
    Start m ->
      Menu.view m
    
    Game m ->
      Flight.view m


port getResources : Task Http.Error ()
port getResources =
  Dict.fromList
        [ ("Sphere", "http://intotheheavens.net/data/sphere.json")
        , ("Background", "http://intotheheavens.net/data/background.json")
        ]
    |> Mesh.request
