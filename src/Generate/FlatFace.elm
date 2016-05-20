module Generate.FlatFace (triangles, convexHull, boundingBox) where

import Array exposing (Array)
import Maybe.Extra as MaybeX
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.Hull as Hull
import Math.BoundingBox as BoundingBox
import Math.Transform as Transform
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
      List.map2
        (\a b -> toVertexTriangle color ( i, a, b ))
        (j :: k :: list)
        (k :: list)

    otherwise ->
      []


convexHull : Vec4 -> Array Vector -> a -> List ( Vertex, Vertex, Vertex )
convexHull color cornerPositions _ =
  Array.toList cornerPositions
    |> Hull.hull
    |> List.map
        (\{ p, q, r } -> toVertexTriangle color ( p, q, r ))


boundingBox : Vec4 -> Array Vector -> a -> List ( Vertex, Vertex, Vertex )
boundingBox color cornerPositions _ =
  let
    box =
      Array.toList cornerPositions
        |> Hull.hull
        |> BoundingBox.boxCreate

    corner x y z =
      Vector.vector (x * box.a) (y * box.b) (z * box.c)
        |> flip Transform.fromBodyFrame box

    une =
      corner 1 1 1

    unw =
      corner -1 1 1

    use =
      corner 1 -1 1

    usw =
      corner -1 -1 1

    lne =
      corner 1 1 -1

    lnw =
      corner -1 1 -1

    lse =
      corner 1 -1 -1

    lsw =
      corner -1 -1 -1
  in
    List.map
      (toVertexTriangle color)
      [ ( une, unw, usw )
      , ( usw, use, une )
      , ( lne, lse, lsw )
      , ( lsw, lnw, lne )
      , ( une, lne, lnw )
      , ( lnw, unw, une )
      , ( use, usw, lsw )
      , ( lsw, lse, use )
      , ( une, use, lse )
      , ( lse, lne, une )
      , ( unw, lnw, lsw )
      , ( lsw, usw, unw )
      ]


toVertexTriangle : Vec4 -> ( Vector, Vector, Vector ) -> ( Vertex, Vertex, Vertex )
toVertexTriangle color ( p, q, r ) =
  let
    normal =
      Vector.cross (Vector.sub q p) (Vector.sub r p)
        |> Vector.normalize
  in
    (,,)
      (toVertex color p normal)
      (toVertex color q normal)
      (toVertex color r normal)


toVertex : Vec4 -> Vector -> Vector -> Vertex
toVertex color position normal =
  { color = color
  , position = position
  , normal = normal
  }
