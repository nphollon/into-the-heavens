#! /usr/bin/env bash

echo "module Generate.$2 (mesh, hull, box) where

import Generate.Json exposing (Vertex)
import Generate.FlatFace as FlatFace
import WebGL exposing (Drawable(..))
import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)
import Math.Vector4 as Vec4 exposing (Vec4)


mesh : Drawable Vertex
mesh =
  map FlatFace.triangles


hull : Drawable Vertex
hull =
  map FlatFace.convexHull


box : Drawable Vertex
box =
  map FlatFace.boundingBox


map : (Vec4 -> Array Vector -> List (List Int) -> List ( Vertex, Vertex, Vertex )) -> Drawable Vertex
map transform =
  Triangle (transform color cornerPositions cornerIndexes)


color : Vec4
color =
  Vec4.vec4 0 0 1 1


cornerPositions : Array Vector
cornerPositions = 
  Array.fromList
    [ Vector.vector 0 0 0"

grep ^v $1 | sed -e "s/v/    , Vector.vector/"

echo "    ]


cornerIndexes : List (List Int)
cornerIndexes =
  [ []"

grep ^f $1 | sed -e "s/^f \(.*\)/  , \[ \1\]/" | sed -e "s/\([0-9]\+\) /\1, /g"

echo "  ]"
