module Grid (parallel, meridian) where

import Math.Vector3 as Vec3
import Math.Matrix4 as Mat4

import Graphics
import Infix exposing (..)

import Graphics.Collage as Collage exposing (Form)
import Color
import Array
import List

type alias Point = 
  (Float, Float)


type alias Image = 
  { points : List Point
  , draw : List Point -> Form
  }
  

parallel : Float -> Float -> Graphics.Uniform -> Graphics.Entity
parallel radius declination uniform =
  let
    transform =
      Graphics.scale (radius * cos declination)

    ring =
      List.map transform (vertexRing 50 0.005 (degrees 90 + declination))

    mesh =
      List.map3 (\a b c -> (a,b,c))
        ring
        (List.drop 1 ring)
        (List.drop 2 ring)
  in
    Graphics.entity mesh uniform


meridian : Float -> Float -> Graphics.Uniform -> Graphics.Entity
meridian radius azimuth uniform = 
  let
    transform =
      Graphics.rotate (degrees 90) azimuth >> Graphics.scale radius

    ring =
      List.map transform (vertexRing 50 0.005 (degrees 90))

    mesh =
      List.map3 (\a b c -> (a,b,c))
        ring
        (List.drop 1 ring)
        (List.drop 2 ring)
  in
    Graphics.entity mesh uniform


vertexRing : Int -> Float -> Float -> List Graphics.Attribute
vertexRing resolution width zenithAngle =
  let
    grate =
      2 * resolution

    indexedVertex i =
      let
        side =
          if (i % 2 == 0) then 1 else -1

        phi =
          turns (i ./. grate)
      in
        sphVertex Color.blue 1 phi (zenithAngle + side .* width)
  in
    Array.initialize (grate + 2) indexedVertex |> Array.toList


sphVertex : Color.Color -> Float -> Float -> Float -> Graphics.Attribute
sphVertex color r phi theta =
  Graphics.vertex
    color
    (r * sin theta * sin phi)
    (r * cos theta)
    (r * sin theta * cos phi)


skyPoint : Float -> Float -> Point
skyPoint ra dec =
  (turns ra / 24, degrees dec)


drawLine : Color.Color -> List Point -> Form
drawLine color path =
  List.map
    (Collage.traced (Collage.solid color))
    (splitPath path)
  |> Collage.group


splitPath : List Point -> List (List Point)
splitPath points = 
  let
    prevPoints = 
      (List.take 1 points) ++ points

    jumps = 
      List.map2 markJumps prevPoints points
  in 
    splitAtJumps jumps


splitAtJumps : List (a, Bool) -> List (List a)
splitAtJumps = 
  let
    addElement (x, mark) (inProgress, finished) =
      case mark of
        True ->
          ([], (x :: inProgress) :: finished)
        False ->
          (x :: inProgress, finished)

    finalize (inProgress, finished) =
      inProgress :: finished
  in
    List.foldr addElement ([], [])
    >> finalize


addElement : (a, Bool) -> (List a, List (List a)) -> (List a, List (List a))
addElement (x, mark) (inProgress, finished) =
  case mark of
    True ->
      ([], (x :: inProgress) :: finished)

    False -> 
      (x :: inProgress, finished)


markJumps : Point -> Point -> (Point, Bool)
markJumps a b = 
  (b, round ((fst a - fst b) / 300.0) /= 0)
