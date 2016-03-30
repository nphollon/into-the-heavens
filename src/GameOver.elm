module GameOver (keyUpdate, actionUpdate, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Effects exposing (Effects)
import Set exposing (Set)
import Char exposing (KeyCode)
import Graphics.AppFrame as AppFrame
import Types exposing (..)
import Flight.Init
import Menu.Init


keyUpdate : Set KeyCode -> GameOverState -> ( Mode, Effects Update )
keyUpdate keySet model =
  if Set.member (Char.toCode 'N') keySet then
    actionUpdate StartGame model
  else
    noEffects (GameOverMode model)


actionUpdate : MenuAction -> GameOverState -> ( Mode, Effects Update )
actionUpdate action model =
  case action of
    StartGame ->
      Flight.Init.game model.seed model.library

    ToMainMenu ->
      Menu.Init.menu model.seed model.library


view : Signal.Address MenuAction -> GameOverState -> Html
view address model =
  let
    message =
      if model.won then
        "You won"
      else
        "You crashed"
  in
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
      [ p
          []
          [ text
              ("\"Even our misfortunes are a part of our belongings.\""
                ++ " ~ Antoine de St. Exupéry"
              )
          ]
      ]


levelButton : Attribute -> String -> Html
levelButton action label =
  div
    [ class "menu-item" ]
    [ button [ action ] [ text label ] ]
