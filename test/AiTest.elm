module AiTest (testSuite) where

import ElmTest exposing (..)
import Dict
import Types exposing (..)
import Math.Vector as Vec exposing (Vector)
import Flight.Ai as Ai


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
      { stillBody
        | position = Vec.vector 0 0 0
        , orientation = Vec.vector 0 0 0
      }

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
        <| assertFire
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 -10)
    , test "default placement, target in +Z"
        <| assertWontFire
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 10)
    , test "at z 20, target at z 10"
        <| assertFire
            (Vec.vector 0 0 20)
            (Vec.vector 0 0 0)
            (Vec.vector 0 0 10)
    , test "facing target from same z, positive y"
        <| assertFire
            (Vec.vector 0 10 10)
            (Vec.vector (turns -0.25) 0 0)
            (Vec.vector 0 0 10)
    , test "facing 15.1 degrees above target"
        <| assertWontFire
            (Vec.vector 0 0 0)
            (Vec.vector (degrees 15.1) 0 0)
            (Vec.vector 0 0 -10)
    , test "facing 14.9 degrees above target"
        <| assertFire
            (Vec.vector 0 0 0)
            (Vec.vector (degrees 14.9) 0 0)
            (Vec.vector 0 0 -10)
      -- not covered : cooldown!
    ]


hostileSteering : Test
hostileSteering =
  suite
    "damped spring rotation to face target"
    [ test "target at +X, facing +Y, rotation in -Z"
        <| assertEqual 0 0
    ]


assertFire : Vector -> Vector -> Vector -> Assertion
assertFire =
  assertTriggerChange True


assertWontFire : Vector -> Vector -> Vector -> Assertion
assertWontFire =
  assertTriggerChange False


assertTriggerChange : Bool -> Vector -> Vector -> Vector -> Assertion
assertTriggerChange shouldFire position orientation targetPosition =
  let
    ai =
      { target = "target"
      , trigger = Ready
      , cooldown = 0
      , timeUntilReady = 0
      }

    expectedAi =
      if shouldFire then
        { ai | trigger = FireAndReset }
      else
        ai

    body =
      { stillBody
        | position = position
        , orientation = orientation
        , ai = Hostile ai
      }

    target =
      { stillBody
        | position = targetPosition
        , orientation = Vec.vector 0 0 0
      }

    universe =
      Dict.fromList
        [ ( "ai", body )
        , ( "target", target )
        ]
  in
    assertEqual
      (Hostile expectedAi)
      (Ai.steerAi 0 body universe)



{-
Linear acceleration
- should avoid planet (wait until last minute)
- should try flyby (seek point near target)
- maximum acceleration

Angular acceleration
- should aim at target

Firing
- should fire if facing target
- should wait before firing again
-}


stillBody : Body
stillBody =
  { position = Vec.vector 0 0 0
  , orientation = Vec.vector 0 0 0
  , velocity = Vec.vector 0 0 0
  , angVelocity = Vec.vector 0 0 0
  , hull = []
  , ai = Dumb
  , health = 0
  }
