module World (World, WorldStyle (..), world, toEntity) where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL

import Mesh exposing (Mesh)
import Triple exposing (Triple)


type alias World =
  { mesh : WebGL.Drawable Mesh.Vertex
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
  , cosAngleIncidence : Float
  }

                       
world : Mesh -> WorldStyle -> Float -> Triple Float -> World
world mesh style radius position =
  let
    scale = 6.9911E6
  in
    { mesh = WebGL.Triangle mesh
    , style = style
    , radius = radius * scale
    , position = Vec3.fromTuple position |> Vec3.scale scale
    }


toEntity : World -> Camera -> WebGL.Renderable
toEntity world uniform =
  let
    fragmentShader =
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
    WebGL.render vertexShader fragmentShader world.mesh newUniform


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


moonShader : WebGL.Shader {} Geometry Varying
moonShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;
  varying float cosAngleIncidence;

  void main () {
    float zone = length(step(0.8, fragColor));

    if (zone < 1e-4) {
      gl_FragColor = vec4(1, 1, 1, 1);
    } else {
      gl_FragColor = vec4(0.2, 0.1, 0.2, 1);
    }    

    gl_FragColor *= cosAngleIncidence;
    gl_FragColor.w = 1.0;
  }
  |]
