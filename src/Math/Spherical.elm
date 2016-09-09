module Math.Spherical exposing (toRect, random, midpoint)

import Random.Pcg as Random
import Vector exposing (Vector)


toRect : Float -> Float -> Float -> Vector
toRect radius latitude longitude =
    Vector.vector (radius * cos latitude * cos longitude)
        (radius * cos latitude * sin longitude)
        (radius * sin latitude)


random : (Float -> Float) -> Random.Generator Vector
random f =
    Random.map3 (\r sinLat lon -> toRect (f r) (asin sinLat) lon)
        (Random.float 0 1)
        (Random.float -1 1)
        (Random.float 0 (turns 1))


midpoint : ( Float, Float ) -> ( Float, Float ) -> ( Float, Float )
midpoint ( latA, lonA ) ( latB, lonB ) =
    let
        bx =
            (cos latB) * (cos (lonB - lonA))

        by =
            (cos latB) * (sin (lonB - lonA))

        latMid =
            atan2 (sin latA + sin latB)
                (sqrt (by ^ 2 + (cos latA + bx) ^ 2))

        lonMid =
            lonA + (atan2 by (cos latA + bx))
    in
        ( latMid, lonMid )
