module Flight (update, transition, view) where

import Html exposing (Html)
import Update exposing (Update, GameState, Mode)
import Flight.Model as Model
import Flight.View as View


update : Update -> GameState -> GameState
update =
  Model.update


transition : GameState -> Maybe Mode
transition =
  Model.transition


view : Signal.Address Update -> GameState -> Html
view =
  View.view
