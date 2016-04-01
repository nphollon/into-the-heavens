module Menu.Init (mainMenu, crash, victory) where

import Effects exposing (Effects)
import Random.PCG exposing (Seed)
import Types exposing (..)


mainMenu : Seed -> Library -> ( Mode, Effects Update )
mainMenu =
  menu LevelSelect


crash : Level -> Seed -> Library -> ( Mode, Effects Update )
crash =
  Lost >> menu


victory : Level -> Seed -> Library -> ( Mode, Effects Update )
victory =
  Won >> menu


menu : Room -> Seed -> Library -> ( Mode, Effects Update )
menu room seed library =
  { seed = seed
  , library = library
  , room = room
  }
    |> noEffects MenuMode
