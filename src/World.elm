module World where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL

import Mesh exposing (Mesh)
import Triple exposing (Triple)


type alias World =
  { mesh : Mesh
  , style : WorldStyle
  , radius : Float
  , position : Vec3
  }


type WorldStyle =
  Planet | Moon


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
  }

                       
world : Mesh -> WorldStyle -> Float -> Triple Float -> World
world mesh style radius position =
  { mesh = mesh
  , style = style
  , radius = radius
  , position = Vec3.fromTuple position
  }


toEntity : World -> Camera -> WebGL.Entity
toEntity world uniform =
  let
    fragShader =
      case world.style of
        Planet ->
          planetShader
        Moon ->
          moonShader

    placement =
      Mat4.scale
            (Vec3.vec3 world.radius world.radius world.radius)
            (Mat4.makeTranslate world.position)

    newUniform =
      { uniform | placement = placement }      
  in
    WebGL.entity vertexShader fragShader world.mesh newUniform


vertexShader : WebGL.Shader Mesh.Vertex Geometry Varying
vertexShader =
  [glsl|
  precision mediump float;

  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform vec3 cameraPosition;
  uniform mat4 perspective;
  uniform mat4 cameraOrientation;
  uniform mat4 placement;

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

              
planetShader : WebGL.Shader {} Geometry Varying
planetShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

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
  }
  |]


moonShader : WebGL.Shader {} Geometry Varying
moonShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    float zone = length(step(0.8, fragColor));

    if (zone < 1e-4) {
      gl_FragColor = vec4(1, 1, 1, 1);
    } else {
      gl_FragColor = vec4(0.2, 0.1, 0.2, 1);
    }    
  }
  |]
