module Level.Outnumbered (data) where

import Color
import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector
import Flight.Spawn as Spawn exposing (defaultBody)


data : LevelData
data =
  { level = Outnumbered
  , events =
      [ ( Immediately
        , [ Notify "Somebody is at the door. Could you get it?"
          , SpawnCheckpoint "start" (Vector.vector 0 6 -10)
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
        , [ Notify "They just keep coming."
          , SpawnShips 8
          ]
        )
      , ( NoMoreVisitors
        , [ Notify "Come back inside before dinner gets cold."
          , SpawnCheckpoint "home" (Vector.vector 0 0 0)
          ]
        )
      , ( ReachedCheckpoint "home", [ Victory ] )
      ]
  , universe =
      Dict.fromList
        [ ( 1
          , { defaultBody
              | position = Vector.vector 0 -20 0
              , angVelocity = Vector.vector 0 3.0e-2 0
              , bounds = Just "Sphere"
              , health = 1.0e10
            }
          )
        ]
  , graphics =
      [ Background "Background"
      , Object
          { bodyId = 1
          , meshName = "Sphere"
          , shader = Matte Color.darkGreen
          }
      ]
  , names = Dict.empty
  }
