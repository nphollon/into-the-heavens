module Generate.Constellation (mesh) where

import Random.PCG as Random
import Color exposing (Color)
import Math.Vector as Vector
import Math.Matrix as Matrix
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Generate.Json exposing (Mesh, Vertex)


mesh : Mesh
mesh =
  List.concat
    [ crux
    , ursaMajor
    , aquarius
    , scatter 100
    ]


type alias Point =
  ( Float, Float )


skyPoint : Float -> Float -> Point
skyPoint ra dec =
  ( turns ra / 24, degrees (90 - dec) )


crux : Mesh
crux =
  constellation
    [ skyPoint 12.43 -63.08
    , skyPoint 12.78 -59.68
    , skyPoint 12.52 -57.1
    , skyPoint 12.25 -58.75
    , skyPoint 12.35 -60.4
    ]


ursaMajor : Mesh
ursaMajor =
  constellation
    [ skyPoint 11.06 61.75
    , skyPoint 11.03 56.38
    , skyPoint 11.9 53.69
    , skyPoint 12.26 57.03
    , skyPoint 12.9 55.96
    , skyPoint 13.4 54.92
    , skyPoint 13.79 49.31
    , skyPoint 9.54 51.68
    , skyPoint 8.99 48.04
    , skyPoint 9.06 47.16
    , skyPoint 10.28 42.91
    , skyPoint 10.37 41.5
    , skyPoint 11.31 33.09
    , skyPoint 8.5 60.72
    ]


aquarius : Mesh
aquarius =
  constellation
    [ skyPoint 22.1 -0.32
    , skyPoint 21.53 -5.57
    , skyPoint 22.36 -1.39
    , skyPoint 22.91 -15.82
    , skyPoint 20.79 -9.5
    , skyPoint 22.48 2.0e-2
    ]


constellation : List Point -> Mesh
constellation stars =
  List.concatMap (uncurry (star Color.yellow)) stars


star : Color.Color -> Float -> Float -> Mesh
star color phi theta =
  let
    distance =
      400.0

    r =
      distance * 4.0e-3

    move =
      translate 0 distance 0 >> rotate theta phi

    down =
      move <| vertex color 0 -r 0

    up =
      move <| vertex color 0 r 0

    west =
      move <| vertex color -r 0 0

    east =
      move <| vertex color r 0 0

    south =
      move <| vertex color 0 0 -r

    north =
      move <| vertex color 0 0 r
  in
    [ ( down, north, west )
    , ( down, east, north )
    , ( down, south, east )
    , ( down, west, south )
    , ( up, west, north )
    , ( up, north, east )
    , ( up, east, south )
    , ( up, south, west )
    ]


translate : Float -> Float -> Float -> Vertex -> Vertex
translate x y z vertex =
  { vertex | vertPosition = Vector.add vertex.vertPosition (Vector.vector x y z) }


rotate : Float -> Float -> Vertex -> Vertex
rotate pitch yaw vertex =
  let
    rotation =
      Vector.orient (Vector.vector 0 yaw 0) (Vector.vector 0 0 pitch)
        |> Matrix.makeRotate
  in
    { vertex | vertPosition = Matrix.transform rotation vertex.vertPosition }


vertex : Color -> Float -> Float -> Float -> Vertex
vertex color x y z =
  let
    norm x =
      toFloat x / 255

    rgba =
      Color.toRgb color

    colorVector =
      Vec4.vec4
        (norm rgba.red)
        (norm rgba.green)
        (norm rgba.blue)
        rgba.alpha
  in
    { vertPosition = Vector.vector x y z
    , vertColor = colorVector
    , normal = Vector.vector 1 0 0
    }


scatter : Int -> Mesh
scatter n =
  let
    seed =
      Random.initialSeed 2

    ( randomPoints, seed' ) =
      Random.generate (Random.list n starPoint) seed
  in
    List.concatMap (uncurry (star Color.blue)) randomPoints


starPoint : Random.Generator Point
starPoint =
  let
    az =
      Random.float 0 (turns 1)

    alt =
      Random.map acos (Random.float -1 1)
  in
    Random.pair az alt
