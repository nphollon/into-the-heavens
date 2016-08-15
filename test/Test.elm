module Main exposing (..)

import ElmTest exposing (..)
import AiTest
import SwitchTest
import SphericalTest
import SpawnTest
import FinanceTest


testSuite : Test
testSuite =
    suite "All tests"
        [ AiTest.testSuite
        , SwitchTest.testSuite
        , SphericalTest.testSuite
        , SpawnTest.testSuite
        , FinanceTest.testSuite
        ]


main : Program Never
main =
    runSuite testSuite
