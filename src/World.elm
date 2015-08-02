module World where

import WebGL
import Sphere
import Graphics

planet = WebGL.entity Graphics.nearVertexShader fragmentShader Sphere.mesh

moon = WebGL.entity Graphics.nearVertexShader fragmentShader Sphere.mesh

fragmentShader : WebGL.Shader { } u Graphics.Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]