module Generate.Cluster (mesh) where

import Random.PCG as Random
import Color exposing (Color)
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform
import Math.Vector4 as Vec4 exposing (Vec4)
import Generate.Json exposing (Vertex)
import WebGL exposing (Drawable(..))


mesh : Drawable Vertex
mesh =
  Points (scatter 10000)


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
    toVertex density az cosAlt color =
      sphericalVector (density ^ 2) (acos cosAlt) az
        |> Vector.add (Vector.vector 0 0 0.8)
        |> toCelestialSphere
        |> vertex color
  in
    Random.map4
      toVertex
      (Random.float 0 1)
      (Random.float 0 (turns 1))
      (Random.float -1 1)
      (Random.float 0 100)


sphericalVector : Float -> Float -> Float -> Vector
sphericalVector radius latitude longitude =
  let
    x =
      radius * sin latitude * cos longitude

    y =
      radius * sin latitude * sin longitude

    z =
      radius * cos latitude
  in
    Vector.vector x y z


toCelestialSphere : Vector -> Vector
toCelestialSphere v =
  let
    r =
      Vector.length v

    flatR =
      400 + r
  in
    sphericalVector flatR (acos (v.z / r)) (atan2 v.y v.x)
