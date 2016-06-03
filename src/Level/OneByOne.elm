module Level.OneByOne exposing (data)

import Dict
import Color
import Types exposing (..)
import Math.Vector as Vector
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
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
              , { defaultBody
                    | position = Vector.vector -35 5 -10
                    , angVelocity = Vector.vector 3.0e-2 4.0e-2 0
                    , bounds = Just "Cage"
                    , health = 1
                }
              )
            ]
    , graphics =
        [ Background "Background"
        , Object
            { bodyId = 1
            , meshName = "Cage"
            , shader = Matte Color.purple
            }
        ]
    , names = Dict.empty
    }
