module Main where

import Keyboard
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
  view <~ Signal.foldp update WaitingForResource inputs


type Update =
  Keys (Set Keyboard.KeyCode) | FPS Time | Resource Mesh.Download | NoUpdate


type Model =
  Game Flight.Model | WaitingForResource | ResourceFailure Http.Error


inputs : Signal Update
inputs =
  Signal.mergeMany
          [ Keys <~ Keyboard.keysDown
          , FPS <~ Time.fpsWhen 60 hasFocus
          , Signal.filterMap (Maybe.map Resource) NoUpdate resource.signal
          ]
        

update : Update -> Model -> Model
update input model =
  case (input, model) of
    (FPS dt, Game m) ->
      Flight.timeUpdate dt m |> Game
        
    (Keys keysDown, Game m) ->
      Flight.controlUpdate keysDown m |> Game
        
    (Resource s, WaitingForResource) ->
      Mesh.resolve ResourceFailure (Flight.init >> Game) s
          
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
  Mesh.download "http://intotheheavens.net/resource.json" resource.address


resource : Signal.Mailbox (Maybe Mesh.Download)
resource = Signal.mailbox Nothing
