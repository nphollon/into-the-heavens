module Update (..) where

import Set exposing (Set)
import Time exposing (Time)
import Dict
import Char
import Mesh
import Flight.World as World exposing (World)
import Background exposing (Background)
import Math.Mechanics as Mech


type Update
  = Meshes Mesh.Response
  | FPS Time
  | Keys (Set Char.KeyCode)


type Mode
  = GameMode
  | MenuMode
  | GameOverMode


type alias Data =
  { continue : Bool
  , ship : Mech.State
  , resources : Mesh.Response
  , action : Action
  , world : World
  , background : Background
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


defaultShip : Mech.State
defaultShip =
  { time = 0
  , bodies = Dict.empty
  }


defaultData : Data
defaultData =
  { action = inaction
  , ship = defaultShip
  , world = World.empty
  , background = Background.empty
  , continue = False
  , resources = Mesh.Waiting
  }
