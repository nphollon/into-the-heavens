module Level.Tutorial (data) where

import Dict
import Types exposing (..)
import Math.Vector as Vector
import Math.Collision as Collision
import Generate.Sphere as Sphere
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
  { level = Tutorial
  , events =
      [ ( Immediately
        , [ Notify "Fly forward to the checkpoint."
          , SpawnCheckpoint "first" (Vector.vector 0 0 -10)
          ]
        )
      , ( ReachedCheckpoint "first"
        , [ DestroyByName "first"
          , SpawnCheckpoint "second" (Vector.vector -35 0 -40)
          , Notify "Thrusting increases your speed."
          , Notify "You must brake to slow down again."
          , Notify "Fly to the next checkpoint."
          ]
        )
      , ( ReachedCheckpoint "second"
        , [ DestroyByName "second"
          , SpawnCheckpoint "south pole" (Vector.vector -35 -13.5 -10)
          , Notify "Find the checkpoint on the surface of the planet. Be careful!"
          ]
        )
      , ( ReachedCheckpoint "south pole", [ Victory ] )
      ]
  , universe =
      Dict.fromList
        [ ( 1
          , { defaultBody
              | position = Vector.vector -35 5 -10
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
