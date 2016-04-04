module Level.AtmosphereTest (data) where

import Dict
import Types exposing (..)
import Math.Vector as Vector
import Math.Collision as Collision
import Generate.Sphere as Sphere
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
  { level = AtmosphereTest
  , events = []
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
      , Atmosphere { bodyId = 1 }
      ]
  , names = Dict.empty
  }
