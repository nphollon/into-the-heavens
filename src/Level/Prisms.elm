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
              | position = Vector.vector -3 0 -10
            }
          )
        , ( 2
          , { defaultBody
              | position = Vector.vector 0 0 -10
            }
          )
        , ( 3
          , { defaultBody
              | position = Vector.vector 3 0 -10
            }
          )
        ]
  , graphics =
      [ Background "Background"
      , Object
          { bodyId = 1
          , meshName = "Prism Hull"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 2
          , meshName = "Prism"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 3
          , meshName = "Prism Box"
          , shader = Matte Color.white
          }
      ]
  , names = Dict.empty
  }
