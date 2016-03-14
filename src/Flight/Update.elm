module Flight.Update (update) where

import Dict exposing (Dict)
import Set exposing (Set)
import Char exposing (KeyCode)
import Time exposing (Time)
import Effects exposing (Effects)
import Types exposing (..)
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
    keyMap =
      Dict.fromList
        [ ( 'D', RightTurn )
        , ( 'A', LeftTurn )
        , ( 'S', DownTurn )
        , ( 'W', UpTurn )
        , ( 'Q', CounterclockwiseRoll )
        , ( 'E', ClockwiseRoll )
        , ( 'I', Thrust )
        , ( 'M', Brake )
        , ( 'O', ShieldsUp )
        , ( 'J', Firing )
        ]
  in
    { model
      | playerActions =
          List.filterMap
            (Char.fromCode >> flip Dict.get keyMap)
            (Set.toList keysDown)
    }
