module Flight.Model (update) where

import Set exposing (Set)
import Char exposing (KeyCode)
import Time exposing (Time)
import Effects exposing (Effects)
import Types exposing (..)
import Flight.Init as Init
import Flight.Engine as Engine
import GameOver.Init


update : Update -> GameState -> ( Mode, Effects Update )
update input model =
  case input of
    Tick clockTime ->
      if Init.hasCrashed model then
        GameOver.Init.gameOver model.seed model.library
      else if model.hasFocus then
        timeUpdate clockTime model
      else
        ( GameMode { model | clockTime = Nothing }, Effects.none )

    Keys keysDown ->
      ( GameMode (controlUpdate keysDown model), Effects.none )

    Meshes _ ->
      ( GameMode model, Effects.none )

    Focus True ->
      ( GameMode { model | hasFocus = True }, Effects.tick Tick )

    Focus False ->
      ( GameMode { model | hasFocus = False }, Effects.none )


timeUpdate : Time -> GameState -> ( Mode, Effects Update )
timeUpdate clockTime model =
  let
    newModel =
      case model.clockTime of
        Just prevClockTime ->
          loop
            { model
              | clockTime = Just clockTime
              , lag = model.lag + clockTime - prevClockTime
            }

        Nothing ->
          { model | clockTime = Just clockTime }
  in
    ( GameMode newModel, Effects.tick Tick )


loop : GameState -> GameState
loop model =
  let
    updateDelta =
      Time.second / 60
  in
    if model.lag < updateDelta then
      model
    else
      { model | lag = model.lag - updateDelta }
        |> Engine.update (Time.inSeconds updateDelta)
        |> loop


controlUpdate : Set KeyCode -> GameState -> GameState
controlUpdate keysDown model =
  let
    keyAct key action =
      case (Char.fromCode key) of
        'D' ->
          { action | yaw = action.yaw - 1 }

        'A' ->
          { action | yaw = action.yaw + 1 }

        'S' ->
          { action | pitch = action.pitch - 1 }

        'W' ->
          { action | pitch = action.pitch + 1 }

        'Q' ->
          { action | roll = action.roll + 1 }

        'E' ->
          { action | roll = action.roll - 1 }

        'I' ->
          { action | thrust = action.thrust + 1 }

        'M' ->
          { action | thrust = action.thrust - 1 }

        _ ->
          action

    newAction =
      Set.foldl keyAct Init.inaction keysDown

    firing =
      Set.member (Char.toCode 'O') keysDown

    newTrigger cockpit =
      case ( firing, cockpit.trigger ) of
        ( True, Ready ) ->
          { cockpit
            | action = newAction
            , trigger = Fire
          }

        ( False, Fire ) ->
          { cockpit
            | action = newAction
            , trigger = FireAndReset
          }

        ( False, Reset ) ->
          { cockpit
            | action = newAction
            , trigger = Ready
          }

        _ ->
          { cockpit | action = newAction }
  in
    Init.updatePlayer newTrigger model
