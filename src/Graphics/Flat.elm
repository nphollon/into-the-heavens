module Graphics.Flat (entity, bar) where

import Math.Vector4 exposing (Vec4)
import Math.Matrix4 exposing (Mat4)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (Vertex, Camera)


type alias Varying a =
  { a
    | fragColor : Vec4
  }


type alias Uniform a =
  { a
    | perspective : Mat4
  }


type alias VertexShader a b =
  Shader Vertex (Uniform a) (Varying b)


type alias FragmentShader a b =
  Shader {} (Uniform a) (Varying b)


entity : Camera -> Drawable Vertex -> Renderable
entity camera mesh =
  let
    uniform =
      { perspective = camera.perspective }
  in
    WebGL.render staticVertex staticFragment mesh uniform


bar : Float -> Camera -> Drawable Vertex -> Renderable
bar fraction camera mesh =
  let
    uniform =
      { perspective = camera.perspective
      , fraction = fraction
      }
  in
    WebGL.render barVertex barFragment mesh uniform


staticVertex : VertexShader {} {}
staticVertex =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;

  varying vec4 fragColor;

  void main() {
    gl_Position = perspective * vec4(vertPosition, 1);

    fragColor = vertColor;
  }
  |]


staticFragment : FragmentShader {} {}
staticFragment =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]


barVertex : VertexShader { fraction : Float } {}
barVertex =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;

  varying vec4 fragColor;

  void main() {
    gl_Position = perspective * vec4(vertPosition, 1);

    fragColor = vertColor;
  }
  |]


barFragment : FragmentShader { fraction : Float } {}
barFragment =
  [glsl|
  precision mediump float;

  uniform float fraction;

  varying vec4 fragColor;

  void main () {
    gl_FragColor = 1.0 - step(fraction, fragColor);
    gl_FragColor.w = 1.0;
  }
  |]
