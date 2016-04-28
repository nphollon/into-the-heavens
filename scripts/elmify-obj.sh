#! /usr/bin/env bash

echo "module Generate.Column (mesh, triangles) where

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
    [ Vector.vector 0 0 0"

grep ^v $1 | sed -e "s/v/    , Vector.vector/"

echo "    ]


cornerIndexes : List (List Int)
cornerIndexes =
  [ []"

grep ^f $1 | sed -e "s/^f \(.*\)/  , \[ \1\]/" | sed -e "s/\([0-9]\+\) /\1, /g"

echo "    ]"
