module Grid (grid) where

import Color
import Array
import List

import Math.Vector3 as Vec3
import Math.Matrix4 as Mat4

import Graphics
import Infix exposing (..)
  

grid : Int -> Int -> Graphics.Uniform -> Graphics.Entity
grid xRes yRes uniform =
  let
    meridians =
      Array.initialize xRes (\i ->
          meridian (i ./. xRes * turns 0.5)
        ) |> Array.toList |> List.concat

    parallels =
      Array.initialize yRes (\i ->
          parallel (i ./. yRes * turns 0.5 - turns 0.25)
        ) |> Array.toList |> List.concat
  in
    Graphics.distantEntity (meridians ++ parallels) uniform
    

parallel : Float -> Graphics.Mesh
parallel declination =
  triangleRing identity declination


meridian : Float -> Graphics.Mesh
meridian azimuth = 
  let
    transform =
      Graphics.rotate (degrees 90) azimuth
  in
    triangleRing transform 0


triangleRing : (Graphics.Attribute -> Graphics.Attribute) -> Float -> Graphics.Mesh
triangleRing transform altitude =
  let
    ring =
      Array.map transform (vertexRing 50 0.005 (degrees 90 + altitude))
      |> Array.toIndexedList

    triangle (i, a) (_, b) (_, c) =
      if (i % 2 == 0)
        then (a, b, c)
        else (a, c, b)
  in
    List.map3 triangle
      ring
      (List.drop 1 ring)
      (List.drop 2 ring)


vertexRing : Int -> Float -> Float -> Array.Array Graphics.Attribute
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
        sphVertex Color.blue 100 phi (zenithAngle + side .* width)
  in
    Array.initialize (grate + 2) indexedVertex


sphVertex : Color.Color -> Float -> Float -> Float -> Graphics.Attribute
sphVertex color r phi theta =
  Graphics.vertex
    color
    (r * sin theta * sin phi)
    (r * cos theta)
    (r * sin theta * cos phi)
