module Main (..) where

import Task exposing (Task)
import Console
import ElmTest exposing (..)
import CollisionTest
import TransformTest
import AiTest


testSuite : Test
testSuite =
  suite
    "All tests"
    [ CollisionTest.testSuite
    , TransformTest.testSuite
    , AiTest.testSuite
    ]


port io : Signal (Task x ())
port io =
  Console.run (consoleRunner testSuite)
