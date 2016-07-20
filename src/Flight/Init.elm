module Flight.Init exposing (game)

import Dict
import Set
import Random.Pcg as Random exposing (Seed)
import Types exposing (..)
import Flight.Util as Util
import Flight.Spawn as Spawn


game : LevelData -> Seed -> Library -> ( Mode, Cmd Update )
game data seed library =
    GameMode
        (Spawn.spawnPlayer
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
            , universe = data.universe
            , graphics = data.graphics ++ hud
            }
        )
        ! []


hud : List GraphicsObject
hud =
    [ Target "TargetDecor"
    , Highlight
        { meshName = "IncomingDecor"
        , filter = Util.isSeekingPlayer
        }
    , Highlight
        { meshName = "VisitorDecor"
        , filter = Util.isVisitor
        }
    , Shield "Shield" "EnergyBar"
    , Reticule "Reticule"
    ]
