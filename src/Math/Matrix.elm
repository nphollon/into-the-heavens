module Math.Matrix (Matrix, perspective, rotate, transpose, inverse, placement, toMat4) where

import Math.Matrix4 as Mat4
import Math.Vector as Vector exposing (Vector)


type Matrix
  = Wrapper Mat4.Mat4


perspective : Float -> Matrix
perspective aspect =
  Mat4.makePerspective 60 aspect 0.1 1000.0
    |> Wrapper


transpose : Matrix -> Matrix
transpose (Wrapper m) =
  Wrapper (Mat4.transpose m)


inverse : Matrix -> Matrix
inverse (Wrapper m) =
  Wrapper (Mat4.inverseOrthonormal m)


rotate : Vector -> Vector -> Vector
rotate orientation vector =
  Vector.toVec3 vector
    |> Mat4.transform (rotMat4 orientation)
    |> Vector.fromVec3


placement : Vector -> Vector -> Matrix
placement position orientation =
  Mat4.mul
    (Mat4.makeTranslate (Vector.toVec3 position))
    (rotMat4 orientation)
    |> Wrapper


toMat4 : Matrix -> Mat4.Mat4
toMat4 (Wrapper m) =
  m


rotMat4 : Vector -> Mat4.Mat4
rotMat4 orientation =
  if Vector.length orientation == 0 then
    Mat4.identity
  else
    Mat4.makeRotate (Vector.length orientation) (Vector.toVec3 orientation)
