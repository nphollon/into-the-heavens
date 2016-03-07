module AiTest (testSuite) where

import ElmTest exposing (..)
import Dict
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Flight.Ai as Ai


testSuite : Test
testSuite =
  suite
    "Hostile AI tests"
    [ test "Steering object without AI returns nothing" noAi ]


noAi : Assertion
noAi =
  let
    body =
      stillBody (Vector.vector 0 0 0) (Vector.vector 0 0 0)

    universe =
      Dict.singleton "dummy" body
  in
    assertEqual
      Nothing
      (Ai.steerAi 0 body universe)


stillBody : Vector -> Vector -> Body
stillBody position orientation =
  { position = position
  , orientation = orientation
  , velocity = Vector.vector 0 0 0
  , angVelocity = Vector.vector 0 0 0
  , hull = []
  , ai = Nothing
  , health = 0
  }



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
