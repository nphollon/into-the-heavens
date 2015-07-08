module WebGLDemo where

import WebGL
import Math.Vector2 as V2
import Graphics.Element as Layout
import Color

main : Layout.Element
main =
  let
    x = 300
    y = 200
  in WebGL.webgl (x, y) [ tringle ]
    |> Layout.container x y Layout.middle
    |> Layout.color Color.black

tringle : WebGL.Entity
tringle =
  let
    mesh =
      [
        ({ position = V2.vec2 0 0.5 }
        ,{ position = V2.vec2 0.5 0.5 }
        ,{ position = V2.vec2 0.5 0 })
      ]
  in
    WebGL.entity vertexShader fragmentShader mesh { }

type alias Attribute = { position : V2.Vec2 }
type alias Uniform = { }
type alias Varying = { }

vertexShader : WebGL.Shader Attribute Uniform Varying
vertexShader = [glsl|
  attribute vec2 position;

  void main() {
    gl_Position = vec4(position, 0, 1);
  }
  |]

fragmentShader : WebGL.Shader { } Uniform Varying
fragmentShader = [glsl|
  void main () {
    gl_FragColor = vec4(1, 0, 0, 1);
  }
  |]