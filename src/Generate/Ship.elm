module Generate.Ship (mesh) where

import Generate.Json exposing (Mesh, Vertex)
import Array
import Math.Vector as Vector exposing (Vector)
import Math.Vector4 as Vec4 exposing (Vec4)
import Maybe.Extra as MaybeX


mesh : Mesh
mesh =
  let
    zPeak =
      (1 + sqrt 2) * 2 ^ -0.25

    zMid =
      -(2 ^ -0.25)

    rMid =
      2 ^ -0.5

    cornerPositions =
      Array.fromList
        [ Vector.vector 0 0 zPeak
        , Vector.vector rMid rMid zMid
        , Vector.vector rMid -rMid zMid
        , Vector.vector -rMid -rMid zMid
        , Vector.vector -rMid rMid zMid
        , Vector.vector 1 0 -zPeak
        , Vector.vector 0 -1 -zPeak
        , Vector.vector -1 0 -zPeak
        , Vector.vector 0 1 -zPeak
        ]

    cornerIndexes =
      [ [ 0, 3, 6, 2 ]
      , [ 0, 4, 7, 3 ]
      , [ 0, 1, 8, 4 ]
      , [ 0, 2, 5, 1 ]
      , [ 8, 5, 6, 7 ]
      , [ 7, 6, 3 ]
      , [ 6, 5, 2 ]
      , [ 5, 8, 1 ]
      , [ 8, 7, 4 ]
      ]

    toPositions indexes =
      MaybeX.traverse (\i -> Array.get i cornerPositions) indexes
  in
    List.filterMap toPositions cornerIndexes
      |> List.concatMap toTriangles


toTriangles : List Vector -> List ( Vertex, Vertex, Vertex )
toTriangles positions =
  case positions of
    i :: (j :: (k :: list)) ->
      let
        normal =
          Vector.cross (Vector.sub j i) (Vector.sub k i)
            |> Vector.normalize

        toVertex p =
          { position = p
          , normal = normal
          , color = Vec4.vec4 0.28125 0.234375 0.47265625 1
          }
      in
        List.map2
          (\a b -> ( toVertex i, toVertex a, toVertex b ))
          (j :: k :: list)
          (k :: list)

    otherwise ->
      []
