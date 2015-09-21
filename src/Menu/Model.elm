module Menu.Model where

import Time exposing (Time)

import Mesh
import Update exposing (Update(..))

type alias Model =
  { time: Time
  , resources : Mesh.Response
  }

                 
init : Model
init =
  { time = 0
  , resources = Mesh.Waiting
  }


update : Update -> Model -> Model
update input model =
  case input of
    FPS dt ->
      { model | time <- dt + model.time }

    Meshes response ->
      { model | resources <- response }

    otherwise ->
      model


