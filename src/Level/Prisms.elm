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
        [ ( 1, { defaultBody | position = Vector.vector -6 4 -8 } )
        , ( 2, { defaultBody | position = Vector.vector -2 4 -8 } )
        , ( 3, { defaultBody | position = Vector.vector 2 4 -8 } )
        , ( 4, { defaultBody | position = Vector.vector 6 4 -8 } )
        , ( 5, { defaultBody | position = Vector.vector -6 0 -8 } )
        , ( 6, { defaultBody | position = Vector.vector -2 0 -8 } )
        , ( 7, { defaultBody | position = Vector.vector 2 0 -8 } )
        , ( 8, { defaultBody | position = Vector.vector 6 0 -8 } )
        , ( 9, { defaultBody | position = Vector.vector -6 -4 -8 } )
        , ( 10, { defaultBody | position = Vector.vector -2 -4 -8 } )
        , ( 11, { defaultBody | position = Vector.vector 2 -4 -8 } )
        , ( 12, { defaultBody | position = Vector.vector 6 -4 -8 } )
        ]
  , graphics =
      [ Background "Background"
      , Object
          { bodyId = 1
          , meshName = "Prism Box 3"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 2
          , meshName = "Prism Box 4"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 3
          , meshName = "Prism Box 5"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 4
          , meshName = "Prism Box 6"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 5
          , meshName = "Prism Box 2"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 6
          , meshName = "Prism Hull"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 7
          , meshName = "Prism"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 8
          , meshName = "Prism Box 7"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 9
          , meshName = "Prism Box 1"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 10
          , meshName = "Prism Box 0"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 11
          , meshName = "Prism Box 9"
          , shader = Matte Color.white
          }
      , Object
          { bodyId = 12
          , meshName = "Prism Box 8"
          , shader = Matte Color.white
          }
      ]
  , names = Dict.empty
  }
