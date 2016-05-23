module Generate.FlatFace (triangles, convexHull, boundingBox) where

import Array exposing (Array)
import WebGL exposing (Drawable(..))
import Maybe.Extra as MaybeX
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.Hull as Hull
import Math.BoundingBox as BoundingBox
import Math.Transform as Transform
import Generate.Json exposing (Vertex)


triangles : Array Vector -> List (List Int) -> Drawable Vertex
triangles cornerPositions cornerIndexes =
  toVectorTriangles cornerPositions cornerIndexes
    |> List.map toVertexTriangle
    |> Triangle


convexHull : Array Vector -> Drawable Vertex
convexHull cornerPositions =
  Array.toList cornerPositions
    |> Hull.hull
    |> List.map (\{ p, q, r } -> toVertexTriangle ( p, q, r ))
    |> Triangle


toVectorTriangles : Array Vector -> List (List Int) -> List ( Vector, Vector, Vector )
toVectorTriangles cornerPositions cornerIndexes =
  let
    lookup =
      MaybeX.traverse (flip Array.get cornerPositions)

    decomposePolygon points =
      case points of
        i :: (j :: (k :: list)) ->
          List.map2
            ((,,) i)
            (j :: k :: list)
            (k :: list)

        otherwise ->
          []
  in
    List.filterMap lookup cornerIndexes
      |> List.concatMap decomposePolygon


boundingBox : Array Vector -> Drawable Vertex
boundingBox cornerPositions =
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
    Triangle
      <| (List.map toVertexTriangle)
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


toVertexTriangle : ( Vector, Vector, Vector ) -> ( Vertex, Vertex, Vertex )
toVertexTriangle ( p, q, r ) =
  let
    normal =
      Vector.cross (Vector.sub q p) (Vector.sub r p)
        |> Vector.normalize
  in
    (,,)
      (toVertex p normal)
      (toVertex q normal)
      (toVertex r normal)


toVertex : Vector -> Vector -> Vertex
toVertex position normal =
  { color = Vec4.vec4 1 1 1 1
  , position = position
  , normal = normal
  }
