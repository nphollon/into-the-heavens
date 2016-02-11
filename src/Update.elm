module Update (..) where

import Effects exposing (Effects)
import Set exposing (Set)
import Time exposing (Time)
import Char
import Dict exposing (Dict)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Http
import WebGL exposing (Drawable)
import Math.Mechanics as Mech
import Math.Collision as Collision


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
  , universe : Mech.State
  , hulls : List Collision.Hull
  , graphics : List GraphicsObject
  , library : Library
  , action : Action
  }


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


type GraphicsObject
  = Background String
  | Object
      { bodyName : String
      , meshName : String
      , shader : ShaderType
      }


type ShaderType
  = Ship
  | Planet


type alias Camera =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
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


gameOver : Library -> ( Mode, Effects a )
gameOver library =
  ( GameOverMode { library = library }, Effects.none )
