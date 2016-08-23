module Level.FlightTest exposing (data)

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
            [ ( 1
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
