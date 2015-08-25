module SphereWriter (main) where

import Color
import Array exposing (Array)
import List
import Graphics.Element as Layout
import Text
import String

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)


import Triple exposing (Triple)
import Graphics
import Entity.Writer


type alias TupPoint = ((Float, Float), Zone)


type Zone = One | Two | Three | Four


main : Layout.Element
main =
  Layout.leftAligned <| Text.fromString <| Entity.Writer.source "Sphere" sphere


sphere : Triple.Mesh Graphics.Attribute
sphere =
  let
    sphereIcosaFaces =
      List.filterMap (Triple.mapMaybe (lookup baseCoords)) baseIndexes

    rectIcosaFaces =
      List.map (Triple.map toRect) sphereIcosaFaces
  in
    List.concatMap (recurse 3) rectIcosaFaces
  

lookup : Array TupPoint -> Int -> Maybe TupPoint
lookup =
  flip Array.get


toRect : TupPoint -> Graphics.Attribute
toRect ((colatitude, longitude), zone) =
  let
    theta = degrees colatitude
    phi = degrees longitude
    position =
      Vec3.vec3 (sin theta * cos phi) (sin theta * sin phi) (cos theta)
  in
    { vertPosition = position
    , vertColor = toColor zone
    }


recurse : Int -> Triple Graphics.Attribute -> Triple.Mesh Graphics.Attribute
recurse iter triangle =
  if iter == 0
    then [ triangle ]
    else List.concatMap (recurse (iter - 1)) (split triangle)


split : Triple Graphics.Attribute -> Triple.Mesh Graphics.Attribute
split (a, b, c) =
  let
    normalMidpoint u v =
      Vec3.add u v |> Vec3.normalize

    meanMidpoint c d =
      Vec4.add c d |> Vec4.scale 0.5

    midpoint a b =
      { vertPosition = normalMidpoint a.vertPosition b.vertPosition
      , vertColor = meanMidpoint a.vertColor b.vertColor
      }

    ab = midpoint a b
    bc = midpoint b c
    ca = midpoint c a
  in
    [ (a, ab, ca)
    , (b, bc, ab)
    , (c, ca, bc)
    , (ab, bc, ca)
    ]


toColor : Zone -> Vec4
toColor z =
  case z of
    One ->
      Vec4.vec4 1 0 0 0
    Two ->
      Vec4.vec4 0 1 0 0
    Three ->
      Vec4.vec4 0 0 1 0
    Four ->
      Vec4.vec4 0 0 0 1


baseCoords : Array TupPoint
baseCoords =
  Array.fromList
    [ ((0, 0), One)
    , ((63.43494882292198, 0), Two)
    , ((63.43494882292198, 72), Three)
    , ((63.43494882292198, 144), Four)
    , ((63.43494882292198, 216), Two)
    , ((63.43494882292198, 288), Three)
    , ((116.56505117707802, 36), Four)
    , ((116.56505117707802, 108), One)
    , ((116.56505117707802, 180), Three)
    , ((116.56505117707802, 252), Four)
    , ((116.56505117707802, 324), One)
    , ((180, 0), Two)
    ]

baseIndexes : Triple.Mesh Int
baseIndexes =
  [ (0, 1, 2)
  , (0, 2, 3)
  , (0, 3, 4)
  , (0, 4, 5)
  , (0, 5, 1)
  , (6, 2, 1)
  , (7, 3, 2)
  , (8, 4, 3)
  , (9, 5, 4)
  , (10, 1, 5)
  , (7, 2, 6)
  , (8, 3, 7)
  , (9, 4, 8)
  , (10, 5, 9)
  , (6, 1, 10)
  , (11, 6, 10)
  , (11, 7, 6)
  , (11, 8, 7)
  , (11, 9, 8)
  , (11, 10, 9)
  ]

