module Flight (Model, update, view, init) where

import Flight.Model as Model
import Flight.View as View


type alias Model = Model.Model

update = Model.update
         
view = View.view

init = Model.init
