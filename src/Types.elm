module Types exposing (..)

import Set exposing (Set)
import Time exposing (Time)
import Char exposing (KeyCode)
import Dict exposing (Dict)
import Random.Pcg as Random
import Http
import Collision exposing (Bounds)
import WebGL exposing (Drawable)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 exposing (Mat4)
import Math.Frame exposing (Frame)


type alias Flags =
    { seed : ( Int, Int )
    , isMobile : Bool
    , domain : String
    }


type Mode
    = GameMode GameState
    | PauseMode PauseState
    | LoadingMode LoadingState
    | MenuMode MenuState


type Update
    = MenuUpdate MenuAction
    | LoadingUpdate Response
    | KeyDown KeyCode
    | KeyUp KeyCode
    | Tick Time
    | LoseVisibility


type alias PauseState =
    { inProgress : GameState }


type MenuAction
    = StartGame Level
    | ToMainMenu


type alias GameState =
    { victory : Bool
    , level : Level
    , nextId : Id
    , log : List ( Float, String )
    , seed : Random.Seed
    , clockTime : Maybe Time
    , lag : Time
    , gameTime : Float
    , lastEventTime : Float
    , playerActions : Set KeyCode
    , universe : Dict Id Body
    , library : Library
    }


type alias LevelData =
    { level : Level
    , universe : Dict Id Body
    }


type alias PlayerData =
    { body : Body
    , cockpit : PlayerCockpit
    }


type alias Id =
    Int


type EngineEffect
    = SpawnShips Int
    | SpawnMissile Id Id
    | SpawnFriendly Id
    | Destroy Id
    | Explode Id
    | DeductHealth Float Id
    | Notify String
    | Victory


type PlayerAction
    = LeftTurn
    | RightTurn
    | UpTurn
    | DownTurn
    | Thrust
    | Brake
    | Firing
    | ShieldsUp


type alias Body =
    { frame : Frame
    , delta : Frame
    , bounds : Bounds
    , health : Float
    , ai : Ai
    , collisionClass : CollisionClass
    }


type CollisionClass
    = Scenery
    | Solid
    | Blockable
    | Ethereal


type Ai
    = Dumb Appearance
    | PlayerControlled PlayerCockpit
    | Seeking MissileCockpit
    | Hostile HostileCockpit
    | Explosion Float
    | PlayerBullet Float


type alias Appearance =
    { meshName : String
    , material : Material
    }


type alias MissileCockpit =
    { target : Id
    , lifespan : Float
    }


type alias HostileCockpit =
    { target : Id
    , trigger : RepeatSwitch
    , status : HostileStatus
    }


type HostileStatus
    = LockingOn
    | Fleeing


type alias PlayerCockpit =
    { action : Action
    , trigger : RepeatSwitch
    , shields : DrainSwitch
    }


type alias RepeatSwitch =
    { value : Float
    , decay : Float
    }


type alias DrainSwitch =
    { value : Float
    , decay : Float
    , recover : Float
    , on : Bool
    }


type alias Action =
    { thrust : Int
    , pitch : Int
    , yaw : Int
    }


type alias Camera =
    { perspective : Mat4
    , orientation : Mat4
    , position : Vec3
    }


type alias LoadingState =
    { response : Maybe Response
    , seed : Random.Seed
    , isMobile : Bool
    }


type alias MenuState =
    { library : Library
    , seed : Random.Seed
    , room : Room
    }


type Room
    = LevelSelect
    | Won Level
    | Lost Level


type alias Library =
    { meshes : Dict String (Drawable Vertex)
    , boxes : Dict String Bounds
    }


type alias Response =
    Result Http.Error Library


type alias Vertex =
    { vertPosition : Vec3
    , normal : Vec3
    }


type alias Material =
    { ambient : Vec3
    , diffuse : Vec3
    , specular : Vec3
    , shininess : Float
    }


type alias LightSource =
    { ambient : Vec3
    , diffuse : Vec3
    , specular : Vec3
    , direction : Vec3
    }


type Level
    = SimplePlatform
