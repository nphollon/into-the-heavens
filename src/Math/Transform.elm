module Math.Transform (rotate, rotationFor, placement, toBodyFrame, fromBodyFrame, degreesFromForward, mulOrient) where

import Math.Matrix as Matrix exposing (Matrix)
import Math.Vector as Vector exposing (Vector)


type alias Body a =
  { a
    | position : Vector
    , orientation : Vector
  }


rotate : Vector -> Vector -> Vector
rotate orientation =
  Matrix.transform (Matrix.makeRotate orientation)


rotationFor : Vector -> Vector -> Vector
rotationFor u v =
  let
    cross =
      Vector.cross u v

    crossMag =
      Vector.length cross

    angle =
      atan2 crossMag (Vector.dot u v)
  in
    if angle == 0 then
      Vector.vector 0 0 0
    else if crossMag == 0 then
      Vector.vector 1.0e-10 0 0
        |> Vector.add v
        |> rotationFor u
    else
      Vector.scale (angle / crossMag) cross


placement : Float -> Vector -> Vector -> Matrix
placement scale position orientation =
  Matrix.mul (Matrix.makeTranslate position) (Matrix.makeRotate orientation)
    |> Matrix.scale scale


toBodyFrame : Vector -> Body a -> Vector
toBodyFrame point body =
  rotate
    (Vector.negate body.orientation)
    (Vector.sub point body.position)


fromBodyFrame : Vector -> Body a -> Vector
fromBodyFrame point body =
  Vector.add body.position (rotate body.orientation point)


degreesFromForward : Vector -> Body a -> Float
degreesFromForward point body =
  toBodyFrame point body
    |> Vector.normalize
    |> Vector.dot (Vector.vector 0 0 -1)
    |> acos


{-| Combine two orientations
-}
mulOrient : Vector -> Vector -> Vector
mulOrient u v =
  compose (toQuaternion v) (toQuaternion u)
    |> fromQuaternion


type alias Quaternion =
  { vector : Vector
  , scalar : Float
  }


toQuaternion : Vector -> Quaternion
toQuaternion v =
  let
    angle =
      Vector.length v
  in
    if angle == 0 then
      { vector = v
      , scalar = 1
      }
    else
      { vector = Vector.scale (sin (0.5 * angle) / angle) v
      , scalar = cos (0.5 * angle)
      }


fromQuaternion : Quaternion -> Vector
fromQuaternion q =
  let
    halfSin =
      Vector.length q.vector
  in
    if halfSin == 0 then
      q.vector
    else
      Vector.scale (2 * acos q.scalar / halfSin) q.vector


compose : Quaternion -> Quaternion -> Quaternion
compose p q =
  { vector =
      (Vector.scale q.scalar p.vector)
        `Vector.add` (Vector.scale p.scalar q.vector)
        `Vector.add` (q.vector `Vector.cross` p.vector)
  , scalar =
      (q.scalar * p.scalar) - (q.vector `Vector.dot` p.vector)
  }
