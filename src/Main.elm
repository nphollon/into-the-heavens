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
import GameOver
import Mesh exposing (Mesh)
import Update exposing (Update(..))


port hasFocus : Signal Bool

                
main =
  view <~ Signal.foldp update init inputs


type Model =
  Start Menu.Model
    | Play Flight.Model
    | GameOver GameOver.Model

      
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
      transition .continue Play (Menu.update input >> Start) m

    Play m ->
      transition .dead (GameOver.init >> GameOver) (Flight.update input >> Play) m

    GameOver m ->
      (GameOver.update input >> GameOver) m


transition : (a -> Maybe b) -> (b -> Model) -> (a -> Model) -> a -> Model
transition isReady yes no model =
  isReady model
  |> Maybe.map yes
  |> Maybe.withDefault (no model)


view model =
  case model of
    Start m ->
      Menu.view m
    
    Play m ->
      Flight.view m

    GameOver m ->
      GameOver.view m


port getResources : Task Http.Error ()
port getResources =
  Dict.fromList
        [ ("Sphere", "http://$DOMAIN/data/sphere.json")
        , ("Background", "http://$DOMAIN/data/background.json")
        ]
    |> Mesh.request
