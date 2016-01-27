module World ( World
             , empty, world, toEntity) where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL

import Mesh exposing (Mesh)
import Triple exposing (Triple)


type alias World =
  { mesh : WebGL.Drawable Mesh.Vertex
  , radius : Float
  , position : Vec3
  }


type alias Camera =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  }

                  
type alias Placed u =
  { u | placement : Mat4 }

  
type alias Geometry = Placed Camera

                       
type alias Varying =
  { fragColor : Vec4
  , cosAngleIncidence : Float
  }


world : Mesh -> Float -> Triple Float -> World
world mesh radius position =
  { mesh = WebGL.Triangle mesh
  , radius = radius
  , position = Vec3.fromTuple position
  }


empty : World
empty =
  world [] 0.0 (0.0, 0.0, 0.0)


toEntity : World -> Camera -> WebGL.Renderable
toEntity world camera =
  let
    placement =
      Mat4.scale
            (Vec3.vec3 world.radius world.radius world.radius)
            (Mat4.makeTranslate world.position)

    newUniform =
      { perspective = camera.perspective
      , cameraOrientation = camera.cameraOrientation
      , cameraPosition = camera.cameraPosition
      , placement = placement }      
  in
    WebGL.render vertexShader planetShader world.mesh newUniform


vertexShader : WebGL.Shader Mesh.Vertex Geometry Varying
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

    cosAngleIncidence = dot(normal, dirToLight);
    fragColor = vertColor;
  }
  |]

              
planetShader : WebGL.Shader {} Geometry Varying
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
