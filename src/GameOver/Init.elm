module GameOver.Init (gameOver) where

import Types exposing (Mode(..), Library, Update)
import Effects exposing (Effects)
import Random.PCG exposing (Seed)


gameOver : Seed -> Library -> ( Mode, Effects Update )
gameOver seed library =
  (,)
    (GameOverMode
      { library = library
      , seed = seed
      }
    )
    Effects.none
