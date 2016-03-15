module Math.Spherical (toRect) where

import Math.Vector as Vector exposing (Vector)


toRect : Float -> Float -> Float -> Vector
toRect radius latitude azimuth =
  Vector.vector
    (radius * cos latitude * cos azimuth)
    (radius * cos latitude * sin azimuth)
    (radius * sin latitude)
