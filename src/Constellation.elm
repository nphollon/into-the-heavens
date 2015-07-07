module Constellation (crux, ursaMajor, aquarius) where

import Graphics.Collage as Graphics
import Color
import List


type alias Point = 
  (Float, Float)


type alias Image = 
  { points : List Point
  , draw : List Point -> Graphics.Form
  }
  

skyPoint : Float -> Float -> Point
skyPoint ra dec =
  (turns ra / 24, degrees dec)


crux : Image
crux =
  constellation 
    [ skyPoint 12.43 -63.08
    , skyPoint 12.78 -59.68
    , skyPoint 12.52 -57.10
    , skyPoint 12.25 -58.75
    , skyPoint 12.35 -60.40
    ]


ursaMajor : Image
ursaMajor =
  constellation
    [ skyPoint 11.06 61.75
    , skyPoint 11.03 56.38
    , skyPoint 11.90 53.69
    , skyPoint 12.26 57.03
    , skyPoint 12.90 55.96
    , skyPoint 13.40 54.92
    , skyPoint 13.79 49.31
    , skyPoint 9.54 51.68
    , skyPoint 8.99 48.04
    , skyPoint 9.06 47.16
    , skyPoint 10.28 42.91
    , skyPoint 10.37 41.50
    , skyPoint 11.31 33.09
    , skyPoint 8.50 60.72
    ]


aquarius : Image
aquarius =
  constellation
    [ skyPoint 22.10 -0.32
    , skyPoint 21.53 -5.57
    , skyPoint 22.36 -1.39
    , skyPoint 22.91 -15.82
    , skyPoint 20.79 -9.50
    , skyPoint 22.48 0.02
    ]


constellation : List Point -> Image
constellation stars =
  let
    drawStar position =
      Graphics.circle 1
      |> Graphics.filled Color.yellow 
      |> Graphics.move position
  in    
    { points = stars
    , draw = Graphics.group << List.map drawStar
    }
