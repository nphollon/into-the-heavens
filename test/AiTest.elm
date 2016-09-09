module AiTest exposing (testSuite)

import ElmTest exposing (..)
import Assertion exposing (..)
import Vector as Vec exposing (Vector)
import Quaternion exposing (Quaternion)
import Types exposing (..)
import Flight.Hostile as Ai
import Collision


testSuite : Test
testSuite =
    let
        criticalDamping =
            Ai.angleSpring 1 (Vec.vector 0 0 -1)
                >> Vec.scale (80 / turns 1)

        underdamping =
            Ai.angleSpring 0.5 (Vec.vector 0 0 -1)
                >> Vec.scale (80 / turns 1)
    in
        suite "damped spring rotation to face target"
            [ test "No acceleration if facing target and no velocity" <|
                assertEqualVector
                    (Vec.vector 0 0 0)
                    (criticalDamping (body Vec.identity Quaternion.identity Quaternion.identity))
            , test "Accelerates towards target if yaw 90 degrees" <|
                assertEqualVector
                    (Vec.vector 0 -5 0)
                    (criticalDamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector 0 (turns 0.25) 0))
                            Quaternion.identity
                        )
                    )
            , test "Accelerates towards target if pitch 90 degrees" <|
                assertEqualVector (Vec.vector -5 0 0)
                    (criticalDamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector (turns 0.25) 0 0))
                            Quaternion.identity
                        )
                    )
            , test "Acceleration ignores roll" <|
                assertEqualVector (Vec.vector 0 0 0)
                    (criticalDamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector 0 0 (turns 0.25)))
                            Quaternion.identity
                        )
                    )
            , test "Accelerates towards target if rotated on oblique axis" <|
                assertEqualVector (Vec.vector -1.0e-2 -1.0e-2 0)
                    (criticalDamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector (turns 5.0e-4) (turns 5.0e-4) 0))
                            Quaternion.identity
                        )
                    )
            , test "Accelerate in some direction if facing directly away from target" <|
                assertEqualFloat 10
                    (Vec.length
                        (criticalDamping
                            (body (Vec.vector 0 0 -2) Quaternion.identity Quaternion.identity)
                        )
                    )
            , test "Acceleration opposes velocity if facing target" <|
                assertEqualVector
                    (Vec.vector 0 -1 0)
                    (criticalDamping
                        (body
                            Vec.identity
                            Quaternion.identity
                            (Quaternion.fromVector (Vec.vector 0 (turns 1.25e-2) 0))
                        )
                    )
            , test "coaxial velocity & orientation, critically damped" <|
                assertEqualVector
                    (Vec.vector 0 -12 0)
                    (criticalDamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector 0 (turns 0.1) 0))
                            (Quaternion.fromVector (Vec.vector 0 (turns 0.125) 0))
                        )
                    )
            , test "coaxial velocity & orientation, underdamped" <|
                assertEqualVector
                    (Vec.vector 0 -14 0)
                    (underdamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector 0 (turns 0.1) 0))
                            (Quaternion.fromVector (Vec.vector 0 (turns 0.125) 0))
                        )
                    )
            , test "orientation perpendicular to velocity" <|
                assertEqualVector
                    (Vec.vector 0 -5 -20)
                    (criticalDamping
                        (body
                            Vec.identity
                            (Quaternion.fromVector (Vec.vector 0 (turns 0.25) 0))
                            (Quaternion.fromVector (Vec.vector 0 0 (turns 0.25)))
                        )
                    )
            , test "oblique orientation" <|
                assertEqualVector
                    (Vec.vector
                        (20 / (turns (sqrt 26)) * acos (2 / sqrt 30))
                        (-100 / (turns (sqrt 26)) * acos (2 / sqrt 30))
                        0
                    )
                    (criticalDamping
                        (body
                            (Vec.vector -5 -2 -2)
                            (Quaternion.fromVector (Vec.vector (turns 0.25) 0 0))
                            Quaternion.identity
                        )
                    )
            ]


body : Vector -> Quaternion -> Quaternion -> Body
body position orientation angVelocity =
    { frame =
        { position = position
        , orientation = orientation
        }
    , delta =
        { position = Vec.vector 0 0 0
        , orientation = angVelocity
        }
    , bounds = Collision.empty
    , health = 0
    , ai =
        Hostile
            { target = 0
            , trigger = { value = 0, decay = 1 }
            , status = LockingOn
            }
    , collisionClass = Scenery
    }
