module Graphics (vertex, entity, transform, scale, render) where

import Color
import Graphics.Element as Layout
import Math.Vector3 as Vec3
import Math.Vector4 as Vec4
import Math.Matrix4 as Mat4
import WebGL

import Infix exposing (..)


{-
  questions:
    triangle fans & strips
    rendering faces in one direction only
    referencing vertices by index
    geometry shaders
  -}

render : (Int, Int) -> List WebGL.Entity -> Layout.Element
render dimensions =
  WebGL.webgl dimensions
  >> uncurry Layout.container dimensions Layout.middle
  >> Layout.color Color.black


type alias Attribute =
  { position : Vec3.Vec3
  , vertColor : Vec4.Vec4
  }


type alias Uniform =
  { perspective : Mat4.Mat4
  , placement : Mat4.Mat4
  }


type alias Varying = {
  fragColor : Vec4.Vec4
  }


vertex : Color.Color -> Float -> Float -> Float -> Attribute
vertex color x y z =
  let
    rgba =
      Color.toRgb color

    colorVector =
      Vec4.vec4
        (rgba.red ./. 255)
        (rgba.green ./. 255)
        (rgba.blue ./. 255)
        rgba.alpha
  in
    { position = Vec3.vec3 x y z
    , vertColor = colorVector }


transform : Mat4.Mat4 -> Attribute -> Attribute
transform rotation vertex =
  { vertex | position <- Mat4.transform rotation vertex.position }


scale : Float -> Attribute -> Attribute
scale factor vertex =
  { vertex | position <- Vec3.scale factor vertex.position }


entity : List (WebGL.Triangle Attribute) -> Uniform -> WebGL.Entity
entity mesh uniform =
  WebGL.entity vertexShader fragmentShader mesh uniform


vertexShader : WebGL.Shader Attribute Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 position;
  attribute vec4 vertColor;
  uniform mat4 perspective;
  uniform mat4 placement;
  varying vec4 fragColor;

  void main() {
    vec4 offset = vec4 (0, 0, length(position), 0);
    gl_Position =
      perspective * (placement * vec4(position, 1.0) - offset);

    fragColor = vertColor;
  }
  |]


fragmentShader : WebGL.Shader { } Uniform Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
