module Cluster exposing (mesh)

import Random.Pcg as Random
import Color exposing (Color)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform
import Math.Spherical as Spherical
import ToJson exposing (Vertex)
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
        Random.step (Random.list n starPoint) seed
            |> fst


starPoint : Random.Generator Vertex
starPoint =
    Random.map toVertex (Spherical.random (\r -> r ^ 2))


toCelestialSphere : Vector -> Vector
toCelestialSphere v =
    let
        r =
            Vector.length v

        flatR =
            200000.0 + r
    in
        Spherical.toRect flatR
            (asin (Vector.getZ v / r))
            (atan2 (Vector.getY v) (Vector.getX v))


toVertex : Vector -> Vertex
toVertex vec =
    { position = toCelestialSphere (Vector.add vec (Vector.vector 0 0.5 0.5))
    , normal = Vector.vector 1 0 0
    }
