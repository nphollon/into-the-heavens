module Flight.Foreground (entity) where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL exposing (Drawable, Renderable, Shader)
import Update exposing (ShaderType(..), Camera, Vertex)
import Math.Matrix as Matrix exposing (Matrix)
import Math.Vector as Vector


type alias Uniform =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  , placement : Mat4
  , inversePlacement : Mat4
  }


type alias Varying =
  { fragColor : Vec4
  , cosAngleIncidence : Float
  }


entity : ShaderType -> Matrix -> Camera -> Drawable Vertex -> Renderable
entity objectType placement camera world =
  let
    newUniform =
      { perspective = Matrix.toMat4 camera.perspective
      , cameraOrientation = Matrix.toMat4 camera.orientation
      , cameraPosition = Vector.toVec3 camera.position
      , placement = Matrix.toMat4 placement
      , inversePlacement = Matrix.toMat4 (Matrix.inverse placement)
      }

    fragmentShader =
      case objectType of
        Planet ->
          planetShader

        Ship ->
          shipShader
  in
    WebGL.render vertexShader fragmentShader world newUniform


vertexShader : Shader Vertex Uniform Varying
vertexShader =
  [glsl|
  precision mediump float;

  attribute vec3 vertPosition;
  attribute vec4 vertColor;
  attribute vec3 normal;

  uniform vec3 cameraPosition;
  uniform mat4 perspective;
  uniform mat4 cameraOrientation;
  uniform mat4 placement;
  uniform mat4 inversePlacement;

  varying vec4 fragColor;
  varying float cosAngleIncidence;

  void main() {
    vec4 worldFrame = placement * vec4(vertPosition, 1);
    vec4 cameraFrame = worldFrame - vec4(cameraPosition, 0);

    vec4 projectionOffset = vec4(0, 0, length(cameraFrame.xyz), 0);

    gl_Position =
      perspective * (cameraOrientation * cameraFrame - projectionOffset);

    vec3 dirToLight = vec3(1, 0, 0);
    vec3 placedNormal = vec3(vec4(normal, 0) * inversePlacement);

    cosAngleIncidence = dot(placedNormal/length(placedNormal), dirToLight);
    fragColor = vertColor;
  }
  |]


shipShader : Shader {} Uniform Varying
shipShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;
  varying float cosAngleIncidence;

  void main () {
    gl_FragColor = fragColor * cosAngleIncidence;
    gl_FragColor.w = 1.0;
  }
  |]


planetShader : Shader {} Uniform Varying
planetShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;
  varying float cosAngleIncidence;

  void main () {
    vec4 blue = vec4(0.2265625,0.28515625,0.84375,1);
    vec4 green = vec4(0.2734375,0.57421875,0.37109375,1);

    bool border = length(fragColor.xy) < 1e-1
      || length(fragColor.xz) < 1e-1
      || length(fragColor.xw) < 1e-1
      || length(fragColor.yz) < 1e-1
      || length(fragColor.yw) < 1e-1
      || length(fragColor.zw) < 1e-1;

    if (border) {
      gl_FragColor = blue;
    } else {
      gl_FragColor = green;
    }

    gl_FragColor *= cosAngleIncidence;
    gl_FragColor.w = 1.0;
  }
  |]
