module Menu.Model where

import Char
import Set
import Time exposing (Time)

import Mesh
import Flight
import Update exposing (Update(..))

                 
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
