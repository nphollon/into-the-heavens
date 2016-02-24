module Flight.Background (entity) where

import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL exposing (Renderable, Drawable, Shader)
import Types exposing (Camera, Vertex)
import Math.Matrix as Matrix


type alias Varying =
  { fragColor : Vec4
  }


type alias Uniform =
  { perspective : Mat4
  , cameraOrientation : Mat4
  }


entity : Camera -> Drawable Vertex -> Renderable
entity camera bkg =
  let
    uniform =
      { perspective = camera.perspective
      , cameraOrientation = Matrix.toMat4 camera.orientation
      }
  in
    WebGL.render vertexShader fragmentShader bkg uniform


vertexShader : Shader Vertex Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;
  uniform mat4 cameraOrientation;

  varying vec4 fragColor;

  void main() {
    vec4 worldPosition = vec4(vertPosition, 1);
    vec4 projectionOffset = vec4(0, 0, length(worldPosition.xyz), 0);
    gl_Position =
      perspective * (cameraOrientation * worldPosition - projectionOffset);

    gl_PointSize = 1.5;

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
