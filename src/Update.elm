module Update (..) where

import Set exposing (Set)
import Time exposing (Time)
import Dict
import Char
import Mesh
import Math.Matrix4 as Mat4 exposing (Mat4)
import World exposing (World)
import Background exposing (Background)
import Math.Mechanics as Mech
import Math.Vector exposing (vector)
import Math.Orientation exposing (fromVector)


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
    , orientation : Mat4
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
    , bodies =
        Dict.singleton
            "ship"
            { position = vector 0 0 0
            , velocity = vector 0 0 0
            , orientation = fromVector (vector 0 0 0)
            , angVelocity = vector 0 0 0
            , inertia = vector 1 1 1
            , mass = 1
            }
    }


defaultData : Data
defaultData =
    { action = inaction
    , ship = defaultShip
    , background = Background.empty
    , continue = False
    , orientation = Mat4.identity
    , resources = Mesh.Waiting
    , world = World.empty
    }
