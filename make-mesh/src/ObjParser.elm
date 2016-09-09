module ObjParser exposing (MeshData, parse)

import Array exposing (Array)
import String
import Vector exposing (Vector)


type alias MeshData =
    { vertexPositions : Array Vector
    , vertexIndexes : List (List Int)
    }


parse : String -> Result String MeshData
parse obj =
    case sortAllLines obj of
        ( Err x, _ ) ->
            Err x

        ( _, Err x ) ->
            Err x

        ( Ok [], _ ) ->
            Err "no lines that look like vertexes"

        ( _, Ok [] ) ->
            Err "no lines that look like faces"

        ( Ok vertexPositions, Ok vertexIndexes ) ->
            Ok
                { vertexPositions =
                    Array.fromList (Vector 0 0 0 :: vertexPositions)
                , vertexIndexes =
                    vertexIndexes
                }


type alias FoldResult =
    ( Result String (List Vector), Result String (List (List Int)) )


sortAllLines : String -> FoldResult
sortAllLines =
    String.lines >> List.foldr sortLine ( Ok [], Ok [] )


sortLine : String -> FoldResult -> FoldResult
sortLine line ( vResult, fResult ) =
    if String.startsWith "v" line then
        ( pushResult parseVertex line vResult, fResult )
    else if String.startsWith "f" line then
        ( vResult, pushResult parseFace line fResult )
    else
        ( vResult, fResult )


parseVertex : String -> Result String Vector
parseVertex line =
    case List.tail (String.split " " line) of
        Nothing ->
            Err "vertex line was empty!"

        Just [] ->
            Err "vertex line was empty!"

        Just components ->
            List.foldr (pushResult String.toFloat) (Ok []) components
                `Result.andThen` vectorFromList


vectorFromList : List Float -> Result String Vector
vectorFromList components =
    case components of
        x :: y :: z :: [] ->
            Ok (Vector x y z)

        _ ->
            [ "could not convert ", toString components, " to a vector" ]
                |> String.concat
                |> Err


parseFace : String -> Result String (List Int)
parseFace line =
    case List.tail (String.split " " line) of
        Nothing ->
            Err "face line was empty!"

        Just [] ->
            Err "face line was empty!"

        Just indexes ->
            List.foldr (pushResult String.toInt) (Ok []) indexes


pushResult : (a -> Result x b) -> a -> Result x (List b) -> Result x (List b)
pushResult f x resultSoFar =
    Result.andThen resultSoFar
        (\ys -> Result.map (\y -> y :: ys) (f x))
