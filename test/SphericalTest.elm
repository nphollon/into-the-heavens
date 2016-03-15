module SphericalTest (testSuite) where

import ElmTest exposing (..)
import Assertion exposing (..)
import Math.Vector as Vec
import Math.Spherical as Spherical


testSuite : Test
testSuite =
  suite
    "Spherical geometry"
    [ test "equator, prime meridian"
        <| assertEqualVector
            (Vec.vector 1 0 0)
            (Spherical.toRect 1 0 0)
    , test "north pole"
        <| assertEqualVector
            (Vec.vector 0 0 1)
            (Spherical.toRect 1 (turns 0.25) 0)
    , test "equator, 90 E"
        <| assertEqualVector
            (Vec.vector 0 1 0)
            (Spherical.toRect 1 0 (turns 0.25))
    , test "zero vector"
        <| assertEqualVector
            (Vec.vector 0 0 0)
            (Spherical.toRect 0 0 0)
    , test "60 S, 60 W, double radius"
        <| assertEqualVector
            (Vec.vector 0.5 (-0.5 * sqrt 3) -(sqrt 3))
            (Spherical.toRect 2 (degrees -60) (degrees -60))
    ]
