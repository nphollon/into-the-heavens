module Level.FlightTest exposing (data, update)

import Dict
import Color
import Types exposing (..)
import Library
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Math.Frame as Frame
import Graphics.Material as Material


data : Library -> LevelData
data library =
    { level = SimplePlatform
    , universe =
        Dict.fromList
            [ ( coreId
              , { frame =
                    { position = Vector.vector 5 120 55
                    , orientation = Quaternion.identity
                    }
                , delta =
                    { position = Vector.vector 0 0 0
                    , orientation = Quaternion.rotateX (turns 0.3)
                    }
                , bounds = Library.getBounds "Cage" library
                , health = 5
                , ai =
                    Dumb
                        { meshName = "Icostar"
                        , material = Material.matte Color.lightBlue
                        }
                , collisionClass = Solid
                }
              )
            , ( 2
              , { frame =
                    { position = Vector.vector 5 120 40
                    , orientation = Quaternion.rotateX (turns -0.25)
                    }
                , delta = Frame.identity
                , bounds = Library.getBounds "Blossom" library
                , health = 5
                , ai =
                    Dumb
                        { meshName = "Blossom"
                        , material = Material.matte Color.blue
                        }
                , collisionClass = Scenery
                }
              )
            ]
    }


coreId : Int
coreId =
    1


update : GameState -> ( MissionStatus, List EngineEffect )
update model =
    case model.missionStatus of
        Beginning ->
            ( InProgress, [ Notify "Destroy the platform." ] )

        InProgress ->
            if Dict.member coreId model.universe then
                ( InProgress, [] )
            else
                ( CountdownToVictory 300, [ Notify "Good job." ] )

        CountdownToVictory tick ->
            if tick > 0 then
                ( CountdownToVictory (tick - 1), [] )
            else
                ( Victory, [] )

        Victory ->
            ( Victory, [] )
