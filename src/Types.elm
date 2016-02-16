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
import WebGL exposing (Drawable)


type Update
  = Meshes Response
  | FPS Time
  | Keys (Set Char.KeyCode)


type Mode
  = GameMode GameState
  | MenuMode MenuState
  | GameOverMode GameOverState


type alias GameState =
  { continue : Bool
  , bodies : Dict String Body
  , library : Library
  }


type alias Body =
  { geometry : Geometry
  , bodyType : BodyType
  }


type BodyType
  = Background
      { meshName : String
      }
  | Inert
      { meshName : String
      , shader : ShaderType
      , hull : Hull
      }
  | Active
      { meshName : String
      , shader : ShaderType
      , hull : Hull
      , action : Action
      , ai : AiState
      }
  | Camera
      { action : Action
      }


type alias Geometry =
  { position : Vector
  , velocity : Vector
  , orientation : Vector
  , angVelocity : Vector
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
  | Braking Float
  | Resting Float


type ShaderType
  = Ship
  | Planet


type alias CameraData =
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
