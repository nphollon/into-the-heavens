module Level.Outnumbered exposing (data)

import Color
import Dict exposing (Dict)
import Types exposing (..)
import Library
import Math.Vector as Vector
import Math.Quaternion as Quaternion


data : Library -> LevelData
data library =
    { level = Outnumbered
    , events =
        [ ( Immediately
          , [ Notify "Somebody is at the door. Could you get it?"
            , SpawnCheckpoint "start" (Vector.vector 0 6 -10)
            ]
          )
        , ( ReachedCheckpoint "start"
          , [ DestroyByName "start"
            , Notify "Here they come."
            , SpawnShips 2
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "We have some more visitors."
            , SpawnShips 5
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "They just keep coming."
            , SpawnShips 8
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "Come back inside before dinner gets cold."
            , SpawnCheckpoint "home" (Vector.vector 0 0 0)
            ]
          )
        , ( ReachedCheckpoint "home", [ Victory ] )
        ]
    , universe =
        Dict.fromList
            [ ( 1
              , { position = Vector.vector 0 -20 0
                , velocity = Vector.vector 0 0 0
                , orientation = Quaternion.identity
                , angVelocity = Vector.vector 0 3.0e-2 0
                , bounds = Library.getBounds "Sphere" library
                , health = 1.0e10
                , ai =
                    Dumb
                        { meshName = "Sphere"
                        , shader = Matte Color.darkGreen
                        }
                , collisionClass = Scenery
                }
              )
            ]
    , names = Dict.empty
    }
