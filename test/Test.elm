module Main exposing (..)

import ElmTest exposing (..)
import TransformTest
import AiTest
import FormatTest
import SwitchTest
import SphericalTest
import SpawnTest
import EngineTest
import TreeTest
import BoundingBoxTest
import CovarianceTest


testSuite : Test
testSuite =
    suite "All tests"
        [ TransformTest.testSuite
        , AiTest.testSuite
        , FormatTest.testSuite
        , SwitchTest.testSuite
        , SphericalTest.testSuite
        , SpawnTest.testSuite
        , EngineTest.testSuite
        , TreeTest.testSuite
        , BoundingBoxTest.testSuite
        , CovarianceTest.testSuite
        ]


main : Program Never
main =
    runSuite testSuite
