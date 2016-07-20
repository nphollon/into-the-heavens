module SpawnTest exposing (testSuite)

import ElmTest exposing (..)
import Assertion exposing (..)
import Random.Pcg as Random
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
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
        suite "Spawning visitor"
            [ test "Uses generator to set position"
                <| assertEqualVector up
                    (.position (spawnAt up))
            , test "Faces down when spawning from up"
                <| assertEqualQuaternion Quaternion.identity
                    (.orientation (spawnAt up))
            , test "Faces east when spawning from west"
                <| assertEqualQuaternion (Quaternion.fromVector (Vector.vector 0 (turns -0.25) 0))
                    (.orientation (spawnAt west))
            , test "Faces south when spawning from north"
                <| assertEqualQuaternion (Quaternion.fromVector (Vector.vector (turns -0.25) 0 0))
                    (.orientation (spawnAt north))
            , test "Going down when spawning from up"
                <| assertEqualVector (Vector.vector 0 0 -1)
                    (velocityDirection (spawnAt up))
            , test "Going east when spawning from west"
                <| assertEqualVector (Vector.vector 1 0 0)
                    (velocityDirection (spawnAt west))
            ]


spawnAt : Vector -> Placement
spawnAt spawnPoint =
    let
        generator =
            Spawn.placeAt (Random.constant spawnPoint)

        seed =
            Random.initialSeed 0
    in
        fst (Random.step generator seed)


velocityDirection : Placement -> Vector
velocityDirection =
    .velocity >> Vector.normalize >> Maybe.withDefault (Vector.vector 0 0 0)


type alias Placement =
    { position : Vector
    , orientation : Quaternion
    , velocity : Vector
    , angVelocity : Vector
    }
