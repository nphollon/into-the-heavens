module Flight.Background (entity) where

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL exposing (Renderable, Drawable, Shader)
import Types exposing (CameraData, Vertex)
import Math.Matrix as Matrix
import Math.Vector as Vector


type alias Varying =
  { fragColor : Vec4
  }


type alias Uniform =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  }


entity : CameraData -> Drawable Vertex -> Renderable
entity camera bkg =
  let
    uniform =
      { perspective = Matrix.toMat4 camera.perspective
      , cameraOrientation = Matrix.toMat4 camera.orientation
      , cameraPosition = Vector.toVec3 camera.position
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
