module Menu (Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Effects exposing (Effects)
import Types exposing (..)
import Graphics.AppFrame as AppFrame
import Flight.Init


type Action
  = StartGame


update : Action -> MenuState -> ( Mode, Effects Float )
update input model =
  case input of
    StartGame ->
      Flight.Init.game model.seed model.library


view : Signal.Address Action -> MenuState -> Html
view address state =
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


levelButton : Attribute -> String -> Html
levelButton action label =
  div
    [ class "menu-item" ]
    [ button [ action ] [ text label ] ]
