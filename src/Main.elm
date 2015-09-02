module Main where

import Keyboard
import Set exposing (Set)
import Signal exposing ((<~))
import Time exposing (Time)
import Task exposing (Task)

import Http

import Model exposing (Model)
import View


port hasFocus : Signal Bool

                
main =
  view <~ Signal.foldp update WaitingForResource inputs


type Update =
  Keys (Set Keyboard.KeyCode) | FPS Time | Resource String


type MainModel =
  Game Model | WaitingForResource

    
inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Resource <~ resource.signal
          ]
        

update : Update -> MainModel -> MainModel
update input model =
  case (input, model) of
    (FPS dt, Game m) ->
      Model.timeUpdate dt m |> Game
    (Keys keysDown, Game m) ->
      Model.controlUpdate keysDown m |> Game
    (Resource s, WaitingForResource) ->
      Game Model.init
    otherwise ->
      model


view model =
  case model of
    Game m ->
      View.view m
    WaitingForResource ->
      View.loading
           

port getUrl : Task Http.Error ()
port getUrl =
  Task.andThen
        (Http.getString "http://intotheheavens.net/resource.json")
        (Signal.send resource.address)


resource : Signal.Mailbox String
resource = Signal.mailbox ""
