module Graphics.Background exposing (draw)

import Math.Vector2 as Vec2 exposing (Vec2)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL exposing (Shader, Renderable, Drawable(..))
import Types exposing (..)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Graphics.Camera as Camera


type alias Uniform =
    { northPole : Vec3
    , sun : Vec3
    , scaleFactor : Vec2
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

        xScale =
            0.5 / tan (0.5 * (degrees Camera.fovy))

        yScale =
            xScale / Camera.aspect

        uniform =
            { northPole = transform (Vec3.vec3 0 0 1)
            , sun = transform (Vec3.vec3 0 -1 0)
            , scaleFactor = Vec2.vec2 xScale yScale
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

         uniform vec2 scaleFactor;

         varying vec2 coord;

         void main() {
             gl_Position = vec4(vertPosition, (1.0 - 1e-7), 1.0);
             coord = vertPosition * scaleFactor;
         }
    |]


fragmentShader : Shader {} Uniform Varying
fragmentShader =
    [glsl|
         precision mediump float;

         varying vec2 coord;

         uniform vec3 northPole;
         uniform vec3 sun;

         float grad(vec3 deprojected, vec3 zenith) {
             float zenithAngle = dot(deprojected, zenith);

             return acos(zenithAngle) * 2.0 / 3.18159 - 1.0;
         }

         vec3 cloudColor(float x) {
             vec3 cloudEdge = vec3(35, 84, 117) / 255.0;
             vec3 lowCloudCenter = vec3(0, 0, 7) / 255.0;
             vec3 highCloudCenter = vec3(8, 28, 65) / 255.0;

             if (x < 0.0) {
                 return mix(cloudEdge, lowCloudCenter, -1.1 * x);
             }
             return mix(cloudEdge, highCloudCenter, x);
         }

         float cloudCover(float x) {
             if (x > 0.4 || x < -0.2) {
                 return 1.0;
             }

             float angle = (x - 0.1) * 3.14159 / 0.3;
             return 0.5 * (1.0 - cos(angle));
         }

         vec3 sunColor(float x) {
             vec3 core = vec3(255, 244, 222) / 255.0;
             vec3 photosphere = vec3(254, 241, 127) / 255.0;
             vec3 corona = vec3(254, 193, 78) / 255.0;
             vec3 sky = vec3(50, 103, 145) / 255.0;

             if (x > 0.9) {
                 return mix(photosphere, core, (x - 0.9)/0.1);
             }

             if (x > 0.7) {
                 return mix(corona, photosphere, (x - 0.7)/0.2);
             }

             if (x > -0.4) {
                 return mix(sky, corona, (x + 0.4)/1.1);
             }

             return sky;
         }

         void main() {
             float distSquared = dot(coord, coord);

             vec3 deprojected =
                 vec3( 2.0 * coord.x, 2.0 * coord.y, distSquared - 1.0 )
                     / (distSquared + 1.0);

             float cloudGrad = grad(deprojected, northPole);

             float sunGrad = grad(deprojected, sun);

             vec3 color = mix(sunColor(sunGrad), cloudColor(cloudGrad), cloudCover(cloudGrad));

             gl_FragColor = vec4(color, 1);
         }
     |]
