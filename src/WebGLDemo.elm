module WebGLDemo where

import WebGL
import Math.Vector3 as V3
import Math.Matrix4 as M4
import Graphics.Element as Layout
import Color
import Signal
import Time

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
      0.0

    model =
      Signal.foldp update startState signal
  in
    Signal.map view model


type alias Model =
  Float


type Action =
  Rotate


signal : Signal Action
signal =
  Signal.map (always Rotate) (Time.every (50 * Time.millisecond))


update : Action -> Model -> Model
update action yaw =
  case action of
    Rotate ->
      yaw + degrees 5


view : Model -> Layout.Element
view yaw =
  let
    x = 300
    y = 200
  in WebGL.webgl (x, y) [ tringle yaw ]
    |> Layout.container x y Layout.middle
    |> Layout.color Color.black


tringle : Model -> WebGL.Entity
tringle yaw =
  let
    mesh =
      [
        ({ position = V3.vec3 0 0.3 0 }
        ,{ position = V3.vec3 0.5 0.3 0 }
        ,{ position = V3.vec3 0.5 -0.3 0 })
      ]

    rotation = M4.makeRotate yaw (V3.vec3 0 1 0)
    translation = M4.makeTranslate (V3.vec3 0 0 -1)

    uniform =
      { perspective = M4.makePerspective 90 1.5 0.1 10
      , placement = M4.mul translation rotation
      }
  in
    WebGL.entity vertexShader fragmentShader mesh uniform

type alias Attribute = { position : V3.Vec3 }
type alias Uniform = { perspective : M4.Mat4, placement : M4.Mat4 }
type alias Varying = { rg : V3.Vec3 }

vertexShader : WebGL.Shader Attribute Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 position;
  uniform mat4 perspective;
  uniform mat4 placement;
  varying vec3 rg;

  void main() {
    gl_Position =
      perspective * (placement * vec4(position, 1.0));
    rg = vec3(1.0, position.xy);
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