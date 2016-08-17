module Graphics.Background exposing (draw)

import Math.Vector2 as Vec2 exposing (Vec2)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL exposing (Shader, Renderable, Drawable(..))
import Types exposing (..)
import Math.Quaternion as Quaternion exposing (Quaternion)


type alias Uniform =
    { northPole : Vec3
    , southPole : Vec3
    }


type alias Varying =
    { coord : Vec2 }


type alias BkgVertex =
    { vertPosition : Vec2 }


draw : Camera -> Renderable
draw camera =
    let
        cameraOrientation =
            Quaternion.toMat4 camera.orientation

        transform =
            Mat4.transform cameraOrientation

        uniform =
            { northPole = transform (Vec3.vec3 0 0 1)
            , southPole = transform (Vec3.vec3 0 0 -1)
            }
    in
        WebGL.render vertexShader fragmentShader rectangle uniform


rectangle : Drawable BkgVertex
rectangle =
    let
        upperLeft =
            BkgVertex (Vec2.vec2 -1 1)

        lowerLeft =
            BkgVertex (Vec2.vec2 -1 -1)

        upperRight =
            BkgVertex (Vec2.vec2 1 1)

        lowerRight =
            BkgVertex (Vec2.vec2 1 -1)
    in
        Triangle
            [ ( upperLeft, lowerLeft, lowerRight )
            , ( lowerRight, upperRight, upperLeft )
            ]


vertexShader : Shader BkgVertex Uniform Varying
vertexShader =
    [glsl|
         precision mediump float;

         attribute vec2 vertPosition;

         varying vec2 coord;

         void main() {
             gl_Position = vec4(vertPosition, (1.0 - 1e-7), 1.0);

             coord = vec2(1.5 * vertPosition.x, vertPosition.y);
         }
    |]


fragmentShader : Shader {} Uniform Varying
fragmentShader =
    [glsl|
         precision mediump float;

         varying vec2 coord;

         uniform vec3 northPole;
         uniform vec3 southPole;

         vec4 skyColor(float x) {
             if (x < -0.1) {
                 return vec4(0.1, 0.1, 0.2, 1);
             }

             if (x > 0.1) {
                 return vec4(0.15, 0.15, 0.25, 1);
             }

             return vec4(0.9, 0.9, 0.1, 1);
         }

         void main() {
             float distSquared = dot(coord, coord);

             vec3 deprojected = vec3( 2.0 * coord.x
                                     , 2.0 * coord.y
                                     , distSquared - 1.0 );

             float zenithAngle = dot(deprojected, northPole) / (distSquared + 1.0);

             float gradient = acos(zenithAngle) * 2.0 / 3.18159 - 1.0;

             gl_FragColor = skyColor(gradient);
         }
    |]
