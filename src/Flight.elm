module Flight (update, view) where

import Html exposing (Html)
import Effects exposing (Effects)
import Types exposing (Update, GameState, Mode)
import Flight.Model as Model
import Flight.View as View


update : Update -> GameState -> ( Mode, Effects Update )
update =
  Model.update


view : Signal.Address Update -> GameState -> Html
view =
  View.view
