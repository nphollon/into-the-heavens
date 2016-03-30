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


focusUpdate : Bool -> GameState -> ( Mode, Effects Update )
focusUpdate focus model =
  if focus then
    tick { model | hasFocus = True }
  else
    noEffects (GameMode { model | hasFocus = False })


timeUpdate : Time -> GameState -> ( Mode, Effects Update )
timeUpdate clockTime model =
  if model.hasFocus then
    gameOverCheck (engineUpdate clockTime model)
  else
    noEffects (GameMode { model | clockTime = Nothing })


gameOverCheck : GameState -> ( Mode, Effects Update )
gameOverCheck model =
  if Util.hasWon model then
    noEffects
      (GameOver.Init.victory model.seed model.library)
  else if Util.hasCrashed model then
    noEffects
      (GameOver.Init.crash model.seed model.library)
  else
    tick model


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


controlUpdate : Set KeyCode -> GameState -> ( Mode, Effects Update )
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
    tick
      { model
        | playerActions =
            List.filterMap
              (Char.fromCode >> flip Dict.get keyMap)
              (Set.toList keysDown)
      }


view : Signal.Address a -> GameState -> Html
view address =
  View.view
