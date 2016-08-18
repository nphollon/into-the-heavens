module Flight exposing (timeUpdate, keyDown, keyUp, view)

import Set exposing (Set)
import Dict exposing (Dict)
import Char exposing (KeyCode)
import Time exposing (Time)
import Html exposing (Html)
import Types exposing (..)
import Flight.Engine as Engine
import Flight.Mechanics as Mechanics
import Menu.Init
import Pause.Init
import Graphics.View as View


keyDown : KeyCode -> GameState -> ( Mode, Cmd Update )
keyDown key model =
    if key == Char.toCode 'P' then
        Pause.Init.pause model
    else
        GameMode { model | playerActions = Set.insert key model.playerActions }
            ! []


keyUp : KeyCode -> GameState -> ( Mode, Cmd Update )
keyUp key model =
    GameMode { model | playerActions = Set.remove key model.playerActions }
        ! []


timeUpdate : Time -> GameState -> ( Mode, Cmd Update )
timeUpdate clockTime model =
    let
        newModel =
            engineUpdate clockTime model

        hasCrashed =
            not (Dict.member Mechanics.playerId newModel.universe)
    in
        if newModel.victory then
            Menu.Init.victory newModel.level
                newModel.seed
                newModel.library
        else if hasCrashed then
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
    if model.lag < Mechanics.delta then
        model
    else
        { model | lag = model.lag - Mechanics.delta }
            |> Engine.update
            |> reduceLag


view : GameState -> Html a
view =
    View.view
