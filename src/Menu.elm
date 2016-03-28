module Menu (Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Effects exposing (Effects)
import Types exposing (..)
import Graphics.AppFrame as AppFrame
import Flight.Init


type Action
  = StartGame Difficulty


update : Action -> MenuState -> ( Mode, Effects Update )
update input model =
  case input of
    StartGame difficulty ->
      Flight.Init.game model.seed model.library difficulty


view : Signal.Address Action -> MenuState -> Html
view address state =
  AppFrame.view
    [ div
        [ class "level-menu" ]
        [ button [ onClick address (StartGame Easy) ] [ text "Easy" ]
        , button [ onClick address (StartGame Hard) ] [ text "Hard" ]
        ]
    ]
    []
