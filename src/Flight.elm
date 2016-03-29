module Flight (timeUpdate, controlUpdate, focusUpdate, view) where

import Dict exposing (Dict)
import Set exposing (Set)
import Char exposing (KeyCode)
import Time exposing (Time)
import Html exposing (Html)
import Effects exposing (Effects)
import Types exposing (..)
import Flight.Engine as Engine
import Flight.Util as Util
import GameOver.Init
import Graphics.View as View


focusUpdate : Bool -> GameState -> ( Mode, Effects Time )
focusUpdate focus model =
  if focus then
    ( GameMode { model | hasFocus = True }, Effects.tick identity )
  else
    ( GameMode { model | hasFocus = False }, Effects.none )


timeUpdate : Time -> GameState -> ( Mode, Effects Time )
timeUpdate clockTime model =
  if model.hasFocus then
    gameOverCheck (engineUpdate clockTime model)
  else
    ( GameMode { model | clockTime = Nothing }, Effects.none )


gameOverCheck : GameState -> ( Mode, Effects Time )
gameOverCheck model =
  if Util.hasWon model then
    (,)
      (GameOver.Init.victory model.seed model.library)
      Effects.none
  else if Util.hasCrashed model then
    (,)
      (GameOver.Init.crash model.seed model.library)
      Effects.none
  else
    ( GameMode model, Effects.tick identity )


engineUpdate : Time -> GameState -> GameState
engineUpdate clockTime model =
  case model.clockTime of
    Just prevClockTime ->
      let
        timeChange =
          Time.inSeconds (clockTime - prevClockTime)
      in
        reduceLag
          { model
            | clockTime = Just clockTime
            , lag = model.lag + timeChange
            , gameTime = model.gameTime + timeChange
          }

    Nothing ->
      { model | clockTime = Just clockTime }


reduceLag : GameState -> GameState
reduceLag model =
  let
    updateDelta =
      1.0 / 60
  in
    if model.lag < updateDelta then
      model
    else
      { model | lag = model.lag - updateDelta }
        |> Engine.update updateDelta
        |> reduceLag


controlUpdate : Set KeyCode -> GameState -> Mode
controlUpdate keysDown model =
  let
    keyMap =
      Dict.fromList
        [ ( 'D', RightTurn )
        , ( 'A', LeftTurn )
        , ( 'S', DownTurn )
        , ( 'W', UpTurn )
        , ( 'I', Thrust )
        , ( 'K', Brake )
        , ( 'H', ShieldsUp )
        , ( 'J', Firing )
        , ( 'L', TargetFacing )
        ]
  in
    GameMode
      { model
        | playerActions =
            List.filterMap
              (Char.fromCode >> flip Dict.get keyMap)
              (Set.toList keysDown)
      }


view : GameState -> Html
view =
  View.view
