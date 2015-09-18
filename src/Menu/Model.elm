module Menu.Model where

import Time exposing (Time)

type alias Model =
  { time: Float
  }

                 
init : Model
init = { time = 0 }


update : Time -> Model -> Model
update dt model =
  { model | time <- dt + model.time }
