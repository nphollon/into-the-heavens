module Generate.Constellation (crux, ursaMajor, aquarius, star) where

import Color exposing (Color)

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)

import Mesh exposing (Mesh)
import Infix exposing (..)

type alias Point = 
  (Float, Float)
  

skyPoint : Float -> Float -> Point
skyPoint ra dec =
  (turns ra / 24, degrees (90 - dec))


crux : Mesh
crux =
  constellation
    [ skyPoint 12.43 -63.08
    , skyPoint 12.78 -59.68
    , skyPoint 12.52 -57.10
    , skyPoint 12.25 -58.75
    , skyPoint 12.35 -60.40
    ]


ursaMajor : Mesh
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


aquarius : Mesh
aquarius =
  constellation
    [ skyPoint 22.10 -0.32
    , skyPoint 21.53 -5.57
    , skyPoint 22.36 -1.39
    , skyPoint 22.91 -15.82
    , skyPoint 20.79 -9.50
    , skyPoint 22.48 0.02
    ]


constellation : List Point -> Mesh
constellation stars =
  List.concatMap (uncurry (star Color.yellow)) stars

      
star : Color.Color -> Float -> Float -> Mesh
star color phi theta =
  let
    distance =
      4e9
      
    r =
      distance * 4e-3
               
    move =
      translate 0 distance 0 >> rotate theta phi

    down = move <| vertex color 0 -r 0
    up = move <| vertex color 0 r 0
    west = move <| vertex color -r 0 0
    east = move <| vertex color r 0 0
    south = move <| vertex color 0 0 -r
    north = move <| vertex color 0 0 r

  in
    [ (down, north, west)
    , (down, east, north)
    , (down, south, east)
    , (down, west, south)
    , (up, west, north)
    , (up, north, east)
    , (up, east, south)
    , (up, south, west)
    ]

  
translate : Float -> Float -> Float -> Mesh.Vertex -> Mesh.Vertex
translate x y z vertex =
  { vertex | vertPosition <- Vec3.add vertex.vertPosition (Vec3.vec3 x y z) }


rotate : Float -> Float -> Mesh.Vertex -> Mesh.Vertex
rotate pitch yaw vertex =
  let
    rotation =
      Mat4.makeRotate yaw Vec3.j
      |> Mat4.rotate pitch Vec3.k
  in
    { vertex | vertPosition <- Mat4.transform rotation vertex.vertPosition }


vertex : Color -> Float -> Float -> Float -> Mesh.Vertex
vertex color x y z =
  let
    rgba =
      Color.toRgb color

    colorVector =
      Vec4.vec4
        (rgba.red ./. 255)
        (rgba.green ./. 255)
        (rgba.blue ./. 255)
        rgba.alpha
  in
    { vertPosition = Vec3.vec3 x y z
    , vertColor = colorVector
    , normal = Vec3.vec3 1 0 0
    }
