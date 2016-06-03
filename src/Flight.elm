module Flight exposing (timeUpdate, controlUpdate, view)

import Dict exposing (Dict)
import Set exposing (Set)
import Char exposing (KeyCode)
import Time exposing (Time)
import Html exposing (Html)
import Types exposing (..)
import Flight.Engine as Engine
import Flight.Util as Util
import Menu.Init
import Graphics.View as View


timeUpdate : Time -> GameState -> ( Mode, Cmd Update )
timeUpdate clockTime model =
    let
        newModel =
            engineUpdate clockTime model
    in
        if Util.hasWon newModel then
            Menu.Init.victory newModel.level
                newModel.seed
                newModel.library
        else if Util.hasCrashed newModel then
            Menu.Init.crash newModel.level
                newModel.seed
                newModel.library
        else
            GameMode newModel ! []


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


controlUpdate : Set KeyCode -> GameState -> ( Mode, Cmd Update )
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
        newModel =
            GameMode
            { model
                | playerActions =
                  List.filterMap (Char.fromCode >> flip Dict.get keyMap)
                  (Set.toList keysDown)
            }
    in
        newModel ! []

view : GameState -> Html a
view =
    View.view
