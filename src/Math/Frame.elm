module Math.Frame exposing (Frame, identity, rotationFor, transformInto, transformOutOf, add, toMat4, compose, composeDelta, position, velocity, orientation, angVelocity, distance, bearing)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)


type alias Frame =
    { position : Vector
    , orientation : Quaternion
    }


type alias Moving a =
    { a
        | frame : Frame
        , delta : Frame
    }


toMat4 : Frame -> Mat4
toMat4 frame =
    Mat4.mul (Mat4.makeTranslate (Vector.toVec3 frame.position))
        (Quaternion.toMat4 frame.orientation)


identity : Frame
identity =
    { position = Vector.identity
    , orientation = Quaternion.identity
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


transformInto : Frame -> Vector -> Vector
transformInto frame point =
    Quaternion.rotateVector
        (Quaternion.conjugate frame.orientation)
        (Vector.sub point frame.position)


transformOutOf : Frame -> Vector -> Vector
transformOutOf frame point =
    Quaternion.rotateVector frame.orientation point
        |> Vector.add frame.position


add : Frame -> Frame -> Frame
add a b =
    { position = Vector.add b.position a.position
    , orientation = Quaternion.compose b.orientation a.orientation
    }


compose : Frame -> Frame -> Frame
compose parent child =
    { position = transformOutOf parent child.position
    , orientation = Quaternion.compose parent.orientation child.orientation
    }


composeDelta : Moving a -> Frame -> Frame
composeDelta parent childDelta =
    { position =
        childDelta.position
            |> Quaternion.rotateVector (orientation parent)
            |> Vector.add (velocity parent)
    , orientation =
        childDelta.orientation
    }


position : Moving a -> Vector
position body =
    body.frame.position


velocity : Moving a -> Vector
velocity body =
    body.delta.position


orientation : Moving a -> Quaternion
orientation body =
    body.frame.orientation


angVelocity : Moving a -> Quaternion
angVelocity body =
    body.delta.orientation


distance : Moving a -> Moving a -> Float
distance a b =
    Vector.distance (position a) (position b)


bearing : Moving a -> Moving b -> Float
bearing viewer target =
    transformInto viewer.frame (position target)
        |> Vector.normalize
        |> Maybe.map (Vector.dot (Vector.vector 0 0 -1) >> acos)
        |> Maybe.withDefault 0
