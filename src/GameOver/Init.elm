module GameOver.Init (crash, victory) where

import Types exposing (..)
import Random.PCG exposing (Seed)


crash : Seed -> Library -> Mode
crash =
  gameOver False


victory : Seed -> Library -> Mode
victory =
  gameOver True


gameOver : Bool -> Seed -> Library -> Mode
gameOver won seed library =
  GameOverMode
    { library = library
    , seed = seed
    , won = won
    }
