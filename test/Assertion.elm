module Assertion (..) where

import ElmTest exposing (..)
import Math.Vector as Vec exposing (Vector)


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
