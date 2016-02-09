module Flight (engine, view) where

import Html exposing (Html)
import Update exposing (Update, Engine, Data)
import Flight.Model as Model
import Flight.View as View


engine : Engine
engine =
  { init = Model.init
  , update = Model.update
  , transition = Model.transition
  }


view : Signal.Address Update -> Data -> Html
view =
  View.view
