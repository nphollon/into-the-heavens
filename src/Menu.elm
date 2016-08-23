module Menu exposing (keyUpdate, actionUpdate, view)

import Char exposing (KeyCode)
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (..)
import Flight.Init
import Level.FlightTest


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
    Flight.Init.game (dataFor level model.library) model.seed model.library


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

        Lost level ->
            gameOverView "You crashed"


mainMenuView : Html MenuAction
mainMenuView =
    let
        levelButton name data =
            menuButton (onClick (StartGame data)) name
    in
        div [ class "menu" ]
            [ h2 [] [ text "Select a level" ]
            , levelButton "Platform" SimplePlatform
            ]


gameOverView : String -> Html MenuAction
gameOverView message =
    div []
        [ h1 [ class "title" ] [ text message ]
        , h2 [ class "subtitle" ] [ text "Press 'N' to replay" ]
        , menuButton (onClick ToMainMenu) "Main Menu"
        ]


menuButton : Attribute a -> String -> Html a
menuButton action label =
    div [ class "menu-item" ]
        [ button [ action ] [ text label ] ]


dataFor : Level -> Library -> LevelData
dataFor level library =
    case level of
        SimplePlatform ->
            Level.FlightTest.data library
