module Planet (planet) where

import Color
import Array
import List
import Maybe

import Math.Vector3 as Vec3

import Graphics

planet : Vec3.Vec3 -> Graphics.Uniform -> Graphics.Entity
planet position uniform =
  let
    vertices =
      List.map (vertex position) vertexAngles |> Array.fromList

    mesh =
      List.map (triangle vertices) indexMesh
  in
    Graphics.entity mesh uniform


vertexAngles =
  [ (0, 0)
  , (63.43494882292198, 0)
  , (63.43494882292198, 72)
  , (63.43494882292198, 144)
  , (63.43494882292198, 216)
  , (63.43494882292198, 288)
  , (116.56505117707802, 36)
  , (116.56505117707802, 108)
  , (116.56505117707802, 180)
  , (116.56505117707802, 252)
  , (116.56505117707802, 324)
  , (180, 0)
  ]


vertex position (colatitude, longitude) =
  let
    theta = degrees colatitude
    phi = degrees longitude
    r = 0.06
    x = r * sin theta * cos phi
    y = r * sin theta * sin phi
    z = r * cos theta
    color = Color.hsl phi (z/r) 0.5
  in
    Graphics.vertex color
      (x + Vec3.getX position)
      (y + Vec3.getY position)
      (z + Vec3.getZ position - 0.5)

indexMesh =
  [ (0, 2, 1)
  , (0, 3, 2)
  , (0, 4, 3)
  , (0, 5, 4)
  , (0, 1, 5)
  , (1, 2, 6)
  , (2, 3, 7)
  , (3, 4, 8)
  , (4, 5, 9)
  , (5, 1, 10)
  , (6, 2, 7)
  , (7, 3, 8)
  , (8, 4, 9)
  , (9, 5, 10)
  , (10, 1, 6)
  , (11, 6, 7)
  , (11, 7, 8)
  , (11, 8, 9)
  , (11, 9, 10)
  , (11, 10, 6)
  ]

triangle vertices (a, b, c) =
  let
    get i =
      Maybe.withDefault
        (Graphics.vertex Color.white 0 0 0)
        (Array.get i vertices)
  in
    (get a, get b, get c)
