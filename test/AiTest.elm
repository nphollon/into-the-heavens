module AiTest (testSuite) where

import ElmTest exposing (..)


testSuite : Test
testSuite =
  suite
    "AI tests"
    [ test "should fail" (assertEqual 1 1) ]
