module Level.FlightTest exposing (data)

import Dict
import Color
import Types exposing (..)
import Library
import Math.Vector as Vector
import Flight.Spawn exposing (defaultBody)


data : Library -> LevelData
data library =
    { level = FlightTest
    , events =
        [ ( Immediately
          , [ Notify "Fly forward to the checkpoint."
            , SpawnCheckpoint "first" (Vector.vector 0 0 -10)
            ]
          )
        , ( ReachedCheckpoint "first"
          , [ DestroyByName "first"
            , SpawnCheckpoint "second" (Vector.vector -35 0 -40)
            , Notify "Your speed stays the same until you thrust or brake."
            , Notify "Fly to the next checkpoint."
            ]
          )
        , ( ReachedCheckpoint "second"
          , [ DestroyByName "second"
            , SpawnCheckpoint "south pole" (Vector.vector -35 -15.2 -10)
            , Notify "Find the checkpoint on the surface of the planet."
            ]
          )
        , ( ReachedCheckpoint "south pole"
          , [ DestroyByName "south pole"
            , SpawnCheckpoint "finish line" (Vector.vector 0 0 5)
            , Notify "Looks like you have the hang of things. Now get to the exit."
            ]
          )
        , ( ReachedCheckpoint "finish line"
          , [ Victory ]
          )
        ]
    , universe =
        Dict.fromList
            [ ( 1
              , { defaultBody
                    | position = Vector.vector -35 5 -10
                    , bounds = Library.getBounds "Sphere" library
                    , health = 1.0e10
                }
              )
            , ( 2
              , { defaultBody
                    | position = Vector.vector 0 0 5
                    , angVelocity = Vector.vector 0.5 0 0
                    , bounds = Library.getBounds "Donut" library
                    , health = 1.0e10
                }
              )
            ]
    , graphics =
        [ Background "Background"
        , Object
            { bodyId = 1
            , meshName = "Sphere"
            , shader = Matte Color.lightBlue
            }
        , Object
            { bodyId = 2
            , meshName = "Donut"
            , shader = Matte Color.lightYellow
            }
        ]
    , names = Dict.empty
    }
