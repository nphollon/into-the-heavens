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


type alias Triangle =
    ( ( Float, Float ), ( Float, Float ), ( Float, Float ) )


equalTriangle : Triangle -> Triangle -> Bool
equalTriangle ( a1, a2, a3 ) ( b1, b2, b3 ) =
    equalPair a1 b1
        && equalPair a2 b2
        && equalPair a3 b3


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


assertMesh : List Triangle -> List Triangle -> Assertion
assertMesh expected actual =
    let
        testTriangle a b =
            if equalTriangle a b then
                Nothing
            else
                Just ( a, b )

        pairs =
            List.map2 testTriangle
                (List.sort expected)
                (List.sort actual)
    in
        assertEqual [] (List.filterMap identity pairs)
