module Main (..) where

import Task exposing (Task)
import Console
import ElmTest exposing (..)
import CollisionTest
import TransformTest
import AiTest
import FormatTest
import SwitchTest


testSuite : Test
testSuite =
  suite
    "All tests"
    [ CollisionTest.testSuite
    , TransformTest.testSuite
    , AiTest.testSuite
    , FormatTest.testSuite
    , SwitchTest.testSuite
    ]


port io : Signal (Task x ())
port io =
  Console.run (consoleRunner testSuite)
