module Menu (engine, view) where

import Html exposing (Html)
import Update exposing (Engine)
import Menu.View as View
import Char
import Set
import Mesh
import Update exposing (Update(..), Engine, Data, Mode)


engine : Engine
engine =
  { init = init
  , update = update
  , transition = transition
  }


view : Signal.Address Update -> Data -> Html
view =
  View.view


init : Data -> Data
init model =
  { model
    | resources = Mesh.Waiting
    , continue = False
  }


update : Update -> Data -> Data
update input model =
  case input of
    FPS dt ->
      model

    Meshes response ->
      { model | resources = response }

    Keys keySet ->
      { model | continue = Set.member (Char.toCode 'N') keySet }


transition : Data -> Maybe Mode
transition data =
  if data.continue then
    Just Update.GameMode
  else
    Nothing
