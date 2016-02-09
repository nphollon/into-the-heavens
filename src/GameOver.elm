module GameOver (update, transition, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Set
import Char
import Frame
import Update exposing (Update(..), Mode, GameOverState)


update : Update -> GameOverState -> GameOverState
update input model =
  case input of
    Keys keySet ->
      { model | continue = Set.member (Char.toCode 'N') keySet }

    otherwise ->
      model


transition : GameOverState -> Maybe Mode
transition data =
  if data.continue then
    Just (Update.game data.library)
  else
    Nothing


view : Signal.Address Update -> GameOverState -> Html
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
