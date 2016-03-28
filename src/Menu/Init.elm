module Menu.Init (..) where

import Effects exposing (Effects)
import Random.PCG exposing (Seed)
import Types exposing (..)


menu : Seed -> Library -> ( Mode, Effects Update )
menu seed library =
  ( MenuMode { seed = seed, library = library }, Effects.none )
