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


port hasFocus : Signal Bool

                
main =
  view <~ Signal.foldp update init inputs


type Update =
  Meshes Mesh.Response
    | FPS Time
    | Keys (Set Keyboard.KeyCode)


type Model =
  ResourceFailure Http.Error
    | Loading Menu.Model
    | Ready Menu.Model Mesh.Library
    | Game Flight.Model

      
init : Model
init =
  Loading Menu.init


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

    (FPS dt, Loading m) ->
      Menu.update dt m |> Loading

    (FPS dt, Ready m lib) ->
      Menu.update dt m |> flip Ready lib
                         
    (Meshes response, Loading m) ->
      Mesh.handle ResourceFailure (Ready m) model response

    otherwise ->
      model


view model =
  case model of
    Game m ->
      Flight.view m
          
    Loading m ->
      Menu.loading m

    Ready m lib ->
      Menu.ready m
          
    ResourceFailure e ->
      Menu.resourceFailure e


port getResources : Task Http.Error ()
port getResources =
  Dict.fromList
        [ ("Sphere", "http://intotheheavens.net/data/sphere.json")
        , ("Background", "http://intotheheavens.net/data/background.json")
        ]
    |> Mesh.request
