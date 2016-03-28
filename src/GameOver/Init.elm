module GameOver.Init (gameOver) where

import Types exposing (..)
import Effects exposing (Effects)
import Random.PCG exposing (Seed)


gameOver : Seed -> Library -> Difficulty -> ( Mode, Effects Update )
gameOver seed library difficulty =
  (,)
    (GameOverMode
      { library = library
      , seed = seed
      , difficulty = difficulty
      }
    )
    Effects.none
