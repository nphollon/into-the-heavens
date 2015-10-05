module Update where

import Set exposing (Set)
import Time exposing (Time)
import Keyboard
import Dict exposing (Dict)

import Mesh

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)

import World exposing (World)
import Background exposing (Background)


type Update =
  Meshes Mesh.Response | FPS Time | Keys (Set Keyboard.KeyCode)


type Mode =
    GameMode
  | MenuMode
  | GameOverMode


type alias Data =
  { continue : Bool
  , time : Time
  , resources : Mesh.Response
                
  , orientation : Mat4
  , position : Vec3
  , speed : Float
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


defaultData : Data
defaultData =
  { action = inaction
  , background = Background.empty
  , continue = False
  , orientation = Mat4.identity
  , position = Vec3.vec3 0 0 0
  , resources = Mesh.Waiting
  , speed = 0
  , time = 0
  , world = World.empty
  }
                  
