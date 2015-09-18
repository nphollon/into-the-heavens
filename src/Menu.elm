module Menu (Model, update, loading, ready, resourceFailure, init) where

import Menu.Model as Model
import Menu.View as View


type alias Model = Model.Model

update = Model.update

loading = View.loading

ready = View.ready

resourceFailure = View.resourceFailure

init = Model.init
