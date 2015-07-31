module Graphics where

import Color
import Graphics.Element as Layout
import Math.Vector3 as Vec3
import Math.Vector4 as Vec4
import Math.Matrix4 as Mat4
import WebGL

import Infix exposing (..)
import Triple


{-
  questions:
    triangle fans & strips -- Pull request
    geometry shaders
  -}

render : (Int, Int) -> List WebGL.Entity -> Layout.Element
render dimensions =
  WebGL.webgl dimensions
  >> uncurry Layout.container dimensions Layout.middle
  >> Layout.color Color.black


type alias Attribute =
  { vertPosition : Vec3.Vec3
  , vertColor : Vec4.Vec4
  }


type alias Mesh =
  List (Triple.Triple Attribute)


type alias Uniform =
  { perspective : Mat4.Mat4
  , cameraOrientation : Mat4.Mat4
  , modelPosition : Vec3.Vec3
  }


type alias Varying =
  { fragColor : Vec4.Vec4
  }


type alias Entity =
  WebGL.Entity


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
    { vertPosition = Vec3.vec3 x y z
    , vertColor = colorVector }


rotate : Float -> Float -> Attribute -> Attribute
rotate pitch yaw vertex =
  let
    rotation =
      Mat4.makeRotate yaw yAxis
      |> Mat4.rotate pitch zAxis
  in
    { vertex | vertPosition <- Mat4.transform rotation vertex.vertPosition }


translate : Float -> Float -> Float -> Attribute -> Attribute
translate x y z vertex =
  { vertex | vertPosition <- Vec3.add vertex.vertPosition (Vec3.vec3 x y z) }


scale : Float -> Attribute -> Attribute
scale factor vertex =
  { vertex | vertPosition <- Vec3.scale factor vertex.vertPosition }


entity : Mesh -> Uniform -> WebGL.Entity
entity mesh uniform =
  WebGL.entity vertexShader fragmentShader mesh uniform


xAxis : Vec3.Vec3
xAxis =
  Vec3.vec3 1 0 0


yAxis : Vec3.Vec3
yAxis =
  Vec3.vec3 0 1 0


zAxis : Vec3.Vec3
zAxis =
  Vec3.vec3 0 0 1


vertexShader : WebGL.Shader Attribute Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;
  uniform mat4 cameraOrientation;
  uniform vec3 modelPosition;

  varying vec4 fragColor;

  void main() {
    vec4 worldPosition = vec4(vertPosition + modelPosition, 1);
    vec4 projectionOffset = vec4(0, 0, length(worldPosition.xyz), 0);
    gl_Position =
      perspective * (cameraOrientation * worldPosition - projectionOffset);

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
