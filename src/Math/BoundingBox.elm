module Math.BoundingBox (BoundingBox, collide) where

import Math.Vector as Vector exposing (Vector)
import Math.Matrix as Matrix exposing (Matrix)


type alias BoundingBox =
  { a : Float
  , b : Float
  , c : Float
  , position : Vector
  , rotation : Matrix
  }


collide : BoundingBox -> BoundingBox -> Bool
collide boxA boxB =
  let
    t =
      Matrix.transform
        (Matrix.transpose boxA.rotation)
        (Vector.sub boxB.position boxA.position)
        |> Vector.toRecord

    rotation =
      Matrix.mul
        (Matrix.transpose boxA.rotation)
        boxB.rotation

    r1 =
      Matrix.transform rotation (Vector.vector 1 0 0)

    r2 =
      Matrix.transform rotation (Vector.vector 0 1 0)

    r3 =
      Matrix.transform rotation (Vector.vector 0 0 1)

    r =
      { a11 = abs (Vector.getX r1)
      , a12 = abs (Vector.getX r2)
      , a13 = abs (Vector.getX r3)
      , a21 = abs (Vector.getY r1)
      , a22 = abs (Vector.getY r2)
      , a23 = abs (Vector.getY r3)
      , a31 = abs (Vector.getZ r1)
      , a32 = abs (Vector.getZ r2)
      , a33 = abs (Vector.getZ r3)
      , s11 = Vector.getX r1
      , s12 = Vector.getX r2
      , s13 = Vector.getX r3
      , s21 = Vector.getY r1
      , s22 = Vector.getY r2
      , s23 = Vector.getY r3
      , s31 = Vector.getZ r1
      , s32 = Vector.getZ r2
      , s33 = Vector.getZ r3
      }

    aMajor =
      abs t.x
        < (boxA.a + boxB.a * r.a11 + boxB.b * r.a12 + boxB.c * r.a13)

    aMiddle =
      abs t.y
        < (boxA.b + boxB.a * r.a21 + boxB.b * r.a22 + boxB.c * r.a23)

    aMinor =
      abs t.z
        < (boxA.c + boxB.a * r.a31 + boxB.b * r.a32 + boxB.c * r.a33)

    bMajor =
      abs (Vector.dot t r1)
        < (boxB.a + boxA.a * r.a11 + boxA.b * r.a21 + boxA.c * r.a31)

    bMiddle =
      abs (Vector.dot t r2)
        < (boxB.b + boxA.a * r.a12 + boxA.b * r.a22 + boxA.c * r.a32)

    bMinor =
      abs (Vector.dot t r3)
        < (boxB.c + boxA.a * r.a13 + boxA.b * r.a23 + boxA.c * r.a33)

    aMajorBMajor =
      abs (t.z * r.s21 - t.y * r.s31)
        < (boxA.b * r.a31 + boxA.c * r.a21 + boxB.b * r.a13 + boxB.c * r.a12)

    aMajorBMiddle =
      abs (t.z * r.s22 - t.y * r.s32)
        < (boxA.b * r.a32 + boxA.c * r.a22 + boxB.a * r.a13 + boxB.c * r.a11)

    aMajorBMinor =
      abs (t.z * r.s23 - t.y * r.s33)
        < (boxA.b * r.a33 + boxA.c * r.a23 + boxB.a * r.a12 + boxB.b * r.a11)

    aMiddleBMajor =
      abs (t.x * r.s31 - t.z * r.s11)
        < (boxA.a * r.a31 + boxA.c * r.a11 + boxB.b * r.a23 + boxB.c * r.a22)

    aMiddleBMiddle =
      abs (t.x * r.s32 - t.z * r.s12)
        < (boxA.a * r.a32 + boxA.c * r.a12 + boxB.a * r.a23 + boxB.c * r.a21)

    aMiddleBMinor =
      abs (t.x * r.s33 - t.z * r.s13)
        < (boxA.a * r.a33 + boxA.c * r.a13 + boxB.a * r.a22 + boxB.b * r.a21)

    aMinorBMajor =
      abs (t.y * r.s11 - t.x * r.s21)
        < (boxA.a * r.a21 + boxA.b * r.a11 + boxB.b * r.a33 + boxB.c * r.a32)

    aMinorBMiddle =
      abs (t.y * r.s12 - t.x * r.s22)
        < (boxA.a * r.a22 + boxA.b * r.a12 + boxB.a * r.a33 + boxB.c * r.a31)

    aMinorBMinor =
      abs (t.y * r.s13 - t.x * r.s23)
        < (boxA.a * r.a23 + boxA.b * r.a13 + boxB.a * r.a32 + boxB.b * r.a31)
  in
    aMajor
      && aMiddle
      && aMinor
      && bMajor
      && bMiddle
      && bMinor
      && aMajorBMajor
      && aMajorBMiddle
      && aMajorBMinor
      && aMiddleBMajor
      && aMiddleBMiddle
      && aMiddleBMinor
      && aMinorBMajor
      && aMinorBMiddle
      && aMinorBMinor
