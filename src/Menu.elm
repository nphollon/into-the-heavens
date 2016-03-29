module Menu (Action, update, view) where

import Time exposing (Time)
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Effects exposing (Effects)
import Types exposing (..)
import Graphics.AppFrame as AppFrame
import Flight.Init


type Action
  = StartGame


update : (Time -> a) -> Action -> MenuState -> ( Mode, Effects a )
update tick input model =
  case input of
    StartGame ->
      Flight.Init.game tick model.seed model.library


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
