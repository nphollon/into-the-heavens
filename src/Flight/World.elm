module Flight.World (toEntity) where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL exposing (Drawable, Renderable, Shader)
import Mesh exposing (Vertex)


type alias Camera =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  }


type alias Placed u =
  { u | placement : Mat4 }


type alias Geometry =
  Placed Camera


type alias Varying =
  { fragColor : Vec4
  , cosAngleIncidence : Float
  }


toEntity : Drawable Vertex -> Mat4 -> Camera -> Renderable
toEntity world placement camera =
  let
    newUniform =
      { perspective = camera.perspective
      , cameraOrientation = camera.cameraOrientation
      , cameraPosition = camera.cameraPosition
      , placement = placement
      }
  in
    WebGL.render vertexShader planetShader world newUniform


vertexShader : Shader Vertex Geometry Varying
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

  varying vec4 fragColor;
  varying float cosAngleIncidence;

  void main() {
    vec4 worldFrame = placement * vec4(vertPosition, 1);
    vec4 cameraFrame = worldFrame - vec4(cameraPosition, 0);

    vec4 projectionOffset = vec4(0, 0, length(cameraFrame.xyz), 0);

    gl_Position =
      perspective * (cameraOrientation * cameraFrame - projectionOffset);

    vec3 dirToLight = vec3(1, 0, 0);
    vec3 placedNormal = (placement * vec4(normal, 0)).xyz;

    cosAngleIncidence = dot(placedNormal, dirToLight);
    fragColor = vertColor;
  }
  |]


planetShader : Shader {} Geometry Varying
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
