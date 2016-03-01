module Flight.Foreground (entity) where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Color exposing (Color)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (ShaderType(..), Camera, Vertex)
import Math.Matrix as Matrix exposing (Matrix)
import Math.Vector as Vector


type alias Uniform a =
  { a
    | perspective : Mat4
    , cameraOrientation : Mat4
    , cameraPosition : Vec3
    , placement : Mat4
    , inversePlacement : Mat4
  }


type alias Varying a =
  { a
    | fragColor : Vec4
  }


type alias VertexShader a b =
  Shader Vertex (Uniform a) (Varying b)


type alias FragmentShader a b =
  Shader {} (Uniform a) (Varying b)


vectorColor : Color -> Vec4
vectorColor c =
  let
    rgb =
      Color.toRgb c
  in
    Vec4.vec4
      (toFloat rgb.red / 255)
      (toFloat rgb.green / 255)
      (toFloat rgb.blue / 255)
      rgb.alpha


entity : ShaderType -> Matrix -> Camera -> Drawable Vertex -> Renderable
entity objectType placement camera world =
  let
    uniform =
      { perspective = camera.perspective
      , cameraOrientation = Matrix.toMat4 camera.orientation
      , cameraPosition = Vector.toVec3 camera.position
      , placement = Matrix.toMat4 placement
      , inversePlacement = Matrix.toMat4 (Matrix.inverse placement)
      }

    matteUniform c =
      { perspective = camera.perspective
      , cameraOrientation = Matrix.toMat4 camera.orientation
      , cameraPosition = Vector.toVec3 camera.position
      , placement = Matrix.toMat4 placement
      , inversePlacement = Matrix.toMat4 (Matrix.inverse placement)
      , color = vectorColor c
      }
  in
    case objectType of
      Planet ->
        WebGL.render planetVertex planetFragment world uniform

      Matte color ->
        matteUniform color
          |> WebGL.render matteVertex matteFragment world

      Decoration ->
        WebGL.render decorVertex decorFragment world uniform


planetVertex : VertexShader {} { cosAngleIncidence : Float }
planetVertex =
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

    vec3 dirToLight = vec3(0, sqrt(0.5), sqrt(0.5));
    vec3 placedNormal = vec3(vec4(normal, 0) * inversePlacement);

    cosAngleIncidence = dot(placedNormal/length(placedNormal), dirToLight);
    fragColor = vertColor;
  }
  |]


planetFragment : FragmentShader {} { cosAngleIncidence : Float }
planetFragment =
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


matteVertex : VertexShader { color : Vec4 } { cosAngleIncidence : Float }
matteVertex =
  [glsl|
  precision mediump float;

  attribute vec3 vertPosition;
  attribute vec3 normal;

  uniform vec3 cameraPosition;
  uniform vec4 color;
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

    vec3 dirToLight = vec3(0, sqrt(0.5), sqrt(0.5));
    vec3 placedNormal = vec3(vec4(normal, 0) * inversePlacement);

    cosAngleIncidence = dot(placedNormal/length(placedNormal), dirToLight);
    fragColor = color;
  }
  |]


matteFragment : FragmentShader { color : Vec4 } { cosAngleIncidence : Float }
matteFragment =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;
  varying float cosAngleIncidence;

  void main () {
    gl_FragColor = fragColor * cosAngleIncidence;
    gl_FragColor.w = 1.0;
  }
  |]


decorVertex : VertexShader {} {}
decorVertex =
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

  void main() {
    vec4 worldFrame = placement * vec4(vertPosition, 1);
    vec4 cameraFrame = worldFrame - vec4(cameraPosition, 0);

    vec4 projectionOffset = vec4(0, 0, length(cameraFrame.xyz), 0);

    gl_Position =
      perspective * (cameraOrientation * cameraFrame - projectionOffset);

    fragColor = vertColor;
  }
  |]


decorFragment : FragmentShader {} {}
decorFragment =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
