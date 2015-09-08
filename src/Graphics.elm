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
import Mesh exposing (Mesh)


render : (Int, Int) -> Camera -> List (Camera -> Entity) -> Layout.Element
render dimensions camera entities =
  List.map (\i -> i camera) entities
    |> WebGL.webgl dimensions
    |> uncurry Layout.container dimensions Layout.middle
    |> Layout.color Color.black


type alias Camera =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  }


type alias Varying =
  { fragColor : Vec4
  }


type alias Entity =
  WebGL.Renderable


vertex : Color -> Float -> Float -> Float -> Mesh.Vertex
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


triangleStrip : Array Mesh.Vertex -> Mesh
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


rotate : Float -> Float -> Mesh.Vertex -> Mesh.Vertex
rotate pitch yaw vertex =
  let
    rotation =
      Mat4.makeRotate yaw Vec3.j
      |> Mat4.rotate pitch Vec3.k
  in
    { vertex | vertPosition <- Mat4.transform rotation vertex.vertPosition }


translate : Float -> Float -> Float -> Mesh.Vertex -> Mesh.Vertex
translate x y z vertex =
  { vertex | vertPosition <- Vec3.add vertex.vertPosition (Vec3.vec3 x y z) }


scale : Float -> Mesh.Vertex -> Mesh.Vertex
scale factor vertex =
  { vertex | vertPosition <- Vec3.scale factor vertex.vertPosition }


distantEntity : Mesh -> Camera -> Entity
distantEntity =
  WebGL.Triangle >> WebGL.render distantVertexShader distantFragmentShader


distantVertexShader : WebGL.Shader Mesh.Vertex Camera Varying
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


distantFragmentShader :   WebGL.Shader {} Camera Varying
distantFragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
