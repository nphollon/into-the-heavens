module Generate.Guides (crosshair, target, incoming) where

import WebGL exposing (Drawable(..))
import Types exposing (Vertex)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)


crosshair : Drawable Vertex
crosshair =
  ngon 4 1 (Vec4.vec4 0.9 0.9 0.9 1)
    |> (++) (ngon 4 1.1 (Vec4.vec4 0 0 0 1))
    |> LineLoop


target : Drawable Vertex
target =
  LineLoop (ngon 30 1 (Vec4.vec4 0.1 0.1 0.5 1))


incoming : Drawable Vertex
incoming =
  LineLoop (ngon 30 0.4 (Vec4.vec4 1 0 0 1))


ngon : Int -> Float -> Vec4 -> List Vertex
ngon sides radius color =
  let
    toVertex angle =
      { vertPosition = toPosition radius angle
      , vertColor = color
      , normal = Vec3.vec3 0 0 0
      }
  in
    [0..sides]
      |> List.map (\i -> turns (toFloat i / toFloat sides))
      |> List.map toVertex


toPosition : Float -> Float -> Vec3
toPosition radius angle =
  let
    ( x, y ) =
      fromPolar ( radius, angle )
  in
    Vec3.vec3 x y 0
