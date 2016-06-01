module Menu (keyUpdate, actionUpdate, view) where

import Set exposing (Set)
import Char exposing (KeyCode)
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Effects exposing (Effects)
import Types exposing (..)
import Graphics.AppFrame as AppFrame
import Flight.Init
import Level.Outnumbered
import Level.FlightTest
import Level.Pavilion
import Level.OneByOne


keyUpdate : Set KeyCode -> MenuState -> ( Mode, Effects Update )
keyUpdate keySet model =
  let
    reset =
      Set.member (Char.toCode 'N') keySet

    maybeLevel =
      case model.room of
        LevelSelect ->
          Nothing

        Won level ->
          Just level

        Lost level ->
          Just level
  in
    case ( reset, maybeLevel ) of
      ( True, Just level ) ->
        actionUpdate (StartGame level) model

      _ ->
        noEffects MenuMode model


actionUpdate : MenuAction -> MenuState -> ( Mode, Effects Update )
actionUpdate input model =
  case input of
    StartGame level ->
      Flight.Init.game (dataFor level) model.seed model.library

    ToMainMenu ->
      noEffects MenuMode { model | room = LevelSelect }


view : Signal.Address MenuAction -> MenuState -> Html
view address state =
  case state.room of
    LevelSelect ->
      mainMenuView address

    Won level ->
      gameOverView
        "You won"
        "\"The machine does not isolate us from the great problems of nature.\" ~ Antoine de St. Exupéry"
        address

    Lost level ->
      gameOverView
        "You crashed"
        "\"Even our misfortunes are a part of our belongings.\" ~ Antoine de St. Exupéry"
        address


mainMenuView : Signal.Address MenuAction -> Html
mainMenuView address =
  let
    levelButton name data =
      menuButton
        (onClick address (StartGame data))
        name
  in
    AppFrame.view
      [ div
          [ class "menu" ]
          [ h2 [] [ text "Select a level" ]
          , levelButton "Flight Practice" FlightTest
          , levelButton "One By One" OneByOne
          , levelButton "Outnumbered" Outnumbered
          ]
      ]
      []


gameOverView : String -> String -> Signal.Address MenuAction -> Html
gameOverView message quote address =
  AppFrame.view
    [ div
        []
        [ h1 [ class "title" ] [ text message ]
        , h2 [ class "subtitle" ] [ text "Press 'N' to replay" ]
        , menuButton
            (onClick address ToMainMenu)
            "Main Menu"
        ]
    ]
    [ p [] [ text quote ] ]


menuButton : Attribute -> String -> Html
menuButton action label =
  div
    [ class "menu-item" ]
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
