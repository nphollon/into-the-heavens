module Flight.Init (game, inaction) where

import Update exposing (..)
import Math.Vector as Vector
import Dict
import Effects exposing (Effects)


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
                    }
                  )
                , ( "planet"
                  , { position = Vector.vector 1 -2 -5
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0.3 0
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    }
                  )
                , ( "other"
                  , { position = Vector.vector 0 0 -20
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0.1 0.3 0.4
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    }
                  )
                ]
          }
      , hulls =
          [ [], [] ]
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
      , action = inaction
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
