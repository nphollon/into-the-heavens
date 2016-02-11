module GameOver (update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Effects exposing (Effects)
import Set
import Char
import Frame
import Update exposing (Update(..), Mode(..), GameOverState)
import Flight.Init


update : Update -> GameOverState -> ( Mode, Effects a )
update input model =
  let
    continue =
      case input of
        Keys keySet ->
          Set.member (Char.toCode 'N') keySet

        otherwise ->
          False
  in
    if continue then
      Flight.Init.game model.library
    else
      ( GameOverMode model, Effects.none )


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
