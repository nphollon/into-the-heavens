module Level.Pavilion exposing (data)

import Dict
import Color
import Types exposing (..)
import Library
import Math.Vector as Vector
import Math.Quaternion as Quaternion exposing (Quaternion)
import Math.Frame as Frame


data : Library -> LevelData
data library =
    let
        column position orientation =
            { frame =
                { position = position
                , orientation = orientation
                }
            , delta = Frame.identity
            , bounds = Library.getBounds "Column" library
            , health = 1.0e10
            , ai =
                Dumb
                    { meshName = "Column"
                    , shader = Matte Color.white
                    }
            , collisionClass = Scenery
            }
    in
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
                [ ( 1, column (Vector.vector -60 0 -60) negZ )
                , ( 2, column (Vector.vector 60 0 -60) negZ )
                , ( 3, column (Vector.vector 60 0 60) posZ )
                , ( 4, column (Vector.vector -60 0 60) posZ )
                , ( 5, column (Vector.vector -60 -60 0) negX )
                , ( 6, column (Vector.vector -60 60 0) negX )
                , ( 7, column (Vector.vector 60 -60 0) posX )
                , ( 8, column (Vector.vector 60 60 0) posX )
                , ( 9, column (Vector.vector 0 -60 -60) negY )
                , ( 10, column (Vector.vector 0 -60 60) negY )
                , ( 11, column (Vector.vector 0 60 -60) posY )
                , ( 12, column (Vector.vector 0 60 60) posY )
                ]
        , names = Dict.empty
        }


negZ : Quaternion
negZ =
    Quaternion.identity


posZ : Quaternion
posZ =
    Quaternion.quaternion 0 1 0 0


negX : Quaternion
negX =
    Quaternion.quaternion rightTurn rightTurn 0 0


posX : Quaternion
posX =
    Quaternion.quaternion rightTurn -rightTurn 0 0


negY : Quaternion
negY =
    Quaternion.quaternion rightTurn 0 0 rightTurn


posY : Quaternion
posY =
    Quaternion.quaternion rightTurn 0 0 -rightTurn



-- This is 45 degrees instead of 90 because quaternions store half-angles


rightTurn : Float
rightTurn =
    cos (degrees 45)
