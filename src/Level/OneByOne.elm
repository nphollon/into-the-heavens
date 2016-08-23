module Level.OneByOne exposing (data)

import Dict
import Color
import Types exposing (..)
import Library
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Graphics.Material as Material


data : Library -> LevelData
data library =
    { level = OneByOne
    , events =
        [ ( Immediately
          , [ Notify "Shoot the cage to get to the checkpoint!"
            , SpawnCheckpoint "spawn visitor" (Vector.vector -35 5 -10)
            ]
          )
        , ( ReachedCheckpoint "spawn visitor"
          , [ DestroyByName "spawn visitor"
            , Notify "An enemy ship is circled in blue. Destroy it!"
            , SpawnShips 1
            ]
          )
        , ( SecondsLater 1
          , [ Notify "Missiles are in red. Block them with your shield!" ]
          )
        , ( NoMoreVisitors
          , [ Notify "Destroy 3 more visitors to continue."
            , SpawnShips 1
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "2 visitors to go..."
            , SpawnShips 1
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "Destroy the final visitor!"
            , SpawnShips 1
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "Excellent flying. You may go now."
            , SpawnCheckpoint "exit" (Vector.vector 0 0 0)
            ]
          )
        , ( ReachedCheckpoint "exit", [ Victory ] )
        ]
    , universe =
        Dict.fromList
            [ ( 1
              , { frame =
                    { position = Vector.vector -35 5 -10
                    , orientation = Quaternion.identity
                    }
                , delta =
                    { position = Vector.identity
                    , orientation =
                        Quaternion.fromVector
                            (Vector.vector 3.0e-2 4.0e-2 0)
                    }
                , bounds = Library.getBounds "Cage" library
                , health = 1
                , ai =
                    Dumb
                        { meshName = "Cage"
                        , material = Material.matte Color.purple
                        }
                , collisionClass = Solid
                }
              )
            ]
    , names = Dict.empty
    }
