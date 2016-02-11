module Update (..) where

import Effects exposing (Effects)
import Set exposing (Set)
import Time exposing (Time)
import Char
import Dict exposing (Dict)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Http
import WebGL exposing (Drawable)
import Math.Vector as Vector exposing (Vector)
import Math.Mechanics as Mech


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
  , objects : List Geometry
  , library : Library
  , action : Action
  }


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }


type Geometry
  = Background String
  | Object
      { bodyName : String
      , meshName : String
      , shader : ShaderType
      , hull : List ( Vector, Vector, Vector )
      }


type ShaderType
  = Ship
  | Planet


game : Library -> ( Mode, Effects a )
game library =
  (,)
    (GameMode
      { library = library
      , continue = False
      , universe =
          { time = 0
          , bodies =
              Dict.fromList
                [ ( "ship"
                  , { position = Vector.vector 0 0 0
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0 0
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    }
                  )
                , ( "planet"
                  , { position = Vector.vector 1 -2 -5
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0 0.3 0
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    }
                  )
                , ( "other"
                  , { position = Vector.vector 0 0 -20
                    , velocity = Vector.vector 0 0 0
                    , orientation = Vector.vector 0 0 0
                    , angVelocity = Vector.vector 0.1 0.3 0.4
                    , inertia = Vector.vector 1 1 1
                    , mass = 1
                    }
                  )
                ]
          }
      , objects =
          [ Background "Background"
          , Object
              { bodyName = "other"
              , meshName = "Ship"
              , hull = []
              , shader = Ship
              }
          , Object
              { bodyName = "planet"
              , meshName = "Sphere"
              , hull = []
              , shader = Planet
              }
          ]
      , action = inaction
      }
    )
    Effects.none


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
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


menu : Mode
menu =
  MenuMode { response = Nothing }


type alias GameOverState =
  { library : Library
  }


gameOver : Library -> ( Mode, Effects a )
gameOver library =
  ( GameOverMode { library = library }, Effects.none )
