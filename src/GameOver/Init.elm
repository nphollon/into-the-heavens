module GameOver.Init (gameOver) where

import Types exposing (..)
import Random.PCG exposing (Seed)


gameOver : Seed -> Library -> Difficulty -> Mode
gameOver seed library difficulty =
  GameOverMode
    { library = library
    , seed = seed
    , difficulty = difficulty
    }
