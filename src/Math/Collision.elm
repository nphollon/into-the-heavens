module Math.Collision (Hull, isOutside, isInside, fromTriangles) where

import Math.Vector as Vector exposing (Vector)


type alias Hull =
  List
    { keyPoint : Vector
    , normal : Vector
    }


{-| Given a list of triangles, compute a hull. For a triangle of points (a,b,c),
the resulting normal will be the normalized cross product `(a to b) x (b to c)`. In
other words, if the triangle vertexes are going counter-clockwise from your point
of view, the normal will be pointing towards from you.

The triangles passed to this function should form a polyhedron that is
* convex (no dents)
* closed (no holes)
-}
fromTriangles : List ( Vector, Vector, Vector ) -> Hull
fromTriangles triangles =
  let
    toFace ( a, b, c ) =
      { normal =
          Vector.normalize (Vector.cross (Vector.sub b a) (Vector.sub c a))
      , keyPoint = a
      }

    isDefined vec =
      [ Vector.getX, Vector.getY, Vector.getZ ]
        |> List.map (\f -> f vec)
        |> List.all (not << isNaN)
  in
    List.map toFace triangles
      |> List.filter (.normal >> isDefined)


{-| Returns `True` if the given position is on or in the given hull.
Defaults to `False` if the hull has no sides.

    hull =
      fromTriangles
        [ (vec3 0 0 0, vec3 0 0 5, vec3 10 0 0)
        , (vec3 0 0 0, vec3 0 5 0, vec3 0 0 5)
        , (vec3 0 0 0, vec3 10 0 0, vec3 0 5 0)
        , (vec3 10 0 0, vec3 0 0 5, vec3 0 5 0)
        ]

    isInside hull (vec3 5 1 1) == True

    isInside hull (vec3 -1 2 -1) == False

    isInside hull (vec3 0 0 0) == True
-}
isInside : Vector -> Hull -> Bool
isInside point faces =
  let
    isBehind face =
      Vector.dot face.normal (Vector.sub point face.keyPoint) < 1.0e-6
  in
    not (List.isEmpty faces) && List.all isBehind faces


{-| Returns `True` if the given position is outside the given hull.
The logical inverse of `isInside`.
-}
isOutside : Vector -> Hull -> Bool
isOutside point boundary =
  not (isInside point boundary)
