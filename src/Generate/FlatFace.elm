module Generate.FlatFace (triangles) where

import Array exposing (Array)
import Maybe.Extra as MaybeX
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Generate.Json exposing (Vertex)


triangles : Vec4 -> Array Vector -> List (List Int) -> List ( Vertex, Vertex, Vertex )
triangles color cornerPositions cornerIndexes =
  let
    toPositions indexes =
      MaybeX.traverse (\i -> Array.get i cornerPositions) indexes
  in
    List.filterMap toPositions cornerIndexes
      |> List.concatMap (toTriangles color)


toTriangles : Vec4 -> List Vector -> List ( Vertex, Vertex, Vertex )
toTriangles color positions =
  case positions of
    i :: (j :: (k :: list)) ->
      let
        normal =
          Vector.cross (Vector.sub j i) (Vector.sub k i)
            |> Vector.normalize

        toVertex p =
          { position = p
          , normal = normal
          , color = color
          }
      in
        List.map2
          (\a b -> ( toVertex i, toVertex a, toVertex b ))
          (j :: k :: list)
          (k :: list)

    otherwise ->
      []
