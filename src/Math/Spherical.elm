module Math.Spherical (toRect, random) where

import Random.PCG as Random
import Math.Vector as Vector exposing (Vector)


toRect : Float -> Float -> Float -> Vector
toRect radius latitude azimuth =
  Vector.vector
    (radius * cos latitude * cos azimuth)
    (radius * cos latitude * sin azimuth)
    (radius * sin latitude)


random : (Float -> Float) -> Random.Generator Vector
random f =
  Random.map3
    (\r sinAlt az -> toRect (f r) (asin sinAlt) az)
    (Random.float 0 1)
    (Random.float -1 1)
    (Random.float 0 (turns 1))
