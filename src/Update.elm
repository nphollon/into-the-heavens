module Update (..) where

import Set exposing (Set)
import Time exposing (Time)
import Char
import Dict
import Math.Vector as Vector
import Mesh exposing (Vertex, Response, Library)
import Math.Mechanics as Mech


type Update
  = Meshes Mesh.Response
  | FPS Time
  | Keys (Set Char.KeyCode)


type Mode
  = GameMode GameState
  | MenuMode MenuState
  | GameOverMode GameOverState


type alias GameState =
  { continue : Bool
  , universe : Mech.State
  , library : Library
  , action : Action
  }


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


game : Library -> Mode
game library =
  GameMode
    { library = library
    , continue = False
    , universe = levelData
    , action = inaction
    }


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


levelData : Mech.State
levelData =
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


type alias MenuState =
  { response : Response
  , continue : Bool
  }


menu : Mode
menu =
  MenuMode
    { response = Nothing
    , continue = False
    }


type alias GameOverState =
  { continue : Bool
  , library : Library
  }


gameOver : Library -> Mode
gameOver library =
  GameOverMode
    { continue = False
    , library = library
    }
