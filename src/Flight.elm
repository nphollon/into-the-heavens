module Flight (timeUpdate, controlUpdate, view) where

import Dict exposing (Dict)
import Set exposing (Set)
import Char exposing (KeyCode)
import Time exposing (Time)
import Html exposing (Html)
import Effects exposing (Effects)
import Types exposing (..)
import Flight.Engine as Engine
import Flight.Util as Util
import Menu.Init
import Graphics.View as View


timeUpdate : Time -> GameState -> ( Mode, Effects Update )
timeUpdate clockTime model =
  let
    newModel =
      engineUpdate clockTime model
  in
    if Util.hasWon newModel then
      Menu.Init.victory newModel.seed newModel.library
    else if Util.hasCrashed newModel then
      Menu.Init.crash newModel.seed newModel.library
    else
      tick GameMode newModel


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
    { model
      | playerActions =
          List.filterMap
            (Char.fromCode >> flip Dict.get keyMap)
            (Set.toList keysDown)
    }
      |> noEffects GameMode


view : GameState -> Html
view =
  View.view
