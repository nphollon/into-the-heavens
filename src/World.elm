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
  , placement : Mat4
  }


place : u -> Vec3 -> Float -> { u | placement : Mat4 }
place uniform position size =
  let
    placement =
      Mat4.makeTranslate position |> Mat4.scale (Vec3.vec3 size size size)
  in
    { uniform | placement = placement }


planet =
  WebGL.entity nearVertexShader planetShader Sphere.mesh

moon =
  WebGL.entity nearVertexShader moonShader Sphere.mesh


nearVertexShader : WebGL.Shader Attribute (NearUniform u) Varying
nearVertexShader =
  [glsl|
  precision mediump float;

  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform vec3 cameraPosition;
  uniform mat4 perspective;
  uniform mat4 cameraOrientation;
  uniform mat4 placement;

  varying vec4 fragColor;

  void main() {
    vec4 worldFrame = placement * vec4(vertPosition, 1);
    vec4 cameraFrame = worldFrame + vec4(cameraPosition, 1);

    vec4 projectionOffset = vec4(0, 0, length(cameraFrame.xyz), 0);

    gl_Position =
      perspective * (cameraOrientation * cameraFrame - projectionOffset);

    fragColor = vertColor;
  }
  |]


planetShader : WebGL.Shader { } u Varying
planetShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

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