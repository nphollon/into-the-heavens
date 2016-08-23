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
            [ ( platformId
              , { frame =
                    { position = Vector.vector -35 5 -10
                    , orientation = Quaternion.identity
                    }
                , delta = Frame.identity
                , bounds = Library.getBounds "Cage" library
                , health = 5
                , ai =
                    Dumb
                        { meshName = "Cage"
                        , material = Material.matte Color.lightBlue
                        }
                , collisionClass = Solid
                }
              )
            ]
    }


platformId : Int
platformId =
    1


update : GameState -> ( MissionStatus, List EngineEffect )
update model =
    case model.missionStatus of
        Beginning ->
            ( InProgress, [ Notify "Destroy the platform." ] )

        InProgress ->
            if Dict.member platformId model.universe then
                ( InProgress, [] )
            else
                ( CountdownToVictory 500, [ Notify "Good job." ] )

        CountdownToVictory tick ->
            if tick > 0 then
                ( CountdownToVictory (tick - 1), [] )
            else
                ( Victory, [] )

        Victory ->
            ( Victory, [] )
