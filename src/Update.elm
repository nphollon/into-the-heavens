module Update (..) where

import Set exposing (Set)
import Time exposing (Time)
import Dict exposing (Dict)
import Char
import Http
import Mesh exposing (Vertex)
import WebGL exposing (Drawable)
import Math.Mechanics as Mech


type Update
  = Meshes (Maybe (Result Http.Error (Dict String (Drawable Vertex))))
  | FPS Time
  | Keys (Set Char.KeyCode)


type MenuState
  = Waiting
  | Failure Http.Error
  | Ready


type Mode
  = GameMode
  | MenuMode
  | GameOverMode


type alias Data =
  { continue : Bool
  , universe : Mech.State
  , resources : MenuState
  , lib : Dict String (Drawable Vertex)
  , action : Action
  }


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


type alias Engine =
  { init : Data -> Data
  , update : Update -> Data -> Data
  , transition : Data -> Maybe Mode
  }


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


defaultData : Data
defaultData =
  { action = inaction
  , universe =
      { time = 0
      , bodies = Dict.empty
      }
  , lib = Dict.empty
  , continue = False
  , resources = Waiting
  }
