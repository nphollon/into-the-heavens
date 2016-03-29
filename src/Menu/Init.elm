module Menu.Init (..) where

import Random.PCG exposing (Seed)
import Types exposing (..)


menu : Seed -> Library -> Mode
menu seed library =
  MenuMode { seed = seed, library = library }
