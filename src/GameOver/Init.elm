module GameOver.Init (gameOver) where

import Types exposing (..)
import Random.PCG exposing (Seed)


gameOver : Seed -> Library -> Mode
gameOver seed library =
  GameOverMode
    { library = library
    , seed = seed
    }
