module WebGLDemo where

import WebGL
import Math.Vector3 as V3
import Math.Matrix4 as M4
import Graphics.Element as Layout
import Color
import Signal
import Time
import Keyboard
import List

{-
  optimization questions:
    triangle fans & strips
    rendering faces in one direction only
    referencing vertices by index
  -}

main : Signal Layout.Element
main =
  let
    startState =
      { orientation = M4.identity
      }

    model =
      Signal.foldp update startState signal
  in
    Signal.map view model


type alias Model =
  { orientation : M4.Mat4
  }


type alias Action =
  { x : Int
  , y : Int
  }


signal : Signal Action
signal =
  Signal.sampleOn (Time.every (10 * Time.millisecond)) Keyboard.wasd


update : Action -> Model -> Model
update action model =
  let
    delta =
      degrees 1

    newOrientation =
      model.orientation
      |> M4.rotate (action.y .* delta) (V3.vec3 1 0 0)
      |> M4.rotate (action.x .* delta) (V3.vec3 0 -1 0)
  in
    { model | orientation <- newOrientation }


view : Model -> Layout.Element
view model =
  let
    dimensions =
      (400, 400)

    aspect =
      uncurry (./.) dimensions

    uniform =
      { perspective = M4.makePerspective 90 1.0 0.1 3.3
      , placement = M4.transpose model.orientation
      }
  in
    [ compass uniform
    ]--, meridian 1 0 ]
    |> WebGL.webgl dimensions
    |> uncurry Layout.container dimensions Layout.middle
    |> Layout.color Color.black


type alias Attribute =
  { position : V3.Vec3
  }

type alias Uniform =
  { perspective : M4.Mat4
  , placement : M4.Mat4
  }

type alias Varying = {
  rg : V3.Vec3
  }

type Orientation =
  LatitudeWall |
  LongitudeWall |
  Floor


compass : Uniform -> WebGL.Entity
compass uniform =
  let
    mesh = 
      [ compassPoint LatitudeWall 0 0 3
      , compassPoint LatitudeWall 0 0 -3
      , compassPoint LongitudeWall 3 0 0
      , compassPoint LongitudeWall -3 0 0
      , compassPoint Floor 0 3 0
      , compassPoint Floor 0 -3 0
      ]
  in
    WebGL.entity vertexShader fragmentShader mesh uniform


compassPoint : Orientation -> Float -> Float -> Float -> WebGL.Triangle Attribute
compassPoint dir x y z =
  case dir of
    LatitudeWall ->
      ( vertex (x + 1) (y - 0.5) z
      , vertex (x - 1) (y - 0.5) z
      , vertex x (y + 1) z
      )
    LongitudeWall ->
      ( vertex x (y - 0.5) (z - 1)
      , vertex x (y - 0.5) (z + 1)
      , vertex x (y + 1) z
      )
    Floor ->
      ( vertex (x + 1) y (z - 0.5)
      , vertex (x - 1) y (z - 0.5)
      , vertex x y (z + 1)
      )

{--
meridian : Float -> Float -> WebGL.Entity
meridian radius azimuth = 
  let
    mesh = [ ]
--}

vertex : Float -> Float -> Float -> Attribute
vertex x y z =
  { position = V3.vec3 x y z }


vertexShader : WebGL.Shader Attribute Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 position;
  uniform mat4 perspective;
  uniform mat4 placement;
  varying vec3 rg;

  void main() {
    gl_Position =
      perspective * placement * vec4(position, 1.0);
    rg = vec3(position + vec3(0.4, 0.4, 0.4));
  }
  |]

fragmentShader : WebGL.Shader { } Uniform Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec3 rg;

  void main () {
    gl_FragColor = vec4(rg, 1.0);
  }
  |]

-- Type-converting arithmetic operators

(./.) : Int -> Int -> Float
(./.) a b =
  toFloat a / toFloat b

(.*) : Int -> Float -> Float
(.*) a b =
  toFloat a * b
