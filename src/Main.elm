module Main where

import Keyboard
import Dict exposing (Dict)
import Set exposing (Set)
import Signal exposing ((<~))
import Time exposing (Time)
import Task exposing (Task)

import Http

import Flight
import View
import Mesh exposing (Mesh)


port hasFocus : Signal Bool

                
main =
  view <~ Signal.foldp update Loading inputs


type Update =
  LoadError Http.Error
    | LoadSuccess Mesh.Library
    | FPS Time
    | Keys (Set Keyboard.KeyCode)


type Model =
  ResourceFailure Http.Error
    | Loading
    | Game Flight.Model


inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Mesh.response LoadError LoadSuccess
          ]
        

update : Update -> Model -> Model
update input model =
  case (input, model) of
    (FPS dt, Game m) ->
      Flight.timeUpdate dt m |> Game
        
    (Keys keysDown, Game m) ->
      Flight.controlUpdate keysDown m |> Game
        
    (LoadError e, Loading) ->
      ResourceFailure e

    (LoadSuccess lib, Loading) ->
      Flight.init lib |> Game
          
    otherwise ->
      model


view model =
  case model of
    Game m ->
      View.view m
    Loading ->
      View.loading
    ResourceFailure e ->
      View.resourceFailure e


port getResources : Task Http.Error ()
port getResources =
  Dict.singleton "Sphere" "http://intotheheavens.net/data/resource.json"
    |> Mesh.request
