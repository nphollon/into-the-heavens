module Graphics.Dustbox exposing (draw)

import Random.Pcg as Random
import WebGL exposing (Shader, Renderable, Drawable(..))
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Types exposing (..)


draw : Camera -> Renderable
draw camera =
    let
        uniform =
            { perspective = camera.perspective
            , cameraOrientation = camera.orientation
            , cameraPosition = camera.position
            }
    in
        WebGL.render vertexShader fragmentShader dust uniform


type alias Uniform =
    { perspective : Mat4
    , cameraOrientation : Mat4
    , cameraPosition : Vec3
    }


type alias DustVertex =
    { vertPosition : Vec3 }


type alias Varying =
    { fragColor : Vec4 }


dust : Drawable DustVertex
dust =
    let
        seed =
            Random.initialSeed 2122

        generator =
            Random.list 200 <|
                Random.map3 dustVertex
                    (Random.float 0 10)
                    (Random.float 0 10)
                    (Random.float 0 10)
    in
        Random.step generator seed
            |> fst
            |> Points


dustVertex : Float -> Float -> Float -> DustVertex
dustVertex x y z =
    { vertPosition = Vec3.vec3 x y z }


vertexShader : Shader DustVertex Uniform Varying
vertexShader =
    [glsl|
         precision mediump float;

         attribute vec3 vertPosition;

         uniform vec3 cameraPosition;
         uniform mat4 perspective;
         uniform mat4 cameraOrientation;

         varying vec4 fragColor;

         void main() {
             vec3 worldFrame =
                 mod(vertPosition - cameraPosition, 10.0) - vec3(5, 5, 5);

             vec4 cameraFrame =
                 cameraOrientation * vec4(worldFrame, 1);

             float projOffset;

             if (cameraFrame.z < 0.0 || cameraFrame.z < length(cameraFrame.xy)) {
                 projOffset = length(cameraFrame.xyz);
             } else {
                 projOffset = 0.0;
             }

             vec4 projection = cameraFrame - vec4(0, 0, projOffset, 0);

             gl_Position = perspective * projection;
             gl_PointSize = 1.1;
             fragColor = vec4(0.5, 0.5, 0.5, 1.0);
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
