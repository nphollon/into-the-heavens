module ObjParser exposing (MeshData, parse)

import Array exposing (Array)
import String
import Math.Vector as Vector exposing (Vector)


type alias MeshData =
    { vertexPositions : Array Vector
    , vertexIndexes : List (List Int)
    }


parse : String -> Maybe MeshData
parse obj =
    let
        ( vertexLines, faceLines ) =
            List.foldl
                (\line ( vs, fs ) ->
                    if String.startsWith "v" line then
                        ( line :: vs, fs )
                    else if String.startsWith "f" line then
                        ( vs, line :: fs )
                    else
                        ( vs, fs )
                )
                ( [], [] )
                (String.lines obj)
    in
        if vertexLines == [] || faceLines == [] then
            Nothing
        else
            Just
                { vertexPositions =
                    vertexLines
                        |> List.map parseVertexLine
                        |> (::) (Vector.vector 0 0 0)
                        |> Array.fromList
                , vertexIndexes = List.map parseFaceLine faceLines
                }


parseVertexLine : String -> Vector
parseVertexLine line =
    Vector.vector 0 0 0


parseFaceLine : String -> List Int
parseFaceLine line =
    [ 1, 1, 1 ]
