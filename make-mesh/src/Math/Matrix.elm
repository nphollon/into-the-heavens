module Math.Matrix exposing (Matrix, mul, identity, makeTranslate, makeRotate, transform, transpose, inverse, scale, toMat4)

import Math.Matrix4 as Mat4
import Math.Vector as Vector exposing (Vector)


type Matrix
    = Wrapper Mat4.Mat4


identity : Matrix
identity =
    Wrapper Mat4.identity


transpose : Matrix -> Matrix
transpose (Wrapper m) =
    Wrapper (Mat4.transpose m)


inverse : Matrix -> Matrix
inverse (Wrapper m) =
    Wrapper (Mat4.inverseOrthonormal m)


transform : Matrix -> Vector -> Vector
transform (Wrapper m) =
    Vector.toVec3 >> Mat4.transform m >> Vector.fromVec3


makeTranslate : Vector -> Matrix
makeTranslate position =
    Vector.toVec3 position
        |> Mat4.makeTranslate
        |> Wrapper


mul : Matrix -> Matrix -> Matrix
mul (Wrapper m) (Wrapper n) =
    Wrapper (Mat4.mul m n)


scale : Float -> Matrix -> Matrix
scale factor (Wrapper m) =
    Wrapper (Mat4.scale3 factor factor factor m)


toMat4 : Matrix -> Mat4.Mat4
toMat4 (Wrapper m) =
    m


makeRotate : Vector -> Matrix
makeRotate orientation =
    if Vector.length orientation == 0 then
        Wrapper (Mat4.identity)
    else
        Mat4.makeRotate (Vector.length orientation)
            (Vector.toVec3 orientation)
            |> Wrapper
