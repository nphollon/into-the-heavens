#! /usr/bin/env bash

echo "module Generate.$2 (mesh, hull, box) where

import Generate.Json exposing (Vertex)
import Generate.FlatFace as FlatFace
import WebGL exposing (Drawable)
import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


mesh : Drawable Vertex
mesh =
  FlatFace.triangles cornerPositions cornerIndexes


hull : Drawable Vertex
hull =
  FlatFace.convexHull cornerPositions


box : Drawable Vertex
box =
  FlatFace.boundingBox cornerPositions


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
