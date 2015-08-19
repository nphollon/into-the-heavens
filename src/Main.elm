module Main where

import Signal
import Time
import Keyboard
import Set
import Char

import AnimationFrame

import Model
import View


main =
  let
    model =
      Signal.foldp Model.update Model.startModel signal
  in
    Signal.map View.view model

      
signal : Signal Model.Update
signal =
  Signal.merge keysDown sample


sample : Signal Model.Update
sample =
  Signal.map Model.TimeDelta AnimationFrame.frame


keysDown : Signal Model.Update
keysDown =
  let
    keyAct key action =
      case (Char.fromCode key) of
        'D' ->
          { action | yaw <- action.yaw - 1 }
        'A' ->
          { action | yaw <- action.yaw + 1 }
        'S' ->
          { action | pitch <- action.pitch - 1 }
        'W' ->
          { action | pitch <- action.pitch + 1 }
        'Q' ->
          { action | roll <- action.roll - 1 }
        'E' ->
          { action | roll <- action.roll + 1 }
        'I' ->
          { action | thrust <- action.thrust - 1 }
        'M' ->
          { action | thrust <- action.thrust + 1 }
        otherwise ->
          action

    fullAction =
      Set.foldl keyAct Model.inaction >> Model.KeyPress
  in
    Signal.map fullAction Keyboard.keysDown
