module Flight.Init (game, inaction, ship) where

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
      , hasFired = False
      , hasFocus = True
      , score = 0
      , nextId = 0
      , clockTime = Nothing
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
            , ( "visitor"
              , ship
              )
            ]
      , graphics =
          [ Background "Background"
          , Object
              { bodyName = "visitor"
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
          ]
      , aiState = Resting 4
      }
    )
    (Effects.tick Tick)


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


ship : Body
ship =
  { position = Vector.vector 5 200 -20
  , velocity = Vector.vector 0 -50 0
  , orientation = Vector.vector (-0.5 * pi) 0 0
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
