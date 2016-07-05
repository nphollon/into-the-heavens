module Generate.Ship exposing (model)

import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


model =
    { vertexPositions = vertexPositions
    , vertexIndexes = vertexIndexes
    }


vertexPositions : Array Vector
vertexPositions =
    Array.fromList
        [ Vector.vector 0 0 0
        , Vector.vector 1.0 0.0 1.0
        , Vector.vector -1.0 0.0 1.0
        , Vector.vector 0.2 0.0 -0.703737
        , Vector.vector -0.2 0.0 -0.703737
        , Vector.vector 0.28 0.221345 1.133568
        , Vector.vector -0.28 0.221345 1.133568
        , Vector.vector 0.0 0.129235 -0.199359
        , Vector.vector 0.0 0.0 -1.0
        , Vector.vector 0.9 -0.047327 0.891851
        , Vector.vector -0.9 -0.047327 0.891851
        , Vector.vector 0.18 -0.047327 -0.641513
        , Vector.vector -0.18 -0.047327 -0.641513
        , Vector.vector 0.0 -0.047327 -0.908149
        , Vector.vector 0.012925 0.267505 0.236717
        , Vector.vector 0.112 0.317367 0.930682
        , Vector.vector -0.112 0.317367 0.930682
        ]


vertexIndexes : List (List Int)
vertexIndexes =
    [ []
    , [ 8, 3, 13 ]
    , [ 1, 3, 7 ]
    , [ 2, 1, 5 ]
    , [ 6, 5, 7 ]
    , [ 4, 2, 7 ]
    , [ 3, 8, 7 ]
    , [ 12, 13, 11 ]
    , [ 3, 1, 9 ]
    , [ 2, 4, 10 ]
    , [ 4, 8, 13 ]
    , [ 1, 2, 10 ]
    , [ 6, 5, 15 ]
    , [ 8, 4, 7 ]
    , [ 16, 15, 14 ]
    , [ 7, 14, 15 ]
    , [ 7, 6, 16 ]
    , [ 3, 11, 13 ]
    , [ 5, 1, 7 ]
    , [ 6, 2, 5 ]
    , [ 2, 6, 7 ]
    , [ 10, 12, 11 ]
    , [ 9, 10, 11 ]
    , [ 11, 3, 9 ]
    , [ 4, 12, 10 ]
    , [ 12, 4, 13 ]
    , [ 9, 1, 10 ]
    , [ 16, 6, 15 ]
    , [ 5, 7, 15 ]
    , [ 14, 7, 16 ]
    ]
