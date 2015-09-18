module Menu.Model where

import Time exposing (Time)

import Mesh

type alias Model =
  { time: Time
  , resources : Mesh.Response
  }

                 
init : Model
init = { time = 0
       , resources = Mesh.Waiting
       }


timeUpdate : Time -> Model -> Model
timeUpdate dt model =
  { model | time <- dt + model.time }


resourceUpdate : Mesh.Response -> Model -> Model
resourceUpdate response model =
  { model | resources <- response }
