module SphericalTest exposing (testSuite)

import ElmTest exposing (..)
import Assertion exposing (..)
import Math.Vector as Vec
import Math.Spherical as Spherical


testSuite : Test
testSuite =
    suite "Spherical geometry"
        [ suite "From spherical to rectangular coordinates"
            [ test "equator, prime meridian" <|
                assertEqualVector (Vec.vector 1 0 0)
                    (Spherical.toRect 1 0 0)
            , test "north pole" <|
                assertEqualVector (Vec.vector 0 0 1)
                    (Spherical.toRect 1 (turns 0.25) 0)
            , test "equator, 90 E" <|
                assertEqualVector (Vec.vector 0 1 0)
                    (Spherical.toRect 1 0 (turns 0.25))
            , test "zero vector" <|
                assertEqualVector (Vec.vector 0 0 0)
                    (Spherical.toRect 0 0 0)
            , test "60 S, 60 W, double radius" <|
                assertEqualVector (Vec.vector 0.5 (-0.5 * sqrt 3) -(sqrt 3))
                    (Spherical.toRect 2 (degrees -60) (degrees -60))
            ]
        , suite "Finding the midpoint of a great circle"
            [ test "a meridian" <|
                assertEqualPair ( 0.25, 1 )
                    (Spherical.midpoint ( -0.25, 1 ) ( 0.75, 1 ))
            , test "the equator" <|
                assertEqualPair ( 0, 0 )
                    (Spherical.midpoint ( 0, -1 ) ( 0, 1 ))
            , test "points on opposite meridians" <|
                assertEqualPair ( degrees 75, 0 )
                    (Spherical.midpoint ( 0, 0 ) ( degrees 30, degrees 180 ))
            ]
        ]
