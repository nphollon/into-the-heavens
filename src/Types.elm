module Types exposing (..)

import Set exposing (Set)
import Time exposing (Time)
import Char exposing (KeyCode)
import Dict exposing (Dict)
import Color exposing (Color)
import Random.Pcg as Random
import Http
import Collision exposing (Bounds)
import WebGL exposing (Drawable)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 exposing (Mat4)
import Math.Vector exposing (Vector)
import Math.Quaternion exposing (Quaternion)


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
    | NoUpdate


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
    , events : List ( EventCondition, List EngineEffect )
    , playerActions : Set KeyCode
    , universe : Dict Id Body
    , names : Dict String Id
    , library : Library
    }


type alias LevelData =
    { level : Level
    , events : List ( EventCondition, List EngineEffect )
    , universe : Dict Id Body
    , names : Dict String Id
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
    | SpawnCheckpoint String Vector
    | SpawnFriendly Id
    | Destroy Id
    | DestroyByName String
    | Explode Id
    | DeductHealth Float Id
    | Notify String
    | Victory


type EventCondition
    = Immediately
    | NoMoreVisitors
    | SecondsLater Float
    | ReachedCheckpoint String


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
    { position : Vector
    , velocity : Vector
    , orientation : Quaternion
    , angVelocity : Quaternion
    , bounds : Bounds
    , health : Float
    , ai : Ai
    , collisionClass : CollisionClass
    }


type alias Placement =
    { position : Vector
    , orientation : Quaternion
    , velocity : Vector
    , angVelocity : Quaternion
    }


type CollisionClass
    = Scenery
    | Solid
    | Blockable
    | Ethereal


type alias Acceleration =
    { linear : Vector
    , angular : Quaternion
    }


type Ai
    = Dumb { meshName : String, shader : ShaderType }
    | PlayerControlled PlayerCockpit
    | Seeking MissileCockpit
    | Hostile HostileCockpit
    | Explosion Float
    | PlayerBullet Float


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


type ShaderType
    = Matte Color
    | Bright Color


type alias Camera =
    { perspective : Mat4
    , orientation : Quaternion
    , position : Vector
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


type Level
    = FlightTest
    | OneByOne
    | Pavilion
    | Outnumbered
