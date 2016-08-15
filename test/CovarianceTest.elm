module CovarianceTest exposing (testSuite)

import ElmTest exposing (..)
import Assertion exposing (..)
import Math.Covariance as Covariance exposing (Basis)
import Math.Vector as Vector exposing (Vector)


testSuite : Test
testSuite =
    let
        matrix =
            Covariance.init -1 1 3 2 0 2

        eigenbasis =
            Covariance.eigenbasis matrix
    in
        suite "Eigenbasis for a real symmetric matrix"
            [ test "one component should be (2, 1, 3) normalized" <|
                assertBasisContains (Vector.normalize (Vector.vector 2 1 3))
                    eigenbasis
            , test "one component should be (-5, 1, 3) normalized" <|
                assertBasisContains (Vector.normalize (Vector.vector -5 1 3))
                    eigenbasis
            , test "one component should be (0, -3, 1) normalized" <|
                assertBasisContains (Vector.normalize (Vector.vector 0 -3 1))
                    eigenbasis
            ]


assertBasisContains : Vector -> Basis -> Assertion
assertBasisContains v basis =
    let
        negV =
            Vector.negate v
    in
        if
            equalVector v basis.x
                || equalVector v basis.y
                || equalVector v basis.z
                || equalVector negV basis.x
                || equalVector negV basis.y
                || equalVector negV basis.z
        then
            pass
        else
            fail ("Expected to find vector " ++ toString v ++ " in basis " ++ toString basis)
