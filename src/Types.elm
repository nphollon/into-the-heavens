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
import Frame exposing (Frame)


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



-- Loading Mode


type alias LoadingState =
    { response : Maybe Response
    , seed : Random.Seed
    , isMobile : Bool
    }


type alias Response =
    Result Http.Error Library


type alias Library =
    { meshes : Dict String (Drawable Vertex)
    , boxes : Dict String Bounds
    }



-- Menu Mode


type alias MenuState =
    { library : Library
    , seed : Random.Seed
    , room : Room
    }


type MenuAction
    = StartGame Level
    | ToMainMenu


type Room
    = LevelSelect
    | Won Level
    | Lost Level


type alias LevelData =
    { level : Level
    , universe : Dict Id Body
    }


type Level
    = SimplePlatform



-- Pause Mode


type alias PauseState =
    { inProgress : GameState }



-- Game Mode


type alias GameState =
    { missionStatus : MissionStatus
    , nextId : Id
    , log : List ( Float, String )
    , seed : Random.Seed
    , clockTime : Maybe Time
    , lag : Time
    , gameTime : Float
    , keysDown : Set KeyCode
    , universe : Dict Id Body
    , library : Library
    , level : Level
    }


type MissionStatus
    = Beginning
    | InProgress
    | CountdownToVictory Int
    | Victory


type EngineEffect
    = SpawnShips Int
    | SpawnMissile Id Id
    | SpawnFriendly Id
    | Destroy Id
    | Explode Id
    | DeductHealth Float Id
    | Notify String


type alias Id =
    Int


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


type alias PlayerCockpit =
    { action : Action
    , trigger : RepeatSwitch
    , shields : DrainSwitch
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


type alias RepeatSwitch =
    { value : Float
    , decay : Float
    }


type alias Action =
    { thrust : Int
    , pitch : Int
    , yaw : Int
    }


type alias DrainSwitch =
    { value : Float
    , decay : Float
    , recover : Float
    , on : Bool
    }



-- Graphics


type alias Vertex =
    { vertPosition : Vec3
    , normal : Vec3
    }


type alias LightSource =
    { ambient : Vec3
    , diffuse : Vec3
    , specular : Vec3
    , direction : Vec3
    }


type alias Camera =
    { perspective : Mat4
    , orientation : Mat4
    , position : Vec3
    }


type alias Material =
    { ambient : Vec3
    , diffuse : Vec3
    , specular : Vec3
    , shininess : Float
    }
