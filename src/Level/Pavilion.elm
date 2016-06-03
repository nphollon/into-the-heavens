module Level.Pavilion exposing (data)

import Dict
import Color
import Types exposing (..)
import Math.Vector as Vector
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
    { level = Pavilion
    , events =
        [ ( Immediately
          , [ Notify "Fly to the checkpoint when you are ready."
            , SpawnCheckpoint "begin" (Vector.vector 0 -5 0)
            ]
          )
        , ( ReachedCheckpoint "begin"
          , [ DestroyByName "begin"
            , Notify "You have 2 visitors."
            , SpawnShips 2
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "You have 2 more visitors."
            , SpawnShips 2
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "You have 2 more visitors."
            , SpawnShips 2
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "You have 2 more visitors."
            , SpawnShips 2
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "You have 2 more visitors."
            , SpawnShips 2
            ]
          )
        , ( NoMoreVisitors
          , [ Notify "Victory!"
            ]
          )
        , ( SecondsLater 3, [ Victory ] )
        ]
    , universe =
        Dict.fromList
            [ ( 1
              , { defaultBody
                    | position = Vector.vector -60 0 -60
                    , orientation = Vector.vector 0 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 2
              , { defaultBody
                    | position = Vector.vector 60 0 -60
                    , orientation = Vector.vector 0 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 3
              , { defaultBody
                    | position = Vector.vector 60 0 60
                    , orientation = Vector.vector (turns 0.5) 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 4
              , { defaultBody
                    | position = Vector.vector -60 0 60
                    , orientation = Vector.vector (turns 0.5) 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 5
              , { defaultBody
                    | position = Vector.vector -60 -60 0
                    , orientation = Vector.vector (turns 0.25) 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 6
              , { defaultBody
                    | position = Vector.vector -60 60 0
                    , orientation = Vector.vector (turns 0.25) 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 7
              , { defaultBody
                    | position = Vector.vector 60 -60 0
                    , orientation = Vector.vector (turns -0.25) 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 8
              , { defaultBody
                    | position = Vector.vector 60 60 0
                    , orientation = Vector.vector (turns -0.25) 0 0
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 9
              , { defaultBody
                    | position = Vector.vector 0 -60 -60
                    , orientation = Vector.vector 0 0 (turns 0.25)
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 10
              , { defaultBody
                    | position = Vector.vector 0 60 -60
                    , orientation = Vector.vector 0 0 (turns 0.25)
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 11
              , { defaultBody
                    | position = Vector.vector 0 -60 60
                    , orientation = Vector.vector 0 0 (turns -0.25)
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            , ( 12
              , { defaultBody
                    | position = Vector.vector 0 60 60
                    , orientation = Vector.vector 0 0 (turns -0.25)
                    , bounds = Just "Column"
                    , health = 1.0e10
                }
              )
            ]
    , graphics =
        [ Background "Background"
        , Object
            { bodyId = 1
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 2
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 3
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 4
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 5
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 6
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 7
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 8
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 9
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 10
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 11
            , meshName = "Column"
            , shader = Matte Color.white
            }
        , Object
            { bodyId = 12
            , meshName = "Column"
            , shader = Matte Color.white
            }
        ]
    , names = Dict.empty
    }
