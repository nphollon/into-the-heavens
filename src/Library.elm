module Library exposing (getBounds)

import Dict
import Collision exposing (Bounds)
import Types exposing (..)


getBounds : String -> Library -> Bounds
getBounds name library =
    Dict.get name library.boxes |> Maybe.withDefault Collision.empty
