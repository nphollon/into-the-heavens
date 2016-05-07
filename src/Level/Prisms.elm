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
                      { a = 18
                      , b = 12
                      , c = 12
                      , position = Vector.vector 0 0 0
                      , orientation = Vector.vector 0 0 0
                      }
                      (Leaf
                        { a = 9
                        , b = 6
                        , c = 3
                        , position = Vector.vector -9 -6 -9
                        , orientation = Vector.vector 0 0 0
                        }
                      )
                      (Leaf
                        { a = 9
                        , b = 6
                        , c = 3
                        , position = Vector.vector 12 3 9
                        , orientation = Vector.vector 0 0 0
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
