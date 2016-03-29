module Flight.Init (game) where

import Dict
import Random.PCG as Random exposing (Seed)
import Effects exposing (Effects)
import Types exposing (..)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision
import Math.Vector as Vector
import Flight.Util as Util
import Flight.Spawn as Spawn exposing (defaultBody)


game : Seed -> Library -> ( Mode, Effects Float )
game seed library =
  (,)
    (GameMode
      { library = library
      , hasFocus = True
      , victory = False
      , clockTime = Nothing
      , lag = 0
      , gameTime = 0
      , seed = seed
      , nextId = 0
      , score = 0
      , log = []
      , events =
          [ Notify "Be careful up there."
          , SpawnShips 1
          , Notify "You have new visitors."
          , SpawnShips 2
          , Notify "Uh oh."
          , SpawnShips 8
          , Victory
          ]
      , playerActions = []
      , universe =
          Dict.fromList
            [ ( Spawn.playerName
              , { defaultBody
                  | hull = Collision.hull .position Ship.triangles
                  , health = 1
                  , ai = PlayerControlled Spawn.defaultCockpit
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
          , Target "TargetDecor"
          , Highlight
              { meshName = "IncomingDecor"
              , filter = Util.isSeekingPlayer
              }
          , Highlight
              { meshName = "VisitorDecor"
              , filter = Util.isVisitor
              }
          , Shield "Shield" "EnergyBar"
          , Reticule "Reticule"
          ]
      }
    )
    (Effects.tick identity)
