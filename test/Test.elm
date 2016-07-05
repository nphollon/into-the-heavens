module Main exposing (..)

import ElmTest exposing (..)
import AiTest
import FormatTest
import SwitchTest
import SphericalTest
import SpawnTest
import EngineTest
import FinanceTest


testSuite : Test
testSuite =
    suite "All tests"
        [ AiTest.testSuite
        , FormatTest.testSuite
        , SwitchTest.testSuite
        , SphericalTest.testSuite
        , SpawnTest.testSuite
        , EngineTest.testSuite
        , FinanceTest.testSuite
        ]


main : Program Never
main =
    runSuite testSuite
