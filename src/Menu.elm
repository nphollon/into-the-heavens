module Menu where

import Graphics.Element as Layout
import Time exposing (Time)

type alias Model =
  { time: Float
  }

                 
init : Model
init = { time = 0 }


update : Time -> Model -> Model
update dt model =
  { model | time <- dt + model.time }


ready : Model -> Layout.Element
ready = Layout.show
