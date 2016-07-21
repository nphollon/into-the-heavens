module Explosion exposing (mesh)

import Array
import WebGL exposing (Drawable(..))
import Math.Vector4 as Vec4
import Math.Vector as Vector exposing (Vector)
import Math.Spherical as Spherical
import ToJson exposing (Vertex)


mesh : Drawable Vertex
mesh =
    basePoints
        |> List.map toVertex
        |> Points


toVertex : Vector -> Vertex
toVertex position =
    { position = position
    , normal = Vector.normalize position
    , color = Vec4.vec4 1 1 0 1
    }


basePoints : List Vector
basePoints =
    Array.initialize 100
        (\i ->
            let
                lon =
                    degrees (17 * toFloat i)

                lat =
                    degrees ((1.8 * toFloat i) - 90)
            in
                Spherical.toRect 1 lat lon
        )
        |> Array.toList
