module Types (..) where

import Set exposing (Set)
import Time exposing (Time)
import Char exposing (KeyCode)
import Dict exposing (Dict)
import Random.PCG as Random
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 exposing (Mat4)
import Math.Matrix exposing (Matrix)
import Math.Vector exposing (Vector)
import Http
import Color exposing (Color)
import WebGL exposing (Drawable)


type Update
  = Meshes Response
  | Tick Time
  | Keys (Set KeyCode)
  | Focus Bool


type Mode
  = GameMode GameState
  | MenuMode MenuState
  | GameOverMode GameOverState


type alias GameState =
  { hasFocus : Bool
  , nextId : Int
  , score : Int
  , log : List ( Float, String )
  , seed : Random.Seed
  , clockTime : Maybe Time
  , lag : Time
  , gameTime : Float
  , playerActions : List PlayerAction
  , universe : Dict String Body
  , graphics : List GraphicsObject
  , library : Library
  }


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


type alias Body =
  { position : Vector
  , velocity : Vector
  , orientation : Vector
  , angVelocity : Vector
  , hull : Hull
  , health : Float
  , ai : Ai
  }


type alias Hull =
  List
    { keyPoint : Vector
    , normal : Vector
    }


type alias Acceleration =
  { linear : Vector
  , angular : Vector
  }


type Ai
  = Dumb
  | PlayerControlled Cockpit
  | Seeking Float String
  | Hostile
      { target : String
      , trigger : RepeatSwitch
      }
  | SelfDestruct
  | Waiting Float


type alias Cockpit =
  { action : Action
  , target : String
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
  | Shield String
  | Object
      { bodyName : String
      , meshName : String
      , shader : ShaderType
      }
  | Explosion
      { bodyName : String
      , meshName : String
      }
  | Target String
  | Highlight
      { filter : Body -> Bool
      , meshName : String
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


type alias MenuState =
  { response : Maybe Response
  , seed : Random.Seed
  }


type alias Library =
  Dict String (Drawable Vertex)


type alias Response =
  Result Http.Error Library


type alias Vertex =
  { vertPosition : Vec3
  , vertColor : Vec4
  , normal : Vec3
  }


type alias GameOverState =
  { library : Library
  , seed : Random.Seed
  }
