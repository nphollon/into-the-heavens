module TransformTest (testSuite) where

import ElmTest exposing (..)
import Math.Vector as Vec
import Math.Transform exposing (..)


testSuite : Test
testSuite =
  suite
    "Rotating one vector into another"
    [ test "rotation between same vectors is zero"
        <| assertEqual
            (Vec.vector 0 0 0)
            (rotationFor (Vec.vector 1 2 3) (Vec.vector 1 2 3))
    , test "rotation between x and y axis is ninety degrees on z axis"
        <| assertEqual
            (Vec.vector 0 0 (degrees 90))
            (rotationFor (Vec.vector 1 0 0) (Vec.vector 0 1 0))
    , test "rotation between vectors ignores their magnitudes"
        <| assertEqual
            (Vec.vector 0 0 (degrees 90))
            (rotationFor (Vec.vector 100 0 0) (Vec.vector 0 100 0))
    ]
