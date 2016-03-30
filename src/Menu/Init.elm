module Menu.Init (..) where

import Effects exposing (Effects)
import Random.PCG exposing (Seed)
import Types exposing (..)


menu : Seed -> Library -> ( Mode, Effects Update )
menu seed library =
  noEffects
    (MenuMode { seed = seed, library = library })
