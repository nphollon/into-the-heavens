module Level.Prisms (data) where

import Dict
import Color
import Types exposing (..)
import Math.Vector as Vector
import Math.Tree exposing (Tree(..))
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
              , angVelocity = Vector.vector 0 0 0
              , bounds =
                  Just
                    (Node
                      { a = 6
                      , b = 4
                      , c = 4
                      , position = Vector.vector 0 0 0
                      , orientation = Vector.vector 0 0 0
                      }
                      (Leaf
                        { a = 3
                        , b = 2
                        , c = 1
                        , position = Vector.vector -3 -2 -3
                        , orientation = Vector.vector 0 0 0
                        }
                      )
                      (Leaf
                        { a = 3
                        , b = 2
                        , c = 1
                        , position = Vector.vector 4 1 3
                        , orientation = Vector.vector 0 0 (degrees 90)
                        }
                      )
                    )
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
