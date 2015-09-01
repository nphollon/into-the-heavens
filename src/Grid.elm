module Grid (grid) where

import Color exposing (Color)
import Array exposing (Array)

import Graphics
import Infix exposing (..)
  

grid : Int -> Int -> Graphics.Camera -> Graphics.Entity
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
    Graphics.distantEntity (meridians ++ parallels)
    

parallel : Float -> Graphics.Mesh
parallel declination =
  vertexRing (degrees 90 + declination)
  |> Graphics.triangleStrip


meridian : Float -> Graphics.Mesh
meridian azimuth =
  vertexRing (degrees 90)
  |> Array.map (Graphics.rotate (degrees 90) azimuth)
  |> Graphics.triangleStrip


vertexRing : Float -> Array Graphics.Attribute
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


sphVertex : Color -> Float -> Float -> Float -> Graphics.Attribute
sphVertex color r phi theta =
  Graphics.vertex
    color
    (r * sin theta * sin phi)
    (r * cos theta)
    (r * sin theta * cos phi)
