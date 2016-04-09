module Assertion (..) where

import ElmTest exposing (..)
import Math.Vector as Vec exposing (Vector)


assertEqualVector : Vector -> Vector -> Assertion
assertEqualVector a b =
  if isAboutZero (Vec.distanceSquared a b) then
    pass
  else
    assertEqual a b


assertEqualFloat : Float -> Float -> Assertion
assertEqualFloat a b =
  if areAboutEqual a b then
    pass
  else
    assertEqual a b


assertEqualPair : ( Float, Float ) -> ( Float, Float ) -> Assertion
assertEqualPair a b =
  if areAboutEqual (fst a) (fst b) && areAboutEqual (snd a) (snd b) then
    pass
  else
    assertEqual a b


assertListContents : List a -> List a -> Assertion
assertListContents expected actual =
  let
    extra =
      List.filter (\i -> not (List.member i expected)) actual

    missing =
      List.filter (\i -> not (List.member i actual)) expected
  in
    if List.isEmpty extra && List.isEmpty missing then
      pass
    else
      fail
        <| "Result list was missing "
        ++ toString missing
        ++ " and should not have contained "
        ++ toString extra


areAboutEqual : Float -> Float -> Bool
areAboutEqual a b =
  isAboutZero ((a - b) ^ 2)


isAboutZero : Float -> Bool
isAboutZero a =
  a < 1.0e-10
