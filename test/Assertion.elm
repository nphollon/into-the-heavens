module Assertion exposing (..)

import ElmTest exposing (..)
import Math.Vector as Vec exposing (Vector)


equalFloat : Float -> Float -> Bool
equalFloat a b =
    (a - b) ^ 2 < 1.0e-10


equalVector : Vector -> Vector -> Bool
equalVector a b =
    equalFloat 0 (Vec.distanceSquared a b)


equalPair : ( Float, Float ) -> ( Float, Float ) -> Bool
equalPair a b =
    equalFloat (fst a) (fst b) && equalFloat (snd a) (snd b)


assertEqualFloat : Float -> Float -> Assertion
assertEqualFloat a b =
    if equalFloat a b then
        pass
    else
        assertEqual a b


assertEqualVector : Vector -> Vector -> Assertion
assertEqualVector a b =
    if equalVector a b then
        pass
    else
        assertEqual a b


assertEqualPair : ( Float, Float ) -> ( Float, Float ) -> Assertion
assertEqualPair a b =
    if equalPair a b then
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
