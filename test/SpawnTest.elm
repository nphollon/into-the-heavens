module SpawnTest exposing (testSuite)

import ElmTest exposing (..)
import Assertion exposing (..)
import Random.Pcg as Random
import Vector exposing (Vector)
import Quaternion exposing (Quaternion)
import Frame exposing (Frame)
import Flight.Engine as Spawn


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
        suite "Spawning visitor"
            [ test "Uses generator to set position" <|
                assertEqualVector up
                    (.position (spawnAt up))
            , test "Faces down when spawning from up" <|
                assertEqualQuaternion Quaternion.identity
                    (.orientation (spawnAt up))
            , test "Faces east when spawning from west" <|
                assertEqualQuaternion (Quaternion.fromVector (Vector.vector 0 (turns -0.25) 0))
                    (.orientation (spawnAt west))
            , test "Faces south when spawning from north" <|
                assertEqualQuaternion (Quaternion.fromVector (Vector.vector (turns -0.25) 0 0))
                    (.orientation (spawnAt north))
            ]


spawnAt : Vector -> Frame
spawnAt spawnPoint =
    let
        generator =
            Spawn.placeAt (Random.constant spawnPoint)

        seed =
            Random.initialSeed 0
    in
        fst (Random.step generator seed)
