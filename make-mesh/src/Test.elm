module Main exposing (..)

import ElmTest exposing (..)


testSuite : Test
testSuite =
    suite "All tests"
        []


main : Program Never
main =
    runSuite testSuite
