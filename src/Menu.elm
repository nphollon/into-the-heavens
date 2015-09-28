module Menu (engine, view) where

import Update exposing (Engine)
import Menu.Model as Model
import Menu.View as View


engine : Engine
engine =
  { init = Model.init
  , update = Model.update
  , transition = Model.transition
  }


view = View.view
