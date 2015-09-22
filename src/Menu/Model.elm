module Menu.Model where

import Time exposing (Time)

import Mesh
import Flight
import Update exposing (Update(..))

type alias Model =
  { time: Time
  , resources : Mesh.Response
  , continue : Maybe Flight.Model 
  }

                 
init : Model
init =
  { time = 0
  , resources = Mesh.Waiting
  , continue = Nothing
  }


update : Update -> Model -> Model
update input model =
  case input of
    FPS dt ->
      { model | time <- dt + model.time }

    Meshes response ->
      { model | resources <- response }

    Keys _ ->
      continue model
               

continue : Model -> Model
continue model =
  case model.resources of
    Mesh.Success lib ->
      { model | continue <- Just (Flight.init lib) }
    otherwise ->
      model
