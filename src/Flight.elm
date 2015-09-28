module Flight (engine, view) where

import Update exposing (Engine)
import Flight.Model as Model
import Flight.View as View


engine : Engine
engine =
  { init = Model.init
  , update = Model.update
  , transition = Model.transition
  }


view = View.view
