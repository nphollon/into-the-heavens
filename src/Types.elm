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
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 exposing (Mat4)
import Math.Vector exposing (Vector)
import Math.Quaternion exposing (Quaternion)


type alias Flags =
    { seed : ( Int, Int ), isMobile : Bool }


type Mode
    = GameMode GameState
    | LoadingMode LoadingState
    | MenuMode MenuState


type Update
    = MenuUpdate MenuAction
    | LoadingUpdate Response
    | KeyDown KeyCode
    | KeyUp KeyCode
    | Tick Time


type MenuAction
    = StartGame Level
    | ToMainMenu


type alias GameState =
    { victory : Bool
    , level : Level
    , nextId : Id
    , score : Int
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
    , graphics : List GraphicsObject
    , library : Library
    }


type alias LevelData =
    { level : Level
    , events : List ( EventCondition, List EngineEffect )
    , universe : Dict Id Body
    , graphics : List GraphicsObject
    , names : Dict String Id
    }


type alias Id =
    Int


type EngineEffect
    = SpawnShips Int
    | SpawnMissile Id Id
    | SpawnCheckpoint String Vector
    | Destroy Id
    | DestroyByName String
    | Explode Id
    | ChangeTarget
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
    | ClockwiseRoll
    | CounterclockwiseRoll
    | Thrust
    | Brake
    | Firing
    | ShieldsUp
    | TargetFacing


type alias Body =
    { position : Vector
    , velocity : Vector
    , orientation : Quaternion
    , angVelocity : Vector
    , bounds : Maybe String
    , health : Float
    , ai : Ai
    }


type alias Acceleration =
    { linear : Vector
    , angular : Vector
    }


type Ai
    = Dumb
    | PlayerControlled Cockpit
    | Seeking Float Id
    | Hostile
        { target : Id
        , trigger : RepeatSwitch
        }
    | SelfDestruct
    | Waiting Float


type alias Cockpit =
    { action : Action
    , target : Id
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
    , roll : Int
    }


type GraphicsObject
    = Background String
    | Reticule String
    | Shield String String
    | Object
        { bodyId : Id
        , meshName : String
        , shader : ShaderType
        }
    | Explosion
        { bodyId : Id
        , meshName : String
        }
    | Target String
    | Highlight
        { filter : Body -> Bool
        , meshName : String
        }
    | Atmosphere
        { bodyId : Id
        }


type ShaderType
    = Matte Color
    | NoLighting


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
    , vertColor : Vec4
    , normal : Vec3
    }


type Level
    = FlightTest
    | OneByOne
    | Pavilion
    | Outnumbered
