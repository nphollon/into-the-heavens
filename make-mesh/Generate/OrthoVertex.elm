module Generate.OrthoVertex exposing (model)

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
        , Vector.vector 10.0 -10.0 -9.999999
        , Vector.vector 10.0 -10.0 10.0
        , Vector.vector -10.000001 -10.0 9.999998
        , Vector.vector -9.999996 -10.0 -10.000004
        , Vector.vector 10.000005 10.0 -9.999994
        , Vector.vector -10.000004 10.0 9.999996
        , Vector.vector -9.999999 10.0 -10.0
        ]


vertexIndexes : List (List Int)
vertexIndexes =
    [ []
    , [ 1, 2, 3, 4 ]
    , [ 2, 1, 5 ]
    , [ 7, 6, 5 ]
    , [ 3, 2, 6 ]
    , [ 3, 6, 7, 4 ]
    , [ 5, 1, 4, 7 ]
    , [ 5, 6, 2 ]
    ]
