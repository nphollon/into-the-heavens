module Constellation (crux, ursaMajor, aquarius, star) where

import Color
import List

import Graphics
import WebGL

type alias Point = 
  (Float, Float)
  

skyPoint : Float -> Float -> Point
skyPoint ra dec =
  (turns ra / 24, degrees (90 - dec))


crux : Graphics.Uniform -> WebGL.Entity
crux =
  constellation
    [ skyPoint 12.43 -63.08
    , skyPoint 12.78 -59.68
    , skyPoint 12.52 -57.10
    , skyPoint 12.25 -58.75
    , skyPoint 12.35 -60.40
    ]


ursaMajor : Graphics.Uniform -> WebGL.Entity
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


aquarius : Graphics.Uniform -> WebGL.Entity
aquarius =
  constellation
    [ skyPoint 22.10 -0.32
    , skyPoint 21.53 -5.57
    , skyPoint 22.36 -1.39
    , skyPoint 22.91 -15.82
    , skyPoint 20.79 -9.50
    , skyPoint 22.48 0.02
    ]


constellation : List Point -> Graphics.Uniform -> WebGL.Entity
constellation stars uniform =
  let
    mesh =
      List.concatMap (uncurry (star Color.yellow 0.01)) stars
  in
    Graphics.entity mesh uniform

star : Color.Color -> Float -> Float -> Float -> List (WebGL.Triangle Graphics.Attribute)
star color r phi theta =
  let
    move =
      Graphics.translate 0 1 0
      >> Graphics.rotate theta phi

    down = move <| Graphics.vertex color 0 -r 0
    up = move <| Graphics.vertex color 0 r 0
    east = move <| Graphics.vertex color -r 0 0
    west = move <| Graphics.vertex color r 0 0
    south = move <| Graphics.vertex color 0 0 -r
    north = move <| Graphics.vertex color 0 0 r

  in
    [ (down, north, up)
    , (down, south, up)
    , (down, east, up)
    , (down, west, up)
    , (east, north, west)
    , (east, south, west)
    ]
