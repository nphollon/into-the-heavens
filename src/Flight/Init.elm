module Flight.Init exposing (game)

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
        , victory = False
        , clockTime = Nothing
        , lag = 0
        , gameTime = 0
        , seed = seed
        , nextId = 100
        , score = 0
        , log = []
        , lastEventTime = 0
        , playerActions = Set.empty
        , names = Dict.empty
        , level = data.level
        , events = data.events
        , universe =
            Dict.insert Mechanics.playerId
                (Player.init library)
                data.universe
        }
        ! []
