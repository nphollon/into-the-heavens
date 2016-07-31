module Math.Transform exposing (Orientable, rotationFor, toBodyFrame, fromBodyFrame, degreesFromForward, add, toMat4)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)


type alias Orientable a =
    { a
        | position : Vector
        , orientation : Quaternion
    }


rotationFor : Vector -> Vector -> Quaternion
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
            Quaternion.identity
        else if crossMag == 0 then
            Vector.vector 1.0e-10 0 0
                |> Vector.add v
                |> rotationFor u
        else
            Vector.scale (angle / crossMag) cross
                |> Quaternion.fromVector


toBodyFrame : Orientable a -> Vector -> Vector
toBodyFrame body point =
    Quaternion.rotateVector (Quaternion.conjugate body.orientation)
        (Vector.sub point body.position)


fromBodyFrame : Orientable a -> Vector -> Vector
fromBodyFrame body point =
    Quaternion.rotateVector body.orientation point
        |> Vector.add body.position


degreesFromForward : Orientable a -> Vector -> Float
degreesFromForward body point =
    toBodyFrame body point
        |> Vector.normalize
        |> Maybe.map (Vector.dot (Vector.vector 0 0 -1) >> acos)
        |> Maybe.withDefault 0


add : Orientable a -> Orientable b -> Orientable b
add { position, orientation } addend =
    { addend
        | position = Vector.add position addend.position
        , orientation = Quaternion.compose addend.orientation orientation
    }


toMat4 : Orientable a -> Mat4
toMat4 body =
    Mat4.mul (Mat4.makeTranslate (Vector.toVec3 body.position))
        (Quaternion.toMat4 body.orientation)
