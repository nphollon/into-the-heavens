module Graphics where

import Color exposing (Color)
import Array exposing (Array)
import Graphics.Element as Layout

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL

import Infix exposing (..)
import Triple exposing (Triple)


render : (Int, Int) -> List WebGL.Entity -> Layout.Element
render dimensions =
  WebGL.webgl dimensions
  >> uncurry Layout.container dimensions Layout.middle
  >> Layout.color Color.black


type alias Attribute =
  { vertPosition : Vec3
  , vertColor : Vec4
  }


type alias Mesh =
  List (Triple Attribute)


type alias FarUniform u =
  { u
  | perspective : Mat4
  , cameraOrientation : Mat4
  }


type alias NearUniform u =
  { u
  | perspective : Mat4
  , cameraOrientation : Mat4
  , modelPosition : Vec3 
  }


type alias Varying =
  { fragColor : Vec4
  }


type alias Entity =
  WebGL.Entity


vertex : Color -> Float -> Float -> Float -> Attribute
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


triangleStrip : Array Attribute -> Mesh
triangleStrip vertexes =
  let
    vertexList =
      Array.toIndexedList vertexes

    triangle (i, a) (_, b) (_, c) =
      if (i % 2 == 0)
        then (a, b, c)
        else (a, c, b)
  in
    List.map3 triangle
      vertexList
      (List.drop 1 vertexList)
      (List.drop 2 vertexList)  


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


distantEntity : Mesh -> FarUniform u -> WebGL.Entity
distantEntity =
  WebGL.entity distantVertexShader fragmentShader


entity : Mesh -> NearUniform u -> WebGL.Entity
entity mesh uniform =
  WebGL.entity vertexShader fragmentShader mesh uniform


yAxis : Vec3
yAxis =
  Vec3.vec3 0 1 0


zAxis : Vec3
zAxis =
  Vec3.vec3 0 0 1


vertexShader : WebGL.Shader Attribute (NearUniform u) Varying
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


distantVertexShader : WebGL.Shader Attribute (FarUniform u) Varying
distantVertexShader =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;
  uniform mat4 cameraOrientation;

  varying vec4 fragColor;

  void main() {
    vec4 worldPosition = vec4(vertPosition, 1);
    vec4 projectionOffset = vec4(0, 0, length(worldPosition.xyz), 0);
    gl_Position =
      perspective * (cameraOrientation * worldPosition - projectionOffset);

    fragColor = vertColor;
  }
  |]


fragmentShader : WebGL.Shader { } u Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
