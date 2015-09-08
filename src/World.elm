module World where

import Math.Matrix4 as Mat4
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL

import Graphics
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


world : Mesh -> WorldStyle -> Float -> Triple Float -> World
world mesh style radius position =
  { mesh = mesh
  , style = style
  , radius = radius
  , position = Vec3.fromTuple position
  }


toEntity : World -> Graphics.Camera -> Graphics.Entity
toEntity world =
  case world.style of
    Planet ->
      drawWorld planetShader world.mesh world.radius world.position
    Moon ->
      drawWorld moonShader world.mesh world.radius world.position

              
drawWorld : Graphics.FragmentShader Graphics.NearUniform -> Mesh -> Float -> Vec3 -> Graphics.Camera -> Graphics.Entity
drawWorld shader mesh size position uniform =
  let
    placement =
      Mat4.makeTranslate position
        |> Mat4.scale (Vec3.vec3 size size size)
  in
    WebGL.entity Graphics.nearVertexShader shader mesh
           { uniform | placement = placement }

           
planetShader : Graphics.FragmentShader u
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


moonShader : Graphics.FragmentShader u
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
