module Graphics.Foreground exposing (entity)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Color exposing (Color)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (ShaderType(..), Camera, Vertex)
import Math.Frame as Frame exposing (Frame)


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


vectorColor : Color -> Vec3
vectorColor c =
    let
        rgb =
            Color.toRgb c
    in
        Vec3.vec3 (toFloat rgb.red / 255)
            (toFloat rgb.green / 255)
            (toFloat rgb.blue / 255)


entity : ShaderType -> Frame -> Camera -> Drawable Vertex -> Renderable
entity objectType frame camera world =
    let
        placement =
            Frame.toMat4 frame

        ambientReflection =
            case objectType of
                Matte color ->
                    Vec3.vec3 0 0 0

                Bright color ->
                    vectorColor color

        diffuseReflection =
            case objectType of
                Matte color ->
                    vectorColor color

                Bright color ->
                    Vec3.vec3 0 0 0

        uniform =
            { perspective = camera.perspective
            , cameraOrientation = camera.orientation
            , cameraPosition = camera.position
            , placement = placement
            , inversePlacement = Mat4.inverseOrthonormal placement
            , ambientReflection = ambientReflection
            , diffuseReflection = diffuseReflection
            , specularReflection = Vec3.vec3 1 1 1
            , shininess = 10
            , ambientLight = Vec3.vec3 1 1 1
            , diffuseLight = Vec3.vec3 1 1 1
            , specularLight = Vec3.vec3 1 1 1
            , lightDirection = Vec3.vec3 0 1 0
            }
    in
        WebGL.render slowPhongVertex slowPhongFragment world uniform


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

    vec3 dirToLight = vec3(0, 1, 0);
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



-- Slow Phong shader


type alias SPUniform =
    { ambientReflection : Vec3
    , diffuseReflection : Vec3
    , specularReflection : Vec3
    , ambientLight : Vec3
    , diffuseLight : Vec3
    , specularLight : Vec3
    , lightDirection : Vec3
    , shininess : Float
    , perspective : Mat4
    , cameraOrientation : Mat4
    , cameraPosition : Vec3
    , placement : Mat4
    , inversePlacement : Mat4
    }


type alias SPVarying =
    { cameraDirection : Vec3
    , surfaceNormal : Vec3
    }


slowPhongVertex : Shader Vertex SPUniform SPVarying
slowPhongVertex =
    [glsl|
         precision mediump float;

         attribute vec3 vertPosition;
         attribute vec3 normal;

         uniform vec3 cameraPosition;
         uniform mat4 perspective;
         uniform mat4 cameraOrientation;
         uniform mat4 placement;
         uniform mat4 inversePlacement;

         varying vec3 cameraDirection;
         varying vec3 surfaceNormal;

         void main() {
             vec4 worldFrame = placement * vec4(vertPosition, 1);
             vec4 cameraOffset = worldFrame - vec4(cameraPosition, 0);
             vec4 cameraFrame = cameraOrientation * cameraOffset;

             float projOffset;

             if (cameraFrame.z < 0.0 || cameraFrame.z < length(cameraFrame.xy)) {
                 projOffset = length(cameraFrame.xyz);
             } else {
                 projOffset = 0.0;
             }

             vec4 projection = cameraFrame - vec4(0, 0, projOffset, 0);

             gl_Position = perspective * projection;
             gl_PointSize = 1.1;

             surfaceNormal = vec3(vec4(normal, 0) * inversePlacement);
             cameraDirection = normalize(-cameraOffset.xyz);
         }
    |]


slowPhongFragment : Shader {} SPUniform SPVarying
slowPhongFragment =
    [glsl|
        precision mediump float;

        varying vec3 cameraDirection;
        varying vec3 surfaceNormal;

        uniform vec3 ambientReflection;
        uniform vec3 diffuseReflection;
        uniform vec3 specularReflection;
        uniform float shininess;

        uniform vec3 ambientLight;
        uniform vec3 diffuseLight;
        uniform vec3 specularLight;
        uniform vec3 lightDirection;

        void main() {
            vec3 normalSurfaceNormal = normalize(surfaceNormal);
            vec3 normalCameraDirection = normalize(cameraDirection);

            float diffuseFactor = dot(lightDirection, normalSurfaceNormal);

            vec3 reflection = normalize(2.0 * diffuseFactor * normalSurfaceNormal - lightDirection);

            float specularFactor = clamp(dot(reflection, normalCameraDirection), 0.0, 1.0);

            vec3 ambientColor = ambientReflection * ambientLight;
            vec3 diffuseColor = diffuseReflection * diffuseLight * diffuseFactor;
            vec3 specularColor = specularReflection * specularLight * pow(specularFactor, shininess);

            gl_FragColor = vec4(ambientColor + diffuseColor + specularColor, 1);
        }
    |]



-- Fast Phong shader


type alias FPUniform =
    { ambientColor : Vec3
    , diffuseReflection : Vec3
    , specularReflection : Vec3
    , diffuseLight : Vec3
    , specularLight : Vec3
    , lightDirection : Vec3
    , shininess : Float
    , perspective : Mat4
    , cameraOrientation : Mat4
    , cameraPosition : Vec3
    , placement : Mat4
    , inversePlacement : Mat4
    }


type alias FPVaring =
    { diffuseColor : Vec3
    , specularFactor : Float
    }
