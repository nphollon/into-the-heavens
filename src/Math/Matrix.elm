module Math.Matrix (Matrix, makeRotate, transform, perspective, transpose, placement, toMat4, toInverseMat4) where

import Math.Matrix4 as Mat4
import Math.Vector as Vector exposing (Vector)


type Matrix
  = Wrapper Mat4.Mat4


makeRotate : Vector -> Matrix
makeRotate v =
  if Vector.length v == 0 then
    Wrapper Mat4.identity
  else
    Mat4.makeRotate
      (Vector.length v)
      (Vector.toVec3 v)
      |> Wrapper


transform : Matrix -> Vector -> Vector
transform (Wrapper m) =
  Vector.toVec3 >> Mat4.transform m >> Vector.fromVec3


perspective : Float -> Matrix
perspective aspect =
  Mat4.makePerspective 60 aspect 0.1 1000.0
    |> Wrapper


transpose : Matrix -> Matrix
transpose (Wrapper m) =
  Wrapper (Mat4.transpose m)


placement : Vector -> Vector -> Matrix
placement position orientation =
  if Vector.length orientation == 0 then
    Wrapper (Mat4.makeTranslate (Vector.toVec3 position))
  else
    Mat4.makeTranslate (Vector.toVec3 position)
      |> Mat4.rotate (Vector.length orientation) (Vector.toVec3 orientation)
      |> Wrapper


toMat4 : Matrix -> Mat4.Mat4
toMat4 (Wrapper m) =
  m


toInverseMat4 : Matrix -> Mat4.Mat4
toInverseMat4 (Wrapper m) =
  Mat4.inverseOrthonormal m
