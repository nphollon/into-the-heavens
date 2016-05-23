module Generate.FlatFace (triangles, convexHull, boundingBoxTree) where

import Array exposing (Array)
import WebGL exposing (Drawable(..))
import Maybe.Extra as MaybeX
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.Hull as Hull
import Math.Face as Face exposing (Face)
import Math.BoundingBox as BoundingBox exposing (BoundingBox)
import Math.Transform as Transform
import Math.Tree as Tree exposing (Tree(..))
import Generate.Json exposing (Vertex)


triangles : Array Vector -> List (List Int) -> Drawable Vertex
triangles cornerPositions cornerIndexes =
  toFaces cornerPositions cornerIndexes
    |> List.map toVertexTriangle
    |> Triangle


convexHull : Array Vector -> Drawable Vertex
convexHull cornerPositions =
  Array.toList cornerPositions
    |> Hull.hull
    |> List.map toVertexTriangle
    |> Triangle


boundingBoxTree : Int -> Array Vector -> List (List Int) -> Drawable Vertex
boundingBoxTree level cornerPositions cornerIndexes =
  toFaces cornerPositions cornerIndexes
    |> BoundingBox.create level
    |> Tree.leaves
    |> List.concatMap boundingBox
    |> List.map toVertexTriangle
    |> Triangle


boundingBox : BoundingBox -> List Face
boundingBox box =
  let
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
    [ Face.face une unw usw
    , Face.face usw use une
    , Face.face lne lse lsw
    , Face.face lsw lnw lne
    , Face.face une lne lnw
    , Face.face lnw unw une
    , Face.face use usw lsw
    , Face.face lsw lse use
    , Face.face une use lse
    , Face.face lse lne une
    , Face.face unw lnw lsw
    , Face.face lsw usw unw
    ]


toFaces : Array Vector -> List (List Int) -> List Face
toFaces cornerPositions cornerIndexes =
  let
    lookup =
      MaybeX.traverse (flip Array.get cornerPositions)

    decomposePolygon points =
      case points of
        i :: (j :: (k :: list)) ->
          List.map2
            (Face.face i)
            (j :: k :: list)
            (k :: list)

        otherwise ->
          []
  in
    List.filterMap lookup cornerIndexes
      |> List.concatMap decomposePolygon


toVertexTriangle : Face -> ( Vertex, Vertex, Vertex )
toVertexTriangle face =
  let
    normal =
      Vector.normalize (Face.cross face)
  in
    (,,)
      (toVertex face.p normal)
      (toVertex face.q normal)
      (toVertex face.r normal)


toVertex : Vector -> Vector -> Vertex
toVertex position normal =
  { color = Vec4.vec4 1 1 1 1
  , position = position
  , normal = normal
  }
