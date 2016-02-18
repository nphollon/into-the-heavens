module Types (..) where

import Set exposing (Set)
import Time exposing (Time)
import Char
import Dict exposing (Dict)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix exposing (Matrix)
import Math.Vector exposing (Vector)
import Http
import Color exposing (Color)
import WebGL exposing (Drawable)


type Update
  = Meshes Response
  | Tick Time
  | Keys (Set Char.KeyCode)
  | Collide String String
  | FireMissile
  | Focus Bool


type Mode
  = GameMode GameState
  | MenuMode MenuState
  | GameOverMode GameOverState


type alias GameState =
  { continue : Bool
  , hasFired : Bool
  , hasFocus : Bool
  , nextId : Int
  , score : Int
  , aiState : AiState
  , clockTime : Maybe Time
  , universe : Dict String Body
  , graphics : List GraphicsObject
  , library : Library
  }


type alias Body =
  { position : Vector
  , velocity : Vector
  , orientation : Vector
  , angVelocity : Vector
  , hull : Hull
  , health : Float
  , action : Action
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


type AiState
  = Turning Float
  | Thrusting Float
  | Resting Float


type GraphicsObject
  = Background String
  | Object
      { bodyName : String
      , meshName : String
      , shader : ShaderType
      , scale : Maybe Float
      }


type ShaderType
  = Planet
  | Matte Color


type alias Camera =
  { perspective : Matrix
  , orientation : Matrix
  , position : Vector
  }


type alias MenuState =
  { response : Maybe Response
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
  }
