module Main where

import Keyboard
import Set exposing (Set)
import Signal exposing ((<~))
import Time exposing (Time)
import Task exposing (Task)

import Http

import Flight
import View


port hasFocus : Signal Bool

                
main =
  view <~ Signal.foldp update WaitingForResource inputs


type Update =
  Keys (Set Keyboard.KeyCode) | FPS Time | Resource (Result Http.Error String)


type Model =
  Game Flight.Model | WaitingForResource | ResourceFailure Http.Error

    
inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Resource <~ resource.signal
          ]
        

update : Update -> Model -> Model
update input model =
  case (input, model) of
    (FPS dt, Game m) ->
      Flight.timeUpdate dt m |> Game
        
    (Keys keysDown, Game m) ->
      Flight.controlUpdate keysDown m |> Game
        
    (Resource s, WaitingForResource) ->
      case s of
        Result.Ok _ ->
          Game Flight.init
        Result.Err e ->
          ResourceFailure e
          
    otherwise ->
      model


view model =
  case model of
    Game m ->
      View.view m
    WaitingForResource ->
      View.loading
    ResourceFailure e ->
      View.resourceFailure e
           

port getUrl : Task Http.Error ()
port getUrl =
  let
    fetch =
      Http.getString "http://intotheheavens.net/resource.json"
        |> Task.toResult

    notify =
      Signal.send resource.address
  in
    fetch `Task.andThen` notify


resource : Signal.Mailbox (Result Http.Error String)
resource = Signal.mailbox (Result.Ok "")
