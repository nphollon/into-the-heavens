module Explosion exposing (mesh)

import Array
import WebGL exposing (Drawable(..))
import Math.Vector4 as Vec4
import Vector exposing (Vector)
import ToJson exposing (Vertex)


mesh : Drawable Vertex
mesh =
    basePoints
        |> List.map toVertex
        |> Points


toVertex : Vector -> Vertex
toVertex position =
    { position = position
    , normal = Maybe.withDefault position (Vector.normalize position)
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
                toRect lat lon
        )
        |> Array.toList


toRect : Float -> Float -> Vector
toRect latitude longitude =
    Vector.vector
        (cos latitude * cos longitude)
        (cos latitude * sin longitude)
        (sin latitude)
