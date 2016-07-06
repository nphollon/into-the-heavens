module ObjParser exposing (MeshData, parse)

import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


type alias MeshData =
    { vertexPositions : Array Vector
    , vertexIndexes : List (List Int)
    }


parse : String -> Maybe MeshData
parse obj =
    Just
        { vertexPositions =
            Array.fromList
                [ Vector.vector 0 0 0
                , Vector.vector 1 0 0
                , Vector.vector 0 1 0
                ]
        , vertexIndexes =
            [ [ 0, 1, 2 ] ]
        }
