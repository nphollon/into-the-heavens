module Types (..) where

import Set exposing (Set)
import Time exposing (Time)
import Char exposing (KeyCode)
import Dict exposing (Dict)
import Color exposing (Color)
import Random.PCG as Random
import Http
import Effects exposing (Effects)
import WebGL exposing (Drawable)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 exposing (Mat4)
import Math.Matrix exposing (Matrix)
import Math.Vector exposing (Vector)
import Math.Tree exposing (Tree)
import Math.BoundingBox exposing (BoundingBox)


type Mode
  = GameMode GameState
  | LoadingMode LoadingState
  | MenuMode MenuState


type Update
  = MenuUpdate MenuAction
  | LoadingUpdate Response
  | Keys (Set KeyCode)
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
  , playerActions : List PlayerAction
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
  , orientation : Vector
  , angVelocity : Vector
  , bounds : Maybe (Tree BoundingBox)
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
  = Planet
  | Matte Color
  | NoLighting


type alias Camera =
  { perspective : Mat4
  , orientation : Matrix
  , position : Vector
  }


type alias LoadingState =
  { response : Maybe Response
  , seed : Random.Seed
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


type Level
  = Tutorial
  | Outnumbered
  | Pavilion


type alias Library =
  Dict String (Drawable Vertex)


type alias Response =
  Result Http.Error Library


type alias Vertex =
  { vertPosition : Vec3
  , vertColor : Vec4
  , normal : Vec3
  }


tick : (a -> Mode) -> a -> ( Mode, Effects Update )
tick constructor state =
  ( constructor state, Effects.tick Tick )


noEffects : (a -> Mode) -> a -> ( Mode, Effects Update )
noEffects constructor state =
  ( constructor state, Effects.none )
