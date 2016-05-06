module Math.Collision (isOutside, isInside, hull) where

import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform


type alias Hull =
  List
    { keyPoint : Vector
    , normal : Vector
    }


type alias Body a =
  { a
    | hull : Maybe Hull
    , orientation : Vector
    , position : Vector
  }


{-| Given a list of triangles, compute a hull. For a triangle of points (a,b,c),
the resulting normal will be the normalized cross product `(a to b) x (b to c)`. In
other words, if the triangle vertexes are going counter-clockwise from your point
of view, the normal will be pointing towards from you.

The triangles passed to this function should form a polyhedron that is
* convex (no dents)
* closed (no holes)
-}
hull : (a -> Vector) -> List ( a, a, a ) -> Hull
hull xform triangles =
  let
    tripleMap ( a, b, c ) =
      ( xform a, xform b, xform c )

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
    List.map (tripleMap >> toFace) triangles
      |> List.filter (.normal >> isDefined)


isInside : Vector -> Body a -> Bool
isInside point body =
  let
    bodyPoint =
      Transform.toBodyFrame point body

    isBehind face =
      Vector.dot face.normal (Vector.sub bodyPoint face.keyPoint) < 1.0e-6

    hull =
      Maybe.withDefault [] body.hull
  in
    not (List.isEmpty hull) && List.all isBehind hull


isOutside : Vector -> Body a -> Bool
isOutside point boundary =
  not (isInside point boundary)
