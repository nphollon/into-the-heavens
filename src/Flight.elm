module Flight (update, view) where

import Html exposing (Html)
import Effects exposing (Effects)
import Types exposing (Update, GameState, Mode)
import Flight.Update as Update
import Graphics.View as View


update : Update -> GameState -> ( Mode, Effects Update )
update =
  Update.update


view : Signal.Address Update -> GameState -> Html
view =
  View.view
