module Graphics.Foreground exposing (entity)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Color exposing (Color)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (ShaderType(..), Camera, Vertex)
import Math.Vector as Vector
import Math.Quaternion as Quaternion


type alias Uniform =
    { perspective : Mat4
    , cameraOrientation : Mat4
    , cameraPosition : Vec3
    , placement : Mat4
    , inversePlacement : Mat4
    , color : Vec4
    }


type alias Varying a =
    { a
        | fragColor : Vec4
    }


type alias VertexShader b =
    Shader Vertex Uniform (Varying b)


type alias FragmentShader b =
    Shader {} Uniform (Varying b)


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


entity : ShaderType -> Mat4 -> Camera -> Drawable Vertex -> Renderable
entity objectType placement camera world =
    let
        uniform c =
            { perspective = camera.perspective
            , cameraOrientation = Quaternion.toMat4 camera.orientation
            , cameraPosition = Vector.toVec3 camera.position
            , placement = placement
            , inversePlacement = Mat4.inverseOrthonormal placement
            , color = vectorColor c
            }
    in
        case objectType of
            Matte color ->
                WebGL.render matteVertex matteFragment world (uniform color)

            Bright color ->
                WebGL.render decorVertex decorFragment world (uniform color)


matteVertex : VertexShader { cosAngleIncidence : Float, distance : Float }
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
  varying float distance;

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
    distance = length(cameraFrame.xyz);
    fragColor = color;
  }
  |]


matteFragment : FragmentShader { cosAngleIncidence : Float, distance : Float }
matteFragment =
    [glsl|
  precision mediump float;
  varying vec4 fragColor;
  varying float cosAngleIncidence;
  varying float distance;

  void main () {
    gl_FragColor = fragColor * cosAngleIncidence;
    gl_FragColor.w = 1.0;

    if (distance < 4.0) {
      gl_FragColor.r = 1.0;
    }
  }
  |]


decorVertex : VertexShader {}
decorVertex =
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

    gl_PointSize = 1.1;

    fragColor = color;
  }
  |]


decorFragment : FragmentShader {}
decorFragment =
    [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
