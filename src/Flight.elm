module Flight (Model, timeUpdate, controlUpdate, view, init) where

import Flight.Model as Model
import Flight.View as View


type alias Model = Model.Model

timeUpdate = Model.timeUpdate

controlUpdate = Model.controlUpdate

view = View.view

init = Model.init
