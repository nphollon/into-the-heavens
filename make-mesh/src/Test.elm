module Main exposing (..)

import Array
import String
import ElmTest exposing (..)
import ObjParser exposing (MeshData, parse)
import Math.Vector as Vector


testSuite : Test
testSuite =
    suite "OBJ file parsing"
        [ test "simple successful case" <|
            assertEqual (Ok goodMeshData)
                (parse goodInput)
        , test "extra lines are ignored" <|
            assertEqual (Ok goodMeshData)
                (parse extraCrap)
        , test "fail if no vertex lines" <|
            assertEqual (Err "no lines that look like vertexes")
                (parse noVLines)
        , test "fail if no face lines" <|
            assertEqual (Err "no lines that look like faces")
                (parse noFLines)
        , test "fail if empty v line" <|
            assertEqual (Err "vertex line was empty!")
                (parse emptyVLine)
        , test "fail if empty f line" <|
            assertEqual (Err "face line was empty!")
                (parse emptyFLine)
        , test "fail if can't parse vector component as float" <|
            assertEqual (Err "could not convert string '10.a000005' to a Float")
                (parse cantParseFloat)
        , test "fail if can't parse index" <|
            assertEqual (Err "could not convert string '?' to an Int")
                (parse cantParseInt)
        , test "fail if vector has less than 3 components" <|
            assertEqual (Err "could not convert [10,-10] to a vector")
                (parse vectorTooShort)
        , test "fail if vector has more than 3 components" <|
            assertEqual (Err "could not convert [10.000005,10,-9.999994,7.35] to a vector")
                (parse vectorTooLong)
        ]



-- OBJ parser does not check for out-of-bounds indexes


goodMeshData : MeshData
goodMeshData =
    { vertexPositions =
        Array.fromList
            [ Vector.vector 0 0 0
            , Vector.vector 10 -10 10
            , Vector.vector 10.000005 10 -9.999994
            ]
    , vertexIndexes =
        [ [ 1, 2, 3, 4 ]
        , [ 2, 1, 5 ]
        ]
    }


goodInput : String
goodInput =
    [ "v 10.000000 -10.000000 10.000000"
    , "v 10.000005 10.000000 -9.999994"
    , "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


extraCrap : String
extraCrap =
    [ "# Blender v2.69 (sub 0) OBJ File: 'ortho_vertex.blend'"
    , "mtllib ortho-vertex.mtl"
    , "o Cube"
    , "v 10.000000 -10.000000 10.000000"
    , "v 10.000005 10.000000 -9.999994"
    , "usemtl Material"
    , "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


noVLines : String
noVLines =
    [ "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


noFLines : String
noFLines =
    [ "v 10.000000 -10.000000 10.000000"
    , "v 10.000005 10.000000 -9.999994"
    ]
        |> String.join "\n"


emptyVLine : String
emptyVLine =
    [ "v"
    , "v 10.000005 10.000000 -9.999994"
    , "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


emptyFLine : String
emptyFLine =
    [ "v 10.000000 -10.000000 10.000000"
    , "v 10.000005 10.000000 -9.999994"
    , "f"
    , "f 2 1 5"
    ]
        |> String.join "\n"


cantParseFloat : String
cantParseFloat =
    [ "v 10.000000 -10.000000 10.000000"
    , "v 10.a000005 10.000000 -9.999994"
    , "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


cantParseInt : String
cantParseInt =
    [ "v 10.000000 -10.000000 10.000000"
    , "v 10.000005 10.000000 -9.999994"
    , "f 1 ? 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


vectorTooShort : String
vectorTooShort =
    [ "v 10.000000 -10.000000"
    , "v 10.000005 10.000000 -9.999994"
    , "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


vectorTooLong : String
vectorTooLong =
    [ "v 10.000000 -10.000000 10.000000"
    , "v 10.000005 10.000000 -9.999994 7.35"
    , "f 1 2 3 4"
    , "f 2 1 5"
    ]
        |> String.join "\n"


main : Program Never
main =
    runSuite testSuite
