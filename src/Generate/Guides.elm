module Generate.Guides (crosshair) where

import WebGL exposing (Drawable(..))
import Types exposing (Vertex)
import Math.Vector3 as Vec3
import Math.Vector4 as Vec4


crosshair : Drawable Vertex
crosshair =
  let
    resolution =
      100
  in
    [0..resolution]
      |> List.map (\i -> turns (toFloat i / toFloat resolution))
      |> List.map toVertex
      |> LineLoop


toVertex : Float -> Vertex
toVertex angle =
  let
    ( x, y ) =
      fromPolar ( 5.0e-2, angle )
  in
    { vertPosition = Vec3.vec3 x y 1
    , vertColor = Vec4.vec4 1 0 0 1
    , normal = Vec3.vec3 0 0 0
    }
