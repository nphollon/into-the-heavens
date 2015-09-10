module Grid (grid) where

import Color exposing (Color)
import Array exposing (Array)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)

import Mesh exposing (Mesh)
import Infix exposing (..)
  

grid : Int -> Int ->  Mesh
grid xRes yRes =
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
    meridians ++ parallels
    

parallel : Float -> Mesh
parallel declination =
  vertexRing (degrees 90 + declination)
  |> triangleStrip


meridian : Float -> Mesh
meridian azimuth =
  vertexRing (degrees 90)
  |> Array.map (rotate azimuth)
  |> triangleStrip


vertexRing : Float -> Array Mesh.Vertex
vertexRing zenithAngle =
  let
    grate = 100
    width = 5e-3

    indexedVertex i =
      let
        side =
          if (i % 2 == 0) then 1 else -1

        phi =
          turns (i ./. grate)
      in
        sphVertex Color.darkCharcoal 499 phi (zenithAngle + side .* width)
  in
    Array.initialize (grate + 2) indexedVertex


sphVertex : Color -> Float -> Float -> Float -> Mesh.Vertex
sphVertex color r phi theta =
  { vertPosition =
    Vec3.vec3
          (r * sin theta * sin phi)
          (r * cos theta)
          (r * sin theta * cos phi)
  , vertColor =
    Vec4.vec4 0.19 0.19 0.19 1
  }


rotate : Float -> Mesh.Vertex -> Mesh.Vertex
rotate yaw vertex =
  let
    rotation =
      Mat4.makeRotate yaw Vec3.j
      |> Mat4.rotate (degrees 90) Vec3.k
  in
    { vertex | vertPosition <- Mat4.transform rotation vertex.vertPosition }


triangleStrip : Array Mesh.Vertex -> Mesh
triangleStrip vertexes =
  let
    vertexList =
      Array.toIndexedList vertexes

    triangle (i, a) (_, b) (_, c) =
      if (i % 2 == 0)
        then (a, b, c)
        else (a, c, b)
  in
    List.map3 triangle
      vertexList
      (List.drop 1 vertexList)
      (List.drop 2 vertexList)  
