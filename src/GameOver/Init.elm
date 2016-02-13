module GameOver.Init (gameOver) where

import Types exposing (Mode(..), Library)
import Effects exposing (Effects)


gameOver : Library -> ( Mode, Effects a )
gameOver library =
  ( GameOverMode { library = library }, Effects.none )
