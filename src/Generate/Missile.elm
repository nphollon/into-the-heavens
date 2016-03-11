module Generate.Missile (mesh, triangles) where

import Generate.Json exposing (Vertex)
import WebGL exposing (Drawable(..))
import Array
import Math.Vector as Vector exposing (Vector)
import Math.Vector4 as Vec4 exposing (Vec4)
import Maybe.Extra as MaybeX


mesh : Drawable Vertex
mesh =
  Triangle triangles


triangles : List ( Vertex, Vertex, Vertex )
triangles =
  let
    zPeak =
      0

    zBase =
      0.1

    rBase =
      0.1

    cornerPositions =
      Array.fromList
        [ Vector.vector 0 0 zPeak
        , Vector.vector 0 rBase zBase
        , Vector.vector rBase 0 zBase
        , Vector.vector 0 -rBase zBase
        , Vector.vector -rBase 0 zBase
        ]

    cornerIndexes =
      [ [ 0, 2, 1 ]
      , [ 0, 3, 2 ]
      , [ 0, 4, 3 ]
      , [ 0, 1, 4 ]
      , [ 1, 2, 3, 4 ]
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
          , color = Vec4.vec4 0.8 1 0 1
          }
      in
        List.map2
          (\a b -> ( toVertex i, toVertex a, toVertex b ))
          (j :: k :: list)
          (k :: list)

    otherwise ->
      []
