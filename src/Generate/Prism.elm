module Generate.Prism (mesh, triangles) where

import Generate.Json exposing (Vertex)
import Generate.FlatFace as FlatFace
import WebGL exposing (Drawable(..))
import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)
import Math.Vector4 as Vec4 exposing (Vec4)


mesh : Drawable Vertex
mesh =
  Triangle triangles


triangles : List ( Vertex, Vertex, Vertex )
triangles =
  FlatFace.triangles color cornerPositions cornerIndexes


color : Vec4
color =
  Vec4.vec4 0 0 1 1


cornerPositions : Array Vector
cornerPositions = 
  Array.fromList
    [ Vector.vector 0 0 0
    , Vector.vector 2.000000 4.000000 4.000000
    , Vector.vector 1.999999 4.000000 2.000000
    , Vector.vector 2.000000 -2.000000 2.000000
    , Vector.vector 2.000001 -2.000000 4.000000
    , Vector.vector 6.000000 4.000000 4.000000
    , Vector.vector 5.999999 4.000000 2.000000
    , Vector.vector 6.000000 -2.000000 2.000000
    , Vector.vector 6.000001 -2.000000 4.000000
    , Vector.vector -6.000000 -4.000000 -2.000000
    , Vector.vector -6.000000 -4.000000 -4.000000
    , Vector.vector 0.000000 -4.000000 -4.000000
    , Vector.vector 0.000000 -4.000000 -2.000000
    , Vector.vector -6.000000 0.000000 -2.000000
    , Vector.vector -6.000000 0.000000 -4.000000
    , Vector.vector 0.000000 0.000000 -4.000000
    , Vector.vector 0.000000 0.000000 -2.000000
    ]


cornerIndexes : List (List Int)
cornerIndexes =
  [ []
  , [ 5, 6, 2, 1]
  , [ 6, 7, 3, 2]
  , [ 7, 8, 4, 3]
  , [ 8, 5, 1, 4]
  , [ 1, 2, 3, 4]
  , [ 8, 7, 6, 5]
  , [ 13, 14, 10, 9]
  , [ 14, 15, 11, 10]
  , [ 15, 16, 12, 11]
  , [ 16, 13, 9, 12]
  , [ 9, 10, 11, 12]
  , [ 16, 15, 14, 13]
  ]
