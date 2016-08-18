module Pause.Init exposing (pause)

import Types exposing (..)


pause : GameState -> ( Mode, Cmd Update )
pause gameData =
    PauseMode { inProgress = gameData } ! []
