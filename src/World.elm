module World where

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)

import WebGL
import Sphere

type alias Attribute =
  { vertPosition : Vec3
  , vertColor : Vec4
  }


type alias Varying =
  { fragColor : Vec4
  }


type alias NearUniform u =
  { u
  | perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  , modelPosition : Vec3 
  }


planet =
  WebGL.entity nearVertexShader planetShader Sphere.mesh

moon =
  WebGL.entity nearVertexShader moonShader Sphere.mesh


nearVertexShader : WebGL.Shader Attribute (NearUniform u) Varying
nearVertexShader =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;
  uniform mat4 cameraOrientation;
  uniform vec3 cameraPosition;
  uniform vec3 modelPosition;

  varying vec4 fragColor;

  void main() {
    vec4 worldPosition = vec4(vertPosition + modelPosition + cameraPosition, 1);
    vec4 projectionOffset = vec4(0, 0, length(worldPosition.xyz), 0);
    gl_Position =
      perspective * (cameraOrientation * worldPosition - projectionOffset);

    fragColor = vertColor;
  }
  |]


planetShader : WebGL.Shader { } u Varying
planetShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    if (fragColor.x < 1e-4) {
      gl_FragColor = vec4(0.82421875,0.8828125,0.7109375, 1);
    } else if (fragColor.y < 1e-4) {
      gl_FragColor = vec4(0.6640625,0.796875,0.69140625, 1);
    } else if (fragColor.z < 1e-4) {
      gl_FragColor = vec4(0.52734375,0.73828125,0.69140625, 1);
    } else if (fragColor.w < 1e-4) {
      gl_FragColor = vec4(0.40625,0.69921875,0.68359375, 1);
    } else {
      gl_FragColor = vec4(0, 0, 0, 1);
    }
  }
  |]


moonShader : WebGL.Shader { } u Varying
moonShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    float zone = length(step(0.8, fragColor));

    if (zone < 1e-4) {
      gl_FragColor = vec4(1, 1, 1, 1);
    } else {
      gl_FragColor = vec4(0.2, 0.1, 0.2, 1);
    }    
  }
  |]