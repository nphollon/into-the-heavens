module Flight.Guide (reticule) where

import Math.Vector4 exposing (Vec4)
import Math.Matrix4 exposing (Mat4)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (Vertex, Camera)


type alias Varying =
  { fragColor : Vec4
  }


type alias Uniform =
  { perspective : Mat4
  }


reticule : Camera -> Drawable Vertex -> Renderable
reticule camera mesh =
  let
    uniform =
      { perspective = camera.perspective }
  in
    WebGL.render vertexShader fragmentShader mesh uniform


vertexShader : Shader Vertex Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;

  varying vec4 fragColor;

  void main() {
    gl_Position = perspective * vec4(vertPosition, 1);
    fragColor = vertColor;
  }
  |]


fragmentShader : Shader {} Uniform Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
