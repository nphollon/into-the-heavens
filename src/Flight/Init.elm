module Flight.Init (game, defaultBody, inaction, defaultCockpit, playerName) where

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
      , gameTime = 0
      , seed = seed
      , nextId = 0
      , score = 0
      , log = [ ( 0, "Be careful up there." ) ]
      , playerActions = []
      , universe =
          Dict.fromList
            [ ( playerName
              , { defaultBody
                  | hull = Collision.hull .position Ship.triangles
                  , health = 1
                  , ai = PlayerControlled defaultCockpit
                }
              )
            , ( "planet"
              , { defaultBody
                  | position = Vector.vector 0 -20 0
                  , angVelocity = Vector.vector 0 3.0e-2 0
                  , hull = Collision.hull .position Sphere.triangles
                  , health = 1.0e10
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
          , Target "TargetDecor"
          , Highlight
              { meshName = "IncomingDecor"
              , filter =
                  \body ->
                    case body.ai of
                      Seeking _ x ->
                        x == playerName

                      _ ->
                        False
              }
          , Shield "Shield"
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


defaultCockpit : Cockpit
defaultCockpit =
  { action = inaction
  , target = ""
  , trigger = { value = 0, decay = 0.3 }
  , shields = { value = 1, decay = 5, recover = 10, on = False }
  }


defaultBody : Body
defaultBody =
  { position = Vector.vector 0 0 0
  , velocity = Vector.vector 0 0 0
  , orientation = Vector.vector 0 0 0
  , angVelocity = Vector.vector 0 0 0
  , hull = []
  , health = 0
  , ai = Dumb
  }


playerName : String
playerName =
  "player"
