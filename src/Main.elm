module Main where

import Keyboard
import Set exposing (Set)
import Signal exposing ((<~))
import Time exposing (Time)

import Model exposing (Model)
import View


port hasFocus : Signal Bool

                
main =
  View.view <~ Signal.foldp update Model.startModel inputs


type Update =
  Keys (Set Keyboard.KeyCode) | FPS Time

    
inputs : Signal Update
inputs =
  Signal.merge
          (Keys <~ Keyboard.keysDown)
          (FPS <~ Time.fpsWhen 60 hasFocus)

        

update : Update -> Model -> Model
update input =
  case input of
    FPS dt ->
      Model.timeUpdate dt
    Keys keysDown ->
      Model.controlUpdate keysDown
           
