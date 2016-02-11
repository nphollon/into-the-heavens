module Flight.Background (entity) where

import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL exposing (Renderable, Drawable, Shader)
import Update exposing (Camera, Vertex)


type alias Varying =
  { fragColor : Vec4
  }


entity : Camera -> Drawable Vertex -> Renderable
entity camera bkg =
  WebGL.render vertexShader fragmentShader bkg camera


vertexShader : Shader Vertex Camera Varying
vertexShader =
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


fragmentShader : Shader {} Camera Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
