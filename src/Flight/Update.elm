module Flight.Update (update) where

import Set exposing (Set)
import Char exposing (KeyCode)
import Time exposing (Time)
import Effects exposing (Effects)
import Types exposing (..)
import Flight.Init as Init
import Flight.Engine as Engine
import Flight.Util as Util
import GameOver.Init


update : Update -> GameState -> ( Mode, Effects Update )
update input model =
  case input of
    Tick clockTime ->
      timeUpdate clockTime model

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
    gameOverCheck newModel =
      if Util.hasCrashed newModel then
        GameOver.Init.gameOver newModel.seed newModel.library
      else
        ( GameMode newModel, Effects.tick Tick )
  in
    if model.hasFocus then
      gameOverCheck (engineUpdate clockTime model)
    else
      ( GameMode { model | clockTime = Nothing }, Effects.none )


engineUpdate : Time -> GameState -> GameState
engineUpdate clockTime model =
  case model.clockTime of
    Just prevClockTime ->
      reduceLag
        { model
          | clockTime = Just clockTime
          , lag = model.lag + clockTime - prevClockTime
        }

    Nothing ->
      { model | clockTime = Just clockTime }


reduceLag : GameState -> GameState
reduceLag model =
  let
    updateDelta =
      Time.second / 60
  in
    if model.lag < updateDelta then
      model
    else
      { model | lag = model.lag - updateDelta }
        |> Engine.update (Time.inSeconds updateDelta)
        |> reduceLag


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

    shieldsUp =
      Set.member (Char.toCode 'O') keysDown

    firing =
      Set.member (Char.toCode 'J') keysDown

    newCockpit cockpit =
      { cockpit
        | action = newAction
        , shieldsUp = shieldsUp
        , trigger = nextTrigger firing shieldsUp cockpit
      }
  in
    Util.updatePlayerCockpit newCockpit model


nextTrigger : Bool -> Bool -> Cockpit -> Trigger
nextTrigger isFiring shieldsUp cockpit =
  case ( isFiring && not shieldsUp, cockpit.trigger ) of
    ( True, Ready ) ->
      Fire

    ( False, Fire ) ->
      FireAndReset

    ( False, Reset ) ->
      Ready

    _ ->
      cockpit.trigger
