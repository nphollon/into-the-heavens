module Flight.Init (game) where

import Dict
import Random.PCG as Random exposing (Seed)
import Effects exposing (Effects)
import Types exposing (..)
import Flight.Util as Util
import Flight.Spawn as Spawn


game : LevelData -> Seed -> Library -> ( Mode, Effects Update )
game data seed library =
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
  , playerActions = []
  , names = Dict.empty
  , level = data.level
  , events = data.events
  , universe = Spawn.spawnPlayer data.universe
  , graphics = data.graphics ++ hud
  }
    |> tick GameMode


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
