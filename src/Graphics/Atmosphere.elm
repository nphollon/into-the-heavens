module Graphics.Atmosphere (entity) where

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Color exposing (Color)
import WebGL exposing (Drawable, Renderable, Shader)
import Types exposing (..)
import Math.Matrix as Matrix exposing (Matrix)
import Math.Vector as Vector


vertex : Shader Vertex {} {}
vertex =
  [glsl|
   |]


fragment : Shader {} {} {}
fragment =
  [glsl|
   |]
