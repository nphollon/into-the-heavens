module Math.Matrix (Matrix, makeRotate, transform) where

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
