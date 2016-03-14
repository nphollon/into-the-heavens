module AiTest (testSuite) where

import ElmTest exposing (..)
import Dict
import Types exposing (..)
import Math.Vector as Vec exposing (Vector)
import Flight.Init exposing (defaultBody)
import Flight.Ai as Ai
import Flight.Util as Util


testSuite : Test
testSuite =
  suite
    "AI tests"
    [ noAi
    , hostileFiring
    , hostileSteering
    ]


noAi : Test
noAi =
  let
    body =
      { defaultBody | ai = Dumb }

    universe =
      Dict.singleton "dummy" body
  in
    test "Steering object without AI returns nothing"
      <| assertEqual
          Dumb
          (Ai.steerAi 0 body universe)


hostileFiring : Test
hostileFiring =
  suite
    "Pull trigger iff target within 30 degree FOV"
    [ test "default placement, target in -Z"
        <| assertFaces
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 -10)
    , test "default placement, target in +Z"
        <| assertDoesntFace
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 10)
    , test "at z 20, target at z 10"
        <| assertFaces
            (Vec.vector 0 0 20)
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 10)
    , test "facing target from same z, positive y"
        <| assertFaces
            (Vec.vector 0 10 10)
            (Vec.vector (turns -0.25) 0 0)
            (Vec.vector 0 0 10)
    , test "facing 15.1 degrees above target"
        <| assertDoesntFace
            (Vec.vector 0 0 0)
            (Vec.vector (degrees 15.1) 0 0)
            (Vec.vector 0 0 -10)
    , test "facing 14.9 degrees above target"
        <| assertFaces
            (Vec.vector 0 0 0)
            (Vec.vector (degrees 14.9) 0 0)
            (Vec.vector 0 0 -10)
      -- not covered : cooldown!
    ]


hostileSteering : Test
hostileSteering =
  let
    criticalDamping =
      Ai.angleSpring 1 (Vec.vector 0 0 -1)
        >> Vec.scale (80 / turns 1)

    underdamping =
      Ai.angleSpring 0.5 (Vec.vector 0 0 -1)
        >> Vec.scale (80 / turns 1)
  in
    suite
      "damped spring rotation to face target"
      [ test "No acceleration if facing target and no velocity"
          <| assertEqualVector
              (Vec.vector 0 0 0)
              (criticalDamping defaultBody)
      , test "Accelerates towards target if yaw 90 degrees"
          <| assertEqualVector
              (Vec.vector 0 -5 0)
              (criticalDamping
                { defaultBody | orientation = Vec.vector 0 (turns 0.25) 0 }
              )
      , test "Accelerates towards target if pitch 90 degrees"
          <| assertEqualVector
              (Vec.vector -5 0 0)
              (criticalDamping
                { defaultBody | orientation = Vec.vector (turns 0.25) 0 0 }
              )
      , test "Acceleration ignores roll"
          <| assertEqualVector
              (Vec.vector 0 0 0)
              (criticalDamping
                { defaultBody | orientation = Vec.vector 0 0 (turns 0.25) }
              )
      , test "Accelerates towards target if rotated on oblique axis"
          <| assertEqualVector
              (Vec.vector -1.0e-2 -1.0e-2 0)
              (criticalDamping
                { defaultBody
                  | orientation = Vec.vector (turns 5.0e-4) (turns 5.0e-4) 0
                }
              )
      , test "Accelerate in some direction if facing directly away from target"
          <| assertEqualFloat
              10
              (criticalDamping
                { defaultBody | position = Vec.vector 0 0 -2 }
                |> Vec.length
              )
      , test "Acceleration opposes velocity if facing target"
          <| assertEqualVector
              (Vec.vector 0 -1 0)
              (criticalDamping
                { defaultBody | angVelocity = Vec.vector 0 (turns 1.25e-2) 0 }
              )
      , test "coaxial velocity & orientation, critically damped"
          <| assertEqualVector
              (Vec.vector 0 -12 0)
              (criticalDamping
                { defaultBody
                  | orientation = Vec.vector 0 (turns 0.1) 0
                  , angVelocity = Vec.vector 0 (turns 0.125) 0
                }
              )
      , test "coaxial velocity & orientation, underdamped"
          <| assertEqualVector
              (Vec.vector 0 -14 0)
              (underdamping
                { defaultBody
                  | orientation = Vec.vector 0 (turns 0.1) 0
                  , angVelocity = Vec.vector 0 (turns 0.125) 0
                }
              )
      , test "orientation perpendicular to velocity"
          <| assertEqualVector
              (Vec.vector 0 -5 -20)
              (criticalDamping
                { defaultBody
                  | orientation = Vec.vector 0 (turns 0.25) 0
                  , angVelocity = Vec.vector 0 0 (turns 0.25)
                }
              )
      , test "oblique orientation"
          <| assertEqualVector
              (Vec.vector
                (20 / (turns (sqrt 26)) * acos (2 / sqrt 30))
                (-100 / (turns (sqrt 26)) * acos (2 / sqrt 30))
                0
              )
              (criticalDamping
                { defaultBody
                  | orientation = Vec.vector (turns 0.25) 0 0
                  , position = Vec.vector -5 -2 -2
                }
              )
      ]


assertEqualVector : Vector -> Vector -> Assertion
assertEqualVector a b =
  if Vec.distanceSquared a b < 1.0e-10 then
    assert True
  else
    assertEqual a b


assertEqualFloat : Float -> Float -> Assertion
assertEqualFloat a b =
  if (a - b) ^ 2 < 1.0e-10 then
    assert True
  else
    assertEqual a b


assertFaces : Vector -> Vector -> Vector -> Assertion
assertFaces =
  assertTriggerChange True


assertDoesntFace : Vector -> Vector -> Vector -> Assertion
assertDoesntFace =
  assertTriggerChange False


assertTriggerChange : Bool -> Vector -> Vector -> Vector -> Assertion
assertTriggerChange shouldFire position orientation targetPosition =
  let
    body =
      { defaultBody
        | position = position
        , orientation = orientation
      }

    target =
      { defaultBody
        | position = targetPosition
      }

    universe =
      Dict.fromList
        [ ( "ai", body )
        , ( "target", target )
        ]
  in
    assertEqual
      shouldFire
      (Util.faces "target" body universe)
