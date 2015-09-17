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
  Meshes Mesh.Response
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
          , Meshes <~ Mesh.response
          ]
        

update : Update -> Model -> Model
update input model =
  case (input, model) of
    (FPS dt, Game m) ->
      Flight.timeUpdate dt m |> Game
        
    (Keys keysDown, Game m) ->
      Flight.controlUpdate keysDown m |> Game
        
    (Meshes response, Loading) ->
      load response

    otherwise ->
      model


load : Mesh.Response -> Model
load response =
  case response of
    Mesh.Waiting ->
      Loading

    Mesh.Error e ->
      ResourceFailure e

    Mesh.Success lib ->
      Flight.init lib |> Game


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
  Dict.fromList
        [ ("Sphere", "http://intotheheavens.net/data/sphere.json")
        , ("Background", "http://intotheheavens.net/data/background.json")
        ]
    |> Mesh.request
