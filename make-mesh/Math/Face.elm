module Math.Face (Face, face, vertexList, vertexTuple, cross) where

import Math.Vector as Vector exposing (Vector)


type alias Face =
  { p : Vector
  , q : Vector
  , r : Vector
  }


face : Vector -> Vector -> Vector -> Face
face p q r =
  { p = p
  , q = q
  , r = r
  }


vertexList : Face -> List Vector
vertexList face =
  [ face.p, face.q, face.r ]


vertexTuple : Face -> ( Vector, Vector, Vector )
vertexTuple face =
  ( face.p, face.q, face.r )


cross : Face -> Vector
cross { p, q, r } =
  Vector.cross (Vector.sub q p) (Vector.sub r p)
