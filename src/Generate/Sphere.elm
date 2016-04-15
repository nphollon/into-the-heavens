module Generate.Sphere (mesh, triangles) where

import Color
import Array exposing (Array)
import Random.PCG as Random
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.Spherical as Spherical
import Generate.Json exposing (Vertex)
import Generate.Terrain as Terrain
import Maybe.Extra as MaybeX
import WebGL exposing (Drawable(..))


type alias TupPoint =
  ( ( Float, Float ), Zone )


type Zone
  = One
  | Two
  | Three
  | Four


size : Float
size =
  18


mesh : Drawable Vertex
mesh =
  Triangle triangles


triangles : List ( Vertex, Vertex, Vertex )
triangles =
  let
    toVertex latitude longitude height =
      { position = Spherical.toRect size latitude longitude
      , color = Vec4.vec4 longitude latitude height 1.0
      , normal = Spherical.toRect 1 latitude longitude
      }
  in
    ( Terrain.init 5 -0.1, Random.initialSeed 13 )
      |> Terrain.generate (Terrain.offset 1.5)
      |> fst
      |> Terrain.triangulate toVertex
