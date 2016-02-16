module Flight.Init (game, inaction) where

import Types exposing (..)
import Math.Vector as Vector
import Dict
import Effects exposing (Effects)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision


game : Library -> ( Mode, Effects a )
game library =
  (,)
    (GameMode
      { library = library
      , continue = False
      , universe =
          { time = 0
          , bodies =
              Dict.fromList
                [ ( "ship"
                  , { position = Vector.vector 0 0 0
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0 0
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    , hull = []
                    , action = inaction
                    }
                  )
                , ( "planet"
                  , { position = Vector.vector 0 -20 0
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 3.0e-2 0
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    , hull = Collision.hull .position Sphere.mesh
                    , action = inaction
                    }
                  )
                , ( "other"
                  , { position = Vector.vector 0 0 -20
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0 0
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    , hull = Collision.hull .position Ship.mesh
                    , action =
                        { thrust = 0
                        , pitch = 0
                        , yaw = 0
                        , roll = 0
                        }
                    }
                  )
                ]
          }
      , graphics =
          [ Background "Background"
          , Object
              { bodyName = "other"
              , meshName = "Ship"
              , shader = Ship
              }
          , Object
              { bodyName = "planet"
              , meshName = "Sphere"
              , shader = Planet
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
