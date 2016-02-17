module Flight.Init (game, inaction) where

import Color
import Types exposing (..)
import Math.Vector as Vector
import Dict
import Effects exposing (Effects)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision


game : Library -> ( Mode, Effects Update )
game library =
  (,)
    (GameMode
      { library = library
      , continue = False
      , universe =
          Dict.fromList
            [ ( "ship"
              , { position = Vector.vector 0 0 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 0 0
                , hull = []
                , health = 1
                , action = inaction
                }
              )
            , ( "planet"
              , { position = Vector.vector 0 -20 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 3.0e-2 0
                , hull = Collision.hull .position Sphere.mesh
                , action = inaction
                , health = 1.0e10
                }
              )
            , ( "other"
              , { position = Vector.vector 5 5 -20
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 0 0
                , hull = Collision.hull .position Ship.mesh
                , health = 1
                , action =
                    { thrust = 0
                    , pitch = 0
                    , yaw = 0
                    , roll = 0
                    }
                }
              )
            ]
      , graphics =
          [ Background "Background"
          , Object
              { bodyName = "other"
              , meshName = "Ship"
              , shader = Matte Color.purple
              , scale = Nothing
              }
          , Object
              { bodyName = "planet"
              , meshName = "Sphere"
              , shader = Planet
              , scale = Nothing
              }
          , Object
              { bodyName = "missile"
              , meshName = "Ship"
              , shader = Matte Color.red
              , scale = Just 0.1
              }
          ]
      , aiState = Resting 1
      }
    )
    Effects.none


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }
