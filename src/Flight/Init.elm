module Flight.Init (game, inaction) where

import Dict
import Random.PCG as Random exposing (Seed)
import Effects exposing (Effects)
import Types exposing (..)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision
import Math.Vector as Vector


game : Seed -> Library -> ( Mode, Effects Update )
game seed library =
  (,)
    (GameMode
      { library = library
      , hasFocus = True
      , clockTime = Nothing
      , lag = 0
      , seed = seed
      , nextId = 0
      , score = -1
      , universe =
          Dict.fromList
            [ ( "ship"
              , { position = Vector.vector 0 0 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 0 0
                , hull = Collision.hull .position Ship.triangles
                , health = 1
                , ai =
                    PlayerControlled
                      { action = inaction
                      , target = ""
                      , trigger = Ready
                      }
                }
              )
            , ( "planet"
              , { position = Vector.vector 0 -20 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 3.0e-2 0
                , hull = Collision.hull .position Sphere.triangles
                , health = 1.0e10
                , ai = Dumb
                }
              )
            ]
      , graphics =
          [ Background "Background"
          , Object
              { bodyName = "planet"
              , meshName = "Sphere"
              , shader = Planet
              }
          , Reticule "Reticule"
          , Target
              { meshName = "TargetDecor"
              }
          , Highlight
              { meshName = "IncomingDecor"
              , filter =
                  \body ->
                    case body.ai of
                      Seeking _ "ship" ->
                        True

                      _ ->
                        False
              }
          , Reticule "Shield"
          ]
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
