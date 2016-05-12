module Level.Prisms (data) where

import Dict
import Color
import Types exposing (..)
import Math.Vector as Vector
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
  { level = Prisms
  , events =
      [ ( Immediately
        , [ Notify "Nothing to do here but admire the scenery."
          ]
        )
      ]
  , universe =
      Dict.fromList
        [ ( 1
          , { defaultBody
              | position = Vector.vector -35 5 -10
              , angVelocity = Vector.vector 0.5 0 0.5
              , bounds = Nothing
              , health = 1.0e10
            }
          )
        ]
  , graphics =
      [ Background "Background"
      , Object
          { bodyId = 1
          , meshName = "Prism"
          , shader = Matte Color.white
          }
      ]
  , names = Dict.empty
  }
