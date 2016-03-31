module Flight.Init (game) where

import Dict
import Random.PCG as Random exposing (Seed)
import Effects exposing (Effects)
import Types exposing (..)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision
import Math.Vector as Vector
import Flight.Util as Util
import Flight.Spawn as Spawn exposing (defaultBody)


game : Seed -> Library -> ( Mode, Effects Update )
game seed library =
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
  , events =
      [ ( SecondsLater 1
        , [ Notify "Somebody is at the door. Could you get it?"
          , SpawnCheckpoint "start" startBody
          ]
        )
      , ( ReachedCheckpoint "start"
        , [ DestroyByName "start"
          , Notify "Here they come."
          , SpawnShips 2
          ]
        )
      , ( NoMoreVisitors
        , [ Notify "We have some more visitors."
          , SpawnShips 5
          ]
        )
      , ( NoMoreVisitors
        , [ Notify "Come back inside before dinner gets cold."
          , SpawnCheckpoint "home" homeBody
          ]
        )
      , ( ReachedCheckpoint "home", [ Victory ] )
      ]
  , playerActions = []
  , names = Dict.empty
  , universe =
      Dict.fromList
        [ ( Spawn.playerId
          , { defaultBody
              | hull = Just (Collision.hull .position Ship.triangles)
              , health = 1
              , ai = PlayerControlled Spawn.defaultCockpit
            }
          )
        , ( 1
          , { defaultBody
              | position = Vector.vector 0 -20 0
              , angVelocity = Vector.vector 0 3.0e-2 0
              , hull = Just (Collision.hull .position Sphere.triangles)
              , health = 1.0e10
            }
          )
        ]
  , graphics =
      [ Background "Background"
      , Object
          { bodyId = 1
          , meshName = "Sphere"
          , shader = Planet
          }
      , Target "TargetDecor"
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
  }
    |> GameMode
    |> tick


homeBody : Body
homeBody =
  { defaultBody
    | position = Vector.vector 0 -1 0
    , angVelocity = Vector.vector 0 1 0
  }


startBody : Body
startBody =
  { defaultBody
    | position = Vector.vector 0 6 -10
    , angVelocity = Vector.vector 1 0 0
  }
