module GameOver.Init (gameOver) where

import Types exposing (Mode(..), Library, Update)
import Effects exposing (Effects)


gameOver : Library -> ( Mode, Effects Update )
gameOver library =
  ( GameOverMode { library = library }, Effects.none )
