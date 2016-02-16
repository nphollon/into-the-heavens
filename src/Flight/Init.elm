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
      , bodies =
          Dict.fromList
            [ ( "player"
              , { geometry =
                    { position = Vector.vector 0 0 0
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0 0
                    }
                , bodyType = Camera { action = inaction }
                }
              )
            , ( "planet"
              , { geometry =
                    { position = Vector.vector 0 -20 0
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 3.0e-2 0
                    }
                , bodyType =
                    Inert
                      { meshName = "Sphere"
                      , shader = Planet
                      , hull = Collision.hull .position Sphere.mesh
                      }
                }
              )
            , ( "other"
              , { geometry =
                    { position = Vector.vector 0 0 -20
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0 0
                    }
                , bodyType =
                    Active
                      { meshName = "Ship"
                      , shader = Ship
                      , hull = Collision.hull .position Ship.mesh
                      , action = inaction
                      , ai = Resting 1
                      }
                }
              )
            , ( "background"
              , { geometry =
                    { position = Vector.vector 0 0 0
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0 0
                    }
                , bodyType =
                    Background
                      { meshName = "Background"
                      }
                }
              )
            ]
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
