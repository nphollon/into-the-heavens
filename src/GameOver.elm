module GameOver (keyUpdate, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Effects exposing (Effects)
import Set exposing (Set)
import Char exposing (KeyCode)
import Graphics.AppFrame as AppFrame
import Types exposing (..)
import Flight.Init


keyUpdate : Set KeyCode -> GameOverState -> ( Mode, Effects Float )
keyUpdate keySet model =
  if Set.member (Char.toCode 'N') keySet then
    Flight.Init.game model.seed model.library
  else
    ( GameOverMode model, Effects.none )


view : GameOverState -> Html
view model =
  AppFrame.view
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
