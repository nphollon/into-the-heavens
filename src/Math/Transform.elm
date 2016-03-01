module Math.Transform (rotate, rotationFor, placement, toBodyFrame, fromBodyFrame, mulOrient) where

import Types exposing (Body)
import Math.Matrix as Matrix exposing (Matrix)
import Math.Vector as Vector exposing (Vector)


rotate : Vector -> Vector -> Vector
rotate orientation =
  Matrix.transform (Matrix.makeRotate orientation)


rotationFor : Vector -> Vector
rotationFor v =
  let
    u =
      Vector.vector 0 0 1

    cross =
      Vector.cross u v

    crossMag =
      Vector.length cross

    angle =
      atan2 crossMag (Vector.dot u v)
  in
    Vector.scale (angle / crossMag) cross


placement : Float -> Vector -> Vector -> Matrix
placement scale position orientation =
  Matrix.mul (Matrix.makeTranslate position) (Matrix.makeRotate orientation)
    |> Matrix.scale scale


toBodyFrame : Vector -> Body -> Vector
toBodyFrame point body =
  rotate
    (Vector.negate body.orientation)
    (Vector.sub point body.position)


fromBodyFrame : Vector -> Body -> Vector
fromBodyFrame point body =
  Vector.add body.position (rotate body.orientation point)


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
