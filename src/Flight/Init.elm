module Flight.Init exposing (game, resume)

import Dict
import Set
import Random.Pcg as Random exposing (Seed)
import Types exposing (..)
import Flight.Player as Player
import Flight.Mechanics as Mechanics


game : LevelData -> Seed -> Library -> ( Mode, Cmd Update )
game data seed library =
    GameMode
        { library = library
        , missionStatus = Beginning
        , clockTime = Nothing
        , lag = 0
        , gameTime = 0
        , seed = seed
        , nextId = 100
        , log = []
        , keysDown = Set.empty
        , level = data.level
        , universe =
            Dict.insert Mechanics.playerId
                (Player.init library)
                data.universe
        }
        ! []


resume : GameState -> ( Mode, Cmd Update )
resume gameData =
    GameMode { gameData | clockTime = Nothing } ! []
