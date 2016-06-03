module Graphics.Foreground exposing (entity)

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
        Vec4.vec4 (toFloat rgb.red / 255)
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

            NoLighting ->
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
    vec4 cameraFrame =
      cameraOrientation * (worldFrame - vec4(cameraPosition, 0));

    float projOffset;

    if (cameraFrame.z < 0.0 || cameraFrame.z < length(cameraFrame.xy)) {
      projOffset = length(cameraFrame.xyz);
    } else {
      projOffset = 0.0;
    }

    vec4 projection = cameraFrame - vec4(0, 0, projOffset, 0);

    gl_Position = perspective * projection;

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
    float latitude = fragColor.y;
    float height = fragColor.z;

    float arcticCircle = 3.14159 / 3.0;
    float pole = 3.14159 / 4.0;
    float temperateSnowline = 0.4;

    float snowline;

    if (abs(latitude) > arcticCircle) {
      snowline =
        temperateSnowline * (abs(latitude) - pole) / (arcticCircle - pole);
    } else {
      snowline = temperateSnowline;
    }

    if (height > snowline) {
      gl_FragColor = vec4(0.8, 0.9, 1.0, 1.0);
    } else if (height > 0.0) {
      gl_FragColor = vec4(0.13, 0.54, 0.13, 1.0);
    } else {
      gl_FragColor = vec4(0.0, 0.0, 1.0, 1.0);
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
    vec4 cameraFrame =
      cameraOrientation * (worldFrame - vec4(cameraPosition, 0));

    float projOffset;

    if (cameraFrame.z < 0.0 || cameraFrame.z < length(cameraFrame.xy)) {
      projOffset = length(cameraFrame.xyz);
    } else {
      projOffset = 0.0;
    }

    vec4 projection = cameraFrame - vec4(0, 0, projOffset, 0);

    gl_Position = perspective * projection;

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
    vec4 cameraFrame =
      cameraOrientation * (worldFrame - vec4(cameraPosition, 0));

    float projOffset;

    if (cameraFrame.z < 0.0 || cameraFrame.z < length(cameraFrame.xy)) {
      projOffset = length(cameraFrame.xyz);
    } else {
      projOffset = 0.0;
    }

    vec4 projection = cameraFrame - vec4(0, 0, projOffset, 0);

    gl_Position = perspective * projection;

    gl_PointSize = 4.0;

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
