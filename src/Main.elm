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
  Keys (Set Keyboard.KeyCode) | FPS Time | Downloads Mesh.DownloadLibrary


type Model =
  Game Flight.Model | Loading | ResourceFailure Http.Error


inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Downloads <~ Mesh.downloadLibrary
          ]
        

update : Update -> Model -> Model
update input model =
  case (input, model) of
    (FPS dt, Game m) ->
      Flight.timeUpdate dt m |> Game
        
    (Keys keysDown, Game m) ->
      Flight.controlUpdate keysDown m |> Game
        
    (Downloads library, Loading) ->
      Mesh.resolve ResourceFailure isComplete library
          
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


downloadRequest =
  { id = "Sphere"
  , url = "http://intotheheavens.net/data/resource.json"
  }

     
isComplete : Mesh.MeshLibrary -> Model
isComplete library =
  case (Dict.get downloadRequest.id library) of
    Just m ->
      Flight.init m |> Game
    Nothing ->
      Loading

                
port getUrl : Task Http.Error ()
port getUrl =
  Mesh.download downloadRequest 
