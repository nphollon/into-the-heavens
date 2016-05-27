module Level.Pavilion (data) where

import Dict
import Color
import Types exposing (..)
import Math.Vector as Vector
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
  { level = Pavilion
  , events =
      [ ( Immediately
        , [ Notify "Nothing to do here but admire the scenery."
          , SpawnCheckpoint "exit" (Vector.vector 0 -5 0)
          ]
        )
      , ( ReachedCheckpoint "exit", [ Victory ] )
      ]
  , universe =
      Dict.fromList
        [ ( 1
          , { defaultBody
              | position = Vector.vector -35 5 -10
              , angVelocity = Vector.vector 1 0 0
              , bounds = Just "Donut"
              , health = 1.0e10
            }
          )
        ]
  , graphics =
      [ Background "Background"
      , Object
          { bodyId = 1
          , meshName = "Donut"
          , shader = Matte Color.white
          }
      ]
  , names = Dict.empty
  }
