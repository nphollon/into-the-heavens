module Planet (main) where

import Color
import Array
import List
import Maybe
import Graphics.Element as Layout
import Text
import String

import Math.Vector3 as Vec3

import Triple exposing (Triple)

type alias Point = (Float, Float)

main : Layout.Element
main =
  Layout.leftAligned <| Text.fromString <| source "Planet" planet

source : String -> List (Triple Vec3.Vec3) -> String
source moduleName mesh =
  String.join "\n"
    [ "module " ++ moduleName ++ " where"
    , "import Math.Vector3 exposing (fromTuple)"
    , printMesh mesh
    ]


printMesh : List (Triple Vec3.Vec3) -> String
printMesh triples = 
  let
    tripleText =
      List.map printTriple triples
  in
    String.concat
      [ "  ["
      , String.join "," tripleText
      , "]"
      ]


printTriple : Triple Vec3.Vec3 -> String
printTriple (a, b, c) =
  String.concat
    [ "(", printVector a
    , ",", printVector b
    , ",", printVector c
    , ")"
    ]


printVector : Vec3.Vec3 -> String
printVector v =
  "fromTuple " ++ (toString (Vec3.toTuple v))


planet : List (Triple Vec3.Vec3)
planet =
  let
    sphereIcosaFaces =
      List.filterMap (Triple.mapMaybe (lookup baseCoords)) baseIndexes

    rectIcosaFaces =
      List.map (Triple.map toRect) sphereIcosaFaces

  in
      List.concatMap (recurse 2) rectIcosaFaces
  

lookup : Array.Array Point -> Int -> Maybe Point
lookup =
  flip Array.get


toRect : Point -> Vec3.Vec3
toRect (colatitude, longitude) =
  let
    theta = degrees colatitude
    phi = degrees longitude
  in
    Vec3.vec3 (sin theta * cos phi) (sin theta * sin phi) (cos theta)


recurse : Int -> Triple Vec3.Vec3 -> List (Triple Vec3.Vec3)
recurse iter triangle =
  if iter == 0
    then [ triangle ]
    else List.concatMap (recurse (iter - 1)) (split triangle)


split : Triple Vec3.Vec3 -> List (Triple Vec3.Vec3)
split (a, b, c) =
  let
    midpoint u v =
      Vec3.add u v |> Vec3.normalize

    ab = midpoint a b
    bc = midpoint b c
    ca = midpoint c a
  in
    [ (a, ab, ca)
    , (b, bc, ab)
    , (c, ca, bc)
    , (ab, bc, ca)
    ]


color position =
  Color.hsl
    (2 * atan2 (Vec3.getX position) (Vec3.getY position))
    (1 - abs (Vec3.getZ position))
    0.5


baseCoords : Array.Array (Float, Float)
baseCoords =
  Array.fromList
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

baseIndexes : List (Int, Int, Int)
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

