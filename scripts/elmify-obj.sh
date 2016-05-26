#! /usr/bin/env bash

echo "module Generate.$2 (model) where

import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


model =
  { vertexPositions = vertexPositions
  , vertexIndexes = vertexIndexes
  }


vertexPositions : Array Vector
vertexPositions =
  Array.fromList
    [ Vector.vector 0 0 0"

grep ^v $1 | sed -e "s/v/    , Vector.vector/"

echo "    ]


vertexIndexes : List (List Int)
vertexIndexes =
  [ []"

grep ^f $1 | sed -e "s/^f \(.*\)/  , \[ \1\]/" | sed -e "s/\([0-9]\+\) /\1, /g"

echo "  ]"
