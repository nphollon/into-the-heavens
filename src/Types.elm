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
  { missileTrigger : Trigger
  , target : String
  , hasFocus : Bool
  , nextId : Int
  , score : Int
  , seed : Random.Seed
  , clockTime : Maybe Time
  , lag : Time
  , universe : Dict String Body
  , graphics : List GraphicsObject
  , library : Library
  }


type Trigger
  = Ready
  | Fire
  | FireAndReset
  | Reset


type alias Body =
  { position : Vector
  , velocity : Vector
  , orientation : Vector
  , angVelocity : Vector
  , hull : Hull
  , health : Float
  , ai : Maybe Ai
  }


type alias Hull =
  List
    { keyPoint : Vector
    , normal : Vector
    }


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


type alias Acceleration =
  { linear : Vector
  , angular : Vector
  }


type Ai
  = Aimless Random.Seed Float Action
  | PlayerControlled Action
  | Seeking Float String
  | SelfDestruct


type GraphicsObject
  = Background String
  | Reticule String
  | Object
      { bodyName : String
      , meshName : String
      , shader : ShaderType
      , scale : Maybe Float
      }
  | Target
      { bodyName : String
      , meshName : String
      }


type ShaderType
  = Planet
  | Matte Color
  | Decoration


type EntityType
  = Ship Random.Seed
  | Missile Body String


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
