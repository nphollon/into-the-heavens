module Main (..) where

import Task exposing (Task)
import Console
import ElmTest exposing (..)
import TransformTest
import AiTest
import FormatTest
import SwitchTest
import SphericalTest
import SpawnTest
import EngineTest
import TerrainTest
import TreeTest
import BoundingBoxTest


testSuite : Test
testSuite =
  suite
    "All tests"
    [ TransformTest.testSuite
    , AiTest.testSuite
    , FormatTest.testSuite
    , SwitchTest.testSuite
    , SphericalTest.testSuite
    , SpawnTest.testSuite
    , EngineTest.testSuite
    , TerrainTest.testSuite
    , TreeTest.testSuite
    , BoundingBoxTest.testSuite
    ]


port io : Signal (Task x ())
port io =
  Console.run (consoleRunner testSuite)
