module Level.Outnumbered (data) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector
import Math.Collision as Collision
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Flight.Spawn as Spawn exposing (defaultBody)


data : LevelData
data =
  { level = Outnumbered
  , events =
      [ ( Immediately
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
      ]
  , names = Dict.empty
  }


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
