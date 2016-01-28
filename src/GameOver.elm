module GameOver (engine, view) where

import Color
import Html exposing (Html)
import Set
import Char
import Time exposing (Time)
import Graphics.Flat as Flat
import Graphics.Palette as Palette
import Update exposing (Update(..), Data, Engine, Mode)


engine : Engine
engine =
    { init = init
    , update = update
    , transition = transition
    }


init : Data -> Data
init model =
    { model
        | time = 0
        , continue = False
    }


update : Update -> Data -> Data
update input model =
    case input of
        FPS dt ->
            { model | time = dt + model.time }

        Keys keySet ->
            { model | continue = Set.member (Char.toCode 'N') keySet }

        otherwise ->
            model


transition : Data -> Maybe Mode
transition data =
    if data.continue then
        Just Update.GameMode
    else
        Nothing


view : Signal.Address Update -> Data -> Html
view address model =
    let
        lightness =
            1 - Time.inSeconds model.time

        hue =
            Palette.yellow |> Color.toHsl |> .hue

        color =
            Color.hsl hue 1 lightness
    in
        Flat.screen
            color
            [ Flat.text Palette.titleStyle ( 0, 0 ) "You crashed"
            , Flat.text Palette.subtitleStyle ( 0, -70 ) "Press 'N'"
            ]
            |> Html.fromElement
