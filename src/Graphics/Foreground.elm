module Graphics.Foreground exposing (entity)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Color exposing (Color)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (..)
import Frame exposing (Frame)
import Graphics.Material as Material


entity : Material -> Frame -> Camera -> Drawable Vertex -> Renderable
entity material frame camera mesh =
    let
        lightSource =
            { ambient = Material.color (Color.rgb 50 103 145)
            , diffuse = Material.color (Color.rgb 254 241 127)
            , specular = Material.color (Color.rgb 255 244 222)
            , direction = Vec3.vec3 0 1 0
            }
    in
        uniform lightSource material frame camera
            |> WebGL.render phongVertex phongFragment mesh


type alias Uniform =
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


type alias Varying =
    { nonspecularColor : Vec3
    , specularFactor : Float
    }


uniform : LightSource -> Material -> Frame -> Camera -> Uniform
uniform light material frame camera =
    let
        placement =
            Frame.toMat4 frame
    in
        { perspective = camera.perspective
        , cameraOrientation = camera.orientation
        , cameraPosition = camera.position
        , placement = placement
        , inversePlacement = Mat4.inverseOrthonormal placement
        , diffuseReflection = material.diffuse
        , specularReflection = material.specular
        , shininess = material.shininess
        , diffuseLight = light.diffuse
        , specularLight = light.specular
        , lightDirection = light.direction
        , ambientColor = vectorMultiply material.ambient light.ambient
        }


vectorMultiply : Vec3 -> Vec3 -> Vec3
vectorMultiply a b =
    Vec3.vec3
        (Vec3.getX a * Vec3.getX b)
        (Vec3.getY a * Vec3.getY b)
        (Vec3.getZ a * Vec3.getZ b)


phongVertex : Shader Vertex Uniform Varying
phongVertex =
    [glsl|
         precision mediump float;

         attribute vec3 vertPosition;
         attribute vec3 normal;

         uniform vec3 cameraPosition;
         uniform mat4 perspective;
         uniform mat4 cameraOrientation;
         uniform mat4 placement;
         uniform mat4 inversePlacement;

         uniform vec3 ambientColor;
         uniform vec3 diffuseLight;
         uniform vec3 diffuseReflection;
         uniform vec3 lightDirection;

         varying vec3 nonspecularColor;
         varying float specularFactor;

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

             vec3 surfaceNormal = vec3(vec4(normal, 0) * inversePlacement);
             float diffuseFactor = dot(lightDirection, surfaceNormal);

             vec3 diffuseColor = diffuseReflection * diffuseLight * diffuseFactor;
             nonspecularColor = ambientColor + diffuseColor;

             vec3 reflection = normalize(2.0 * diffuseFactor * surfaceNormal - lightDirection);
             vec3 cameraDirection = normalize(-cameraOffset.xyz);
             specularFactor = clamp(dot(reflection, cameraDirection), 0.0, 1.0);
         }
    |]


phongFragment : Shader {} Uniform Varying
phongFragment =
    [glsl|
        precision mediump float;

        varying vec3 nonspecularColor;
        varying float specularFactor;

        uniform vec3 specularReflection;
        uniform vec3 specularLight;
        uniform float shininess;

        void main() {
            vec3 specularColor = specularReflection * specularLight * pow(specularFactor, shininess);

            gl_FragColor = vec4(nonspecularColor + specularColor, 1);
        }
    |]
