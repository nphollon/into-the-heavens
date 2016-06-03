module TransformTest exposing (testSuite)

import ElmTest exposing (..)
import Math.Vector as Vec
import Math.Transform exposing (..)


testSuite : Test
testSuite =
    suite "Geometric transformations"
        [ rotationForSuite
        , basisToOrientationSuite
        ]


rotationForSuite : Test
rotationForSuite =
    suite "Rotating one vector into another"
        [ test "rotation between same vectors is zero"
            <| assertEqual (Vec.vector 0 0 0)
                (rotationFor (Vec.vector 1 2 3) (Vec.vector 1 2 3))
        , test "rotation between x and y axis is ninety degrees on z axis"
            <| assertEqual (Vec.vector 0 0 (degrees 90))
                (rotationFor (Vec.vector 1 0 0) (Vec.vector 0 1 0))
        , test "rotation between vectors ignores their magnitudes"
            <| assertEqual (Vec.vector 0 0 (degrees 90))
                (rotationFor (Vec.vector 100 0 0) (Vec.vector 0 100 0))
        ]


basisToOrientationSuite : Test
basisToOrientationSuite =
    suite "converting an orthonormal basis to an axis-angle rotation"
        [ test "Identity transformation"
            <| assertEqual (Vec.vector 0 0 0)
                (basisToOrientation
                    { x = Vec.vector 1 0 0
                    , y = Vec.vector 0 1 0
                    , z = Vec.vector 0 0 1
                    }
                )
        , test "180 degree rotation"
            <| assertEqual (Vec.vector (turns 0.5 / sqrt 2) (turns 0.5 / sqrt 2) 0)
                (basisToOrientation
                    { x = Vec.vector 0 1 0
                    , y = Vec.vector 1 0 0
                    , z = Vec.vector 0 0 -1
                    }
                )
        ]
