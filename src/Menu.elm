module Menu exposing (keyUpdate, actionUpdate, view)

import Char exposing (KeyCode)
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (..)
import Graphics.AppFrame as AppFrame
import Flight.Init
import Level.Outnumbered
import Level.FlightTest
import Level.Pavilion
import Level.OneByOne


keyUpdate : KeyCode -> MenuState -> ( Mode, Cmd Update )
keyUpdate key model =
    if key == Char.toCode 'N' then
        case model.room of
            Won level ->
                load level model

            Lost level ->
                load level model

            LevelSelect ->
                noCmd model
    else
        noCmd model


actionUpdate : MenuAction -> MenuState -> ( Mode, Cmd Update )
actionUpdate input model =
    case input of
        StartGame level ->
            load level model

        ToMainMenu ->
            noCmd { model | room = LevelSelect }


load : Level -> MenuState -> ( Mode, Cmd Update )
load level model =
    Flight.Init.game (dataFor level) model.seed model.library


noCmd : MenuState -> ( Mode, Cmd Update )
noCmd model =
    MenuMode model ! []


view : MenuState -> Html MenuAction
view state =
    case state.room of
        LevelSelect ->
            mainMenuView

        Won level ->
            gameOverView "You won"
                "\"The machine does not isolate us from the great problems of nature.\" ~ Antoine de St. Exupéry"

        Lost level ->
            gameOverView "You crashed"
                "\"Even our misfortunes are a part of our belongings.\" ~ Antoine de St. Exupéry"


mainMenuView : Html MenuAction
mainMenuView =
    let
        levelButton name data =
            menuButton (onClick (StartGame data)) name
    in
        AppFrame.view
            [ div [ class "menu" ]
                [ h2 [] [ text "Select a level" ]
                , levelButton "Flight Practice" FlightTest
                , levelButton "One By One" OneByOne
                , levelButton "Pavilion" Pavilion
                , levelButton "Outnumbered" Outnumbered
                ]
            ]
            []


gameOverView : String -> String -> Html MenuAction
gameOverView message quote =
    AppFrame.view
        [ div []
            [ h1 [ class "title" ] [ text message ]
            , h2 [ class "subtitle" ] [ text "Press 'N' to replay" ]
            , menuButton (onClick ToMainMenu) "Main Menu"
            ]
        ]
        [ p [] [ text quote ] ]


menuButton : Attribute a -> String -> Html a
menuButton action label =
    div [ class "menu-item" ]
        [ button [ action ] [ text label ] ]


dataFor : Level -> LevelData
dataFor level =
    case level of
        FlightTest ->
            Level.FlightTest.data

        Outnumbered ->
            Level.Outnumbered.data

        Pavilion ->
            Level.Pavilion.data

        OneByOne ->
            Level.OneByOne.data
