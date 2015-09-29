module Menu (engine, view) where

import Update exposing (Engine)
import Menu.View as View

import Char
import Set
import Time exposing (Time)

import Mesh
import Update exposing (Update(..))

                 
engine : Update.Engine
engine =
  { init = init
  , update = update
  , transition = transition
  }


view = View.view


init : Update.Data -> Update.Data
init model =
  { model | time <- 0
          , resources <- Mesh.Waiting
          , continue <- False
  }


update : Update -> Update.Data -> Update.Data
update input model =
  case input of
    FPS dt ->
      { model | time <- dt + model.time }

    Meshes response ->
      { model | resources <- response }

    Keys keySet ->
      { model | continue <- Set.member (Char.toCode 'N') keySet }
               
      
transition : Update.Data -> Maybe Update.Mode
transition data =
  if | data.continue -> Just Update.GameMode
     | otherwise -> Nothing
