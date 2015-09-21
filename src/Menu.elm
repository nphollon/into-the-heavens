module Menu (Model, update, view, init) where

import Menu.Model as Model
import Menu.View as View


type alias Model = Model.Model

update = Model.update

view = View.view

init = Model.init
