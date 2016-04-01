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


keyUpdate : Set KeyCode -> MenuState -> ( Mode, Effects Update )
keyUpdate keySet model =
  if Set.member (Char.toCode 'N') keySet then
    actionUpdate StartGame model
  else
    noEffects MenuMode model


actionUpdate : MenuAction -> MenuState -> ( Mode, Effects Update )
actionUpdate input model =
  case input of
    StartGame ->
      Flight.Init.game model.seed model.library

    ToMainMenu ->
      noEffects MenuMode { model | room = LevelSelect }


view : Signal.Address MenuAction -> MenuState -> Html
view address state =
  case state.room of
    LevelSelect ->
      mainMenuView address

    LevelWon ->
      gameOverView
        "You won"
        "\"The machine does not isolate us from the great problems of nature but plunges us more deeply into them.\" ~ Antoine de St. Exupéry"
        address

    LevelLost ->
      gameOverView
        "You crashed"
        "\"Even our misfortunes are a part of our belongings.\" ~ Antoine de St. Exupéry"
        address


mainMenuView : Signal.Address MenuAction -> Html
mainMenuView address =
  AppFrame.view
    [ div
        [ class "menu" ]
        [ h2 [] [ text "Select a level" ]
        , levelButton
            (onClick address StartGame)
            "Outnumbered"
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
        , levelButton
            (onClick address ToMainMenu)
            "Main Menu"
        ]
    ]
    [ p [] [ text quote ] ]


levelButton : Attribute -> String -> Html
levelButton action label =
  div
    [ class "menu-item" ]
    [ button [ action ] [ text label ] ]
