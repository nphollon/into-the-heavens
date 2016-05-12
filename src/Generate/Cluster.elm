module Generate.Cluster (mesh) where

import Random.PCG as Random
import Color exposing (Color)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform
import Math.Spherical as Spherical
import Generate.Json exposing (Vertex)
import WebGL exposing (Drawable(..))


mesh : Drawable Vertex
mesh =
  Points (scatter 8900)


type alias Point =
  ( Float, Float )


scatter : Int -> List Vertex
scatter n =
  let
    seed =
      Random.initialSeed 2
  in
    Random.generate (Random.list n starPoint) seed
      |> fst


vertex : Float -> Vector -> Vertex
vertex hue position =
  let
    colorVector r g b =
      Vec4.vec4 (r / 255) (g / 255) (b / 255) 1

    starColor =
      if hue < 1.5 then
        --colorVector 157 180 255
        colorVector 57 80 255
      else if hue < 7 then
        --colorVector 170 191 255
        colorVector 70 91 255
      else if hue < 32.5 then
        --colorVector 202 216 255
        colorVector 102 116 255
      else if hue < 58 then
        --colorVector 251 248 255
        colorVector 251 248 255
      else if hue < 77.3 then
        --colorVector 255 244 232
        colorVector 255 144 132
      else if hue < 89.6 then
        --colorVector 255 221 180
        colorVector 255 121 80
      else
        --colorVector 255 189 111
        colorVector 255 89 11
  in
    { position = position
    , color = starColor
    , normal = Vector.vector 1 0 0
    }


starPoint : Random.Generator Vertex
starPoint =
  let
    toVertex vec color =
      Vector.add vec (Vector.vector 0 0.5 0.5)
        |> toCelestialSphere
        |> vertex color
  in
    Random.map2
      toVertex
      (Spherical.random (\r -> r ^ 2))
      (Random.float 0 100)


toCelestialSphere : Vector -> Vector
toCelestialSphere v =
  let
    r =
      Vector.length v

    flatR =
      200000.0 + r
  in
    Spherical.toRect
      flatR
      (asin (Vector.getZ v / r))
      (atan2 (Vector.getY v) (Vector.getX v))
