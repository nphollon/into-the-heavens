module Assertion (..) where

import ElmTest exposing (..)
import Math.Vector as Vec exposing (Vector)


assertEqualVector : Vector -> Vector -> Assertion
assertEqualVector a b =
  if isAboutZero (Vec.distanceSquared a b) then
    assert True
  else
    assertEqual a b


assertEqualFloat : Float -> Float -> Assertion
assertEqualFloat a b =
  if isAboutZero ((a - b) ^ 2) then
    assert True
  else
    assertEqual a b


assertEqualPair : ( Float, Float ) -> ( Float, Float ) -> Assertion
assertEqualPair a b =
  if
    isAboutZero ((fst a - fst b) ^ 2)
      && isAboutZero ((snd a - snd b) ^ 2)
  then
    assert True
  else
    assertEqual a b


isAboutZero : Float -> Bool
isAboutZero a =
  a < 1.0e-10
