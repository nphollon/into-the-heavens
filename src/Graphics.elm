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


render : (Int, Int) -> Camera -> List (Camera -> WebGL.Entity) -> Layout.Element
render dimensions camera entities =
  List.map (\i -> i camera) entities
    |> WebGL.webgl dimensions
    |> uncurry Layout.container dimensions Layout.middle
    |> Layout.color Color.black


type alias Attribute =
  { vertPosition : Vec3
  , vertColor : Vec4
  }


type alias Mesh =
  List (Triple Attribute)


type alias Camera =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  }

                  
type alias NearUniform =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  , placement : Mat4
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


colorVector : Color -> Vec4
colorVector color =
  let
    rgba =
      Color.toRgb color
  in
    Vec4.vec4
      (rgba.red ./. 255)
      (rgba.green ./. 255)
      (rgba.blue ./. 255)
      rgba.alpha


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
      Mat4.makeRotate yaw Vec3.j
      |> Mat4.rotate pitch Vec3.k
  in
    { vertex | vertPosition <- Mat4.transform rotation vertex.vertPosition }


translate : Float -> Float -> Float -> Attribute -> Attribute
translate x y z vertex =
  { vertex | vertPosition <- Vec3.add vertex.vertPosition (Vec3.vec3 x y z) }


scale : Float -> Attribute -> Attribute
scale factor vertex =
  { vertex | vertPosition <- Vec3.scale factor vertex.vertPosition }


distantEntity : Mesh -> Camera -> WebGL.Entity
distantEntity =
  WebGL.entity distantVertexShader distantFragmentShader


nearVertexShader : WebGL.Shader Attribute NearUniform Varying
nearVertexShader =
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


distantVertexShader : WebGL.Shader Attribute Camera Varying
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


type alias FragmentShader u =
  WebGL.Shader { } u Varying


distantFragmentShader : FragmentShader u
distantFragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
