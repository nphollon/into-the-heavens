module Menu (Model, timeUpdate, resourceUpdate, view, init) where

import Menu.Model as Model
import Menu.View as View


type alias Model = Model.Model

timeUpdate = Model.timeUpdate

resourceUpdate = Model.resourceUpdate

view = View.view

init = Model.init
