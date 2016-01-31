module GameOver (engine, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Set
import Char
import Frame
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
    Frame.view
        [ div
            []
            [ h1 [ class "title" ] [ text "You crashed" ]
            , h2 [ class "subtitle" ] [ text "Press 'N'" ]
            ]
        ]
        [ p
            []
            [ text
                ("\"Even our misfortunes are a part of our belongings.\""
                    ++ " ~ Antoine de St. Exupéry"
                )
            ]
        ]



{-
view : Signal.Address Update -> Data -> Html
view address model =
    let
        lightness =
            1 - Time.inSeconds model.time

        hue =
            Palette.yellow |> Color.toHsl |> .hue

        color =
            Color.hsla hue 1 lightness lightness
    in
        Frame.view
            [ Flat.screen
                color
                [ Flat.text Palette.titleStyle ( 0, 0 ) "You crashed"
                , Flat.text Palette.subtitleStyle ( 0, -70 ) "Press 'N'"
                ]
                |> Html.fromElement
            ]
            []
-}
