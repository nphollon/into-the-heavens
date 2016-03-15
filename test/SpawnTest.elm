module SpawnTest (testSuite) where

import ElmTest exposing (..)
import Assertion exposing (..)
import Random.PCG as Random
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Flight.Spawn as Spawn


testSuite : Test
testSuite =
  let
    up =
      Vector.vector 0 0 1000

    north =
      Vector.vector 0 500 0

    west =
      Vector.vector -1000 0 0
  in
    suite
      "Spawning visitor"
      [ test "Uses generator to set position"
          <| assertEqualVector
              up
              (.position (spawnAt up))
      , test "Faces down when spawning from up"
          <| assertEqualVector
              (Vector.vector 0 0 0)
              (.orientation (spawnAt up))
      , test "Faces east when spawning from west"
          <| assertEqualVector
              (Vector.vector 0 (turns -0.25) 0)
              (.orientation (spawnAt west))
      , test "Faces south when spawning from north"
          <| assertEqualVector
              (Vector.vector (turns -0.25) 0 0)
              (.orientation (spawnAt north))
      , test "Going down when spawning from up"
          <| assertEqualVector
              (Vector.vector 0 0 -1)
              (spawnAt up |> .velocity |> Vector.normalize)
      , test "Going east when spawning from west"
          <| assertEqualVector
              (Vector.vector 1 0 0)
              (spawnAt west |> .velocity |> Vector.normalize)
      ]


spawnAt : Vector -> Body
spawnAt spawnPoint =
  let
    generator =
      Spawn.visitorBodyAt (Random.constant spawnPoint)

    seed =
      Random.initialSeed 0
  in
    fst (Random.generate generator seed)
