module Generate.Cage (model) where

import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


model =
  { vertexPositions = vertexPositions
  , vertexIndexes = vertexIndexes
  }


vertexPositions : Array Vector
vertexPositions =
  Array.fromList
    [ Vector.vector 0 0 0
    , Vector.vector -3.000000 -3.000000 3.000000
    , Vector.vector -3.000000 -3.000000 -3.000000
    , Vector.vector 3.000000 -3.000000 -3.000000
    , Vector.vector 3.000000 -3.000000 3.000000
    , Vector.vector -3.000000 3.000000 3.000000
    , Vector.vector -3.000000 3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 3.000000
    , Vector.vector -3.000000 0.000000 3.000000
    , Vector.vector -3.000000 3.000000 -0.000000
    , Vector.vector -3.000000 0.000000 -3.000000
    , Vector.vector -3.000000 -3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 -3.000000
    , Vector.vector 3.000000 0.000000 -3.000000
    , Vector.vector -0.000000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -0.000000
    , Vector.vector 3.000000 0.000000 3.000000
    , Vector.vector 3.000000 -3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 3.000000
    , Vector.vector -0.000000 -3.000000 3.000000
    , Vector.vector -3.000000 1.500000 3.000000
    , Vector.vector -3.000000 3.000000 -1.500000
    , Vector.vector -3.000000 -1.500000 -3.000000
    , Vector.vector -3.000000 -3.000000 1.500000
    , Vector.vector 1.500000 3.000000 -3.000000
    , Vector.vector 3.000000 -1.500000 -3.000000
    , Vector.vector -1.500000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 1.500000
    , Vector.vector 3.000000 -1.500000 3.000000
    , Vector.vector 3.000000 -3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 3.000000
    , Vector.vector 1.500000 -3.000000 3.000000
    , Vector.vector -3.000000 -1.500000 3.000000
    , Vector.vector -3.000000 3.000000 1.500000
    , Vector.vector -3.000000 1.500000 -3.000000
    , Vector.vector -3.000000 -3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 -3.000000
    , Vector.vector 3.000000 1.500000 -3.000000
    , Vector.vector 1.500000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -1.500000
    , Vector.vector 3.000000 1.500000 3.000000
    , Vector.vector 3.000000 -3.000000 1.500000
    , Vector.vector 1.500000 3.000000 3.000000
    , Vector.vector -1.500000 -3.000000 3.000000
    , Vector.vector -3.000000 -1.500000 -0.000000
    , Vector.vector -3.000000 1.500000 -0.000000
    , Vector.vector -3.000000 0.000000 1.500000
    , Vector.vector -3.000000 0.000000 -1.500000
    , Vector.vector -0.000000 -1.500000 -3.000000
    , Vector.vector -0.000000 1.500000 -3.000000
    , Vector.vector -1.500000 0.000000 -3.000000
    , Vector.vector 1.500000 0.000000 -3.000000
    , Vector.vector 3.000000 -1.500000 -0.000000
    , Vector.vector 3.000000 1.500000 -0.000000
    , Vector.vector 3.000000 0.000000 -1.500000
    , Vector.vector 3.000000 0.000000 1.500000
    , Vector.vector -0.000000 -1.500000 3.000000
    , Vector.vector -0.000000 1.500000 3.000000
    , Vector.vector 1.500000 0.000000 3.000000
    , Vector.vector -1.500000 0.000000 3.000000
    , Vector.vector 1.500000 -3.000000 -0.000000
    , Vector.vector -1.500000 -3.000000 -0.000000
    , Vector.vector -0.000000 -3.000000 1.500000
    , Vector.vector -0.000000 -3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 -0.000000
    , Vector.vector 1.500000 3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 1.500000
    , Vector.vector -0.000000 3.000000 -1.500000
    , Vector.vector -3.000000 -1.500000 -1.500000
    , Vector.vector 1.500000 -1.500000 -3.000000
    , Vector.vector 3.000000 -1.500000 1.500000
    , Vector.vector -1.500000 -1.500000 3.000000
    , Vector.vector 1.500000 -3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 -1.500000
    , Vector.vector -3.000000 -1.500000 1.500000
    , Vector.vector -3.000000 1.500000 1.500000
    , Vector.vector -3.000000 1.500000 -1.500000
    , Vector.vector -1.500000 -1.500000 -3.000000
    , Vector.vector -1.500000 1.500000 -3.000000
    , Vector.vector 1.500000 1.500000 -3.000000
    , Vector.vector 3.000000 -1.500000 -1.500000
    , Vector.vector 3.000000 1.500000 -1.500000
    , Vector.vector 3.000000 1.500000 1.500000
    , Vector.vector 1.500000 -1.500000 3.000000
    , Vector.vector 1.500000 1.500000 3.000000
    , Vector.vector -1.500000 1.500000 3.000000
    , Vector.vector 1.500000 -3.000000 1.500000
    , Vector.vector -1.500000 -3.000000 1.500000
    , Vector.vector -1.500000 -3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 1.500000
    , Vector.vector 1.500000 3.000000 1.500000
    , Vector.vector 1.500000 3.000000 -1.500000
    , Vector.vector -3.000000 2.250000 3.000000
    , Vector.vector -3.000000 3.000000 -2.250000
    , Vector.vector -3.000000 -2.250000 -3.000000
    , Vector.vector -3.000000 -3.000000 2.250000
    , Vector.vector 2.250000 3.000000 -3.000000
    , Vector.vector 3.000000 -2.250000 -3.000000
    , Vector.vector -2.250000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 2.250000
    , Vector.vector 3.000000 -2.250000 3.000000
    , Vector.vector 3.000000 -3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 3.000000
    , Vector.vector 2.250000 -3.000000 3.000000
    , Vector.vector -3.000000 -2.250000 3.000000
    , Vector.vector -3.000000 3.000000 2.250000
    , Vector.vector -3.000000 2.250000 -3.000000
    , Vector.vector -3.000000 -3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 -3.000000
    , Vector.vector 3.000000 2.250000 -3.000000
    , Vector.vector 2.250000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -2.250000
    , Vector.vector 3.000000 2.250000 3.000000
    , Vector.vector 3.000000 -3.000000 2.250000
    , Vector.vector 2.250000 3.000000 3.000000
    , Vector.vector -2.250000 -3.000000 3.000000
    , Vector.vector -3.000000 0.000000 -0.750000
    , Vector.vector 0.750000 0.000000 -3.000000
    , Vector.vector 3.000000 0.000000 0.750000
    , Vector.vector -0.750000 0.000000 3.000000
    , Vector.vector -0.000000 -3.000000 -0.750000
    , Vector.vector -0.000000 3.000000 -0.750000
    , Vector.vector -3.000000 0.750000 3.000000
    , Vector.vector -3.000000 3.000000 -0.750000
    , Vector.vector -3.000000 -0.750000 -3.000000
    , Vector.vector -3.000000 -3.000000 0.750000
    , Vector.vector 0.750000 3.000000 -3.000000
    , Vector.vector 3.000000 -0.750000 -3.000000
    , Vector.vector -0.750000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 0.750000
    , Vector.vector 3.000000 -0.750000 3.000000
    , Vector.vector 3.000000 -3.000000 -0.750000
    , Vector.vector -0.750000 3.000000 3.000000
    , Vector.vector 0.750000 -3.000000 3.000000
    , Vector.vector -3.000000 -0.750000 3.000000
    , Vector.vector -3.000000 3.000000 0.750000
    , Vector.vector -3.000000 0.750000 -3.000000
    , Vector.vector -3.000000 -3.000000 -0.750000
    , Vector.vector -0.750000 3.000000 -3.000000
    , Vector.vector 3.000000 0.750000 -3.000000
    , Vector.vector 0.750000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -0.750000
    , Vector.vector 3.000000 0.750000 3.000000
    , Vector.vector 3.000000 -3.000000 0.750000
    , Vector.vector 0.750000 3.000000 3.000000
    , Vector.vector -0.750000 -3.000000 3.000000
    , Vector.vector -3.000000 -0.750000 -0.000000
    , Vector.vector -3.000000 0.750000 -0.000000
    , Vector.vector -3.000000 0.000000 0.750000
    , Vector.vector -0.000000 -0.750000 -3.000000
    , Vector.vector -0.000000 0.750000 -3.000000
    , Vector.vector -0.750000 0.000000 -3.000000
    , Vector.vector 3.000000 -0.750000 -0.000000
    , Vector.vector 3.000000 0.750000 -0.000000
    , Vector.vector 3.000000 0.000000 -0.750000
    , Vector.vector -0.000000 -0.750000 3.000000
    , Vector.vector -0.000000 0.750000 3.000000
    , Vector.vector 0.750000 0.000000 3.000000
    , Vector.vector 0.750000 -3.000000 -0.000000
    , Vector.vector -0.750000 -3.000000 -0.000000
    , Vector.vector -0.000000 -3.000000 0.750000
    , Vector.vector -0.750000 3.000000 -0.000000
    , Vector.vector 0.750000 3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 0.750000
    , Vector.vector -3.000000 -2.250000 -1.500000
    , Vector.vector -3.000000 -0.750000 -1.500000
    , Vector.vector -3.000000 -1.500000 -0.750000
    , Vector.vector -3.000000 -1.500000 -2.250000
    , Vector.vector 1.500000 -2.250000 -3.000000
    , Vector.vector 1.500000 -0.750000 -3.000000
    , Vector.vector 0.750000 -1.500000 -3.000000
    , Vector.vector 2.250000 -1.500000 -3.000000
    , Vector.vector 3.000000 -2.250000 1.500000
    , Vector.vector 3.000000 -0.750000 1.500000
    , Vector.vector 3.000000 -1.500000 0.750000
    , Vector.vector 3.000000 -1.500000 2.250000
    , Vector.vector -1.500000 -2.250000 3.000000
    , Vector.vector -1.500000 -0.750000 3.000000
    , Vector.vector -0.750000 -1.500000 3.000000
    , Vector.vector -2.250000 -1.500000 3.000000
    , Vector.vector 2.250000 -3.000000 -1.500000
    , Vector.vector 0.750000 -3.000000 -1.500000
    , Vector.vector 1.500000 -3.000000 -0.750000
    , Vector.vector 1.500000 -3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 -1.500000
    , Vector.vector -0.750000 3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 -0.750000
    , Vector.vector -1.500000 3.000000 -2.250000
    , Vector.vector -3.000000 -2.250000 1.500000
    , Vector.vector -3.000000 -0.750000 1.500000
    , Vector.vector -3.000000 -1.500000 2.250000
    , Vector.vector -3.000000 -1.500000 0.750000
    , Vector.vector -3.000000 0.750000 1.500000
    , Vector.vector -3.000000 2.250000 1.500000
    , Vector.vector -3.000000 1.500000 2.250000
    , Vector.vector -3.000000 1.500000 0.750000
    , Vector.vector -3.000000 0.750000 -1.500000
    , Vector.vector -3.000000 2.250000 -1.500000
    , Vector.vector -3.000000 1.500000 -0.750000
    , Vector.vector -3.000000 1.500000 -2.250000
    , Vector.vector -1.500000 -2.250000 -3.000000
    , Vector.vector -1.500000 -0.750000 -3.000000
    , Vector.vector -2.250000 -1.500000 -3.000000
    , Vector.vector -0.750000 -1.500000 -3.000000
    , Vector.vector -1.500000 0.750000 -3.000000
    , Vector.vector -1.500000 2.250000 -3.000000
    , Vector.vector -2.250000 1.500000 -3.000000
    , Vector.vector -0.750000 1.500000 -3.000000
    , Vector.vector 1.500000 0.750000 -3.000000
    , Vector.vector 1.500000 2.250000 -3.000000
    , Vector.vector 0.750000 1.500000 -3.000000
    , Vector.vector 2.250000 1.500000 -3.000000
    , Vector.vector 3.000000 -2.250000 -1.500000
    , Vector.vector 3.000000 -0.750000 -1.500000
    , Vector.vector 3.000000 -1.500000 -2.250000
    , Vector.vector 3.000000 -1.500000 -0.750000
    , Vector.vector 3.000000 0.750000 -1.500000
    , Vector.vector 3.000000 2.250000 -1.500000
    , Vector.vector 3.000000 1.500000 -2.250000
    , Vector.vector 3.000000 1.500000 -0.750000
    , Vector.vector 3.000000 0.750000 1.500000
    , Vector.vector 3.000000 2.250000 1.500000
    , Vector.vector 3.000000 1.500000 0.750000
    , Vector.vector 3.000000 1.500000 2.250000
    , Vector.vector 1.500000 -2.250000 3.000000
    , Vector.vector 1.500000 -0.750000 3.000000
    , Vector.vector 2.250000 -1.500000 3.000000
    , Vector.vector 0.750000 -1.500000 3.000000
    , Vector.vector 1.500000 0.750000 3.000000
    , Vector.vector 1.500000 2.250000 3.000000
    , Vector.vector 2.250000 1.500000 3.000000
    , Vector.vector 0.750000 1.500000 3.000000
    , Vector.vector -1.500000 0.750000 3.000000
    , Vector.vector -1.500000 2.250000 3.000000
    , Vector.vector -0.750000 1.500000 3.000000
    , Vector.vector -2.250000 1.500000 3.000000
    , Vector.vector 2.250000 -3.000000 1.500000
    , Vector.vector 0.750000 -3.000000 1.500000
    , Vector.vector 1.500000 -3.000000 2.250000
    , Vector.vector 1.500000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 1.500000
    , Vector.vector -2.250000 -3.000000 1.500000
    , Vector.vector -1.500000 -3.000000 2.250000
    , Vector.vector -1.500000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 -1.500000
    , Vector.vector -2.250000 -3.000000 -1.500000
    , Vector.vector -1.500000 -3.000000 -0.750000
    , Vector.vector -1.500000 -3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 1.500000
    , Vector.vector -0.750000 3.000000 1.500000
    , Vector.vector -1.500000 3.000000 2.250000
    , Vector.vector -1.500000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 1.500000
    , Vector.vector 2.250000 3.000000 1.500000
    , Vector.vector 1.500000 3.000000 2.250000
    , Vector.vector 1.500000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 -1.500000
    , Vector.vector 2.250000 3.000000 -1.500000
    , Vector.vector 1.500000 3.000000 -0.750000
    , Vector.vector 1.500000 3.000000 -2.250000
    , Vector.vector -3.000000 -2.250000 0.750000
    , Vector.vector -3.000000 0.750000 0.750000
    , Vector.vector -3.000000 0.750000 -2.250000
    , Vector.vector -0.750000 -2.250000 -3.000000
    , Vector.vector -0.750000 0.750000 -3.000000
    , Vector.vector 2.250000 0.750000 -3.000000
    , Vector.vector 3.000000 -2.250000 -0.750000
    , Vector.vector 3.000000 0.750000 -0.750000
    , Vector.vector 3.000000 0.750000 2.250000
    , Vector.vector 0.750000 -2.250000 3.000000
    , Vector.vector 0.750000 0.750000 3.000000
    , Vector.vector -2.250000 0.750000 3.000000
    , Vector.vector 2.250000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 -2.250000
    , Vector.vector -3.000000 -2.250000 -0.750000
    , Vector.vector -3.000000 -0.750000 -0.750000
    , Vector.vector -3.000000 -0.750000 -2.250000
    , Vector.vector 0.750000 -2.250000 -3.000000
    , Vector.vector 0.750000 -0.750000 -3.000000
    , Vector.vector 2.250000 -0.750000 -3.000000
    , Vector.vector 3.000000 -2.250000 0.750000
    , Vector.vector 3.000000 -0.750000 0.750000
    , Vector.vector 3.000000 -0.750000 2.250000
    , Vector.vector -0.750000 -2.250000 3.000000
    , Vector.vector -0.750000 -0.750000 3.000000
    , Vector.vector -2.250000 -0.750000 3.000000
    , Vector.vector 2.250000 -3.000000 -0.750000
    , Vector.vector 0.750000 -3.000000 -0.750000
    , Vector.vector 0.750000 -3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 -0.750000
    , Vector.vector -0.750000 3.000000 -0.750000
    , Vector.vector -0.750000 3.000000 -2.250000
    , Vector.vector -3.000000 -0.750000 2.250000
    , Vector.vector -3.000000 -0.750000 0.750000
    , Vector.vector -3.000000 0.750000 2.250000
    , Vector.vector -3.000000 2.250000 0.750000
    , Vector.vector -3.000000 0.750000 -0.750000
    , Vector.vector -3.000000 2.250000 -0.750000
    , Vector.vector -2.250000 -0.750000 -3.000000
    , Vector.vector -0.750000 -0.750000 -3.000000
    , Vector.vector -2.250000 0.750000 -3.000000
    , Vector.vector -0.750000 2.250000 -3.000000
    , Vector.vector 0.750000 0.750000 -3.000000
    , Vector.vector 0.750000 2.250000 -3.000000
    , Vector.vector 3.000000 -0.750000 -2.250000
    , Vector.vector 3.000000 -0.750000 -0.750000
    , Vector.vector 3.000000 0.750000 -2.250000
    , Vector.vector 3.000000 2.250000 -0.750000
    , Vector.vector 3.000000 0.750000 0.750000
    , Vector.vector 3.000000 2.250000 0.750000
    , Vector.vector 2.250000 -0.750000 3.000000
    , Vector.vector 0.750000 -0.750000 3.000000
    , Vector.vector 2.250000 0.750000 3.000000
    , Vector.vector 0.750000 2.250000 3.000000
    , Vector.vector -0.750000 0.750000 3.000000
    , Vector.vector -0.750000 2.250000 3.000000
    , Vector.vector 0.750000 -3.000000 2.250000
    , Vector.vector 0.750000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 2.250000
    , Vector.vector -2.250000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 -0.750000
    , Vector.vector -2.250000 -3.000000 -0.750000
    , Vector.vector -0.750000 3.000000 2.250000
    , Vector.vector -0.750000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 2.250000
    , Vector.vector 2.250000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 -0.750000
    , Vector.vector 2.250000 3.000000 -0.750000
    , Vector.vector -3.000000 2.625000 3.000000
    , Vector.vector -3.000000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -3.000000
    , Vector.vector -3.000000 -3.000000 2.625000
    , Vector.vector 2.625000 3.000000 -3.000000
    , Vector.vector 3.000000 -2.625000 -3.000000
    , Vector.vector -2.625000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 2.625000
    , Vector.vector 3.000000 -2.625000 3.000000
    , Vector.vector 3.000000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 3.000000
    , Vector.vector 2.625000 -3.000000 3.000000
    , Vector.vector -3.000000 -2.625000 3.000000
    , Vector.vector -3.000000 3.000000 2.625000
    , Vector.vector -3.000000 2.625000 -3.000000
    , Vector.vector -3.000000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -3.000000
    , Vector.vector 3.000000 2.625000 -3.000000
    , Vector.vector 2.625000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -2.625000
    , Vector.vector 3.000000 2.625000 3.000000
    , Vector.vector 3.000000 -3.000000 2.625000
    , Vector.vector 2.625000 3.000000 3.000000
    , Vector.vector -2.625000 -3.000000 3.000000
    , Vector.vector -3.000000 -2.625000 -0.000000
    , Vector.vector -3.000000 2.625000 -0.000000
    , Vector.vector -3.000000 0.000000 2.625000
    , Vector.vector -3.000000 0.000000 -0.375000
    , Vector.vector -0.000000 -2.625000 -3.000000
    , Vector.vector -0.000000 2.625000 -3.000000
    , Vector.vector -2.625000 0.000000 -3.000000
    , Vector.vector 0.375000 0.000000 -3.000000
    , Vector.vector 3.000000 -2.625000 -0.000000
    , Vector.vector 3.000000 2.625000 -0.000000
    , Vector.vector 3.000000 0.000000 -2.625000
    , Vector.vector 3.000000 0.000000 0.375000
    , Vector.vector -0.000000 -2.625000 3.000000
    , Vector.vector -0.000000 2.625000 3.000000
    , Vector.vector 2.625000 0.000000 3.000000
    , Vector.vector -0.375000 0.000000 3.000000
    , Vector.vector 2.625000 -3.000000 -0.000000
    , Vector.vector -2.625000 -3.000000 -0.000000
    , Vector.vector -0.000000 -3.000000 2.625000
    , Vector.vector -0.000000 -3.000000 -0.375000
    , Vector.vector -2.625000 3.000000 -0.000000
    , Vector.vector 2.625000 3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 2.625000
    , Vector.vector -0.000000 3.000000 -0.375000
    , Vector.vector -3.000000 0.375000 3.000000
    , Vector.vector -3.000000 3.000000 -0.375000
    , Vector.vector -3.000000 -0.375000 -3.000000
    , Vector.vector -3.000000 -3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -3.000000
    , Vector.vector 3.000000 -0.375000 -3.000000
    , Vector.vector -0.375000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 0.375000
    , Vector.vector 3.000000 -0.375000 3.000000
    , Vector.vector 3.000000 -3.000000 -0.375000
    , Vector.vector -0.375000 3.000000 3.000000
    , Vector.vector 0.375000 -3.000000 3.000000
    , Vector.vector -3.000000 -0.375000 3.000000
    , Vector.vector -3.000000 3.000000 0.375000
    , Vector.vector -3.000000 0.375000 -3.000000
    , Vector.vector -3.000000 -3.000000 -0.375000
    , Vector.vector -0.375000 3.000000 -3.000000
    , Vector.vector 3.000000 0.375000 -3.000000
    , Vector.vector 0.375000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -0.375000
    , Vector.vector 3.000000 0.375000 3.000000
    , Vector.vector 3.000000 -3.000000 0.375000
    , Vector.vector 0.375000 3.000000 3.000000
    , Vector.vector -0.375000 -3.000000 3.000000
    , Vector.vector -3.000000 -0.375000 -0.000000
    , Vector.vector -3.000000 0.375000 -0.000000
    , Vector.vector -3.000000 0.000000 0.375000
    , Vector.vector -3.000000 0.000000 -2.625000
    , Vector.vector -0.000000 -0.375000 -3.000000
    , Vector.vector -0.000000 0.375000 -3.000000
    , Vector.vector -0.375000 0.000000 -3.000000
    , Vector.vector 2.625000 0.000000 -3.000000
    , Vector.vector 3.000000 -0.375000 -0.000000
    , Vector.vector 3.000000 0.375000 -0.000000
    , Vector.vector 3.000000 0.000000 -0.375000
    , Vector.vector 3.000000 0.000000 2.625000
    , Vector.vector -0.000000 -0.375000 3.000000
    , Vector.vector -0.000000 0.375000 3.000000
    , Vector.vector 0.375000 0.000000 3.000000
    , Vector.vector -2.625000 0.000000 3.000000
    , Vector.vector 0.375000 -3.000000 -0.000000
    , Vector.vector -0.375000 -3.000000 -0.000000
    , Vector.vector -0.000000 -3.000000 0.375000
    , Vector.vector -0.000000 -3.000000 -2.625000
    , Vector.vector -0.375000 3.000000 -0.000000
    , Vector.vector 0.375000 3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 0.375000
    , Vector.vector -0.000000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -1.500000
    , Vector.vector -3.000000 -0.375000 -1.500000
    , Vector.vector -3.000000 -1.500000 -0.375000
    , Vector.vector -3.000000 -1.500000 -1.875000
    , Vector.vector 1.500000 -2.625000 -3.000000
    , Vector.vector 1.500000 -0.375000 -3.000000
    , Vector.vector 0.375000 -1.500000 -3.000000
    , Vector.vector 1.875000 -1.500000 -3.000000
    , Vector.vector 3.000000 -2.625000 1.500000
    , Vector.vector 3.000000 -0.375000 1.500000
    , Vector.vector 3.000000 -1.500000 0.375000
    , Vector.vector 3.000000 -1.500000 1.875000
    , Vector.vector -1.500000 -2.625000 3.000000
    , Vector.vector -1.500000 -0.375000 3.000000
    , Vector.vector -0.375000 -1.500000 3.000000
    , Vector.vector -1.875000 -1.500000 3.000000
    , Vector.vector 2.625000 -3.000000 -1.500000
    , Vector.vector 0.375000 -3.000000 -1.500000
    , Vector.vector 1.500000 -3.000000 -0.375000
    , Vector.vector 1.500000 -3.000000 -1.875000
    , Vector.vector -2.625000 3.000000 -1.500000
    , Vector.vector -0.375000 3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 -0.375000
    , Vector.vector -1.500000 3.000000 -1.875000
    , Vector.vector -3.000000 -2.625000 1.500000
    , Vector.vector -3.000000 -0.375000 1.500000
    , Vector.vector -3.000000 -1.500000 2.625000
    , Vector.vector -3.000000 -1.500000 1.125000
    , Vector.vector -3.000000 0.375000 1.500000
    , Vector.vector -3.000000 2.625000 1.500000
    , Vector.vector -3.000000 1.500000 2.625000
    , Vector.vector -3.000000 1.500000 1.125000
    , Vector.vector -3.000000 0.375000 -1.500000
    , Vector.vector -3.000000 2.625000 -1.500000
    , Vector.vector -3.000000 1.500000 -0.375000
    , Vector.vector -3.000000 1.500000 -1.875000
    , Vector.vector -1.500000 -2.625000 -3.000000
    , Vector.vector -1.500000 -0.375000 -3.000000
    , Vector.vector -2.625000 -1.500000 -3.000000
    , Vector.vector -1.125000 -1.500000 -3.000000
    , Vector.vector -1.500000 0.375000 -3.000000
    , Vector.vector -1.500000 2.625000 -3.000000
    , Vector.vector -2.625000 1.500000 -3.000000
    , Vector.vector -1.125000 1.500000 -3.000000
    , Vector.vector 1.500000 0.375000 -3.000000
    , Vector.vector 1.500000 2.625000 -3.000000
    , Vector.vector 0.375000 1.500000 -3.000000
    , Vector.vector 1.875000 1.500000 -3.000000
    , Vector.vector 3.000000 -2.625000 -1.500000
    , Vector.vector 3.000000 -0.375000 -1.500000
    , Vector.vector 3.000000 -1.500000 -2.625000
    , Vector.vector 3.000000 -1.500000 -1.125000
    , Vector.vector 3.000000 0.375000 -1.500000
    , Vector.vector 3.000000 2.625000 -1.500000
    , Vector.vector 3.000000 1.500000 -2.625000
    , Vector.vector 3.000000 1.500000 -1.125000
    , Vector.vector 3.000000 0.375000 1.500000
    , Vector.vector 3.000000 2.625000 1.500000
    , Vector.vector 3.000000 1.500000 0.375000
    , Vector.vector 3.000000 1.500000 1.875000
    , Vector.vector 1.500000 -2.625000 3.000000
    , Vector.vector 1.500000 -0.375000 3.000000
    , Vector.vector 2.625000 -1.500000 3.000000
    , Vector.vector 1.125000 -1.500000 3.000000
    , Vector.vector 1.500000 0.375000 3.000000
    , Vector.vector 1.500000 2.625000 3.000000
    , Vector.vector 2.625000 1.500000 3.000000
    , Vector.vector 1.125000 1.500000 3.000000
    , Vector.vector -1.500000 0.375000 3.000000
    , Vector.vector -1.500000 2.625000 3.000000
    , Vector.vector -0.375000 1.500000 3.000000
    , Vector.vector -1.875000 1.500000 3.000000
    , Vector.vector 2.625000 -3.000000 1.500000
    , Vector.vector 0.375000 -3.000000 1.500000
    , Vector.vector 1.500000 -3.000000 2.625000
    , Vector.vector 1.500000 -3.000000 1.125000
    , Vector.vector -0.375000 -3.000000 1.500000
    , Vector.vector -2.625000 -3.000000 1.500000
    , Vector.vector -1.500000 -3.000000 2.625000
    , Vector.vector -1.500000 -3.000000 1.125000
    , Vector.vector -0.375000 -3.000000 -1.500000
    , Vector.vector -2.625000 -3.000000 -1.500000
    , Vector.vector -1.500000 -3.000000 -0.375000
    , Vector.vector -1.500000 -3.000000 -1.875000
    , Vector.vector -2.625000 3.000000 1.500000
    , Vector.vector -0.375000 3.000000 1.500000
    , Vector.vector -1.500000 3.000000 2.625000
    , Vector.vector -1.500000 3.000000 1.125000
    , Vector.vector 0.375000 3.000000 1.500000
    , Vector.vector 2.625000 3.000000 1.500000
    , Vector.vector 1.500000 3.000000 2.625000
    , Vector.vector 1.500000 3.000000 1.125000
    , Vector.vector 0.375000 3.000000 -1.500000
    , Vector.vector 2.625000 3.000000 -1.500000
    , Vector.vector 1.500000 3.000000 -0.375000
    , Vector.vector 1.500000 3.000000 -1.875000
    , Vector.vector -3.000000 1.875000 3.000000
    , Vector.vector -3.000000 3.000000 -1.875000
    , Vector.vector -3.000000 -1.875000 -3.000000
    , Vector.vector -3.000000 -3.000000 1.875000
    , Vector.vector 1.875000 3.000000 -3.000000
    , Vector.vector 3.000000 -1.875000 -3.000000
    , Vector.vector -1.875000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 1.875000
    , Vector.vector 3.000000 -1.875000 3.000000
    , Vector.vector 3.000000 -3.000000 -1.875000
    , Vector.vector -1.875000 3.000000 3.000000
    , Vector.vector 1.875000 -3.000000 3.000000
    , Vector.vector -3.000000 -1.875000 3.000000
    , Vector.vector -3.000000 3.000000 1.875000
    , Vector.vector -3.000000 1.875000 -3.000000
    , Vector.vector -3.000000 -3.000000 -1.875000
    , Vector.vector -1.875000 3.000000 -3.000000
    , Vector.vector 3.000000 1.875000 -3.000000
    , Vector.vector 1.875000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -1.875000
    , Vector.vector 3.000000 1.875000 3.000000
    , Vector.vector 3.000000 -3.000000 1.875000
    , Vector.vector 1.875000 3.000000 3.000000
    , Vector.vector -1.875000 -3.000000 3.000000
    , Vector.vector -3.000000 -1.875000 -0.000000
    , Vector.vector -3.000000 1.875000 -0.000000
    , Vector.vector -3.000000 0.000000 1.875000
    , Vector.vector -0.000000 -1.875000 -3.000000
    , Vector.vector -0.000000 1.875000 -3.000000
    , Vector.vector -1.875000 0.000000 -3.000000
    , Vector.vector 3.000000 -1.875000 -0.000000
    , Vector.vector 3.000000 1.875000 -0.000000
    , Vector.vector 3.000000 0.000000 -1.875000
    , Vector.vector -0.000000 -1.875000 3.000000
    , Vector.vector -0.000000 1.875000 3.000000
    , Vector.vector 1.875000 0.000000 3.000000
    , Vector.vector 1.875000 -3.000000 -0.000000
    , Vector.vector -1.875000 -3.000000 -0.000000
    , Vector.vector -0.000000 -3.000000 1.875000
    , Vector.vector -1.875000 3.000000 -0.000000
    , Vector.vector 1.875000 3.000000 -0.000000
    , Vector.vector -0.000000 3.000000 1.875000
    , Vector.vector -3.000000 1.125000 3.000000
    , Vector.vector -3.000000 3.000000 -1.125000
    , Vector.vector -3.000000 -1.125000 -3.000000
    , Vector.vector -3.000000 -3.000000 1.125000
    , Vector.vector 1.125000 3.000000 -3.000000
    , Vector.vector 3.000000 -1.125000 -3.000000
    , Vector.vector -1.125000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 1.125000
    , Vector.vector 3.000000 -1.125000 3.000000
    , Vector.vector 3.000000 -3.000000 -1.125000
    , Vector.vector -1.125000 3.000000 3.000000
    , Vector.vector 1.125000 -3.000000 3.000000
    , Vector.vector -3.000000 -1.125000 3.000000
    , Vector.vector -3.000000 3.000000 1.125000
    , Vector.vector -3.000000 1.125000 -3.000000
    , Vector.vector -3.000000 -3.000000 -1.125000
    , Vector.vector -1.125000 3.000000 -3.000000
    , Vector.vector 3.000000 1.125000 -3.000000
    , Vector.vector 1.125000 -3.000000 -3.000000
    , Vector.vector 3.000000 3.000000 -1.125000
    , Vector.vector 3.000000 1.125000 3.000000
    , Vector.vector 3.000000 -3.000000 1.125000
    , Vector.vector 1.125000 3.000000 3.000000
    , Vector.vector -1.125000 -3.000000 3.000000
    , Vector.vector -3.000000 0.000000 -1.875000
    , Vector.vector 1.875000 0.000000 -3.000000
    , Vector.vector 3.000000 0.000000 1.875000
    , Vector.vector -1.875000 0.000000 3.000000
    , Vector.vector -0.000000 -3.000000 -1.875000
    , Vector.vector -0.000000 3.000000 -1.875000
    , Vector.vector -3.000000 -1.875000 -1.500000
    , Vector.vector -3.000000 -1.125000 -1.500000
    , Vector.vector -3.000000 -1.500000 -1.125000
    , Vector.vector -3.000000 -1.500000 -2.625000
    , Vector.vector 1.500000 -1.875000 -3.000000
    , Vector.vector 1.500000 -1.125000 -3.000000
    , Vector.vector 1.125000 -1.500000 -3.000000
    , Vector.vector 2.625000 -1.500000 -3.000000
    , Vector.vector 3.000000 -1.875000 1.500000
    , Vector.vector 3.000000 -1.125000 1.500000
    , Vector.vector 3.000000 -1.500000 1.125000
    , Vector.vector 3.000000 -1.500000 2.625000
    , Vector.vector -1.500000 -1.875000 3.000000
    , Vector.vector -1.500000 -1.125000 3.000000
    , Vector.vector -1.125000 -1.500000 3.000000
    , Vector.vector -2.625000 -1.500000 3.000000
    , Vector.vector 1.875000 -3.000000 -1.500000
    , Vector.vector 1.125000 -3.000000 -1.500000
    , Vector.vector 1.500000 -3.000000 -1.125000
    , Vector.vector 1.500000 -3.000000 -2.625000
    , Vector.vector -1.875000 3.000000 -1.500000
    , Vector.vector -1.125000 3.000000 -1.500000
    , Vector.vector -1.500000 3.000000 -1.125000
    , Vector.vector -1.500000 3.000000 -2.625000
    , Vector.vector -3.000000 -1.875000 1.500000
    , Vector.vector -3.000000 -1.125000 1.500000
    , Vector.vector -3.000000 -1.500000 1.875000
    , Vector.vector -3.000000 -1.500000 0.375000
    , Vector.vector -3.000000 1.125000 1.500000
    , Vector.vector -3.000000 1.875000 1.500000
    , Vector.vector -3.000000 1.500000 1.875000
    , Vector.vector -3.000000 1.500000 0.375000
    , Vector.vector -3.000000 1.125000 -1.500000
    , Vector.vector -3.000000 1.875000 -1.500000
    , Vector.vector -3.000000 1.500000 -1.125000
    , Vector.vector -3.000000 1.500000 -2.625000
    , Vector.vector -1.500000 -1.875000 -3.000000
    , Vector.vector -1.500000 -1.125000 -3.000000
    , Vector.vector -1.875000 -1.500000 -3.000000
    , Vector.vector -0.375000 -1.500000 -3.000000
    , Vector.vector -1.500000 1.125000 -3.000000
    , Vector.vector -1.500000 1.875000 -3.000000
    , Vector.vector -1.875000 1.500000 -3.000000
    , Vector.vector -0.375000 1.500000 -3.000000
    , Vector.vector 1.500000 1.125000 -3.000000
    , Vector.vector 1.500000 1.875000 -3.000000
    , Vector.vector 1.125000 1.500000 -3.000000
    , Vector.vector 2.625000 1.500000 -3.000000
    , Vector.vector 3.000000 -1.875000 -1.500000
    , Vector.vector 3.000000 -1.125000 -1.500000
    , Vector.vector 3.000000 -1.500000 -1.875000
    , Vector.vector 3.000000 -1.500000 -0.375000
    , Vector.vector 3.000000 1.125000 -1.500000
    , Vector.vector 3.000000 1.875000 -1.500000
    , Vector.vector 3.000000 1.500000 -1.875000
    , Vector.vector 3.000000 1.500000 -0.375000
    , Vector.vector 3.000000 1.125000 1.500000
    , Vector.vector 3.000000 1.875000 1.500000
    , Vector.vector 3.000000 1.500000 1.125000
    , Vector.vector 3.000000 1.500000 2.625000
    , Vector.vector 1.500000 -1.875000 3.000000
    , Vector.vector 1.500000 -1.125000 3.000000
    , Vector.vector 1.875000 -1.500000 3.000000
    , Vector.vector 0.375000 -1.500000 3.000000
    , Vector.vector 1.500000 1.125000 3.000000
    , Vector.vector 1.500000 1.875000 3.000000
    , Vector.vector 1.875000 1.500000 3.000000
    , Vector.vector 0.375000 1.500000 3.000000
    , Vector.vector -1.500000 1.125000 3.000000
    , Vector.vector -1.500000 1.875000 3.000000
    , Vector.vector -1.125000 1.500000 3.000000
    , Vector.vector -2.625000 1.500000 3.000000
    , Vector.vector 1.875000 -3.000000 1.500000
    , Vector.vector 1.125000 -3.000000 1.500000
    , Vector.vector 1.500000 -3.000000 1.875000
    , Vector.vector 1.500000 -3.000000 0.375000
    , Vector.vector -1.125000 -3.000000 1.500000
    , Vector.vector -1.875000 -3.000000 1.500000
    , Vector.vector -1.500000 -3.000000 1.875000
    , Vector.vector -1.500000 -3.000000 0.375000
    , Vector.vector -1.125000 -3.000000 -1.500000
    , Vector.vector -1.875000 -3.000000 -1.500000
    , Vector.vector -1.500000 -3.000000 -1.125000
    , Vector.vector -1.500000 -3.000000 -2.625000
    , Vector.vector -1.875000 3.000000 1.500000
    , Vector.vector -1.125000 3.000000 1.500000
    , Vector.vector -1.500000 3.000000 1.875000
    , Vector.vector -1.500000 3.000000 0.375000
    , Vector.vector 1.125000 3.000000 1.500000
    , Vector.vector 1.875000 3.000000 1.500000
    , Vector.vector 1.500000 3.000000 1.875000
    , Vector.vector 1.500000 3.000000 0.375000
    , Vector.vector 1.125000 3.000000 -1.500000
    , Vector.vector 1.875000 3.000000 -1.500000
    , Vector.vector 1.500000 3.000000 -1.125000
    , Vector.vector 1.500000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -2.250000
    , Vector.vector -3.000000 -1.875000 -2.250000
    , Vector.vector -3.000000 -2.250000 -1.875000
    , Vector.vector -3.000000 -2.250000 -2.625000
    , Vector.vector 2.250000 -2.625000 -3.000000
    , Vector.vector 2.250000 -1.875000 -3.000000
    , Vector.vector 1.875000 -2.250000 -3.000000
    , Vector.vector 2.625000 -2.250000 -3.000000
    , Vector.vector 3.000000 -2.625000 2.250000
    , Vector.vector 3.000000 -1.875000 2.250000
    , Vector.vector 3.000000 -2.250000 1.875000
    , Vector.vector 3.000000 -2.250000 2.625000
    , Vector.vector -2.250000 -2.625000 3.000000
    , Vector.vector -2.250000 -1.875000 3.000000
    , Vector.vector -1.875000 -2.250000 3.000000
    , Vector.vector -2.625000 -2.250000 3.000000
    , Vector.vector 2.625000 -3.000000 -2.250000
    , Vector.vector 1.875000 -3.000000 -2.250000
    , Vector.vector 2.250000 -3.000000 -1.875000
    , Vector.vector 2.250000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -2.250000
    , Vector.vector -1.875000 3.000000 -2.250000
    , Vector.vector -2.250000 3.000000 -1.875000
    , Vector.vector -2.250000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 0.750000
    , Vector.vector -3.000000 -1.875000 0.750000
    , Vector.vector -3.000000 -2.250000 0.375000
    , Vector.vector -3.000000 0.375000 0.750000
    , Vector.vector -3.000000 1.125000 0.750000
    , Vector.vector -3.000000 0.750000 1.125000
    , Vector.vector -3.000000 0.750000 0.375000
    , Vector.vector -3.000000 0.375000 -2.250000
    , Vector.vector -3.000000 0.750000 -1.875000
    , Vector.vector -3.000000 0.750000 -2.625000
    , Vector.vector -0.750000 -2.625000 -3.000000
    , Vector.vector -0.750000 -1.875000 -3.000000
    , Vector.vector -0.375000 -2.250000 -3.000000
    , Vector.vector -0.750000 0.375000 -3.000000
    , Vector.vector -0.750000 1.125000 -3.000000
    , Vector.vector -1.125000 0.750000 -3.000000
    , Vector.vector -0.375000 0.750000 -3.000000
    , Vector.vector 2.250000 0.375000 -3.000000
    , Vector.vector 1.875000 0.750000 -3.000000
    , Vector.vector 2.625000 0.750000 -3.000000
    , Vector.vector 3.000000 -2.625000 -0.750000
    , Vector.vector 3.000000 -1.875000 -0.750000
    , Vector.vector 3.000000 -2.250000 -0.375000
    , Vector.vector 3.000000 0.375000 -0.750000
    , Vector.vector 3.000000 1.125000 -0.750000
    , Vector.vector 3.000000 0.750000 -1.125000
    , Vector.vector 3.000000 0.750000 -0.375000
    , Vector.vector 3.000000 0.375000 2.250000
    , Vector.vector 3.000000 0.750000 1.875000
    , Vector.vector 3.000000 0.750000 2.625000
    , Vector.vector 0.750000 -2.625000 3.000000
    , Vector.vector 0.750000 -1.875000 3.000000
    , Vector.vector 0.375000 -2.250000 3.000000
    , Vector.vector 0.750000 0.375000 3.000000
    , Vector.vector 0.750000 1.125000 3.000000
    , Vector.vector 1.125000 0.750000 3.000000
    , Vector.vector 0.375000 0.750000 3.000000
    , Vector.vector -2.250000 0.375000 3.000000
    , Vector.vector -1.875000 0.750000 3.000000
    , Vector.vector -2.625000 0.750000 3.000000
    , Vector.vector 2.625000 -3.000000 0.750000
    , Vector.vector 1.875000 -3.000000 0.750000
    , Vector.vector 2.250000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 0.750000
    , Vector.vector -1.125000 -3.000000 0.750000
    , Vector.vector -0.750000 -3.000000 1.125000
    , Vector.vector -0.750000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 -2.250000
    , Vector.vector -0.750000 -3.000000 -1.875000
    , Vector.vector -0.750000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 0.750000
    , Vector.vector -1.875000 3.000000 0.750000
    , Vector.vector -2.250000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 0.750000
    , Vector.vector 1.125000 3.000000 0.750000
    , Vector.vector 0.750000 3.000000 1.125000
    , Vector.vector 0.750000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -2.250000
    , Vector.vector 0.750000 3.000000 -1.875000
    , Vector.vector 0.750000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -0.750000
    , Vector.vector -3.000000 -1.875000 -0.750000
    , Vector.vector -3.000000 -2.250000 -0.375000
    , Vector.vector -3.000000 -1.125000 -0.750000
    , Vector.vector -3.000000 -0.375000 -0.750000
    , Vector.vector -3.000000 -0.750000 -0.375000
    , Vector.vector -3.000000 -0.750000 -1.125000
    , Vector.vector -3.000000 -0.375000 -2.250000
    , Vector.vector -3.000000 -0.750000 -1.875000
    , Vector.vector -3.000000 -0.750000 -2.625000
    , Vector.vector 0.750000 -2.625000 -3.000000
    , Vector.vector 0.750000 -1.875000 -3.000000
    , Vector.vector 0.375000 -2.250000 -3.000000
    , Vector.vector 0.750000 -1.125000 -3.000000
    , Vector.vector 0.750000 -0.375000 -3.000000
    , Vector.vector 0.375000 -0.750000 -3.000000
    , Vector.vector 1.125000 -0.750000 -3.000000
    , Vector.vector 2.250000 -0.375000 -3.000000
    , Vector.vector 1.875000 -0.750000 -3.000000
    , Vector.vector 2.625000 -0.750000 -3.000000
    , Vector.vector 3.000000 -2.625000 0.750000
    , Vector.vector 3.000000 -1.875000 0.750000
    , Vector.vector 3.000000 -2.250000 0.375000
    , Vector.vector 3.000000 -1.125000 0.750000
    , Vector.vector 3.000000 -0.375000 0.750000
    , Vector.vector 3.000000 -0.750000 0.375000
    , Vector.vector 3.000000 -0.750000 1.125000
    , Vector.vector 3.000000 -0.375000 2.250000
    , Vector.vector 3.000000 -0.750000 1.875000
    , Vector.vector 3.000000 -0.750000 2.625000
    , Vector.vector -0.750000 -2.625000 3.000000
    , Vector.vector -0.750000 -1.875000 3.000000
    , Vector.vector -0.375000 -2.250000 3.000000
    , Vector.vector -0.750000 -1.125000 3.000000
    , Vector.vector -0.750000 -0.375000 3.000000
    , Vector.vector -0.375000 -0.750000 3.000000
    , Vector.vector -1.125000 -0.750000 3.000000
    , Vector.vector -2.250000 -0.375000 3.000000
    , Vector.vector -1.875000 -0.750000 3.000000
    , Vector.vector -2.625000 -0.750000 3.000000
    , Vector.vector 2.625000 -3.000000 -0.750000
    , Vector.vector 1.875000 -3.000000 -0.750000
    , Vector.vector 2.250000 -3.000000 -0.375000
    , Vector.vector 1.125000 -3.000000 -0.750000
    , Vector.vector 0.375000 -3.000000 -0.750000
    , Vector.vector 0.750000 -3.000000 -0.375000
    , Vector.vector 0.750000 -3.000000 -1.125000
    , Vector.vector 0.375000 -3.000000 -2.250000
    , Vector.vector 0.750000 -3.000000 -1.875000
    , Vector.vector 0.750000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -0.750000
    , Vector.vector -1.875000 3.000000 -0.750000
    , Vector.vector -2.250000 3.000000 -0.375000
    , Vector.vector -1.125000 3.000000 -0.750000
    , Vector.vector -0.375000 3.000000 -0.750000
    , Vector.vector -0.750000 3.000000 -0.375000
    , Vector.vector -0.750000 3.000000 -1.125000
    , Vector.vector -0.375000 3.000000 -2.250000
    , Vector.vector -0.750000 3.000000 -1.875000
    , Vector.vector -0.750000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 2.250000
    , Vector.vector -3.000000 -1.875000 2.250000
    , Vector.vector -3.000000 -2.250000 2.625000
    , Vector.vector -3.000000 -2.250000 1.875000
    , Vector.vector -3.000000 -0.375000 2.250000
    , Vector.vector -3.000000 -0.750000 2.625000
    , Vector.vector -3.000000 -0.750000 1.875000
    , Vector.vector -3.000000 -1.125000 0.750000
    , Vector.vector -3.000000 -0.375000 0.750000
    , Vector.vector -3.000000 -0.750000 1.125000
    , Vector.vector -3.000000 -0.750000 0.375000
    , Vector.vector -3.000000 0.375000 2.250000
    , Vector.vector -3.000000 0.750000 2.625000
    , Vector.vector -3.000000 0.750000 1.875000
    , Vector.vector -3.000000 1.875000 2.250000
    , Vector.vector -3.000000 2.625000 2.250000
    , Vector.vector -3.000000 2.250000 2.625000
    , Vector.vector -3.000000 2.250000 1.875000
    , Vector.vector -3.000000 1.875000 0.750000
    , Vector.vector -3.000000 2.625000 0.750000
    , Vector.vector -3.000000 2.250000 0.375000
    , Vector.vector -3.000000 0.375000 -0.750000
    , Vector.vector -3.000000 1.125000 -0.750000
    , Vector.vector -3.000000 0.750000 -0.375000
    , Vector.vector -3.000000 0.750000 -1.125000
    , Vector.vector -3.000000 1.875000 -0.750000
    , Vector.vector -3.000000 2.625000 -0.750000
    , Vector.vector -3.000000 2.250000 -0.375000
    , Vector.vector -3.000000 1.875000 -2.250000
    , Vector.vector -3.000000 2.625000 -2.250000
    , Vector.vector -3.000000 2.250000 -1.875000
    , Vector.vector -3.000000 2.250000 -2.625000
    , Vector.vector -2.250000 -2.625000 -3.000000
    , Vector.vector -2.250000 -1.875000 -3.000000
    , Vector.vector -2.625000 -2.250000 -3.000000
    , Vector.vector -1.875000 -2.250000 -3.000000
    , Vector.vector -2.250000 -0.375000 -3.000000
    , Vector.vector -2.625000 -0.750000 -3.000000
    , Vector.vector -1.875000 -0.750000 -3.000000
    , Vector.vector -0.750000 -1.125000 -3.000000
    , Vector.vector -0.750000 -0.375000 -3.000000
    , Vector.vector -1.125000 -0.750000 -3.000000
    , Vector.vector -0.375000 -0.750000 -3.000000
    , Vector.vector -2.250000 0.375000 -3.000000
    , Vector.vector -2.625000 0.750000 -3.000000
    , Vector.vector -1.875000 0.750000 -3.000000
    , Vector.vector -2.250000 1.875000 -3.000000
    , Vector.vector -2.250000 2.625000 -3.000000
    , Vector.vector -2.625000 2.250000 -3.000000
    , Vector.vector -1.875000 2.250000 -3.000000
    , Vector.vector -0.750000 1.875000 -3.000000
    , Vector.vector -0.750000 2.625000 -3.000000
    , Vector.vector -0.375000 2.250000 -3.000000
    , Vector.vector 0.750000 0.375000 -3.000000
    , Vector.vector 0.750000 1.125000 -3.000000
    , Vector.vector 0.375000 0.750000 -3.000000
    , Vector.vector 1.125000 0.750000 -3.000000
    , Vector.vector 0.750000 1.875000 -3.000000
    , Vector.vector 0.750000 2.625000 -3.000000
    , Vector.vector 0.375000 2.250000 -3.000000
    , Vector.vector 2.250000 1.875000 -3.000000
    , Vector.vector 2.250000 2.625000 -3.000000
    , Vector.vector 1.875000 2.250000 -3.000000
    , Vector.vector 2.625000 2.250000 -3.000000
    , Vector.vector 3.000000 -2.625000 -2.250000
    , Vector.vector 3.000000 -1.875000 -2.250000
    , Vector.vector 3.000000 -2.250000 -2.625000
    , Vector.vector 3.000000 -2.250000 -1.875000
    , Vector.vector 3.000000 -0.375000 -2.250000
    , Vector.vector 3.000000 -0.750000 -2.625000
    , Vector.vector 3.000000 -0.750000 -1.875000
    , Vector.vector 3.000000 -1.125000 -0.750000
    , Vector.vector 3.000000 -0.375000 -0.750000
    , Vector.vector 3.000000 -0.750000 -1.125000
    , Vector.vector 3.000000 -0.750000 -0.375000
    , Vector.vector 3.000000 0.375000 -2.250000
    , Vector.vector 3.000000 0.750000 -2.625000
    , Vector.vector 3.000000 0.750000 -1.875000
    , Vector.vector 3.000000 1.875000 -2.250000
    , Vector.vector 3.000000 2.625000 -2.250000
    , Vector.vector 3.000000 2.250000 -2.625000
    , Vector.vector 3.000000 2.250000 -1.875000
    , Vector.vector 3.000000 1.875000 -0.750000
    , Vector.vector 3.000000 2.625000 -0.750000
    , Vector.vector 3.000000 2.250000 -0.375000
    , Vector.vector 3.000000 0.375000 0.750000
    , Vector.vector 3.000000 1.125000 0.750000
    , Vector.vector 3.000000 0.750000 0.375000
    , Vector.vector 3.000000 0.750000 1.125000
    , Vector.vector 3.000000 1.875000 0.750000
    , Vector.vector 3.000000 2.625000 0.750000
    , Vector.vector 3.000000 2.250000 0.375000
    , Vector.vector 3.000000 1.875000 2.250000
    , Vector.vector 3.000000 2.625000 2.250000
    , Vector.vector 3.000000 2.250000 1.875000
    , Vector.vector 3.000000 2.250000 2.625000
    , Vector.vector 2.250000 -2.625000 3.000000
    , Vector.vector 2.250000 -1.875000 3.000000
    , Vector.vector 2.625000 -2.250000 3.000000
    , Vector.vector 1.875000 -2.250000 3.000000
    , Vector.vector 2.250000 -0.375000 3.000000
    , Vector.vector 2.625000 -0.750000 3.000000
    , Vector.vector 1.875000 -0.750000 3.000000
    , Vector.vector 0.750000 -1.125000 3.000000
    , Vector.vector 0.750000 -0.375000 3.000000
    , Vector.vector 1.125000 -0.750000 3.000000
    , Vector.vector 0.375000 -0.750000 3.000000
    , Vector.vector 2.250000 0.375000 3.000000
    , Vector.vector 2.625000 0.750000 3.000000
    , Vector.vector 1.875000 0.750000 3.000000
    , Vector.vector 2.250000 1.875000 3.000000
    , Vector.vector 2.250000 2.625000 3.000000
    , Vector.vector 2.625000 2.250000 3.000000
    , Vector.vector 1.875000 2.250000 3.000000
    , Vector.vector 0.750000 1.875000 3.000000
    , Vector.vector 0.750000 2.625000 3.000000
    , Vector.vector 0.375000 2.250000 3.000000
    , Vector.vector -0.750000 0.375000 3.000000
    , Vector.vector -0.750000 1.125000 3.000000
    , Vector.vector -0.375000 0.750000 3.000000
    , Vector.vector -1.125000 0.750000 3.000000
    , Vector.vector -0.750000 1.875000 3.000000
    , Vector.vector -0.750000 2.625000 3.000000
    , Vector.vector -0.375000 2.250000 3.000000
    , Vector.vector -2.250000 1.875000 3.000000
    , Vector.vector -2.250000 2.625000 3.000000
    , Vector.vector -1.875000 2.250000 3.000000
    , Vector.vector -2.625000 2.250000 3.000000
    , Vector.vector 2.625000 -3.000000 2.250000
    , Vector.vector 1.875000 -3.000000 2.250000
    , Vector.vector 2.250000 -3.000000 2.625000
    , Vector.vector 2.250000 -3.000000 1.875000
    , Vector.vector 0.375000 -3.000000 2.250000
    , Vector.vector 0.750000 -3.000000 2.625000
    , Vector.vector 0.750000 -3.000000 1.875000
    , Vector.vector 1.125000 -3.000000 0.750000
    , Vector.vector 0.375000 -3.000000 0.750000
    , Vector.vector 0.750000 -3.000000 1.125000
    , Vector.vector 0.750000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 2.250000
    , Vector.vector -0.750000 -3.000000 2.625000
    , Vector.vector -0.750000 -3.000000 1.875000
    , Vector.vector -1.875000 -3.000000 2.250000
    , Vector.vector -2.625000 -3.000000 2.250000
    , Vector.vector -2.250000 -3.000000 2.625000
    , Vector.vector -2.250000 -3.000000 1.875000
    , Vector.vector -1.875000 -3.000000 0.750000
    , Vector.vector -2.625000 -3.000000 0.750000
    , Vector.vector -2.250000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 -0.750000
    , Vector.vector -1.125000 -3.000000 -0.750000
    , Vector.vector -0.750000 -3.000000 -0.375000
    , Vector.vector -0.750000 -3.000000 -1.125000
    , Vector.vector -1.875000 -3.000000 -0.750000
    , Vector.vector -2.625000 -3.000000 -0.750000
    , Vector.vector -2.250000 -3.000000 -0.375000
    , Vector.vector -1.875000 -3.000000 -2.250000
    , Vector.vector -2.625000 -3.000000 -2.250000
    , Vector.vector -2.250000 -3.000000 -1.875000
    , Vector.vector -2.250000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 2.250000
    , Vector.vector -1.875000 3.000000 2.250000
    , Vector.vector -2.250000 3.000000 2.625000
    , Vector.vector -2.250000 3.000000 1.875000
    , Vector.vector -0.375000 3.000000 2.250000
    , Vector.vector -0.750000 3.000000 2.625000
    , Vector.vector -0.750000 3.000000 1.875000
    , Vector.vector -1.125000 3.000000 0.750000
    , Vector.vector -0.375000 3.000000 0.750000
    , Vector.vector -0.750000 3.000000 1.125000
    , Vector.vector -0.750000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 2.250000
    , Vector.vector 0.750000 3.000000 2.625000
    , Vector.vector 0.750000 3.000000 1.875000
    , Vector.vector 1.875000 3.000000 2.250000
    , Vector.vector 2.625000 3.000000 2.250000
    , Vector.vector 2.250000 3.000000 2.625000
    , Vector.vector 2.250000 3.000000 1.875000
    , Vector.vector 1.875000 3.000000 0.750000
    , Vector.vector 2.625000 3.000000 0.750000
    , Vector.vector 2.250000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -0.750000
    , Vector.vector 1.125000 3.000000 -0.750000
    , Vector.vector 0.750000 3.000000 -0.375000
    , Vector.vector 0.750000 3.000000 -1.125000
    , Vector.vector 1.875000 3.000000 -0.750000
    , Vector.vector 2.625000 3.000000 -0.750000
    , Vector.vector 2.250000 3.000000 -0.375000
    , Vector.vector 1.875000 3.000000 -2.250000
    , Vector.vector 2.625000 3.000000 -2.250000
    , Vector.vector 2.250000 3.000000 -1.875000
    , Vector.vector 2.250000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -2.625000
    , Vector.vector 2.625000 -2.625000 -3.000000
    , Vector.vector 3.000000 -2.625000 2.625000
    , Vector.vector -2.625000 -2.625000 3.000000
    , Vector.vector 2.625000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 0.375000
    , Vector.vector -3.000000 0.375000 0.375000
    , Vector.vector -3.000000 0.375000 -2.625000
    , Vector.vector -0.375000 -2.625000 -3.000000
    , Vector.vector -0.375000 0.375000 -3.000000
    , Vector.vector 2.625000 0.375000 -3.000000
    , Vector.vector 3.000000 -2.625000 -0.375000
    , Vector.vector 3.000000 0.375000 -0.375000
    , Vector.vector 3.000000 0.375000 2.625000
    , Vector.vector 0.375000 -2.625000 3.000000
    , Vector.vector 0.375000 0.375000 3.000000
    , Vector.vector -2.625000 0.375000 3.000000
    , Vector.vector 2.625000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -1.125000
    , Vector.vector -3.000000 -1.125000 -2.625000
    , Vector.vector 1.125000 -2.625000 -3.000000
    , Vector.vector 2.625000 -1.125000 -3.000000
    , Vector.vector 3.000000 -2.625000 1.125000
    , Vector.vector 3.000000 -1.125000 2.625000
    , Vector.vector -1.125000 -2.625000 3.000000
    , Vector.vector -2.625000 -1.125000 3.000000
    , Vector.vector 2.625000 -3.000000 -1.125000
    , Vector.vector 1.125000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -1.125000
    , Vector.vector -1.125000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 1.875000
    , Vector.vector -3.000000 -1.125000 1.875000
    , Vector.vector -3.000000 -1.125000 0.375000
    , Vector.vector -3.000000 0.375000 1.875000
    , Vector.vector -3.000000 1.875000 1.875000
    , Vector.vector -3.000000 1.875000 0.375000
    , Vector.vector -3.000000 0.375000 -1.125000
    , Vector.vector -3.000000 1.875000 -1.125000
    , Vector.vector -3.000000 1.875000 -2.625000
    , Vector.vector -1.875000 -2.625000 -3.000000
    , Vector.vector -1.875000 -1.125000 -3.000000
    , Vector.vector -0.375000 -1.125000 -3.000000
    , Vector.vector -1.875000 0.375000 -3.000000
    , Vector.vector -1.875000 1.875000 -3.000000
    , Vector.vector -0.375000 1.875000 -3.000000
    , Vector.vector 1.125000 0.375000 -3.000000
    , Vector.vector 1.125000 1.875000 -3.000000
    , Vector.vector 2.625000 1.875000 -3.000000
    , Vector.vector 3.000000 -2.625000 -1.875000
    , Vector.vector 3.000000 -1.125000 -1.875000
    , Vector.vector 3.000000 -1.125000 -0.375000
    , Vector.vector 3.000000 0.375000 -1.875000
    , Vector.vector 3.000000 1.875000 -1.875000
    , Vector.vector 3.000000 1.875000 -0.375000
    , Vector.vector 3.000000 0.375000 1.125000
    , Vector.vector 3.000000 1.875000 1.125000
    , Vector.vector 3.000000 1.875000 2.625000
    , Vector.vector 1.875000 -2.625000 3.000000
    , Vector.vector 1.875000 -1.125000 3.000000
    , Vector.vector 0.375000 -1.125000 3.000000
    , Vector.vector 1.875000 0.375000 3.000000
    , Vector.vector 1.875000 1.875000 3.000000
    , Vector.vector 0.375000 1.875000 3.000000
    , Vector.vector -1.125000 0.375000 3.000000
    , Vector.vector -1.125000 1.875000 3.000000
    , Vector.vector -2.625000 1.875000 3.000000
    , Vector.vector 2.625000 -3.000000 1.875000
    , Vector.vector 1.125000 -3.000000 1.875000
    , Vector.vector 1.125000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 1.875000
    , Vector.vector -1.875000 -3.000000 1.875000
    , Vector.vector -1.875000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 -1.125000
    , Vector.vector -1.875000 -3.000000 -1.125000
    , Vector.vector -1.875000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 1.875000
    , Vector.vector -1.125000 3.000000 1.875000
    , Vector.vector -1.125000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 1.875000
    , Vector.vector 1.875000 3.000000 1.875000
    , Vector.vector 1.875000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -1.125000
    , Vector.vector 1.875000 3.000000 -1.125000
    , Vector.vector 1.875000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -1.875000
    , Vector.vector -3.000000 -1.875000 -1.875000
    , Vector.vector -3.000000 -1.875000 -2.625000
    , Vector.vector 1.875000 -2.625000 -3.000000
    , Vector.vector 1.875000 -1.875000 -3.000000
    , Vector.vector 2.625000 -1.875000 -3.000000
    , Vector.vector 3.000000 -2.625000 1.875000
    , Vector.vector 3.000000 -1.875000 1.875000
    , Vector.vector 3.000000 -1.875000 2.625000
    , Vector.vector -1.875000 -2.625000 3.000000
    , Vector.vector -1.875000 -1.875000 3.000000
    , Vector.vector -2.625000 -1.875000 3.000000
    , Vector.vector 2.625000 -3.000000 -1.875000
    , Vector.vector 1.875000 -3.000000 -1.875000
    , Vector.vector 1.875000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -1.875000
    , Vector.vector -1.875000 3.000000 -1.875000
    , Vector.vector -1.875000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 1.125000
    , Vector.vector -3.000000 -1.875000 1.125000
    , Vector.vector -3.000000 -1.875000 0.375000
    , Vector.vector -3.000000 0.375000 1.125000
    , Vector.vector -3.000000 1.125000 0.375000
    , Vector.vector -3.000000 0.375000 -1.875000
    , Vector.vector -3.000000 1.125000 -1.875000
    , Vector.vector -3.000000 1.125000 -2.625000
    , Vector.vector -1.125000 -2.625000 -3.000000
    , Vector.vector -1.125000 -1.875000 -3.000000
    , Vector.vector -0.375000 -1.875000 -3.000000
    , Vector.vector -1.125000 0.375000 -3.000000
    , Vector.vector -0.375000 1.125000 -3.000000
    , Vector.vector 1.875000 0.375000 -3.000000
    , Vector.vector 1.875000 1.125000 -3.000000
    , Vector.vector 2.625000 1.125000 -3.000000
    , Vector.vector 3.000000 -2.625000 -1.125000
    , Vector.vector 3.000000 -1.875000 -1.125000
    , Vector.vector 3.000000 -1.875000 -0.375000
    , Vector.vector 3.000000 0.375000 -1.125000
    , Vector.vector 3.000000 1.125000 -0.375000
    , Vector.vector 3.000000 0.375000 1.875000
    , Vector.vector 3.000000 1.125000 1.875000
    , Vector.vector 3.000000 1.125000 2.625000
    , Vector.vector 1.125000 -2.625000 3.000000
    , Vector.vector 1.125000 -1.875000 3.000000
    , Vector.vector 0.375000 -1.875000 3.000000
    , Vector.vector 1.125000 0.375000 3.000000
    , Vector.vector 0.375000 1.125000 3.000000
    , Vector.vector -1.875000 0.375000 3.000000
    , Vector.vector -1.875000 1.125000 3.000000
    , Vector.vector -2.625000 1.125000 3.000000
    , Vector.vector 2.625000 -3.000000 1.125000
    , Vector.vector 1.875000 -3.000000 1.125000
    , Vector.vector 1.875000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 1.125000
    , Vector.vector -1.125000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 -1.875000
    , Vector.vector -1.125000 -3.000000 -1.875000
    , Vector.vector -1.125000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 1.125000
    , Vector.vector -1.875000 3.000000 1.125000
    , Vector.vector -1.875000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 1.125000
    , Vector.vector 1.125000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -1.875000
    , Vector.vector 1.125000 3.000000 -1.875000
    , Vector.vector 1.125000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 -0.375000
    , Vector.vector -3.000000 -1.875000 -0.375000
    , Vector.vector -3.000000 -1.875000 -1.125000
    , Vector.vector -3.000000 -1.125000 -0.375000
    , Vector.vector -3.000000 -0.375000 -0.375000
    , Vector.vector -3.000000 -0.375000 -1.125000
    , Vector.vector -3.000000 -1.125000 -1.875000
    , Vector.vector -3.000000 -0.375000 -1.875000
    , Vector.vector -3.000000 -0.375000 -2.625000
    , Vector.vector 0.375000 -2.625000 -3.000000
    , Vector.vector 0.375000 -1.875000 -3.000000
    , Vector.vector 1.125000 -1.875000 -3.000000
    , Vector.vector 0.375000 -1.125000 -3.000000
    , Vector.vector 0.375000 -0.375000 -3.000000
    , Vector.vector 1.125000 -0.375000 -3.000000
    , Vector.vector 1.875000 -1.125000 -3.000000
    , Vector.vector 1.875000 -0.375000 -3.000000
    , Vector.vector 2.625000 -0.375000 -3.000000
    , Vector.vector 3.000000 -2.625000 0.375000
    , Vector.vector 3.000000 -1.875000 0.375000
    , Vector.vector 3.000000 -1.875000 1.125000
    , Vector.vector 3.000000 -1.125000 0.375000
    , Vector.vector 3.000000 -0.375000 0.375000
    , Vector.vector 3.000000 -0.375000 1.125000
    , Vector.vector 3.000000 -1.125000 1.875000
    , Vector.vector 3.000000 -0.375000 1.875000
    , Vector.vector 3.000000 -0.375000 2.625000
    , Vector.vector -0.375000 -2.625000 3.000000
    , Vector.vector -0.375000 -1.875000 3.000000
    , Vector.vector -1.125000 -1.875000 3.000000
    , Vector.vector -0.375000 -1.125000 3.000000
    , Vector.vector -0.375000 -0.375000 3.000000
    , Vector.vector -1.125000 -0.375000 3.000000
    , Vector.vector -1.875000 -1.125000 3.000000
    , Vector.vector -1.875000 -0.375000 3.000000
    , Vector.vector -2.625000 -0.375000 3.000000
    , Vector.vector 2.625000 -3.000000 -0.375000
    , Vector.vector 1.875000 -3.000000 -0.375000
    , Vector.vector 1.875000 -3.000000 -1.125000
    , Vector.vector 1.125000 -3.000000 -0.375000
    , Vector.vector 0.375000 -3.000000 -0.375000
    , Vector.vector 0.375000 -3.000000 -1.125000
    , Vector.vector 1.125000 -3.000000 -1.875000
    , Vector.vector 0.375000 -3.000000 -1.875000
    , Vector.vector 0.375000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 -0.375000
    , Vector.vector -1.875000 3.000000 -0.375000
    , Vector.vector -1.875000 3.000000 -1.125000
    , Vector.vector -1.125000 3.000000 -0.375000
    , Vector.vector -0.375000 3.000000 -0.375000
    , Vector.vector -0.375000 3.000000 -1.125000
    , Vector.vector -1.125000 3.000000 -1.875000
    , Vector.vector -0.375000 3.000000 -1.875000
    , Vector.vector -0.375000 3.000000 -2.625000
    , Vector.vector -3.000000 -2.625000 2.625000
    , Vector.vector -3.000000 -1.875000 2.625000
    , Vector.vector -3.000000 -1.875000 1.875000
    , Vector.vector -3.000000 -1.125000 2.625000
    , Vector.vector -3.000000 -0.375000 2.625000
    , Vector.vector -3.000000 -0.375000 1.875000
    , Vector.vector -3.000000 -0.375000 1.125000
    , Vector.vector -3.000000 -0.375000 0.375000
    , Vector.vector -3.000000 0.375000 2.625000
    , Vector.vector -3.000000 1.125000 2.625000
    , Vector.vector -3.000000 1.125000 1.875000
    , Vector.vector -3.000000 1.875000 2.625000
    , Vector.vector -3.000000 2.625000 2.625000
    , Vector.vector -3.000000 2.625000 1.875000
    , Vector.vector -3.000000 1.875000 1.125000
    , Vector.vector -3.000000 2.625000 1.125000
    , Vector.vector -3.000000 2.625000 0.375000
    , Vector.vector -3.000000 0.375000 -0.375000
    , Vector.vector -3.000000 1.125000 -0.375000
    , Vector.vector -3.000000 1.875000 -0.375000
    , Vector.vector -3.000000 2.625000 -0.375000
    , Vector.vector -3.000000 2.625000 -1.125000
    , Vector.vector -3.000000 1.875000 -1.875000
    , Vector.vector -3.000000 2.625000 -1.875000
    , Vector.vector -3.000000 2.625000 -2.625000
    , Vector.vector -2.625000 -2.625000 -3.000000
    , Vector.vector -2.625000 -1.875000 -3.000000
    , Vector.vector -1.875000 -1.875000 -3.000000
    , Vector.vector -2.625000 -1.125000 -3.000000
    , Vector.vector -2.625000 -0.375000 -3.000000
    , Vector.vector -1.875000 -0.375000 -3.000000
    , Vector.vector -1.125000 -0.375000 -3.000000
    , Vector.vector -0.375000 -0.375000 -3.000000
    , Vector.vector -2.625000 0.375000 -3.000000
    , Vector.vector -2.625000 1.125000 -3.000000
    , Vector.vector -1.875000 1.125000 -3.000000
    , Vector.vector -2.625000 1.875000 -3.000000
    , Vector.vector -2.625000 2.625000 -3.000000
    , Vector.vector -1.875000 2.625000 -3.000000
    , Vector.vector -1.125000 1.875000 -3.000000
    , Vector.vector -1.125000 2.625000 -3.000000
    , Vector.vector -0.375000 2.625000 -3.000000
    , Vector.vector 0.375000 0.375000 -3.000000
    , Vector.vector 0.375000 1.125000 -3.000000
    , Vector.vector 0.375000 1.875000 -3.000000
    , Vector.vector 0.375000 2.625000 -3.000000
    , Vector.vector 1.125000 2.625000 -3.000000
    , Vector.vector 1.875000 1.875000 -3.000000
    , Vector.vector 1.875000 2.625000 -3.000000
    , Vector.vector 2.625000 2.625000 -3.000000
    , Vector.vector 3.000000 -2.625000 -2.625000
    , Vector.vector 3.000000 -1.875000 -2.625000
    , Vector.vector 3.000000 -1.875000 -1.875000
    , Vector.vector 3.000000 -1.125000 -2.625000
    , Vector.vector 3.000000 -0.375000 -2.625000
    , Vector.vector 3.000000 -0.375000 -1.875000
    , Vector.vector 3.000000 -0.375000 -1.125000
    , Vector.vector 3.000000 -0.375000 -0.375000
    , Vector.vector 3.000000 0.375000 -2.625000
    , Vector.vector 3.000000 1.125000 -2.625000
    , Vector.vector 3.000000 1.125000 -1.875000
    , Vector.vector 3.000000 1.875000 -2.625000
    , Vector.vector 3.000000 2.625000 -2.625000
    , Vector.vector 3.000000 2.625000 -1.875000
    , Vector.vector 3.000000 1.875000 -1.125000
    , Vector.vector 3.000000 2.625000 -1.125000
    , Vector.vector 3.000000 2.625000 -0.375000
    , Vector.vector 3.000000 0.375000 0.375000
    , Vector.vector 3.000000 1.125000 0.375000
    , Vector.vector 3.000000 1.875000 0.375000
    , Vector.vector 3.000000 2.625000 0.375000
    , Vector.vector 3.000000 2.625000 1.125000
    , Vector.vector 3.000000 1.875000 1.875000
    , Vector.vector 3.000000 2.625000 1.875000
    , Vector.vector 3.000000 2.625000 2.625000
    , Vector.vector 2.625000 -2.625000 3.000000
    , Vector.vector 2.625000 -1.875000 3.000000
    , Vector.vector 1.875000 -1.875000 3.000000
    , Vector.vector 2.625000 -1.125000 3.000000
    , Vector.vector 2.625000 -0.375000 3.000000
    , Vector.vector 1.875000 -0.375000 3.000000
    , Vector.vector 1.125000 -0.375000 3.000000
    , Vector.vector 0.375000 -0.375000 3.000000
    , Vector.vector 2.625000 0.375000 3.000000
    , Vector.vector 2.625000 1.125000 3.000000
    , Vector.vector 1.875000 1.125000 3.000000
    , Vector.vector 2.625000 1.875000 3.000000
    , Vector.vector 2.625000 2.625000 3.000000
    , Vector.vector 1.875000 2.625000 3.000000
    , Vector.vector 1.125000 1.875000 3.000000
    , Vector.vector 1.125000 2.625000 3.000000
    , Vector.vector 0.375000 2.625000 3.000000
    , Vector.vector -0.375000 0.375000 3.000000
    , Vector.vector -0.375000 1.125000 3.000000
    , Vector.vector -0.375000 1.875000 3.000000
    , Vector.vector -0.375000 2.625000 3.000000
    , Vector.vector -1.125000 2.625000 3.000000
    , Vector.vector -1.875000 1.875000 3.000000
    , Vector.vector -1.875000 2.625000 3.000000
    , Vector.vector -2.625000 2.625000 3.000000
    , Vector.vector 2.625000 -3.000000 2.625000
    , Vector.vector 1.875000 -3.000000 2.625000
    , Vector.vector 1.875000 -3.000000 1.875000
    , Vector.vector 1.125000 -3.000000 2.625000
    , Vector.vector 0.375000 -3.000000 2.625000
    , Vector.vector 0.375000 -3.000000 1.875000
    , Vector.vector 0.375000 -3.000000 1.125000
    , Vector.vector 0.375000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 2.625000
    , Vector.vector -1.125000 -3.000000 2.625000
    , Vector.vector -1.125000 -3.000000 1.875000
    , Vector.vector -1.875000 -3.000000 2.625000
    , Vector.vector -2.625000 -3.000000 2.625000
    , Vector.vector -2.625000 -3.000000 1.875000
    , Vector.vector -1.875000 -3.000000 1.125000
    , Vector.vector -2.625000 -3.000000 1.125000
    , Vector.vector -2.625000 -3.000000 0.375000
    , Vector.vector -0.375000 -3.000000 -0.375000
    , Vector.vector -1.125000 -3.000000 -0.375000
    , Vector.vector -1.875000 -3.000000 -0.375000
    , Vector.vector -2.625000 -3.000000 -0.375000
    , Vector.vector -2.625000 -3.000000 -1.125000
    , Vector.vector -1.875000 -3.000000 -1.875000
    , Vector.vector -2.625000 -3.000000 -1.875000
    , Vector.vector -2.625000 -3.000000 -2.625000
    , Vector.vector -2.625000 3.000000 2.625000
    , Vector.vector -1.875000 3.000000 2.625000
    , Vector.vector -1.875000 3.000000 1.875000
    , Vector.vector -1.125000 3.000000 2.625000
    , Vector.vector -0.375000 3.000000 2.625000
    , Vector.vector -0.375000 3.000000 1.875000
    , Vector.vector -0.375000 3.000000 1.125000
    , Vector.vector -0.375000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 2.625000
    , Vector.vector 1.125000 3.000000 2.625000
    , Vector.vector 1.125000 3.000000 1.875000
    , Vector.vector 1.875000 3.000000 2.625000
    , Vector.vector 2.625000 3.000000 2.625000
    , Vector.vector 2.625000 3.000000 1.875000
    , Vector.vector 1.875000 3.000000 1.125000
    , Vector.vector 2.625000 3.000000 1.125000
    , Vector.vector 2.625000 3.000000 0.375000
    , Vector.vector 0.375000 3.000000 -0.375000
    , Vector.vector 1.125000 3.000000 -0.375000
    , Vector.vector 1.875000 3.000000 -0.375000
    , Vector.vector 2.625000 3.000000 -0.375000
    , Vector.vector 2.625000 3.000000 -1.125000
    , Vector.vector 1.875000 3.000000 -1.875000
    , Vector.vector 2.625000 3.000000 -1.875000
    , Vector.vector 2.625000 3.000000 -2.625000
    , Vector.vector -3.600000 -3.600000 3.600000
    , Vector.vector -3.600000 -3.600000 -3.600000
    , Vector.vector 3.600000 -3.600000 -3.600000
    , Vector.vector 3.600000 -3.600000 3.600000
    , Vector.vector -3.600000 3.600000 3.600000
    , Vector.vector -3.600000 3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 3.600000
    , Vector.vector -3.600000 0.000000 3.600000
    , Vector.vector -3.600000 3.600000 -0.000000
    , Vector.vector -3.600000 0.000000 -3.600000
    , Vector.vector -3.600000 -3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 -3.600000
    , Vector.vector 3.600000 0.000000 -3.600000
    , Vector.vector -0.000000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -0.000000
    , Vector.vector 3.600000 0.000000 3.600000
    , Vector.vector 3.600000 -3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 3.600000
    , Vector.vector -0.000000 -3.600000 3.600000
    , Vector.vector -3.600000 1.800000 3.600000
    , Vector.vector -3.600000 3.600000 -1.800000
    , Vector.vector -3.600000 -1.800000 -3.600000
    , Vector.vector -3.600000 -3.600000 1.800000
    , Vector.vector 1.800000 3.600000 -3.600000
    , Vector.vector 3.600000 -1.800000 -3.600000
    , Vector.vector -1.800000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 1.800000
    , Vector.vector 3.600000 -1.800000 3.600000
    , Vector.vector 3.600000 -3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 3.600000
    , Vector.vector 1.800000 -3.600000 3.600000
    , Vector.vector -3.600000 -1.800000 3.600000
    , Vector.vector -3.600000 3.600000 1.800000
    , Vector.vector -3.600000 1.800000 -3.600000
    , Vector.vector -3.600000 -3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 -3.600000
    , Vector.vector 3.600000 1.800000 -3.600000
    , Vector.vector 1.800000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -1.800000
    , Vector.vector 3.600000 1.800000 3.600000
    , Vector.vector 3.600000 -3.600000 1.800000
    , Vector.vector 1.800000 3.600000 3.600000
    , Vector.vector -1.800000 -3.600000 3.600000
    , Vector.vector -3.600000 -1.800000 -0.000000
    , Vector.vector -3.600000 1.800000 -0.000000
    , Vector.vector -3.600000 0.000000 1.800000
    , Vector.vector -3.600000 0.000000 -1.800000
    , Vector.vector -0.000000 -1.800000 -3.600000
    , Vector.vector -0.000000 1.800000 -3.600000
    , Vector.vector -1.800000 0.000000 -3.600000
    , Vector.vector 1.800000 0.000000 -3.600000
    , Vector.vector 3.600000 -1.800000 -0.000000
    , Vector.vector 3.600000 1.800000 -0.000000
    , Vector.vector 3.600000 0.000000 -1.800000
    , Vector.vector 3.600000 0.000000 1.800000
    , Vector.vector -0.000000 -1.800000 3.600000
    , Vector.vector -0.000000 1.800000 3.600000
    , Vector.vector 1.800000 0.000000 3.600000
    , Vector.vector -1.800000 0.000000 3.600000
    , Vector.vector 1.800000 -3.600000 -0.000000
    , Vector.vector -1.800000 -3.600000 -0.000000
    , Vector.vector -0.000000 -3.600000 1.800000
    , Vector.vector -0.000000 -3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 -0.000000
    , Vector.vector 1.800000 3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 1.800000
    , Vector.vector -0.000000 3.600000 -1.800000
    , Vector.vector -3.600000 -1.800000 -1.800000
    , Vector.vector 1.800000 -1.800000 -3.600000
    , Vector.vector 3.600000 -1.800000 1.800000
    , Vector.vector -1.800000 -1.800000 3.600000
    , Vector.vector 1.800000 -3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 -1.800000
    , Vector.vector -3.600000 -1.800000 1.800000
    , Vector.vector -3.600000 1.800000 1.800000
    , Vector.vector -3.600000 1.800000 -1.800000
    , Vector.vector -1.800000 -1.800000 -3.600000
    , Vector.vector -1.800000 1.800000 -3.600000
    , Vector.vector 1.800000 1.800000 -3.600000
    , Vector.vector 3.600000 -1.800000 -1.800000
    , Vector.vector 3.600000 1.800000 -1.800000
    , Vector.vector 3.600000 1.800000 1.800000
    , Vector.vector 1.800000 -1.800000 3.600000
    , Vector.vector 1.800000 1.800000 3.600000
    , Vector.vector -1.800000 1.800000 3.600000
    , Vector.vector 1.800000 -3.600000 1.800000
    , Vector.vector -1.800000 -3.600000 1.800000
    , Vector.vector -1.800000 -3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 1.800000
    , Vector.vector 1.800000 3.600000 1.800000
    , Vector.vector 1.800000 3.600000 -1.800000
    , Vector.vector -3.600000 2.700000 3.600000
    , Vector.vector -3.600000 3.600000 -2.700000
    , Vector.vector -3.600000 -2.700000 -3.600000
    , Vector.vector -3.600000 -3.600000 2.700000
    , Vector.vector 2.700000 3.600000 -3.600000
    , Vector.vector 3.600000 -2.700000 -3.600000
    , Vector.vector -2.700000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 2.700000
    , Vector.vector 3.600000 -2.700000 3.600000
    , Vector.vector 3.600000 -3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 3.600000
    , Vector.vector 2.700000 -3.600000 3.600000
    , Vector.vector -3.600000 -2.700000 3.600000
    , Vector.vector -3.600000 3.600000 2.700000
    , Vector.vector -3.600000 2.700000 -3.600000
    , Vector.vector -3.600000 -3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 -3.600000
    , Vector.vector 3.600000 2.700000 -3.600000
    , Vector.vector 2.700000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -2.700000
    , Vector.vector 3.600000 2.700000 3.600000
    , Vector.vector 3.600000 -3.600000 2.700000
    , Vector.vector 2.700000 3.600000 3.600000
    , Vector.vector -2.700000 -3.600000 3.600000
    , Vector.vector -3.600000 0.000000 -0.900000
    , Vector.vector 0.900000 0.000000 -3.600000
    , Vector.vector 3.600000 0.000000 0.900000
    , Vector.vector -0.900000 0.000000 3.600000
    , Vector.vector -0.000000 -3.600000 -0.900000
    , Vector.vector -0.000000 3.600000 -0.900000
    , Vector.vector -3.600000 0.900000 3.600000
    , Vector.vector -3.600000 3.600000 -0.900000
    , Vector.vector -3.600000 -0.900000 -3.600000
    , Vector.vector -3.600000 -3.600000 0.900000
    , Vector.vector 0.900000 3.600000 -3.600000
    , Vector.vector 3.600000 -0.900000 -3.600000
    , Vector.vector -0.900000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 0.900000
    , Vector.vector 3.600000 -0.900000 3.600000
    , Vector.vector 3.600000 -3.600000 -0.900000
    , Vector.vector -0.900000 3.600000 3.600000
    , Vector.vector 0.900000 -3.600000 3.600000
    , Vector.vector -3.600000 -0.900000 3.600000
    , Vector.vector -3.600000 3.600000 0.900000
    , Vector.vector -3.600000 0.900000 -3.600000
    , Vector.vector -3.600000 -3.600000 -0.900000
    , Vector.vector -0.900000 3.600000 -3.600000
    , Vector.vector 3.600000 0.900000 -3.600000
    , Vector.vector 0.900000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -0.900000
    , Vector.vector 3.600000 0.900000 3.600000
    , Vector.vector 3.600000 -3.600000 0.900000
    , Vector.vector 0.900000 3.600000 3.600000
    , Vector.vector -0.900000 -3.600000 3.600000
    , Vector.vector -3.600000 -0.900000 -0.000000
    , Vector.vector -3.600000 0.900000 -0.000000
    , Vector.vector -3.600000 0.000000 0.900000
    , Vector.vector -0.000000 -0.900000 -3.600000
    , Vector.vector -0.000000 0.900000 -3.600000
    , Vector.vector -0.900000 0.000000 -3.600000
    , Vector.vector 3.600000 -0.900000 -0.000000
    , Vector.vector 3.600000 0.900000 -0.000000
    , Vector.vector 3.600000 0.000000 -0.900000
    , Vector.vector -0.000000 -0.900000 3.600000
    , Vector.vector -0.000000 0.900000 3.600000
    , Vector.vector 0.900000 0.000000 3.600000
    , Vector.vector 0.900000 -3.600000 -0.000000
    , Vector.vector -0.900000 -3.600000 -0.000000
    , Vector.vector -0.000000 -3.600000 0.900000
    , Vector.vector -0.900000 3.600000 -0.000000
    , Vector.vector 0.900000 3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 0.900000
    , Vector.vector -3.600000 -2.700000 -1.800000
    , Vector.vector -3.600000 -0.900000 -1.800000
    , Vector.vector -3.600000 -1.800000 -0.900000
    , Vector.vector -3.600000 -1.800000 -2.700000
    , Vector.vector 1.800000 -2.700000 -3.600000
    , Vector.vector 1.800000 -0.900000 -3.600000
    , Vector.vector 0.900000 -1.800000 -3.600000
    , Vector.vector 2.700000 -1.800000 -3.600000
    , Vector.vector 3.600000 -2.700000 1.800000
    , Vector.vector 3.600000 -0.900000 1.800000
    , Vector.vector 3.600000 -1.800000 0.900000
    , Vector.vector 3.600000 -1.800000 2.700000
    , Vector.vector -1.800000 -2.700000 3.600000
    , Vector.vector -1.800000 -0.900000 3.600000
    , Vector.vector -0.900000 -1.800000 3.600000
    , Vector.vector -2.700000 -1.800000 3.600000
    , Vector.vector 2.700000 -3.600000 -1.800000
    , Vector.vector 0.900000 -3.600000 -1.800000
    , Vector.vector 1.800000 -3.600000 -0.900000
    , Vector.vector 1.800000 -3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 -1.800000
    , Vector.vector -0.900000 3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 -0.900000
    , Vector.vector -1.800000 3.600000 -2.700000
    , Vector.vector -3.600000 -2.700000 1.800000
    , Vector.vector -3.600000 -0.900000 1.800000
    , Vector.vector -3.600000 -1.800000 2.700000
    , Vector.vector -3.600000 -1.800000 0.900000
    , Vector.vector -3.600000 0.900000 1.800000
    , Vector.vector -3.600000 2.700000 1.800000
    , Vector.vector -3.600000 1.800000 2.700000
    , Vector.vector -3.600000 1.800000 0.900000
    , Vector.vector -3.600000 0.900000 -1.800000
    , Vector.vector -3.600000 2.700000 -1.800000
    , Vector.vector -3.600000 1.800000 -0.900000
    , Vector.vector -3.600000 1.800000 -2.700000
    , Vector.vector -1.800000 -2.700000 -3.600000
    , Vector.vector -1.800000 -0.900000 -3.600000
    , Vector.vector -2.700000 -1.800000 -3.600000
    , Vector.vector -0.900000 -1.800000 -3.600000
    , Vector.vector -1.800000 0.900000 -3.600000
    , Vector.vector -1.800000 2.700000 -3.600000
    , Vector.vector -2.700000 1.800000 -3.600000
    , Vector.vector -0.900000 1.800000 -3.600000
    , Vector.vector 1.800000 0.900000 -3.600000
    , Vector.vector 1.800000 2.700000 -3.600000
    , Vector.vector 0.900000 1.800000 -3.600000
    , Vector.vector 2.700000 1.800000 -3.600000
    , Vector.vector 3.600000 -2.700000 -1.800000
    , Vector.vector 3.600000 -0.900000 -1.800000
    , Vector.vector 3.600000 -1.800000 -2.700000
    , Vector.vector 3.600000 -1.800000 -0.900000
    , Vector.vector 3.600000 0.900000 -1.800000
    , Vector.vector 3.600000 2.700000 -1.800000
    , Vector.vector 3.600000 1.800000 -2.700000
    , Vector.vector 3.600000 1.800000 -0.900000
    , Vector.vector 3.600000 0.900000 1.800000
    , Vector.vector 3.600000 2.700000 1.800000
    , Vector.vector 3.600000 1.800000 0.900000
    , Vector.vector 3.600000 1.800000 2.700000
    , Vector.vector 1.800000 -2.700000 3.600000
    , Vector.vector 1.800000 -0.900000 3.600000
    , Vector.vector 2.700000 -1.800000 3.600000
    , Vector.vector 0.900000 -1.800000 3.600000
    , Vector.vector 1.800000 0.900000 3.600000
    , Vector.vector 1.800000 2.700000 3.600000
    , Vector.vector 2.700000 1.800000 3.600000
    , Vector.vector 0.900000 1.800000 3.600000
    , Vector.vector -1.800000 0.900000 3.600000
    , Vector.vector -1.800000 2.700000 3.600000
    , Vector.vector -0.900000 1.800000 3.600000
    , Vector.vector -2.700000 1.800000 3.600000
    , Vector.vector 2.700000 -3.600000 1.800000
    , Vector.vector 0.900000 -3.600000 1.800000
    , Vector.vector 1.800000 -3.600000 2.700000
    , Vector.vector 1.800000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 1.800000
    , Vector.vector -2.700000 -3.600000 1.800000
    , Vector.vector -1.800000 -3.600000 2.700000
    , Vector.vector -1.800000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 -1.800000
    , Vector.vector -2.700000 -3.600000 -1.800000
    , Vector.vector -1.800000 -3.600000 -0.900000
    , Vector.vector -1.800000 -3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 1.800000
    , Vector.vector -0.900000 3.600000 1.800000
    , Vector.vector -1.800000 3.600000 2.700000
    , Vector.vector -1.800000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 1.800000
    , Vector.vector 2.700000 3.600000 1.800000
    , Vector.vector 1.800000 3.600000 2.700000
    , Vector.vector 1.800000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 -1.800000
    , Vector.vector 2.700000 3.600000 -1.800000
    , Vector.vector 1.800000 3.600000 -0.900000
    , Vector.vector 1.800000 3.600000 -2.700000
    , Vector.vector -3.600000 -2.700000 0.900000
    , Vector.vector -3.600000 0.900000 0.900000
    , Vector.vector -3.600000 0.900000 -2.700000
    , Vector.vector -0.900000 -2.700000 -3.600000
    , Vector.vector -0.900000 0.900000 -3.600000
    , Vector.vector 2.700000 0.900000 -3.600000
    , Vector.vector 3.600000 -2.700000 -0.900000
    , Vector.vector 3.600000 0.900000 -0.900000
    , Vector.vector 3.600000 0.900000 2.700000
    , Vector.vector 0.900000 -2.700000 3.600000
    , Vector.vector 0.900000 0.900000 3.600000
    , Vector.vector -2.700000 0.900000 3.600000
    , Vector.vector 2.700000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 -2.700000
    , Vector.vector -3.600000 -2.700000 -0.900000
    , Vector.vector -3.600000 -0.900000 -0.900000
    , Vector.vector -3.600000 -0.900000 -2.700000
    , Vector.vector 0.900000 -2.700000 -3.600000
    , Vector.vector 0.900000 -0.900000 -3.600000
    , Vector.vector 2.700000 -0.900000 -3.600000
    , Vector.vector 3.600000 -2.700000 0.900000
    , Vector.vector 3.600000 -0.900000 0.900000
    , Vector.vector 3.600000 -0.900000 2.700000
    , Vector.vector -0.900000 -2.700000 3.600000
    , Vector.vector -0.900000 -0.900000 3.600000
    , Vector.vector -2.700000 -0.900000 3.600000
    , Vector.vector 2.700000 -3.600000 -0.900000
    , Vector.vector 0.900000 -3.600000 -0.900000
    , Vector.vector 0.900000 -3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 -0.900000
    , Vector.vector -0.900000 3.600000 -0.900000
    , Vector.vector -0.900000 3.600000 -2.700000
    , Vector.vector -3.600000 -0.900000 2.700000
    , Vector.vector -3.600000 -0.900000 0.900000
    , Vector.vector -3.600000 0.900000 2.700000
    , Vector.vector -3.600000 2.700000 0.900000
    , Vector.vector -3.600000 0.900000 -0.900000
    , Vector.vector -3.600000 2.700000 -0.900000
    , Vector.vector -2.700000 -0.900000 -3.600000
    , Vector.vector -0.900000 -0.900000 -3.600000
    , Vector.vector -2.700000 0.900000 -3.600000
    , Vector.vector -0.900000 2.700000 -3.600000
    , Vector.vector 0.900000 0.900000 -3.600000
    , Vector.vector 0.900000 2.700000 -3.600000
    , Vector.vector 3.600000 -0.900000 -2.700000
    , Vector.vector 3.600000 -0.900000 -0.900000
    , Vector.vector 3.600000 0.900000 -2.700000
    , Vector.vector 3.600000 2.700000 -0.900000
    , Vector.vector 3.600000 0.900000 0.900000
    , Vector.vector 3.600000 2.700000 0.900000
    , Vector.vector 2.700000 -0.900000 3.600000
    , Vector.vector 0.900000 -0.900000 3.600000
    , Vector.vector 2.700000 0.900000 3.600000
    , Vector.vector 0.900000 2.700000 3.600000
    , Vector.vector -0.900000 0.900000 3.600000
    , Vector.vector -0.900000 2.700000 3.600000
    , Vector.vector 0.900000 -3.600000 2.700000
    , Vector.vector 0.900000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 2.700000
    , Vector.vector -2.700000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 -0.900000
    , Vector.vector -2.700000 -3.600000 -0.900000
    , Vector.vector -0.900000 3.600000 2.700000
    , Vector.vector -0.900000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 2.700000
    , Vector.vector 2.700000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 -0.900000
    , Vector.vector 2.700000 3.600000 -0.900000
    , Vector.vector -3.600000 3.150000 3.600000
    , Vector.vector -3.600000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -3.600000
    , Vector.vector -3.600000 -3.600000 3.150000
    , Vector.vector 3.150000 3.600000 -3.600000
    , Vector.vector 3.600000 -3.150000 -3.600000
    , Vector.vector -3.150000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 3.150000
    , Vector.vector 3.600000 -3.150000 3.600000
    , Vector.vector 3.600000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 3.600000
    , Vector.vector 3.150000 -3.600000 3.600000
    , Vector.vector -3.600000 -3.150000 3.600000
    , Vector.vector -3.600000 3.600000 3.150000
    , Vector.vector -3.600000 3.150000 -3.600000
    , Vector.vector -3.600000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -3.600000
    , Vector.vector 3.600000 3.150000 -3.600000
    , Vector.vector 3.150000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -3.150000
    , Vector.vector 3.600000 3.150000 3.600000
    , Vector.vector 3.600000 -3.600000 3.150000
    , Vector.vector 3.150000 3.600000 3.600000
    , Vector.vector -3.150000 -3.600000 3.600000
    , Vector.vector -3.600000 -3.150000 -0.000000
    , Vector.vector -3.600000 3.150000 -0.000000
    , Vector.vector -3.600000 0.000000 3.150000
    , Vector.vector -3.600000 0.000000 -0.450000
    , Vector.vector -0.000000 -3.150000 -3.600000
    , Vector.vector -0.000000 3.150000 -3.600000
    , Vector.vector -3.150000 0.000000 -3.600000
    , Vector.vector 0.450000 0.000000 -3.600000
    , Vector.vector 3.600000 -3.150000 -0.000000
    , Vector.vector 3.600000 3.150000 -0.000000
    , Vector.vector 3.600000 0.000000 -3.150000
    , Vector.vector 3.600000 0.000000 0.450000
    , Vector.vector -0.000000 -3.150000 3.600000
    , Vector.vector -0.000000 3.150000 3.600000
    , Vector.vector 3.150000 0.000000 3.600000
    , Vector.vector -0.450000 0.000000 3.600000
    , Vector.vector 3.150000 -3.600000 -0.000000
    , Vector.vector -3.150000 -3.600000 -0.000000
    , Vector.vector -0.000000 -3.600000 3.150000
    , Vector.vector -0.000000 -3.600000 -0.450000
    , Vector.vector -3.150000 3.600000 -0.000000
    , Vector.vector 3.150000 3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 3.150000
    , Vector.vector -0.000000 3.600000 -0.450000
    , Vector.vector -3.600000 0.450000 3.600000
    , Vector.vector -3.600000 3.600000 -0.450000
    , Vector.vector -3.600000 -0.450000 -3.600000
    , Vector.vector -3.600000 -3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -3.600000
    , Vector.vector 3.600000 -0.450000 -3.600000
    , Vector.vector -0.450000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 0.450000
    , Vector.vector 3.600000 -0.450000 3.600000
    , Vector.vector 3.600000 -3.600000 -0.450000
    , Vector.vector -0.450000 3.600000 3.600000
    , Vector.vector 0.450000 -3.600000 3.600000
    , Vector.vector -3.600000 -0.450000 3.600000
    , Vector.vector -3.600000 3.600000 0.450000
    , Vector.vector -3.600000 0.450000 -3.600000
    , Vector.vector -3.600000 -3.600000 -0.450000
    , Vector.vector -0.450000 3.600000 -3.600000
    , Vector.vector 3.600000 0.450000 -3.600000
    , Vector.vector 0.450000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -0.450000
    , Vector.vector 3.600000 0.450000 3.600000
    , Vector.vector 3.600000 -3.600000 0.450000
    , Vector.vector 0.450000 3.600000 3.600000
    , Vector.vector -0.450000 -3.600000 3.600000
    , Vector.vector -3.600000 -0.450000 -0.000000
    , Vector.vector -3.600000 0.450000 -0.000000
    , Vector.vector -3.600000 0.000000 0.450000
    , Vector.vector -3.600000 0.000000 -3.150000
    , Vector.vector -0.000000 -0.450000 -3.600000
    , Vector.vector -0.000000 0.450000 -3.600000
    , Vector.vector -0.450000 0.000000 -3.600000
    , Vector.vector 3.150000 0.000000 -3.600000
    , Vector.vector 3.600000 -0.450000 -0.000000
    , Vector.vector 3.600000 0.450000 -0.000000
    , Vector.vector 3.600000 0.000000 -0.450000
    , Vector.vector 3.600000 0.000000 3.150000
    , Vector.vector -0.000000 -0.450000 3.600000
    , Vector.vector -0.000000 0.450000 3.600000
    , Vector.vector 0.450000 0.000000 3.600000
    , Vector.vector -3.150000 0.000000 3.600000
    , Vector.vector 0.450000 -3.600000 -0.000000
    , Vector.vector -0.450000 -3.600000 -0.000000
    , Vector.vector -0.000000 -3.600000 0.450000
    , Vector.vector -0.000000 -3.600000 -3.150000
    , Vector.vector -0.450000 3.600000 -0.000000
    , Vector.vector 0.450000 3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 0.450000
    , Vector.vector -0.000000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -1.800000
    , Vector.vector -3.600000 -0.450000 -1.800000
    , Vector.vector -3.600000 -1.800000 -0.450000
    , Vector.vector -3.600000 -1.800000 -2.250000
    , Vector.vector 1.800000 -3.150000 -3.600000
    , Vector.vector 1.800000 -0.450000 -3.600000
    , Vector.vector 0.450000 -1.800000 -3.600000
    , Vector.vector 2.250000 -1.800000 -3.600000
    , Vector.vector 3.600000 -3.150000 1.800000
    , Vector.vector 3.600000 -0.450000 1.800000
    , Vector.vector 3.600000 -1.800000 0.450000
    , Vector.vector 3.600000 -1.800000 2.250000
    , Vector.vector -1.800000 -3.150000 3.600000
    , Vector.vector -1.800000 -0.450000 3.600000
    , Vector.vector -0.450000 -1.800000 3.600000
    , Vector.vector -2.250000 -1.800000 3.600000
    , Vector.vector 3.150000 -3.600000 -1.800000
    , Vector.vector 0.450000 -3.600000 -1.800000
    , Vector.vector 1.800000 -3.600000 -0.450000
    , Vector.vector 1.800000 -3.600000 -2.250000
    , Vector.vector -3.150000 3.600000 -1.800000
    , Vector.vector -0.450000 3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 -0.450000
    , Vector.vector -1.800000 3.600000 -2.250000
    , Vector.vector -3.600000 -3.150000 1.800000
    , Vector.vector -3.600000 -0.450000 1.800000
    , Vector.vector -3.600000 -1.800000 3.150000
    , Vector.vector -3.600000 -1.800000 1.350000
    , Vector.vector -3.600000 0.450000 1.800000
    , Vector.vector -3.600000 3.150000 1.800000
    , Vector.vector -3.600000 1.800000 3.150000
    , Vector.vector -3.600000 1.800000 1.350000
    , Vector.vector -3.600000 0.450000 -1.800000
    , Vector.vector -3.600000 3.150000 -1.800000
    , Vector.vector -3.600000 1.800000 -0.450000
    , Vector.vector -3.600000 1.800000 -2.250000
    , Vector.vector -1.800000 -3.150000 -3.600000
    , Vector.vector -1.800000 -0.450000 -3.600000
    , Vector.vector -3.150000 -1.800000 -3.600000
    , Vector.vector -1.350000 -1.800000 -3.600000
    , Vector.vector -1.800000 0.450000 -3.600000
    , Vector.vector -1.800000 3.150000 -3.600000
    , Vector.vector -3.150000 1.800000 -3.600000
    , Vector.vector -1.350000 1.800000 -3.600000
    , Vector.vector 1.800000 0.450000 -3.600000
    , Vector.vector 1.800000 3.150000 -3.600000
    , Vector.vector 0.450000 1.800000 -3.600000
    , Vector.vector 2.250000 1.800000 -3.600000
    , Vector.vector 3.600000 -3.150000 -1.800000
    , Vector.vector 3.600000 -0.450000 -1.800000
    , Vector.vector 3.600000 -1.800000 -3.150000
    , Vector.vector 3.600000 -1.800000 -1.350000
    , Vector.vector 3.600000 0.450000 -1.800000
    , Vector.vector 3.600000 3.150000 -1.800000
    , Vector.vector 3.600000 1.800000 -3.150000
    , Vector.vector 3.600000 1.800000 -1.350000
    , Vector.vector 3.600000 0.450000 1.800000
    , Vector.vector 3.600000 3.150000 1.800000
    , Vector.vector 3.600000 1.800000 0.450000
    , Vector.vector 3.600000 1.800000 2.250000
    , Vector.vector 1.800000 -3.150000 3.600000
    , Vector.vector 1.800000 -0.450000 3.600000
    , Vector.vector 3.150000 -1.800000 3.600000
    , Vector.vector 1.350000 -1.800000 3.600000
    , Vector.vector 1.800000 0.450000 3.600000
    , Vector.vector 1.800000 3.150000 3.600000
    , Vector.vector 3.150000 1.800000 3.600000
    , Vector.vector 1.350000 1.800000 3.600000
    , Vector.vector -1.800000 0.450000 3.600000
    , Vector.vector -1.800000 3.150000 3.600000
    , Vector.vector -0.450000 1.800000 3.600000
    , Vector.vector -2.250000 1.800000 3.600000
    , Vector.vector 3.150000 -3.600000 1.800000
    , Vector.vector 0.450000 -3.600000 1.800000
    , Vector.vector 1.800000 -3.600000 3.150000
    , Vector.vector 1.800000 -3.600000 1.350000
    , Vector.vector -0.450000 -3.600000 1.800000
    , Vector.vector -3.150000 -3.600000 1.800000
    , Vector.vector -1.800000 -3.600000 3.150000
    , Vector.vector -1.800000 -3.600000 1.350000
    , Vector.vector -0.450000 -3.600000 -1.800000
    , Vector.vector -3.150000 -3.600000 -1.800000
    , Vector.vector -1.800000 -3.600000 -0.450000
    , Vector.vector -1.800000 -3.600000 -2.250000
    , Vector.vector -3.150000 3.600000 1.800000
    , Vector.vector -0.450000 3.600000 1.800000
    , Vector.vector -1.800000 3.600000 3.150000
    , Vector.vector -1.800000 3.600000 1.350000
    , Vector.vector 0.450000 3.600000 1.800000
    , Vector.vector 3.150000 3.600000 1.800000
    , Vector.vector 1.800000 3.600000 3.150000
    , Vector.vector 1.800000 3.600000 1.350000
    , Vector.vector 0.450000 3.600000 -1.800000
    , Vector.vector 3.150000 3.600000 -1.800000
    , Vector.vector 1.800000 3.600000 -0.450000
    , Vector.vector 1.800000 3.600000 -2.250000
    , Vector.vector -3.600000 2.250000 3.600000
    , Vector.vector -3.600000 3.600000 -2.250000
    , Vector.vector -3.600000 -2.250000 -3.600000
    , Vector.vector -3.600000 -3.600000 2.250000
    , Vector.vector 2.250000 3.600000 -3.600000
    , Vector.vector 3.600000 -2.250000 -3.600000
    , Vector.vector -2.250000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 2.250000
    , Vector.vector 3.600000 -2.250000 3.600000
    , Vector.vector 3.600000 -3.600000 -2.250000
    , Vector.vector -2.250000 3.600000 3.600000
    , Vector.vector 2.250000 -3.600000 3.600000
    , Vector.vector -3.600000 -2.250000 3.600000
    , Vector.vector -3.600000 3.600000 2.250000
    , Vector.vector -3.600000 2.250000 -3.600000
    , Vector.vector -3.600000 -3.600000 -2.250000
    , Vector.vector -2.250000 3.600000 -3.600000
    , Vector.vector 3.600000 2.250000 -3.600000
    , Vector.vector 2.250000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -2.250000
    , Vector.vector 3.600000 2.250000 3.600000
    , Vector.vector 3.600000 -3.600000 2.250000
    , Vector.vector 2.250000 3.600000 3.600000
    , Vector.vector -2.250000 -3.600000 3.600000
    , Vector.vector -3.600000 -2.250000 -0.000000
    , Vector.vector -3.600000 2.250000 -0.000000
    , Vector.vector -3.600000 0.000000 2.250000
    , Vector.vector -0.000000 -2.250000 -3.600000
    , Vector.vector -0.000000 2.250000 -3.600000
    , Vector.vector -2.250000 0.000000 -3.600000
    , Vector.vector 3.600000 -2.250000 -0.000000
    , Vector.vector 3.600000 2.250000 -0.000000
    , Vector.vector 3.600000 0.000000 -2.250000
    , Vector.vector -0.000000 -2.250000 3.600000
    , Vector.vector -0.000000 2.250000 3.600000
    , Vector.vector 2.250000 0.000000 3.600000
    , Vector.vector 2.250000 -3.600000 -0.000000
    , Vector.vector -2.250000 -3.600000 -0.000000
    , Vector.vector -0.000000 -3.600000 2.250000
    , Vector.vector -2.250000 3.600000 -0.000000
    , Vector.vector 2.250000 3.600000 -0.000000
    , Vector.vector -0.000000 3.600000 2.250000
    , Vector.vector -3.600000 1.350000 3.600000
    , Vector.vector -3.600000 3.600000 -1.350000
    , Vector.vector -3.600000 -1.350000 -3.600000
    , Vector.vector -3.600000 -3.600000 1.350000
    , Vector.vector 1.350000 3.600000 -3.600000
    , Vector.vector 3.600000 -1.350000 -3.600000
    , Vector.vector -1.350000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 1.350000
    , Vector.vector 3.600000 -1.350000 3.600000
    , Vector.vector 3.600000 -3.600000 -1.350000
    , Vector.vector -1.350000 3.600000 3.600000
    , Vector.vector 1.350000 -3.600000 3.600000
    , Vector.vector -3.600000 -1.350000 3.600000
    , Vector.vector -3.600000 3.600000 1.350000
    , Vector.vector -3.600000 1.350000 -3.600000
    , Vector.vector -3.600000 -3.600000 -1.350000
    , Vector.vector -1.350000 3.600000 -3.600000
    , Vector.vector 3.600000 1.350000 -3.600000
    , Vector.vector 1.350000 -3.600000 -3.600000
    , Vector.vector 3.600000 3.600000 -1.350000
    , Vector.vector 3.600000 1.350000 3.600000
    , Vector.vector 3.600000 -3.600000 1.350000
    , Vector.vector 1.350000 3.600000 3.600000
    , Vector.vector -1.350000 -3.600000 3.600000
    , Vector.vector -3.600000 0.000000 -2.250000
    , Vector.vector 2.250000 0.000000 -3.600000
    , Vector.vector 3.600000 0.000000 2.250000
    , Vector.vector -2.250000 0.000000 3.600000
    , Vector.vector -0.000000 -3.600000 -2.250000
    , Vector.vector -0.000000 3.600000 -2.250000
    , Vector.vector -3.600000 -2.250000 -1.800000
    , Vector.vector -3.600000 -1.350000 -1.800000
    , Vector.vector -3.600000 -1.800000 -1.350000
    , Vector.vector -3.600000 -1.800000 -3.150000
    , Vector.vector 1.800000 -2.250000 -3.600000
    , Vector.vector 1.800000 -1.350000 -3.600000
    , Vector.vector 1.350000 -1.800000 -3.600000
    , Vector.vector 3.150000 -1.800000 -3.600000
    , Vector.vector 3.600000 -2.250000 1.800000
    , Vector.vector 3.600000 -1.350000 1.800000
    , Vector.vector 3.600000 -1.800000 1.350000
    , Vector.vector 3.600000 -1.800000 3.150000
    , Vector.vector -1.800000 -2.250000 3.600000
    , Vector.vector -1.800000 -1.350000 3.600000
    , Vector.vector -1.350000 -1.800000 3.600000
    , Vector.vector -3.150000 -1.800000 3.600000
    , Vector.vector 2.250000 -3.600000 -1.800000
    , Vector.vector 1.350000 -3.600000 -1.800000
    , Vector.vector 1.800000 -3.600000 -1.350000
    , Vector.vector 1.800000 -3.600000 -3.150000
    , Vector.vector -2.250000 3.600000 -1.800000
    , Vector.vector -1.350000 3.600000 -1.800000
    , Vector.vector -1.800000 3.600000 -1.350000
    , Vector.vector -1.800000 3.600000 -3.150000
    , Vector.vector -3.600000 -2.250000 1.800000
    , Vector.vector -3.600000 -1.350000 1.800000
    , Vector.vector -3.600000 -1.800000 2.250000
    , Vector.vector -3.600000 -1.800000 0.450000
    , Vector.vector -3.600000 1.350000 1.800000
    , Vector.vector -3.600000 2.250000 1.800000
    , Vector.vector -3.600000 1.800000 2.250000
    , Vector.vector -3.600000 1.800000 0.450000
    , Vector.vector -3.600000 1.350000 -1.800000
    , Vector.vector -3.600000 2.250000 -1.800000
    , Vector.vector -3.600000 1.800000 -1.350000
    , Vector.vector -3.600000 1.800000 -3.150000
    , Vector.vector -1.800000 -2.250000 -3.600000
    , Vector.vector -1.800000 -1.350000 -3.600000
    , Vector.vector -2.250000 -1.800000 -3.600000
    , Vector.vector -0.450000 -1.800000 -3.600000
    , Vector.vector -1.800000 1.350000 -3.600000
    , Vector.vector -1.800000 2.250000 -3.600000
    , Vector.vector -2.250000 1.800000 -3.600000
    , Vector.vector -0.450000 1.800000 -3.600000
    , Vector.vector 1.800000 1.350000 -3.600000
    , Vector.vector 1.800000 2.250000 -3.600000
    , Vector.vector 1.350000 1.800000 -3.600000
    , Vector.vector 3.150000 1.800000 -3.600000
    , Vector.vector 3.600000 -2.250000 -1.800000
    , Vector.vector 3.600000 -1.350000 -1.800000
    , Vector.vector 3.600000 -1.800000 -2.250000
    , Vector.vector 3.600000 -1.800000 -0.450000
    , Vector.vector 3.600000 1.350000 -1.800000
    , Vector.vector 3.600000 2.250000 -1.800000
    , Vector.vector 3.600000 1.800000 -2.250000
    , Vector.vector 3.600000 1.800000 -0.450000
    , Vector.vector 3.600000 1.350000 1.800000
    , Vector.vector 3.600000 2.250000 1.800000
    , Vector.vector 3.600000 1.800000 1.350000
    , Vector.vector 3.600000 1.800000 3.150000
    , Vector.vector 1.800000 -2.250000 3.600000
    , Vector.vector 1.800000 -1.350000 3.600000
    , Vector.vector 2.250000 -1.800000 3.600000
    , Vector.vector 0.450000 -1.800000 3.600000
    , Vector.vector 1.800000 1.350000 3.600000
    , Vector.vector 1.800000 2.250000 3.600000
    , Vector.vector 2.250000 1.800000 3.600000
    , Vector.vector 0.450000 1.800000 3.600000
    , Vector.vector -1.800000 1.350000 3.600000
    , Vector.vector -1.800000 2.250000 3.600000
    , Vector.vector -1.350000 1.800000 3.600000
    , Vector.vector -3.150000 1.800000 3.600000
    , Vector.vector 2.250000 -3.600000 1.800000
    , Vector.vector 1.350000 -3.600000 1.800000
    , Vector.vector 1.800000 -3.600000 2.250000
    , Vector.vector 1.800000 -3.600000 0.450000
    , Vector.vector -1.350000 -3.600000 1.800000
    , Vector.vector -2.250000 -3.600000 1.800000
    , Vector.vector -1.800000 -3.600000 2.250000
    , Vector.vector -1.800000 -3.600000 0.450000
    , Vector.vector -1.350000 -3.600000 -1.800000
    , Vector.vector -2.250000 -3.600000 -1.800000
    , Vector.vector -1.800000 -3.600000 -1.350000
    , Vector.vector -1.800000 -3.600000 -3.150000
    , Vector.vector -2.250000 3.600000 1.800000
    , Vector.vector -1.350000 3.600000 1.800000
    , Vector.vector -1.800000 3.600000 2.250000
    , Vector.vector -1.800000 3.600000 0.450000
    , Vector.vector 1.350000 3.600000 1.800000
    , Vector.vector 2.250000 3.600000 1.800000
    , Vector.vector 1.800000 3.600000 2.250000
    , Vector.vector 1.800000 3.600000 0.450000
    , Vector.vector 1.350000 3.600000 -1.800000
    , Vector.vector 2.250000 3.600000 -1.800000
    , Vector.vector 1.800000 3.600000 -1.350000
    , Vector.vector 1.800000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -2.700000
    , Vector.vector -3.600000 -2.250000 -2.700000
    , Vector.vector -3.600000 -2.700000 -2.250000
    , Vector.vector -3.600000 -2.700000 -3.150000
    , Vector.vector 2.700000 -3.150000 -3.600000
    , Vector.vector 2.700000 -2.250000 -3.600000
    , Vector.vector 2.250000 -2.700000 -3.600000
    , Vector.vector 3.150000 -2.700000 -3.600000
    , Vector.vector 3.600000 -3.150000 2.700000
    , Vector.vector 3.600000 -2.250000 2.700000
    , Vector.vector 3.600000 -2.700000 2.250000
    , Vector.vector 3.600000 -2.700000 3.150000
    , Vector.vector -2.700000 -3.150000 3.600000
    , Vector.vector -2.700000 -2.250000 3.600000
    , Vector.vector -2.250000 -2.700000 3.600000
    , Vector.vector -3.150000 -2.700000 3.600000
    , Vector.vector 3.150000 -3.600000 -2.700000
    , Vector.vector 2.250000 -3.600000 -2.700000
    , Vector.vector 2.700000 -3.600000 -2.250000
    , Vector.vector 2.700000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -2.700000
    , Vector.vector -2.250000 3.600000 -2.700000
    , Vector.vector -2.700000 3.600000 -2.250000
    , Vector.vector -2.700000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 0.900000
    , Vector.vector -3.600000 -2.250000 0.900000
    , Vector.vector -3.600000 -2.700000 0.450000
    , Vector.vector -3.600000 0.450000 0.900000
    , Vector.vector -3.600000 1.350000 0.900000
    , Vector.vector -3.600000 0.900000 1.350000
    , Vector.vector -3.600000 0.900000 0.450000
    , Vector.vector -3.600000 0.450000 -2.700000
    , Vector.vector -3.600000 0.900000 -2.250000
    , Vector.vector -3.600000 0.900000 -3.150000
    , Vector.vector -0.900000 -3.150000 -3.600000
    , Vector.vector -0.900000 -2.250000 -3.600000
    , Vector.vector -0.450000 -2.700000 -3.600000
    , Vector.vector -0.900000 0.450000 -3.600000
    , Vector.vector -0.900000 1.350000 -3.600000
    , Vector.vector -1.350000 0.900000 -3.600000
    , Vector.vector -0.450000 0.900000 -3.600000
    , Vector.vector 2.700000 0.450000 -3.600000
    , Vector.vector 2.250000 0.900000 -3.600000
    , Vector.vector 3.150000 0.900000 -3.600000
    , Vector.vector 3.600000 -3.150000 -0.900000
    , Vector.vector 3.600000 -2.250000 -0.900000
    , Vector.vector 3.600000 -2.700000 -0.450000
    , Vector.vector 3.600000 0.450000 -0.900000
    , Vector.vector 3.600000 1.350000 -0.900000
    , Vector.vector 3.600000 0.900000 -1.350000
    , Vector.vector 3.600000 0.900000 -0.450000
    , Vector.vector 3.600000 0.450000 2.700000
    , Vector.vector 3.600000 0.900000 2.250000
    , Vector.vector 3.600000 0.900000 3.150000
    , Vector.vector 0.900000 -3.150000 3.600000
    , Vector.vector 0.900000 -2.250000 3.600000
    , Vector.vector 0.450000 -2.700000 3.600000
    , Vector.vector 0.900000 0.450000 3.600000
    , Vector.vector 0.900000 1.350000 3.600000
    , Vector.vector 1.350000 0.900000 3.600000
    , Vector.vector 0.450000 0.900000 3.600000
    , Vector.vector -2.700000 0.450000 3.600000
    , Vector.vector -2.250000 0.900000 3.600000
    , Vector.vector -3.150000 0.900000 3.600000
    , Vector.vector 3.150000 -3.600000 0.900000
    , Vector.vector 2.250000 -3.600000 0.900000
    , Vector.vector 2.700000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 0.900000
    , Vector.vector -1.350000 -3.600000 0.900000
    , Vector.vector -0.900000 -3.600000 1.350000
    , Vector.vector -0.900000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 -2.700000
    , Vector.vector -0.900000 -3.600000 -2.250000
    , Vector.vector -0.900000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 0.900000
    , Vector.vector -2.250000 3.600000 0.900000
    , Vector.vector -2.700000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 0.900000
    , Vector.vector 1.350000 3.600000 0.900000
    , Vector.vector 0.900000 3.600000 1.350000
    , Vector.vector 0.900000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -2.700000
    , Vector.vector 0.900000 3.600000 -2.250000
    , Vector.vector 0.900000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -0.900000
    , Vector.vector -3.600000 -2.250000 -0.900000
    , Vector.vector -3.600000 -2.700000 -0.450000
    , Vector.vector -3.600000 -1.350000 -0.900000
    , Vector.vector -3.600000 -0.450000 -0.900000
    , Vector.vector -3.600000 -0.900000 -0.450000
    , Vector.vector -3.600000 -0.900000 -1.350000
    , Vector.vector -3.600000 -0.450000 -2.700000
    , Vector.vector -3.600000 -0.900000 -2.250000
    , Vector.vector -3.600000 -0.900000 -3.150000
    , Vector.vector 0.900000 -3.150000 -3.600000
    , Vector.vector 0.900000 -2.250000 -3.600000
    , Vector.vector 0.450000 -2.700000 -3.600000
    , Vector.vector 0.900000 -1.350000 -3.600000
    , Vector.vector 0.900000 -0.450000 -3.600000
    , Vector.vector 0.450000 -0.900000 -3.600000
    , Vector.vector 1.350000 -0.900000 -3.600000
    , Vector.vector 2.700000 -0.450000 -3.600000
    , Vector.vector 2.250000 -0.900000 -3.600000
    , Vector.vector 3.150000 -0.900000 -3.600000
    , Vector.vector 3.600000 -3.150000 0.900000
    , Vector.vector 3.600000 -2.250000 0.900000
    , Vector.vector 3.600000 -2.700000 0.450000
    , Vector.vector 3.600000 -1.350000 0.900000
    , Vector.vector 3.600000 -0.450000 0.900000
    , Vector.vector 3.600000 -0.900000 0.450000
    , Vector.vector 3.600000 -0.900000 1.350000
    , Vector.vector 3.600000 -0.450000 2.700000
    , Vector.vector 3.600000 -0.900000 2.250000
    , Vector.vector 3.600000 -0.900000 3.150000
    , Vector.vector -0.900000 -3.150000 3.600000
    , Vector.vector -0.900000 -2.250000 3.600000
    , Vector.vector -0.450000 -2.700000 3.600000
    , Vector.vector -0.900000 -1.350000 3.600000
    , Vector.vector -0.900000 -0.450000 3.600000
    , Vector.vector -0.450000 -0.900000 3.600000
    , Vector.vector -1.350000 -0.900000 3.600000
    , Vector.vector -2.700000 -0.450000 3.600000
    , Vector.vector -2.250000 -0.900000 3.600000
    , Vector.vector -3.150000 -0.900000 3.600000
    , Vector.vector 3.150000 -3.600000 -0.900000
    , Vector.vector 2.250000 -3.600000 -0.900000
    , Vector.vector 2.700000 -3.600000 -0.450000
    , Vector.vector 1.350000 -3.600000 -0.900000
    , Vector.vector 0.450000 -3.600000 -0.900000
    , Vector.vector 0.900000 -3.600000 -0.450000
    , Vector.vector 0.900000 -3.600000 -1.350000
    , Vector.vector 0.450000 -3.600000 -2.700000
    , Vector.vector 0.900000 -3.600000 -2.250000
    , Vector.vector 0.900000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -0.900000
    , Vector.vector -2.250000 3.600000 -0.900000
    , Vector.vector -2.700000 3.600000 -0.450000
    , Vector.vector -1.350000 3.600000 -0.900000
    , Vector.vector -0.450000 3.600000 -0.900000
    , Vector.vector -0.900000 3.600000 -0.450000
    , Vector.vector -0.900000 3.600000 -1.350000
    , Vector.vector -0.450000 3.600000 -2.700000
    , Vector.vector -0.900000 3.600000 -2.250000
    , Vector.vector -0.900000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 2.700000
    , Vector.vector -3.600000 -2.250000 2.700000
    , Vector.vector -3.600000 -2.700000 3.150000
    , Vector.vector -3.600000 -2.700000 2.250000
    , Vector.vector -3.600000 -0.450000 2.700000
    , Vector.vector -3.600000 -0.900000 3.150000
    , Vector.vector -3.600000 -0.900000 2.250000
    , Vector.vector -3.600000 -1.350000 0.900000
    , Vector.vector -3.600000 -0.450000 0.900000
    , Vector.vector -3.600000 -0.900000 1.350000
    , Vector.vector -3.600000 -0.900000 0.450000
    , Vector.vector -3.600000 0.450000 2.700000
    , Vector.vector -3.600000 0.900000 3.150000
    , Vector.vector -3.600000 0.900000 2.250000
    , Vector.vector -3.600000 2.250000 2.700000
    , Vector.vector -3.600000 3.150000 2.700000
    , Vector.vector -3.600000 2.700000 3.150000
    , Vector.vector -3.600000 2.700000 2.250000
    , Vector.vector -3.600000 2.250000 0.900000
    , Vector.vector -3.600000 3.150000 0.900000
    , Vector.vector -3.600000 2.700000 0.450000
    , Vector.vector -3.600000 0.450000 -0.900000
    , Vector.vector -3.600000 1.350000 -0.900000
    , Vector.vector -3.600000 0.900000 -0.450000
    , Vector.vector -3.600000 0.900000 -1.350000
    , Vector.vector -3.600000 2.250000 -0.900000
    , Vector.vector -3.600000 3.150000 -0.900000
    , Vector.vector -3.600000 2.700000 -0.450000
    , Vector.vector -3.600000 2.250000 -2.700000
    , Vector.vector -3.600000 3.150000 -2.700000
    , Vector.vector -3.600000 2.700000 -2.250000
    , Vector.vector -3.600000 2.700000 -3.150000
    , Vector.vector -2.700000 -3.150000 -3.600000
    , Vector.vector -2.700000 -2.250000 -3.600000
    , Vector.vector -3.150000 -2.700000 -3.600000
    , Vector.vector -2.250000 -2.700000 -3.600000
    , Vector.vector -2.700000 -0.450000 -3.600000
    , Vector.vector -3.150000 -0.900000 -3.600000
    , Vector.vector -2.250000 -0.900000 -3.600000
    , Vector.vector -0.900000 -1.350000 -3.600000
    , Vector.vector -0.900000 -0.450000 -3.600000
    , Vector.vector -1.350000 -0.900000 -3.600000
    , Vector.vector -0.450000 -0.900000 -3.600000
    , Vector.vector -2.700000 0.450000 -3.600000
    , Vector.vector -3.150000 0.900000 -3.600000
    , Vector.vector -2.250000 0.900000 -3.600000
    , Vector.vector -2.700000 2.250000 -3.600000
    , Vector.vector -2.700000 3.150000 -3.600000
    , Vector.vector -3.150000 2.700000 -3.600000
    , Vector.vector -2.250000 2.700000 -3.600000
    , Vector.vector -0.900000 2.250000 -3.600000
    , Vector.vector -0.900000 3.150000 -3.600000
    , Vector.vector -0.450000 2.700000 -3.600000
    , Vector.vector 0.900000 0.450000 -3.600000
    , Vector.vector 0.900000 1.350000 -3.600000
    , Vector.vector 0.450000 0.900000 -3.600000
    , Vector.vector 1.350000 0.900000 -3.600000
    , Vector.vector 0.900000 2.250000 -3.600000
    , Vector.vector 0.900000 3.150000 -3.600000
    , Vector.vector 0.450000 2.700000 -3.600000
    , Vector.vector 2.700000 2.250000 -3.600000
    , Vector.vector 2.700000 3.150000 -3.600000
    , Vector.vector 2.250000 2.700000 -3.600000
    , Vector.vector 3.150000 2.700000 -3.600000
    , Vector.vector 3.600000 -3.150000 -2.700000
    , Vector.vector 3.600000 -2.250000 -2.700000
    , Vector.vector 3.600000 -2.700000 -3.150000
    , Vector.vector 3.600000 -2.700000 -2.250000
    , Vector.vector 3.600000 -0.450000 -2.700000
    , Vector.vector 3.600000 -0.900000 -3.150000
    , Vector.vector 3.600000 -0.900000 -2.250000
    , Vector.vector 3.600000 -1.350000 -0.900000
    , Vector.vector 3.600000 -0.450000 -0.900000
    , Vector.vector 3.600000 -0.900000 -1.350000
    , Vector.vector 3.600000 -0.900000 -0.450000
    , Vector.vector 3.600000 0.450000 -2.700000
    , Vector.vector 3.600000 0.900000 -3.150000
    , Vector.vector 3.600000 0.900000 -2.250000
    , Vector.vector 3.600000 2.250000 -2.700000
    , Vector.vector 3.600000 3.150000 -2.700000
    , Vector.vector 3.600000 2.700000 -3.150000
    , Vector.vector 3.600000 2.700000 -2.250000
    , Vector.vector 3.600000 2.250000 -0.900000
    , Vector.vector 3.600000 3.150000 -0.900000
    , Vector.vector 3.600000 2.700000 -0.450000
    , Vector.vector 3.600000 0.450000 0.900000
    , Vector.vector 3.600000 1.350000 0.900000
    , Vector.vector 3.600000 0.900000 0.450000
    , Vector.vector 3.600000 0.900000 1.350000
    , Vector.vector 3.600000 2.250000 0.900000
    , Vector.vector 3.600000 3.150000 0.900000
    , Vector.vector 3.600000 2.700000 0.450000
    , Vector.vector 3.600000 2.250000 2.700000
    , Vector.vector 3.600000 3.150000 2.700000
    , Vector.vector 3.600000 2.700000 2.250000
    , Vector.vector 3.600000 2.700000 3.150000
    , Vector.vector 2.700000 -3.150000 3.600000
    , Vector.vector 2.700000 -2.250000 3.600000
    , Vector.vector 3.150000 -2.700000 3.600000
    , Vector.vector 2.250000 -2.700000 3.600000
    , Vector.vector 2.700000 -0.450000 3.600000
    , Vector.vector 3.150000 -0.900000 3.600000
    , Vector.vector 2.250000 -0.900000 3.600000
    , Vector.vector 0.900000 -1.350000 3.600000
    , Vector.vector 0.900000 -0.450000 3.600000
    , Vector.vector 1.350000 -0.900000 3.600000
    , Vector.vector 0.450000 -0.900000 3.600000
    , Vector.vector 2.700000 0.450000 3.600000
    , Vector.vector 3.150000 0.900000 3.600000
    , Vector.vector 2.250000 0.900000 3.600000
    , Vector.vector 2.700000 2.250000 3.600000
    , Vector.vector 2.700000 3.150000 3.600000
    , Vector.vector 3.150000 2.700000 3.600000
    , Vector.vector 2.250000 2.700000 3.600000
    , Vector.vector 0.900000 2.250000 3.600000
    , Vector.vector 0.900000 3.150000 3.600000
    , Vector.vector 0.450000 2.700000 3.600000
    , Vector.vector -0.900000 0.450000 3.600000
    , Vector.vector -0.900000 1.350000 3.600000
    , Vector.vector -0.450000 0.900000 3.600000
    , Vector.vector -1.350000 0.900000 3.600000
    , Vector.vector -0.900000 2.250000 3.600000
    , Vector.vector -0.900000 3.150000 3.600000
    , Vector.vector -0.450000 2.700000 3.600000
    , Vector.vector -2.700000 2.250000 3.600000
    , Vector.vector -2.700000 3.150000 3.600000
    , Vector.vector -2.250000 2.700000 3.600000
    , Vector.vector -3.150000 2.700000 3.600000
    , Vector.vector 3.150000 -3.600000 2.700000
    , Vector.vector 2.250000 -3.600000 2.700000
    , Vector.vector 2.700000 -3.600000 3.150000
    , Vector.vector 2.700000 -3.600000 2.250000
    , Vector.vector 0.450000 -3.600000 2.700000
    , Vector.vector 0.900000 -3.600000 3.150000
    , Vector.vector 0.900000 -3.600000 2.250000
    , Vector.vector 1.350000 -3.600000 0.900000
    , Vector.vector 0.450000 -3.600000 0.900000
    , Vector.vector 0.900000 -3.600000 1.350000
    , Vector.vector 0.900000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 2.700000
    , Vector.vector -0.900000 -3.600000 3.150000
    , Vector.vector -0.900000 -3.600000 2.250000
    , Vector.vector -2.250000 -3.600000 2.700000
    , Vector.vector -3.150000 -3.600000 2.700000
    , Vector.vector -2.700000 -3.600000 3.150000
    , Vector.vector -2.700000 -3.600000 2.250000
    , Vector.vector -2.250000 -3.600000 0.900000
    , Vector.vector -3.150000 -3.600000 0.900000
    , Vector.vector -2.700000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 -0.900000
    , Vector.vector -1.350000 -3.600000 -0.900000
    , Vector.vector -0.900000 -3.600000 -0.450000
    , Vector.vector -0.900000 -3.600000 -1.350000
    , Vector.vector -2.250000 -3.600000 -0.900000
    , Vector.vector -3.150000 -3.600000 -0.900000
    , Vector.vector -2.700000 -3.600000 -0.450000
    , Vector.vector -2.250000 -3.600000 -2.700000
    , Vector.vector -3.150000 -3.600000 -2.700000
    , Vector.vector -2.700000 -3.600000 -2.250000
    , Vector.vector -2.700000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 2.700000
    , Vector.vector -2.250000 3.600000 2.700000
    , Vector.vector -2.700000 3.600000 3.150000
    , Vector.vector -2.700000 3.600000 2.250000
    , Vector.vector -0.450000 3.600000 2.700000
    , Vector.vector -0.900000 3.600000 3.150000
    , Vector.vector -0.900000 3.600000 2.250000
    , Vector.vector -1.350000 3.600000 0.900000
    , Vector.vector -0.450000 3.600000 0.900000
    , Vector.vector -0.900000 3.600000 1.350000
    , Vector.vector -0.900000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 2.700000
    , Vector.vector 0.900000 3.600000 3.150000
    , Vector.vector 0.900000 3.600000 2.250000
    , Vector.vector 2.250000 3.600000 2.700000
    , Vector.vector 3.150000 3.600000 2.700000
    , Vector.vector 2.700000 3.600000 3.150000
    , Vector.vector 2.700000 3.600000 2.250000
    , Vector.vector 2.250000 3.600000 0.900000
    , Vector.vector 3.150000 3.600000 0.900000
    , Vector.vector 2.700000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -0.900000
    , Vector.vector 1.350000 3.600000 -0.900000
    , Vector.vector 0.900000 3.600000 -0.450000
    , Vector.vector 0.900000 3.600000 -1.350000
    , Vector.vector 2.250000 3.600000 -0.900000
    , Vector.vector 3.150000 3.600000 -0.900000
    , Vector.vector 2.700000 3.600000 -0.450000
    , Vector.vector 2.250000 3.600000 -2.700000
    , Vector.vector 3.150000 3.600000 -2.700000
    , Vector.vector 2.700000 3.600000 -2.250000
    , Vector.vector 2.700000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -3.150000
    , Vector.vector 3.150000 -3.150000 -3.600000
    , Vector.vector 3.600000 -3.150000 3.150000
    , Vector.vector -3.150000 -3.150000 3.600000
    , Vector.vector 3.150000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 0.450000
    , Vector.vector -3.600000 0.450000 0.450000
    , Vector.vector -3.600000 0.450000 -3.150000
    , Vector.vector -0.450000 -3.150000 -3.600000
    , Vector.vector -0.450000 0.450000 -3.600000
    , Vector.vector 3.150000 0.450000 -3.600000
    , Vector.vector 3.600000 -3.150000 -0.450000
    , Vector.vector 3.600000 0.450000 -0.450000
    , Vector.vector 3.600000 0.450000 3.150000
    , Vector.vector 0.450000 -3.150000 3.600000
    , Vector.vector 0.450000 0.450000 3.600000
    , Vector.vector -3.150000 0.450000 3.600000
    , Vector.vector 3.150000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -1.350000
    , Vector.vector -3.600000 -1.350000 -3.150000
    , Vector.vector 1.350000 -3.150000 -3.600000
    , Vector.vector 3.150000 -1.350000 -3.600000
    , Vector.vector 3.600000 -3.150000 1.350000
    , Vector.vector 3.600000 -1.350000 3.150000
    , Vector.vector -1.350000 -3.150000 3.600000
    , Vector.vector -3.150000 -1.350000 3.600000
    , Vector.vector 3.150000 -3.600000 -1.350000
    , Vector.vector 1.350000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -1.350000
    , Vector.vector -1.350000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 2.250000
    , Vector.vector -3.600000 -1.350000 2.250000
    , Vector.vector -3.600000 -1.350000 0.450000
    , Vector.vector -3.600000 0.450000 2.250000
    , Vector.vector -3.600000 2.250000 2.250000
    , Vector.vector -3.600000 2.250000 0.450000
    , Vector.vector -3.600000 0.450000 -1.350000
    , Vector.vector -3.600000 2.250000 -1.350000
    , Vector.vector -3.600000 2.250000 -3.150000
    , Vector.vector -2.250000 -3.150000 -3.600000
    , Vector.vector -2.250000 -1.350000 -3.600000
    , Vector.vector -0.450000 -1.350000 -3.600000
    , Vector.vector -2.250000 0.450000 -3.600000
    , Vector.vector -2.250000 2.250000 -3.600000
    , Vector.vector -0.450000 2.250000 -3.600000
    , Vector.vector 1.350000 0.450000 -3.600000
    , Vector.vector 1.350000 2.250000 -3.600000
    , Vector.vector 3.150000 2.250000 -3.600000
    , Vector.vector 3.600000 -3.150000 -2.250000
    , Vector.vector 3.600000 -1.350000 -2.250000
    , Vector.vector 3.600000 -1.350000 -0.450000
    , Vector.vector 3.600000 0.450000 -2.250000
    , Vector.vector 3.600000 2.250000 -2.250000
    , Vector.vector 3.600000 2.250000 -0.450000
    , Vector.vector 3.600000 0.450000 1.350000
    , Vector.vector 3.600000 2.250000 1.350000
    , Vector.vector 3.600000 2.250000 3.150000
    , Vector.vector 2.250000 -3.150000 3.600000
    , Vector.vector 2.250000 -1.350000 3.600000
    , Vector.vector 0.450000 -1.350000 3.600000
    , Vector.vector 2.250000 0.450000 3.600000
    , Vector.vector 2.250000 2.250000 3.600000
    , Vector.vector 0.450000 2.250000 3.600000
    , Vector.vector -1.350000 0.450000 3.600000
    , Vector.vector -1.350000 2.250000 3.600000
    , Vector.vector -3.150000 2.250000 3.600000
    , Vector.vector 3.150000 -3.600000 2.250000
    , Vector.vector 1.350000 -3.600000 2.250000
    , Vector.vector 1.350000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 2.250000
    , Vector.vector -2.250000 -3.600000 2.250000
    , Vector.vector -2.250000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 -1.350000
    , Vector.vector -2.250000 -3.600000 -1.350000
    , Vector.vector -2.250000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 2.250000
    , Vector.vector -1.350000 3.600000 2.250000
    , Vector.vector -1.350000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 2.250000
    , Vector.vector 2.250000 3.600000 2.250000
    , Vector.vector 2.250000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -1.350000
    , Vector.vector 2.250000 3.600000 -1.350000
    , Vector.vector 2.250000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -2.250000
    , Vector.vector -3.600000 -2.250000 -2.250000
    , Vector.vector -3.600000 -2.250000 -3.150000
    , Vector.vector 2.250000 -3.150000 -3.600000
    , Vector.vector 2.250000 -2.250000 -3.600000
    , Vector.vector 3.150000 -2.250000 -3.600000
    , Vector.vector 3.600000 -3.150000 2.250000
    , Vector.vector 3.600000 -2.250000 2.250000
    , Vector.vector 3.600000 -2.250000 3.150000
    , Vector.vector -2.250000 -3.150000 3.600000
    , Vector.vector -2.250000 -2.250000 3.600000
    , Vector.vector -3.150000 -2.250000 3.600000
    , Vector.vector 3.150000 -3.600000 -2.250000
    , Vector.vector 2.250000 -3.600000 -2.250000
    , Vector.vector 2.250000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -2.250000
    , Vector.vector -2.250000 3.600000 -2.250000
    , Vector.vector -2.250000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 1.350000
    , Vector.vector -3.600000 -2.250000 1.350000
    , Vector.vector -3.600000 -2.250000 0.450000
    , Vector.vector -3.600000 0.450000 1.350000
    , Vector.vector -3.600000 1.350000 0.450000
    , Vector.vector -3.600000 0.450000 -2.250000
    , Vector.vector -3.600000 1.350000 -2.250000
    , Vector.vector -3.600000 1.350000 -3.150000
    , Vector.vector -1.350000 -3.150000 -3.600000
    , Vector.vector -1.350000 -2.250000 -3.600000
    , Vector.vector -0.450000 -2.250000 -3.600000
    , Vector.vector -1.350000 0.450000 -3.600000
    , Vector.vector -0.450000 1.350000 -3.600000
    , Vector.vector 2.250000 0.450000 -3.600000
    , Vector.vector 2.250000 1.350000 -3.600000
    , Vector.vector 3.150000 1.350000 -3.600000
    , Vector.vector 3.600000 -3.150000 -1.350000
    , Vector.vector 3.600000 -2.250000 -1.350000
    , Vector.vector 3.600000 -2.250000 -0.450000
    , Vector.vector 3.600000 0.450000 -1.350000
    , Vector.vector 3.600000 1.350000 -0.450000
    , Vector.vector 3.600000 0.450000 2.250000
    , Vector.vector 3.600000 1.350000 2.250000
    , Vector.vector 3.600000 1.350000 3.150000
    , Vector.vector 1.350000 -3.150000 3.600000
    , Vector.vector 1.350000 -2.250000 3.600000
    , Vector.vector 0.450000 -2.250000 3.600000
    , Vector.vector 1.350000 0.450000 3.600000
    , Vector.vector 0.450000 1.350000 3.600000
    , Vector.vector -2.250000 0.450000 3.600000
    , Vector.vector -2.250000 1.350000 3.600000
    , Vector.vector -3.150000 1.350000 3.600000
    , Vector.vector 3.150000 -3.600000 1.350000
    , Vector.vector 2.250000 -3.600000 1.350000
    , Vector.vector 2.250000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 1.350000
    , Vector.vector -1.350000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 -2.250000
    , Vector.vector -1.350000 -3.600000 -2.250000
    , Vector.vector -1.350000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 1.350000
    , Vector.vector -2.250000 3.600000 1.350000
    , Vector.vector -2.250000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 1.350000
    , Vector.vector 1.350000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -2.250000
    , Vector.vector 1.350000 3.600000 -2.250000
    , Vector.vector 1.350000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 -0.450000
    , Vector.vector -3.600000 -2.250000 -0.450000
    , Vector.vector -3.600000 -2.250000 -1.350000
    , Vector.vector -3.600000 -1.350000 -0.450000
    , Vector.vector -3.600000 -0.450000 -0.450000
    , Vector.vector -3.600000 -0.450000 -1.350000
    , Vector.vector -3.600000 -1.350000 -2.250000
    , Vector.vector -3.600000 -0.450000 -2.250000
    , Vector.vector -3.600000 -0.450000 -3.150000
    , Vector.vector 0.450000 -3.150000 -3.600000
    , Vector.vector 0.450000 -2.250000 -3.600000
    , Vector.vector 1.350000 -2.250000 -3.600000
    , Vector.vector 0.450000 -1.350000 -3.600000
    , Vector.vector 0.450000 -0.450000 -3.600000
    , Vector.vector 1.350000 -0.450000 -3.600000
    , Vector.vector 2.250000 -1.350000 -3.600000
    , Vector.vector 2.250000 -0.450000 -3.600000
    , Vector.vector 3.150000 -0.450000 -3.600000
    , Vector.vector 3.600000 -3.150000 0.450000
    , Vector.vector 3.600000 -2.250000 0.450000
    , Vector.vector 3.600000 -2.250000 1.350000
    , Vector.vector 3.600000 -1.350000 0.450000
    , Vector.vector 3.600000 -0.450000 0.450000
    , Vector.vector 3.600000 -0.450000 1.350000
    , Vector.vector 3.600000 -1.350000 2.250000
    , Vector.vector 3.600000 -0.450000 2.250000
    , Vector.vector 3.600000 -0.450000 3.150000
    , Vector.vector -0.450000 -3.150000 3.600000
    , Vector.vector -0.450000 -2.250000 3.600000
    , Vector.vector -1.350000 -2.250000 3.600000
    , Vector.vector -0.450000 -1.350000 3.600000
    , Vector.vector -0.450000 -0.450000 3.600000
    , Vector.vector -1.350000 -0.450000 3.600000
    , Vector.vector -2.250000 -1.350000 3.600000
    , Vector.vector -2.250000 -0.450000 3.600000
    , Vector.vector -3.150000 -0.450000 3.600000
    , Vector.vector 3.150000 -3.600000 -0.450000
    , Vector.vector 2.250000 -3.600000 -0.450000
    , Vector.vector 2.250000 -3.600000 -1.350000
    , Vector.vector 1.350000 -3.600000 -0.450000
    , Vector.vector 0.450000 -3.600000 -0.450000
    , Vector.vector 0.450000 -3.600000 -1.350000
    , Vector.vector 1.350000 -3.600000 -2.250000
    , Vector.vector 0.450000 -3.600000 -2.250000
    , Vector.vector 0.450000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 -0.450000
    , Vector.vector -2.250000 3.600000 -0.450000
    , Vector.vector -2.250000 3.600000 -1.350000
    , Vector.vector -1.350000 3.600000 -0.450000
    , Vector.vector -0.450000 3.600000 -0.450000
    , Vector.vector -0.450000 3.600000 -1.350000
    , Vector.vector -1.350000 3.600000 -2.250000
    , Vector.vector -0.450000 3.600000 -2.250000
    , Vector.vector -0.450000 3.600000 -3.150000
    , Vector.vector -3.600000 -3.150000 3.150000
    , Vector.vector -3.600000 -2.250000 3.150000
    , Vector.vector -3.600000 -2.250000 2.250000
    , Vector.vector -3.600000 -1.350000 3.150000
    , Vector.vector -3.600000 -0.450000 3.150000
    , Vector.vector -3.600000 -0.450000 2.250000
    , Vector.vector -3.600000 -0.450000 1.350000
    , Vector.vector -3.600000 -0.450000 0.450000
    , Vector.vector -3.600000 0.450000 3.150000
    , Vector.vector -3.600000 1.350000 3.150000
    , Vector.vector -3.600000 1.350000 2.250000
    , Vector.vector -3.600000 2.250000 3.150000
    , Vector.vector -3.600000 3.150000 3.150000
    , Vector.vector -3.600000 3.150000 2.250000
    , Vector.vector -3.600000 2.250000 1.350000
    , Vector.vector -3.600000 3.150000 1.350000
    , Vector.vector -3.600000 3.150000 0.450000
    , Vector.vector -3.600000 0.450000 -0.450000
    , Vector.vector -3.600000 1.350000 -0.450000
    , Vector.vector -3.600000 2.250000 -0.450000
    , Vector.vector -3.600000 3.150000 -0.450000
    , Vector.vector -3.600000 3.150000 -1.350000
    , Vector.vector -3.600000 2.250000 -2.250000
    , Vector.vector -3.600000 3.150000 -2.250000
    , Vector.vector -3.600000 3.150000 -3.150000
    , Vector.vector -3.150000 -3.150000 -3.600000
    , Vector.vector -3.150000 -2.250000 -3.600000
    , Vector.vector -2.250000 -2.250000 -3.600000
    , Vector.vector -3.150000 -1.350000 -3.600000
    , Vector.vector -3.150000 -0.450000 -3.600000
    , Vector.vector -2.250000 -0.450000 -3.600000
    , Vector.vector -1.350000 -0.450000 -3.600000
    , Vector.vector -0.450000 -0.450000 -3.600000
    , Vector.vector -3.150000 0.450000 -3.600000
    , Vector.vector -3.150000 1.350000 -3.600000
    , Vector.vector -2.250000 1.350000 -3.600000
    , Vector.vector -3.150000 2.250000 -3.600000
    , Vector.vector -3.150000 3.150000 -3.600000
    , Vector.vector -2.250000 3.150000 -3.600000
    , Vector.vector -1.350000 2.250000 -3.600000
    , Vector.vector -1.350000 3.150000 -3.600000
    , Vector.vector -0.450000 3.150000 -3.600000
    , Vector.vector 0.450000 0.450000 -3.600000
    , Vector.vector 0.450000 1.350000 -3.600000
    , Vector.vector 0.450000 2.250000 -3.600000
    , Vector.vector 0.450000 3.150000 -3.600000
    , Vector.vector 1.350000 3.150000 -3.600000
    , Vector.vector 2.250000 2.250000 -3.600000
    , Vector.vector 2.250000 3.150000 -3.600000
    , Vector.vector 3.150000 3.150000 -3.600000
    , Vector.vector 3.600000 -3.150000 -3.150000
    , Vector.vector 3.600000 -2.250000 -3.150000
    , Vector.vector 3.600000 -2.250000 -2.250000
    , Vector.vector 3.600000 -1.350000 -3.150000
    , Vector.vector 3.600000 -0.450000 -3.150000
    , Vector.vector 3.600000 -0.450000 -2.250000
    , Vector.vector 3.600000 -0.450000 -1.350000
    , Vector.vector 3.600000 -0.450000 -0.450000
    , Vector.vector 3.600000 0.450000 -3.150000
    , Vector.vector 3.600000 1.350000 -3.150000
    , Vector.vector 3.600000 1.350000 -2.250000
    , Vector.vector 3.600000 2.250000 -3.150000
    , Vector.vector 3.600000 3.150000 -3.150000
    , Vector.vector 3.600000 3.150000 -2.250000
    , Vector.vector 3.600000 2.250000 -1.350000
    , Vector.vector 3.600000 3.150000 -1.350000
    , Vector.vector 3.600000 3.150000 -0.450000
    , Vector.vector 3.600000 0.450000 0.450000
    , Vector.vector 3.600000 1.350000 0.450000
    , Vector.vector 3.600000 2.250000 0.450000
    , Vector.vector 3.600000 3.150000 0.450000
    , Vector.vector 3.600000 3.150000 1.350000
    , Vector.vector 3.600000 2.250000 2.250000
    , Vector.vector 3.600000 3.150000 2.250000
    , Vector.vector 3.600000 3.150000 3.150000
    , Vector.vector 3.150000 -3.150000 3.600000
    , Vector.vector 3.150000 -2.250000 3.600000
    , Vector.vector 2.250000 -2.250000 3.600000
    , Vector.vector 3.150000 -1.350000 3.600000
    , Vector.vector 3.150000 -0.450000 3.600000
    , Vector.vector 2.250000 -0.450000 3.600000
    , Vector.vector 1.350000 -0.450000 3.600000
    , Vector.vector 0.450000 -0.450000 3.600000
    , Vector.vector 3.150000 0.450000 3.600000
    , Vector.vector 3.150000 1.350000 3.600000
    , Vector.vector 2.250000 1.350000 3.600000
    , Vector.vector 3.150000 2.250000 3.600000
    , Vector.vector 3.150000 3.150000 3.600000
    , Vector.vector 2.250000 3.150000 3.600000
    , Vector.vector 1.350000 2.250000 3.600000
    , Vector.vector 1.350000 3.150000 3.600000
    , Vector.vector 0.450000 3.150000 3.600000
    , Vector.vector -0.450000 0.450000 3.600000
    , Vector.vector -0.450000 1.350000 3.600000
    , Vector.vector -0.450000 2.250000 3.600000
    , Vector.vector -0.450000 3.150000 3.600000
    , Vector.vector -1.350000 3.150000 3.600000
    , Vector.vector -2.250000 2.250000 3.600000
    , Vector.vector -2.250000 3.150000 3.600000
    , Vector.vector -3.150000 3.150000 3.600000
    , Vector.vector 3.150000 -3.600000 3.150000
    , Vector.vector 2.250000 -3.600000 3.150000
    , Vector.vector 2.250000 -3.600000 2.250000
    , Vector.vector 1.350000 -3.600000 3.150000
    , Vector.vector 0.450000 -3.600000 3.150000
    , Vector.vector 0.450000 -3.600000 2.250000
    , Vector.vector 0.450000 -3.600000 1.350000
    , Vector.vector 0.450000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 3.150000
    , Vector.vector -1.350000 -3.600000 3.150000
    , Vector.vector -1.350000 -3.600000 2.250000
    , Vector.vector -2.250000 -3.600000 3.150000
    , Vector.vector -3.150000 -3.600000 3.150000
    , Vector.vector -3.150000 -3.600000 2.250000
    , Vector.vector -2.250000 -3.600000 1.350000
    , Vector.vector -3.150000 -3.600000 1.350000
    , Vector.vector -3.150000 -3.600000 0.450000
    , Vector.vector -0.450000 -3.600000 -0.450000
    , Vector.vector -1.350000 -3.600000 -0.450000
    , Vector.vector -2.250000 -3.600000 -0.450000
    , Vector.vector -3.150000 -3.600000 -0.450000
    , Vector.vector -3.150000 -3.600000 -1.350000
    , Vector.vector -2.250000 -3.600000 -2.250000
    , Vector.vector -3.150000 -3.600000 -2.250000
    , Vector.vector -3.150000 -3.600000 -3.150000
    , Vector.vector -3.150000 3.600000 3.150000
    , Vector.vector -2.250000 3.600000 3.150000
    , Vector.vector -2.250000 3.600000 2.250000
    , Vector.vector -1.350000 3.600000 3.150000
    , Vector.vector -0.450000 3.600000 3.150000
    , Vector.vector -0.450000 3.600000 2.250000
    , Vector.vector -0.450000 3.600000 1.350000
    , Vector.vector -0.450000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 3.150000
    , Vector.vector 1.350000 3.600000 3.150000
    , Vector.vector 1.350000 3.600000 2.250000
    , Vector.vector 2.250000 3.600000 3.150000
    , Vector.vector 3.150000 3.600000 3.150000
    , Vector.vector 3.150000 3.600000 2.250000
    , Vector.vector 2.250000 3.600000 1.350000
    , Vector.vector 3.150000 3.600000 1.350000
    , Vector.vector 3.150000 3.600000 0.450000
    , Vector.vector 0.450000 3.600000 -0.450000
    , Vector.vector 1.350000 3.600000 -0.450000
    , Vector.vector 2.250000 3.600000 -0.450000
    , Vector.vector 3.150000 3.600000 -0.450000
    , Vector.vector 3.150000 3.600000 -1.350000
    , Vector.vector 2.250000 3.600000 -2.250000
    , Vector.vector 3.150000 3.600000 -2.250000
    , Vector.vector 3.150000 3.600000 -3.150000
    ]


vertexIndexes : List (List Int)
vertexIndexes =
  [ []
  , [ 1029, 348, 2, 335]
  , [ 1030, 351, 3, 338]
  , [ 1031, 354, 4, 341]
  , [ 1032, 356, 1, 345]
  , [ 1033, 342, 3, 351]
  , [ 1034, 334, 6, 349]
  , [ 1035, 384, 12, 357]
  , [ 1037, 408, 11, 395]
  , [ 1038, 387, 15, 361]
  , [ 1040, 412, 14, 398]
  , [ 1041, 390, 18, 365]
  , [ 1043, 416, 17, 401]
  , [ 1044, 392, 20, 369]
  , [ 1046, 420, 9, 381]
  , [ 1047, 402, 18, 373]
  , [ 1049, 424, 15, 387]
  , [ 1050, 394, 10, 377]
  , [ 1052, 428, 13, 385]
  , [ 1053, 582, 36, 429]
  , [ 1054, 600, 23, 569]
  , [ 1055, 585, 39, 433]
  , [ 1056, 604, 26, 572]
  , [ 1057, 588, 42, 437]
  , [ 1058, 608, 29, 575]
  , [ 1059, 590, 44, 441]
  , [ 1060, 612, 33, 579]
  , [ 1061, 576, 30, 445]
  , [ 1062, 616, 39, 585]
  , [ 1063, 568, 22, 449]
  , [ 1064, 620, 37, 583]
  , [ 1065, 528, 24, 453]
  , [ 1066, 623, 75, 622]
  , [ 1068, 551, 47, 457]
  , [ 1069, 627, 76, 626]
  , [ 1070, 628, 46, 550]
  , [ 1072, 631, 77, 630]
  , [ 1073, 632, 35, 539]
  , [ 1074, 531, 27, 465]
  , [ 1075, 635, 78, 634]
  , [ 1077, 554, 51, 469]
  , [ 1078, 639, 79, 638]
  , [ 1079, 640, 50, 553]
  , [ 1081, 643, 80, 642]
  , [ 1082, 644, 38, 542]
  , [ 1083, 534, 30, 477]
  , [ 1084, 647, 81, 646]
  , [ 1086, 557, 55, 481]
  , [ 1087, 651, 82, 650]
  , [ 1088, 652, 54, 556]
  , [ 1090, 655, 83, 654]
  , [ 1091, 656, 41, 545]
  , [ 1092, 536, 32, 489]
  , [ 1093, 659, 84, 658]
  , [ 1095, 560, 59, 493]
  , [ 1096, 663, 85, 662]
  , [ 1097, 664, 58, 559]
  , [ 1099, 667, 86, 666]
  , [ 1100, 668, 21, 525]
  , [ 1101, 546, 42, 501]
  , [ 1102, 671, 87, 670]
  , [ 1104, 563, 63, 505]
  , [ 1105, 675, 88, 674]
  , [ 1106, 676, 62, 562]
  , [ 1108, 679, 89, 678]
  , [ 1109, 680, 27, 531]
  , [ 1110, 538, 34, 513]
  , [ 1111, 683, 90, 682]
  , [ 1113, 566, 67, 517]
  , [ 1114, 687, 91, 686]
  , [ 1115, 688, 66, 565]
  , [ 1117, 691, 92, 690]
  , [ 1118, 692, 25, 529]
  , [ 1119, 540, 108, 693]
  , [ 1121, 696, 95, 527]
  , [ 1122, 543, 111, 697]
  , [ 1124, 700, 98, 530]
  , [ 1125, 546, 114, 701]
  , [ 1127, 704, 101, 533]
  , [ 1128, 548, 116, 705]
  , [ 1130, 708, 105, 537]
  , [ 1131, 534, 102, 709]
  , [ 1133, 712, 111, 543]
  , [ 1134, 526, 94, 713]
  , [ 1136, 716, 109, 541]
  , [ 1137, 570, 126, 717]
  , [ 1144, 726, 137, 581]
  , [ 1145, 573, 129, 727]
  , [ 1152, 736, 140, 584]
  , [ 1153, 576, 132, 737]
  , [ 1160, 746, 143, 587]
  , [ 1161, 578, 134, 747]
  , [ 1168, 756, 123, 567]
  , [ 1169, 588, 144, 757]
  , [ 1176, 766, 129, 573]
  , [ 1177, 580, 136, 767]
  , [ 1184, 776, 127, 571]
  , [ 1185, 396, 138, 777]
  , [ 1186, 779, 279, 778]
  , [ 1188, 431, 167, 780]
  , [ 1189, 782, 280, 781]
  , [ 1190, 783, 166, 430]
  , [ 1192, 785, 281, 784]
  , [ 1193, 786, 125, 383]
  , [ 1194, 399, 141, 787]
  , [ 1195, 789, 282, 788]
  , [ 1197, 435, 171, 790]
  , [ 1198, 792, 283, 791]
  , [ 1199, 793, 170, 434]
  , [ 1201, 795, 284, 794]
  , [ 1202, 796, 128, 386]
  , [ 1203, 402, 144, 797]
  , [ 1204, 799, 285, 798]
  , [ 1206, 439, 175, 800]
  , [ 1207, 802, 286, 801]
  , [ 1208, 803, 174, 438]
  , [ 1210, 805, 287, 804]
  , [ 1211, 806, 131, 389]
  , [ 1212, 404, 146, 807]
  , [ 1213, 809, 288, 808]
  , [ 1215, 443, 179, 810]
  , [ 1216, 812, 289, 811]
  , [ 1217, 813, 178, 442]
  , [ 1219, 815, 290, 814]
  , [ 1220, 816, 135, 393]
  , [ 1221, 390, 132, 817]
  , [ 1222, 819, 291, 818]
  , [ 1224, 447, 183, 820]
  , [ 1225, 822, 292, 821]
  , [ 1226, 823, 182, 446]
  , [ 1228, 825, 293, 824]
  , [ 1229, 826, 141, 399]
  , [ 1230, 382, 124, 827]
  , [ 1231, 829, 294, 828]
  , [ 1233, 451, 187, 830]
  , [ 1234, 832, 295, 831]
  , [ 1235, 833, 186, 450]
  , [ 1237, 835, 296, 834]
  , [ 1238, 836, 139, 397]
  , [ 1239, 336, 96, 837]
  , [ 1241, 840, 189, 621]
  , [ 1243, 842, 297, 841]
  , [ 1244, 843, 190, 454]
  , [ 1245, 846, 298, 845]
  , [ 1246, 847, 147, 405]
  , [ 1249, 850, 193, 625]
  , [ 1250, 459, 195, 851]
  , [ 1252, 854, 194, 458]
  , [ 1253, 460, 196, 855]
  , [ 1256, 360, 117, 858]
  , [ 1257, 860, 301, 859]
  , [ 1258, 463, 199, 862]
  , [ 1259, 864, 302, 863]
  , [ 1261, 464, 200, 865]
  , [ 1263, 868, 107, 347]
  , [ 1264, 339, 99, 869]
  , [ 1266, 872, 201, 633]
  , [ 1268, 874, 303, 873]
  , [ 1269, 875, 202, 466]
  , [ 1270, 878, 304, 877]
  , [ 1271, 879, 150, 409]
  , [ 1274, 882, 205, 637]
  , [ 1275, 471, 207, 883]
  , [ 1277, 886, 206, 470]
  , [ 1278, 472, 208, 887]
  , [ 1281, 364, 118, 890]
  , [ 1282, 892, 307, 891]
  , [ 1283, 475, 211, 894]
  , [ 1284, 896, 308, 895]
  , [ 1286, 476, 212, 897]
  , [ 1288, 900, 110, 350]
  , [ 1289, 342, 102, 901]
  , [ 1291, 904, 213, 645]
  , [ 1293, 906, 309, 905]
  , [ 1294, 907, 214, 478]
  , [ 1295, 910, 310, 909]
  , [ 1296, 911, 153, 413]
  , [ 1299, 914, 217, 649]
  , [ 1300, 483, 219, 915]
  , [ 1302, 918, 218, 482]
  , [ 1303, 484, 220, 919]
  , [ 1306, 368, 119, 922]
  , [ 1307, 924, 313, 923]
  , [ 1308, 487, 223, 926]
  , [ 1309, 928, 314, 927]
  , [ 1311, 488, 224, 929]
  , [ 1313, 932, 113, 353]
  , [ 1314, 344, 104, 933]
  , [ 1316, 936, 225, 657]
  , [ 1318, 938, 315, 937]
  , [ 1319, 939, 226, 490]
  , [ 1320, 942, 316, 941]
  , [ 1321, 943, 156, 417]
  , [ 1324, 946, 229, 661]
  , [ 1325, 495, 231, 947]
  , [ 1327, 950, 230, 494]
  , [ 1328, 496, 232, 951]
  , [ 1331, 372, 120, 954]
  , [ 1332, 956, 319, 955]
  , [ 1333, 499, 235, 958]
  , [ 1334, 960, 320, 959]
  , [ 1336, 500, 236, 961]
  , [ 1338, 964, 93, 333]
  , [ 1339, 354, 114, 965]
  , [ 1341, 968, 237, 669]
  , [ 1343, 970, 321, 969]
  , [ 1344, 971, 238, 502]
  , [ 1345, 974, 322, 973]
  , [ 1346, 975, 159, 421]
  , [ 1349, 978, 241, 673]
  , [ 1350, 507, 243, 979]
  , [ 1352, 982, 242, 506]
  , [ 1353, 508, 244, 983]
  , [ 1356, 376, 121, 986]
  , [ 1357, 988, 325, 987]
  , [ 1358, 511, 247, 990]
  , [ 1359, 992, 326, 991]
  , [ 1361, 512, 248, 993]
  , [ 1363, 996, 99, 339]
  , [ 1364, 346, 106, 997]
  , [ 1366, 1000, 249, 681]
  , [ 1368, 1002, 327, 1001]
  , [ 1369, 1003, 250, 514]
  , [ 1370, 1006, 328, 1005]
  , [ 1371, 1007, 162, 425]
  , [ 1374, 1010, 253, 685]
  , [ 1375, 519, 255, 1011]
  , [ 1377, 1014, 254, 518]
  , [ 1378, 520, 256, 1015]
  , [ 1381, 380, 122, 1018]
  , [ 1382, 1020, 331, 1019]
  , [ 1383, 523, 259, 1022]
  , [ 1384, 1024, 332, 1023]
  , [ 1386, 524, 260, 1025]
  , [ 1388, 1028, 97, 337]
  , [ 693, 108, 348, 1029]
  , [ 696, 1029, 335, 95]
  , [ 697, 111, 351, 1030]
  , [ 700, 1030, 338, 98]
  , [ 701, 114, 354, 1031]
  , [ 704, 1031, 341, 101]
  , [ 705, 116, 356, 1032]
  , [ 708, 1032, 345, 105]
  , [ 709, 102, 342, 1033]
  , [ 712, 1033, 351, 111]
  , [ 713, 94, 334, 1034]
  , [ 716, 1034, 349, 109]
  , [ 717, 126, 384, 1035]
  , [ 261, 717, 1035, 719]
  , [ 720, 149, 407, 1036]
  , [ 262, 720, 1036, 723]
  , [ 723, 1036, 406, 148]
  , [ 263, 724, 1037, 726]
  , [ 726, 1037, 395, 137]
  , [ 727, 129, 387, 1038]
  , [ 264, 727, 1038, 729]
  , [ 730, 152, 411, 1039]
  , [ 265, 730, 1039, 733]
  , [ 733, 1039, 410, 151]
  , [ 266, 734, 1040, 736]
  , [ 736, 1040, 398, 140]
  , [ 737, 132, 390, 1041]
  , [ 267, 737, 1041, 739]
  , [ 740, 155, 415, 1042]
  , [ 268, 740, 1042, 743]
  , [ 743, 1042, 414, 154]
  , [ 269, 744, 1043, 746]
  , [ 746, 1043, 401, 143]
  , [ 747, 134, 392, 1044]
  , [ 270, 747, 1044, 749]
  , [ 750, 158, 419, 1045]
  , [ 271, 750, 1045, 753]
  , [ 753, 1045, 418, 157]
  , [ 272, 754, 1046, 756]
  , [ 756, 1046, 381, 123]
  , [ 757, 144, 402, 1047]
  , [ 273, 757, 1047, 759]
  , [ 760, 161, 423, 1048]
  , [ 274, 760, 1048, 763]
  , [ 763, 1048, 422, 160]
  , [ 275, 764, 1049, 766]
  , [ 766, 1049, 387, 129]
  , [ 767, 136, 394, 1050]
  , [ 276, 767, 1050, 769]
  , [ 770, 164, 427, 1051]
  , [ 277, 770, 1051, 773]
  , [ 773, 1051, 426, 163]
  , [ 278, 774, 1052, 776]
  , [ 776, 1052, 385, 127]
  , [ 777, 138, 582, 1053]
  , [ 786, 1054, 569, 125]
  , [ 787, 141, 585, 1055]
  , [ 796, 1056, 572, 128]
  , [ 797, 144, 588, 1057]
  , [ 806, 1058, 575, 131]
  , [ 807, 146, 590, 1059]
  , [ 816, 1060, 579, 135]
  , [ 817, 132, 576, 1061]
  , [ 826, 1062, 585, 141]
  , [ 827, 124, 568, 1063]
  , [ 836, 1064, 583, 139]
  , [ 837, 96, 528, 1065]
  , [ 840, 1065, 453, 189]
  , [ 843, 1066, 622, 190]
  , [ 844, 192, 624, 1067]
  , [ 298, 844, 1067, 847]
  , [ 299, 848, 1068, 850]
  , [ 850, 1068, 457, 193]
  , [ 851, 195, 627, 1069]
  , [ 854, 1069, 626, 194]
  , [ 855, 196, 628, 1070]
  , [ 300, 855, 1070, 857]
  , [ 301, 858, 1071, 861]
  , [ 861, 1071, 461, 197]
  , [ 862, 199, 631, 1072]
  , [ 865, 200, 632, 1073]
  , [ 868, 1073, 539, 107]
  , [ 869, 99, 531, 1074]
  , [ 872, 1074, 465, 201]
  , [ 875, 1075, 634, 202]
  , [ 876, 204, 636, 1076]
  , [ 304, 876, 1076, 879]
  , [ 305, 880, 1077, 882]
  , [ 882, 1077, 469, 205]
  , [ 883, 207, 639, 1078]
  , [ 886, 1078, 638, 206]
  , [ 887, 208, 640, 1079]
  , [ 306, 887, 1079, 889]
  , [ 307, 890, 1080, 893]
  , [ 893, 1080, 473, 209]
  , [ 894, 211, 643, 1081]
  , [ 897, 212, 644, 1082]
  , [ 900, 1082, 542, 110]
  , [ 901, 102, 534, 1083]
  , [ 904, 1083, 477, 213]
  , [ 907, 1084, 646, 214]
  , [ 908, 216, 648, 1085]
  , [ 310, 908, 1085, 911]
  , [ 311, 912, 1086, 914]
  , [ 914, 1086, 481, 217]
  , [ 915, 219, 651, 1087]
  , [ 918, 1087, 650, 218]
  , [ 919, 220, 652, 1088]
  , [ 312, 919, 1088, 921]
  , [ 313, 922, 1089, 925]
  , [ 925, 1089, 485, 221]
  , [ 926, 223, 655, 1090]
  , [ 929, 224, 656, 1091]
  , [ 932, 1091, 545, 113]
  , [ 933, 104, 536, 1092]
  , [ 936, 1092, 489, 225]
  , [ 939, 1093, 658, 226]
  , [ 940, 228, 660, 1094]
  , [ 316, 940, 1094, 943]
  , [ 317, 944, 1095, 946]
  , [ 946, 1095, 493, 229]
  , [ 947, 231, 663, 1096]
  , [ 950, 1096, 662, 230]
  , [ 951, 232, 664, 1097]
  , [ 318, 951, 1097, 953]
  , [ 319, 954, 1098, 957]
  , [ 957, 1098, 497, 233]
  , [ 958, 235, 667, 1099]
  , [ 961, 236, 668, 1100]
  , [ 964, 1100, 525, 93]
  , [ 965, 114, 546, 1101]
  , [ 968, 1101, 501, 237]
  , [ 971, 1102, 670, 238]
  , [ 972, 240, 672, 1103]
  , [ 322, 972, 1103, 975]
  , [ 323, 976, 1104, 978]
  , [ 978, 1104, 505, 241]
  , [ 979, 243, 675, 1105]
  , [ 982, 1105, 674, 242]
  , [ 983, 244, 676, 1106]
  , [ 324, 983, 1106, 985]
  , [ 325, 986, 1107, 989]
  , [ 989, 1107, 509, 245]
  , [ 990, 247, 679, 1108]
  , [ 993, 248, 680, 1109]
  , [ 996, 1109, 531, 99]
  , [ 997, 106, 538, 1110]
  , [ 1000, 1110, 513, 249]
  , [ 1003, 1111, 682, 250]
  , [ 1004, 252, 684, 1112]
  , [ 328, 1004, 1112, 1007]
  , [ 329, 1008, 1113, 1010]
  , [ 1010, 1113, 517, 253]
  , [ 1011, 255, 687, 1114]
  , [ 1014, 1114, 686, 254]
  , [ 1015, 256, 688, 1115]
  , [ 330, 1015, 1115, 1017]
  , [ 331, 1018, 1116, 1021]
  , [ 1021, 1116, 521, 257]
  , [ 1022, 259, 691, 1117]
  , [ 1025, 260, 692, 1118]
  , [ 1028, 1118, 529, 97]
  , [ 429, 36, 540, 1119]
  , [ 165, 429, 1119, 695]
  , [ 597, 165, 695, 1120]
  , [ 69, 597, 1120, 432]
  , [ 432, 1120, 694, 168]
  , [ 168, 694, 1121, 600]
  , [ 600, 1121, 527, 23]
  , [ 433, 39, 543, 1122]
  , [ 169, 433, 1122, 699]
  , [ 601, 169, 699, 1123]
  , [ 70, 601, 1123, 436]
  , [ 436, 1123, 698, 172]
  , [ 172, 698, 1124, 604]
  , [ 604, 1124, 530, 26]
  , [ 437, 42, 546, 1125]
  , [ 173, 437, 1125, 703]
  , [ 605, 173, 703, 1126]
  , [ 71, 605, 1126, 440]
  , [ 440, 1126, 702, 176]
  , [ 176, 702, 1127, 608]
  , [ 608, 1127, 533, 29]
  , [ 441, 44, 548, 1128]
  , [ 177, 441, 1128, 707]
  , [ 609, 177, 707, 1129]
  , [ 72, 609, 1129, 444]
  , [ 444, 1129, 706, 180]
  , [ 180, 706, 1130, 612]
  , [ 612, 1130, 537, 33]
  , [ 445, 30, 534, 1131]
  , [ 181, 445, 1131, 711]
  , [ 613, 181, 711, 1132]
  , [ 73, 613, 1132, 448]
  , [ 448, 1132, 710, 184]
  , [ 184, 710, 1133, 616]
  , [ 616, 1133, 543, 39]
  , [ 449, 22, 526, 1134]
  , [ 185, 449, 1134, 715]
  , [ 617, 185, 715, 1135]
  , [ 74, 617, 1135, 452]
  , [ 452, 1135, 714, 188]
  , [ 188, 714, 1136, 620]
  , [ 620, 1136, 541, 37]
  , [ 453, 24, 570, 1137]
  , [ 75, 621, 1138, 456]
  , [ 456, 1138, 718, 192]
  , [ 718, 261, 719, 1139]
  , [ 192, 718, 1139, 624]
  , [ 624, 1139, 549, 45]
  , [ 193, 457, 1140, 722]
  , [ 722, 1140, 720, 262]
  , [ 721, 262, 723, 1141]
  , [ 196, 721, 1141, 628]
  , [ 461, 48, 591, 1142]
  , [ 197, 461, 1142, 725]
  , [ 725, 1142, 724, 263]
  , [ 629, 197, 725, 1143]
  , [ 77, 629, 1143, 464]
  , [ 632, 1144, 581, 35]
  , [ 465, 27, 573, 1145]
  , [ 78, 633, 1146, 468]
  , [ 468, 1146, 728, 204]
  , [ 728, 264, 729, 1147]
  , [ 204, 728, 1147, 636]
  , [ 636, 1147, 552, 49]
  , [ 205, 469, 1148, 732]
  , [ 732, 1148, 730, 265]
  , [ 731, 265, 733, 1149]
  , [ 208, 731, 1149, 640]
  , [ 473, 52, 592, 1150]
  , [ 209, 473, 1150, 735]
  , [ 735, 1150, 734, 266]
  , [ 641, 209, 735, 1151]
  , [ 80, 641, 1151, 476]
  , [ 644, 1152, 584, 38]
  , [ 477, 30, 576, 1153]
  , [ 81, 645, 1154, 480]
  , [ 480, 1154, 738, 216]
  , [ 738, 267, 739, 1155]
  , [ 216, 738, 1155, 648]
  , [ 648, 1155, 555, 53]
  , [ 217, 481, 1156, 742]
  , [ 742, 1156, 740, 268]
  , [ 741, 268, 743, 1157]
  , [ 220, 741, 1157, 652]
  , [ 485, 56, 593, 1158]
  , [ 221, 485, 1158, 745]
  , [ 745, 1158, 744, 269]
  , [ 653, 221, 745, 1159]
  , [ 83, 653, 1159, 488]
  , [ 656, 1160, 587, 41]
  , [ 489, 32, 578, 1161]
  , [ 84, 657, 1162, 492]
  , [ 492, 1162, 748, 228]
  , [ 748, 270, 749, 1163]
  , [ 228, 748, 1163, 660]
  , [ 660, 1163, 558, 57]
  , [ 229, 493, 1164, 752]
  , [ 752, 1164, 750, 271]
  , [ 751, 271, 753, 1165]
  , [ 232, 751, 1165, 664]
  , [ 497, 60, 594, 1166]
  , [ 233, 497, 1166, 755]
  , [ 755, 1166, 754, 272]
  , [ 665, 233, 755, 1167]
  , [ 86, 665, 1167, 500]
  , [ 668, 1168, 567, 21]
  , [ 501, 42, 588, 1169]
  , [ 87, 669, 1170, 504]
  , [ 504, 1170, 758, 240]
  , [ 758, 273, 759, 1171]
  , [ 240, 758, 1171, 672]
  , [ 672, 1171, 561, 61]
  , [ 241, 505, 1172, 762]
  , [ 762, 1172, 760, 274]
  , [ 761, 274, 763, 1173]
  , [ 244, 761, 1173, 676]
  , [ 509, 64, 595, 1174]
  , [ 245, 509, 1174, 765]
  , [ 765, 1174, 764, 275]
  , [ 677, 245, 765, 1175]
  , [ 89, 677, 1175, 512]
  , [ 680, 1176, 573, 27]
  , [ 513, 34, 580, 1177]
  , [ 90, 681, 1178, 516]
  , [ 516, 1178, 768, 252]
  , [ 768, 276, 769, 1179]
  , [ 252, 768, 1179, 684]
  , [ 684, 1179, 564, 65]
  , [ 253, 517, 1180, 772]
  , [ 772, 1180, 770, 277]
  , [ 771, 277, 773, 1181]
  , [ 256, 771, 1181, 688]
  , [ 521, 68, 596, 1182]
  , [ 257, 521, 1182, 775]
  , [ 775, 1182, 774, 278]
  , [ 689, 257, 775, 1183]
  , [ 92, 689, 1183, 524]
  , [ 692, 1184, 571, 25]
  , [ 357, 12, 396, 1185]
  , [ 779, 1185, 777, 279]
  , [ 45, 549, 1186, 431]
  , [ 431, 1186, 778, 167]
  , [ 167, 778, 1187, 599]
  , [ 599, 1187, 597, 69]
  , [ 782, 1188, 780, 280]
  , [ 405, 147, 782, 1189]
  , [ 360, 1189, 781, 117]
  , [ 781, 280, 783, 1190]
  , [ 598, 69, 432, 1191]
  , [ 166, 598, 1191, 785]
  , [ 430, 166, 785, 1192]
  , [ 48, 430, 1192, 591]
  , [ 784, 281, 786, 1193]
  , [ 408, 1193, 383, 11]
  , [ 361, 15, 399, 1194]
  , [ 789, 1194, 787, 282]
  , [ 49, 552, 1195, 435]
  , [ 435, 1195, 788, 171]
  , [ 171, 788, 1196, 603]
  , [ 603, 1196, 601, 70]
  , [ 792, 1197, 790, 283]
  , [ 409, 150, 792, 1198]
  , [ 364, 1198, 791, 118]
  , [ 791, 283, 793, 1199]
  , [ 602, 70, 436, 1200]
  , [ 170, 602, 1200, 795]
  , [ 434, 170, 795, 1201]
  , [ 52, 434, 1201, 592]
  , [ 794, 284, 796, 1202]
  , [ 412, 1202, 386, 14]
  , [ 365, 18, 402, 1203]
  , [ 799, 1203, 797, 285]
  , [ 53, 555, 1204, 439]
  , [ 439, 1204, 798, 175]
  , [ 175, 798, 1205, 607]
  , [ 607, 1205, 605, 71]
  , [ 802, 1206, 800, 286]
  , [ 413, 153, 802, 1207]
  , [ 368, 1207, 801, 119]
  , [ 801, 286, 803, 1208]
  , [ 606, 71, 440, 1209]
  , [ 174, 606, 1209, 805]
  , [ 438, 174, 805, 1210]
  , [ 56, 438, 1210, 593]
  , [ 804, 287, 806, 1211]
  , [ 416, 1211, 389, 17]
  , [ 369, 20, 404, 1212]
  , [ 809, 1212, 807, 288]
  , [ 57, 558, 1213, 443]
  , [ 443, 1213, 808, 179]
  , [ 179, 808, 1214, 611]
  , [ 611, 1214, 609, 72]
  , [ 812, 1215, 810, 289]
  , [ 417, 156, 812, 1216]
  , [ 372, 1216, 811, 120]
  , [ 811, 289, 813, 1217]
  , [ 610, 72, 444, 1218]
  , [ 178, 610, 1218, 815]
  , [ 442, 178, 815, 1219]
  , [ 60, 442, 1219, 594]
  , [ 814, 290, 816, 1220]
  , [ 420, 1220, 393, 9]
  , [ 373, 18, 390, 1221]
  , [ 819, 1221, 817, 291]
  , [ 61, 561, 1222, 447]
  , [ 447, 1222, 818, 183]
  , [ 183, 818, 1223, 615]
  , [ 615, 1223, 613, 73]
  , [ 822, 1224, 820, 292]
  , [ 421, 159, 822, 1225]
  , [ 376, 1225, 821, 121]
  , [ 821, 292, 823, 1226]
  , [ 614, 73, 448, 1227]
  , [ 182, 614, 1227, 825]
  , [ 446, 182, 825, 1228]
  , [ 64, 446, 1228, 595]
  , [ 824, 293, 826, 1229]
  , [ 424, 1229, 399, 15]
  , [ 377, 10, 382, 1230]
  , [ 829, 1230, 827, 294]
  , [ 65, 564, 1231, 451]
  , [ 451, 1231, 828, 187]
  , [ 187, 828, 1232, 619]
  , [ 619, 1232, 617, 74]
  , [ 832, 1233, 830, 295]
  , [ 425, 162, 832, 1234]
  , [ 380, 1234, 831, 122]
  , [ 831, 295, 833, 1235]
  , [ 618, 74, 452, 1236]
  , [ 186, 618, 1236, 835]
  , [ 450, 186, 835, 1237]
  , [ 68, 450, 1237, 596]
  , [ 834, 296, 836, 1238]
  , [ 428, 1238, 397, 13]
  , [ 345, 1, 336, 1239]
  , [ 105, 345, 1239, 839]
  , [ 537, 105, 839, 1240]
  , [ 33, 537, 1240, 455]
  , [ 455, 1240, 838, 191]
  , [ 191, 838, 1241, 623]
  , [ 623, 1241, 621, 75]
  , [ 579, 33, 455, 1242]
  , [ 135, 579, 1242, 842]
  , [ 393, 135, 842, 1243]
  , [ 9, 393, 1243, 359]
  , [ 841, 297, 843, 1244]
  , [ 551, 1244, 454, 47]
  , [ 454, 190, 846, 1245]
  , [ 845, 298, 847, 1246]
  , [ 149, 845, 1246, 407]
  , [ 381, 9, 359, 1247]
  , [ 123, 381, 1247, 849]
  , [ 849, 1247, 848, 299]
  , [ 567, 123, 849, 1248]
  , [ 21, 567, 1248, 459]
  , [ 627, 1249, 625, 76]
  , [ 525, 21, 459, 1250]
  , [ 93, 525, 1250, 853]
  , [ 333, 93, 853, 1251]
  , [ 5, 333, 1251, 346]
  , [ 346, 1251, 852, 106]
  , [ 106, 852, 1252, 538]
  , [ 538, 1252, 458, 34]
  , [ 626, 76, 460, 1253]
  , [ 34, 458, 1254, 580]
  , [ 580, 1254, 856, 136]
  , [ 856, 300, 857, 1255]
  , [ 136, 856, 1255, 394]
  , [ 394, 1255, 358, 10]
  , [ 148, 406, 1256, 860]
  , [ 860, 1256, 858, 301]
  , [ 463, 1257, 859, 199]
  , [ 550, 46, 463, 1258]
  , [ 864, 1258, 862, 302]
  , [ 10, 358, 1259, 382]
  , [ 382, 1259, 863, 124]
  , [ 124, 863, 1260, 568]
  , [ 568, 1260, 462, 22]
  , [ 630, 77, 464, 1261]
  , [ 198, 630, 1261, 867]
  , [ 462, 198, 867, 1262]
  , [ 22, 462, 1262, 526]
  , [ 526, 1262, 866, 94]
  , [ 94, 866, 1263, 334]
  , [ 334, 1263, 347, 6]
  , [ 335, 2, 339, 1264]
  , [ 95, 335, 1264, 871]
  , [ 527, 95, 871, 1265]
  , [ 23, 527, 1265, 467]
  , [ 467, 1265, 870, 203]
  , [ 203, 870, 1266, 635]
  , [ 635, 1266, 633, 78]
  , [ 569, 23, 467, 1267]
  , [ 125, 569, 1267, 874]
  , [ 383, 125, 874, 1268]
  , [ 11, 383, 1268, 363]
  , [ 873, 303, 875, 1269]
  , [ 554, 1269, 466, 51]
  , [ 466, 202, 878, 1270]
  , [ 877, 304, 879, 1271]
  , [ 152, 877, 1271, 411]
  , [ 395, 11, 363, 1272]
  , [ 137, 395, 1272, 881]
  , [ 881, 1272, 880, 305]
  , [ 581, 137, 881, 1273]
  , [ 35, 581, 1273, 471]
  , [ 639, 1274, 637, 79]
  , [ 539, 35, 471, 1275]
  , [ 107, 539, 1275, 885]
  , [ 347, 107, 885, 1276]
  , [ 6, 347, 1276, 349]
  , [ 349, 1276, 884, 109]
  , [ 109, 884, 1277, 541]
  , [ 541, 1277, 470, 37]
  , [ 638, 79, 472, 1278]
  , [ 37, 470, 1279, 583]
  , [ 583, 1279, 888, 139]
  , [ 888, 306, 889, 1280]
  , [ 139, 888, 1280, 397]
  , [ 397, 1280, 362, 13]
  , [ 151, 410, 1281, 892]
  , [ 892, 1281, 890, 307]
  , [ 475, 1282, 891, 211]
  , [ 553, 50, 475, 1283]
  , [ 896, 1283, 894, 308]
  , [ 13, 362, 1284, 385]
  , [ 385, 1284, 895, 127]
  , [ 127, 895, 1285, 571]
  , [ 571, 1285, 474, 25]
  , [ 642, 80, 476, 1286]
  , [ 210, 642, 1286, 899]
  , [ 474, 210, 899, 1287]
  , [ 25, 474, 1287, 529]
  , [ 529, 1287, 898, 97]
  , [ 97, 898, 1288, 337]
  , [ 337, 1288, 350, 7]
  , [ 338, 3, 342, 1289]
  , [ 98, 338, 1289, 903]
  , [ 530, 98, 903, 1290]
  , [ 26, 530, 1290, 479]
  , [ 479, 1290, 902, 215]
  , [ 215, 902, 1291, 647]
  , [ 647, 1291, 645, 81]
  , [ 572, 26, 479, 1292]
  , [ 128, 572, 1292, 906]
  , [ 386, 128, 906, 1293]
  , [ 14, 386, 1293, 367]
  , [ 905, 309, 907, 1294]
  , [ 557, 1294, 478, 55]
  , [ 478, 214, 910, 1295]
  , [ 909, 310, 911, 1296]
  , [ 155, 909, 1296, 415]
  , [ 398, 14, 367, 1297]
  , [ 140, 398, 1297, 913]
  , [ 913, 1297, 912, 311]
  , [ 584, 140, 913, 1298]
  , [ 38, 584, 1298, 483]
  , [ 651, 1299, 649, 82]
  , [ 542, 38, 483, 1300]
  , [ 110, 542, 1300, 917]
  , [ 350, 110, 917, 1301]
  , [ 7, 350, 1301, 352]
  , [ 352, 1301, 916, 112]
  , [ 112, 916, 1302, 544]
  , [ 544, 1302, 482, 40]
  , [ 650, 82, 484, 1303]
  , [ 40, 482, 1304, 586]
  , [ 586, 1304, 920, 142]
  , [ 920, 312, 921, 1305]
  , [ 142, 920, 1305, 400]
  , [ 400, 1305, 366, 16]
  , [ 154, 414, 1306, 924]
  , [ 924, 1306, 922, 313]
  , [ 487, 1307, 923, 223]
  , [ 556, 54, 487, 1308]
  , [ 928, 1308, 926, 314]
  , [ 16, 366, 1309, 388]
  , [ 388, 1309, 927, 130]
  , [ 130, 927, 1310, 574]
  , [ 574, 1310, 486, 28]
  , [ 654, 83, 488, 1311]
  , [ 222, 654, 1311, 931]
  , [ 486, 222, 931, 1312]
  , [ 28, 486, 1312, 532]
  , [ 532, 1312, 930, 100]
  , [ 100, 930, 1313, 340]
  , [ 340, 1313, 353, 8]
  , [ 341, 4, 344, 1314]
  , [ 101, 341, 1314, 935]
  , [ 533, 101, 935, 1315]
  , [ 29, 533, 1315, 491]
  , [ 491, 1315, 934, 227]
  , [ 227, 934, 1316, 659]
  , [ 659, 1316, 657, 84]
  , [ 575, 29, 491, 1317]
  , [ 131, 575, 1317, 938]
  , [ 389, 131, 938, 1318]
  , [ 17, 389, 1318, 371]
  , [ 937, 315, 939, 1319]
  , [ 560, 1319, 490, 59]
  , [ 490, 226, 942, 1320]
  , [ 941, 316, 943, 1321]
  , [ 158, 941, 1321, 419]
  , [ 401, 17, 371, 1322]
  , [ 143, 401, 1322, 945]
  , [ 945, 1322, 944, 317]
  , [ 587, 143, 945, 1323]
  , [ 41, 587, 1323, 495]
  , [ 663, 1324, 661, 85]
  , [ 545, 41, 495, 1325]
  , [ 113, 545, 1325, 949]
  , [ 353, 113, 949, 1326]
  , [ 8, 353, 1326, 355]
  , [ 355, 1326, 948, 115]
  , [ 115, 948, 1327, 547]
  , [ 547, 1327, 494, 43]
  , [ 662, 85, 496, 1328]
  , [ 43, 494, 1329, 589]
  , [ 589, 1329, 952, 145]
  , [ 952, 318, 953, 1330]
  , [ 145, 952, 1330, 403]
  , [ 403, 1330, 370, 19]
  , [ 157, 418, 1331, 956]
  , [ 956, 1331, 954, 319]
  , [ 499, 1332, 955, 235]
  , [ 559, 58, 499, 1333]
  , [ 960, 1333, 958, 320]
  , [ 19, 370, 1334, 391]
  , [ 391, 1334, 959, 133]
  , [ 133, 959, 1335, 577]
  , [ 577, 1335, 498, 31]
  , [ 666, 86, 500, 1336]
  , [ 234, 666, 1336, 963]
  , [ 498, 234, 963, 1337]
  , [ 31, 498, 1337, 535]
  , [ 535, 1337, 962, 103]
  , [ 103, 962, 1338, 343]
  , [ 343, 1338, 333, 5]
  , [ 344, 4, 354, 1339]
  , [ 104, 344, 1339, 967]
  , [ 536, 104, 967, 1340]
  , [ 32, 536, 1340, 503]
  , [ 503, 1340, 966, 239]
  , [ 239, 966, 1341, 671]
  , [ 671, 1341, 669, 87]
  , [ 578, 32, 503, 1342]
  , [ 134, 578, 1342, 970]
  , [ 392, 134, 970, 1343]
  , [ 20, 392, 1343, 375]
  , [ 969, 321, 971, 1344]
  , [ 563, 1344, 502, 63]
  , [ 502, 238, 974, 1345]
  , [ 973, 322, 975, 1346]
  , [ 161, 973, 1346, 423]
  , [ 404, 20, 375, 1347]
  , [ 146, 404, 1347, 977]
  , [ 977, 1347, 976, 323]
  , [ 590, 146, 977, 1348]
  , [ 44, 590, 1348, 507]
  , [ 675, 1349, 673, 88]
  , [ 548, 44, 507, 1350]
  , [ 116, 548, 1350, 981]
  , [ 356, 116, 981, 1351]
  , [ 1, 356, 1351, 336]
  , [ 336, 1351, 980, 96]
  , [ 96, 980, 1352, 528]
  , [ 528, 1352, 506, 24]
  , [ 674, 88, 508, 1353]
  , [ 24, 506, 1354, 570]
  , [ 570, 1354, 984, 126]
  , [ 984, 324, 985, 1355]
  , [ 126, 984, 1355, 384]
  , [ 384, 1355, 374, 12]
  , [ 160, 422, 1356, 988]
  , [ 988, 1356, 986, 325]
  , [ 511, 1357, 987, 247]
  , [ 562, 62, 511, 1358]
  , [ 992, 1358, 990, 326]
  , [ 12, 374, 1359, 396]
  , [ 396, 1359, 991, 138]
  , [ 138, 991, 1360, 582]
  , [ 582, 1360, 510, 36]
  , [ 678, 89, 512, 1361]
  , [ 246, 678, 1361, 995]
  , [ 510, 246, 995, 1362]
  , [ 36, 510, 1362, 540]
  , [ 540, 1362, 994, 108]
  , [ 108, 994, 1363, 348]
  , [ 348, 1363, 339, 2]
  , [ 343, 5, 346, 1364]
  , [ 103, 343, 1364, 999]
  , [ 535, 103, 999, 1365]
  , [ 31, 535, 1365, 515]
  , [ 515, 1365, 998, 251]
  , [ 251, 998, 1366, 683]
  , [ 683, 1366, 681, 90]
  , [ 577, 31, 515, 1367]
  , [ 133, 577, 1367, 1002]
  , [ 391, 133, 1002, 1368]
  , [ 19, 391, 1368, 379]
  , [ 1001, 327, 1003, 1369]
  , [ 566, 1369, 514, 67]
  , [ 514, 250, 1006, 1370]
  , [ 1005, 328, 1007, 1371]
  , [ 164, 1005, 1371, 427]
  , [ 403, 19, 379, 1372]
  , [ 145, 403, 1372, 1009]
  , [ 1009, 1372, 1008, 329]
  , [ 589, 145, 1009, 1373]
  , [ 43, 589, 1373, 519]
  , [ 687, 1374, 685, 91]
  , [ 547, 43, 519, 1375]
  , [ 115, 547, 1375, 1013]
  , [ 355, 115, 1013, 1376]
  , [ 8, 355, 1376, 340]
  , [ 340, 1376, 1012, 100]
  , [ 100, 1012, 1377, 532]
  , [ 532, 1377, 518, 28]
  , [ 686, 91, 520, 1378]
  , [ 28, 518, 1379, 574]
  , [ 574, 1379, 1016, 130]
  , [ 1016, 330, 1017, 1380]
  , [ 130, 1016, 1380, 388]
  , [ 388, 1380, 378, 16]
  , [ 163, 426, 1381, 1020]
  , [ 1020, 1381, 1018, 331]
  , [ 523, 1382, 1019, 259]
  , [ 565, 66, 523, 1383]
  , [ 1024, 1383, 1022, 332]
  , [ 16, 378, 1384, 400]
  , [ 400, 1384, 1023, 142]
  , [ 142, 1023, 1385, 586]
  , [ 586, 1385, 522, 40]
  , [ 690, 92, 524, 1386]
  , [ 258, 690, 1386, 1027]
  , [ 522, 258, 1027, 1387]
  , [ 40, 522, 1387, 544]
  , [ 544, 1387, 1026, 112]
  , [ 112, 1026, 1388, 352]
  , [ 352, 1388, 337, 7]
  , [ 2417, 1723, 1390, 1736]
  , [ 2418, 1726, 1391, 1739]
  , [ 2419, 1729, 1392, 1742]
  , [ 2420, 1733, 1389, 1744]
  , [ 2421, 1739, 1391, 1730]
  , [ 2422, 1737, 1394, 1722]
  , [ 2423, 1745, 1400, 1772]
  , [ 2425, 1783, 1399, 1796]
  , [ 2426, 1749, 1403, 1775]
  , [ 2428, 1786, 1402, 1800]
  , [ 2429, 1753, 1406, 1778]
  , [ 2431, 1789, 1405, 1804]
  , [ 2432, 1757, 1408, 1780]
  , [ 2434, 1769, 1397, 1808]
  , [ 2435, 1761, 1406, 1790]
  , [ 2437, 1775, 1403, 1812]
  , [ 2438, 1765, 1398, 1782]
  , [ 2440, 1773, 1401, 1816]
  , [ 2441, 1817, 1424, 1970]
  , [ 2442, 1957, 1411, 1988]
  , [ 2443, 1821, 1427, 1973]
  , [ 2444, 1960, 1414, 1992]
  , [ 2445, 1825, 1430, 1976]
  , [ 2446, 1963, 1417, 1996]
  , [ 2447, 1829, 1432, 1978]
  , [ 2448, 1967, 1421, 2000]
  , [ 2449, 1833, 1418, 1964]
  , [ 2450, 1973, 1427, 2004]
  , [ 2451, 1837, 1410, 1956]
  , [ 2452, 1971, 1425, 2008]
  , [ 2453, 1841, 1412, 1916]
  , [ 2454, 2010, 1463, 2011]
  , [ 2456, 1845, 1435, 1939]
  , [ 2457, 2014, 1464, 2015]
  , [ 2458, 1938, 1434, 2016]
  , [ 2460, 2018, 1465, 2019]
  , [ 2461, 1927, 1423, 2020]
  , [ 2462, 1853, 1415, 1919]
  , [ 2463, 2022, 1466, 2023]
  , [ 2465, 1857, 1439, 1942]
  , [ 2466, 2026, 1467, 2027]
  , [ 2467, 1941, 1438, 2028]
  , [ 2469, 2030, 1468, 2031]
  , [ 2470, 1930, 1426, 2032]
  , [ 2471, 1865, 1418, 1922]
  , [ 2472, 2034, 1469, 2035]
  , [ 2474, 1869, 1443, 1945]
  , [ 2475, 2038, 1470, 2039]
  , [ 2476, 1944, 1442, 2040]
  , [ 2478, 2042, 1471, 2043]
  , [ 2479, 1933, 1429, 2044]
  , [ 2480, 1877, 1420, 1924]
  , [ 2481, 2046, 1472, 2047]
  , [ 2483, 1881, 1447, 1948]
  , [ 2484, 2050, 1473, 2051]
  , [ 2485, 1947, 1446, 2052]
  , [ 2487, 2054, 1474, 2055]
  , [ 2488, 1913, 1409, 2056]
  , [ 2489, 1889, 1430, 1934]
  , [ 2490, 2058, 1475, 2059]
  , [ 2492, 1893, 1451, 1951]
  , [ 2493, 2062, 1476, 2063]
  , [ 2494, 1950, 1450, 2064]
  , [ 2496, 2066, 1477, 2067]
  , [ 2497, 1919, 1415, 2068]
  , [ 2498, 1901, 1422, 1926]
  , [ 2499, 2070, 1478, 2071]
  , [ 2501, 1905, 1455, 1954]
  , [ 2502, 2074, 1479, 2075]
  , [ 2503, 1953, 1454, 2076]
  , [ 2505, 2078, 1480, 2079]
  , [ 2506, 1917, 1413, 2080]
  , [ 2507, 2081, 1496, 1928]
  , [ 2509, 1915, 1483, 2084]
  , [ 2510, 2085, 1499, 1931]
  , [ 2512, 1918, 1486, 2088]
  , [ 2513, 2089, 1502, 1934]
  , [ 2515, 1921, 1489, 2092]
  , [ 2516, 2093, 1504, 1936]
  , [ 2518, 1925, 1493, 2096]
  , [ 2519, 2097, 1490, 1922]
  , [ 2521, 1931, 1499, 2100]
  , [ 2522, 2101, 1482, 1914]
  , [ 2524, 1929, 1497, 2104]
  , [ 2525, 2105, 1514, 1958]
  , [ 2532, 1969, 1525, 2114]
  , [ 2533, 2115, 1517, 1961]
  , [ 2540, 1972, 1528, 2124]
  , [ 2541, 2125, 1520, 1964]
  , [ 2548, 1975, 1531, 2134]
  , [ 2549, 2135, 1522, 1966]
  , [ 2556, 1955, 1511, 2144]
  , [ 2557, 2145, 1532, 1976]
  , [ 2564, 1961, 1517, 2154]
  , [ 2565, 2155, 1524, 1968]
  , [ 2572, 1959, 1515, 2164]
  , [ 2573, 2165, 1526, 1784]
  , [ 2574, 2166, 1667, 2167]
  , [ 2576, 2168, 1555, 1819]
  , [ 2577, 2169, 1668, 2170]
  , [ 2578, 1818, 1554, 2171]
  , [ 2580, 2172, 1669, 2173]
  , [ 2581, 1771, 1513, 2174]
  , [ 2582, 2175, 1529, 1787]
  , [ 2583, 2176, 1670, 2177]
  , [ 2585, 2178, 1559, 1823]
  , [ 2586, 2179, 1671, 2180]
  , [ 2587, 1822, 1558, 2181]
  , [ 2589, 2182, 1672, 2183]
  , [ 2590, 1774, 1516, 2184]
  , [ 2591, 2185, 1532, 1790]
  , [ 2592, 2186, 1673, 2187]
  , [ 2594, 2188, 1563, 1827]
  , [ 2595, 2189, 1674, 2190]
  , [ 2596, 1826, 1562, 2191]
  , [ 2598, 2192, 1675, 2193]
  , [ 2599, 1777, 1519, 2194]
  , [ 2600, 2195, 1534, 1792]
  , [ 2601, 2196, 1676, 2197]
  , [ 2603, 2198, 1567, 1831]
  , [ 2604, 2199, 1677, 2200]
  , [ 2605, 1830, 1566, 2201]
  , [ 2607, 2202, 1678, 2203]
  , [ 2608, 1781, 1523, 2204]
  , [ 2609, 2205, 1520, 1778]
  , [ 2610, 2206, 1679, 2207]
  , [ 2612, 2208, 1571, 1835]
  , [ 2613, 2209, 1680, 2210]
  , [ 2614, 1834, 1570, 2211]
  , [ 2616, 2212, 1681, 2213]
  , [ 2617, 1787, 1529, 2214]
  , [ 2618, 2215, 1512, 1770]
  , [ 2619, 2216, 1682, 2217]
  , [ 2621, 2218, 1575, 1839]
  , [ 2622, 2219, 1683, 2220]
  , [ 2623, 1838, 1574, 2221]
  , [ 2625, 2222, 1684, 2223]
  , [ 2626, 1785, 1527, 2224]
  , [ 2627, 2225, 1484, 1724]
  , [ 2629, 2009, 1577, 2228]
  , [ 2631, 2229, 1685, 2230]
  , [ 2632, 1842, 1578, 2231]
  , [ 2633, 2233, 1686, 2234]
  , [ 2634, 1793, 1535, 2235]
  , [ 2637, 2013, 1581, 2238]
  , [ 2638, 2239, 1583, 1847]
  , [ 2640, 1846, 1582, 2242]
  , [ 2641, 2243, 1584, 1848]
  , [ 2644, 2246, 1505, 1748]
  , [ 2645, 2247, 1689, 2248]
  , [ 2646, 2250, 1587, 1851]
  , [ 2647, 2251, 1690, 2252]
  , [ 2649, 2253, 1588, 1852]
  , [ 2651, 1735, 1495, 2256]
  , [ 2652, 2257, 1487, 1727]
  , [ 2654, 2021, 1589, 2260]
  , [ 2656, 2261, 1691, 2262]
  , [ 2657, 1854, 1590, 2263]
  , [ 2658, 2265, 1692, 2266]
  , [ 2659, 1797, 1538, 2267]
  , [ 2662, 2025, 1593, 2270]
  , [ 2663, 2271, 1595, 1859]
  , [ 2665, 1858, 1594, 2274]
  , [ 2666, 2275, 1596, 1860]
  , [ 2669, 2278, 1506, 1752]
  , [ 2670, 2279, 1695, 2280]
  , [ 2671, 2282, 1599, 1863]
  , [ 2672, 2283, 1696, 2284]
  , [ 2674, 2285, 1600, 1864]
  , [ 2676, 1738, 1498, 2288]
  , [ 2677, 2289, 1490, 1730]
  , [ 2679, 2033, 1601, 2292]
  , [ 2681, 2293, 1697, 2294]
  , [ 2682, 1866, 1602, 2295]
  , [ 2683, 2297, 1698, 2298]
  , [ 2684, 1801, 1541, 2299]
  , [ 2687, 2037, 1605, 2302]
  , [ 2688, 2303, 1607, 1871]
  , [ 2690, 1870, 1606, 2306]
  , [ 2691, 2307, 1608, 1872]
  , [ 2694, 2310, 1507, 1756]
  , [ 2695, 2311, 1701, 2312]
  , [ 2696, 2314, 1611, 1875]
  , [ 2697, 2315, 1702, 2316]
  , [ 2699, 2317, 1612, 1876]
  , [ 2701, 1741, 1501, 2320]
  , [ 2702, 2321, 1492, 1732]
  , [ 2704, 2045, 1613, 2324]
  , [ 2706, 2325, 1703, 2326]
  , [ 2707, 1878, 1614, 2327]
  , [ 2708, 2329, 1704, 2330]
  , [ 2709, 1805, 1544, 2331]
  , [ 2712, 2049, 1617, 2334]
  , [ 2713, 2335, 1619, 1883]
  , [ 2715, 1882, 1618, 2338]
  , [ 2716, 2339, 1620, 1884]
  , [ 2719, 2342, 1508, 1760]
  , [ 2720, 2343, 1707, 2344]
  , [ 2721, 2346, 1623, 1887]
  , [ 2722, 2347, 1708, 2348]
  , [ 2724, 2349, 1624, 1888]
  , [ 2726, 1721, 1481, 2352]
  , [ 2727, 2353, 1502, 1742]
  , [ 2729, 2057, 1625, 2356]
  , [ 2731, 2357, 1709, 2358]
  , [ 2732, 1890, 1626, 2359]
  , [ 2733, 2361, 1710, 2362]
  , [ 2734, 1809, 1547, 2363]
  , [ 2737, 2061, 1629, 2366]
  , [ 2738, 2367, 1631, 1895]
  , [ 2740, 1894, 1630, 2370]
  , [ 2741, 2371, 1632, 1896]
  , [ 2744, 2374, 1509, 1764]
  , [ 2745, 2375, 1713, 2376]
  , [ 2746, 2378, 1635, 1899]
  , [ 2747, 2379, 1714, 2380]
  , [ 2749, 2381, 1636, 1900]
  , [ 2751, 1727, 1487, 2384]
  , [ 2752, 2385, 1494, 1734]
  , [ 2754, 2069, 1637, 2388]
  , [ 2756, 2389, 1715, 2390]
  , [ 2757, 1902, 1638, 2391]
  , [ 2758, 2393, 1716, 2394]
  , [ 2759, 1813, 1550, 2395]
  , [ 2762, 2073, 1641, 2398]
  , [ 2763, 2399, 1643, 1907]
  , [ 2765, 1906, 1642, 2402]
  , [ 2766, 2403, 1644, 1908]
  , [ 2769, 2406, 1510, 1768]
  , [ 2770, 2407, 1719, 2408]
  , [ 2771, 2410, 1647, 1911]
  , [ 2772, 2411, 1720, 2412]
  , [ 2774, 2413, 1648, 1912]
  , [ 2776, 1725, 1485, 2416]
  , [ 2081, 2417, 1736, 1496]
  , [ 2084, 1483, 1723, 2417]
  , [ 2085, 2418, 1739, 1499]
  , [ 2088, 1486, 1726, 2418]
  , [ 2089, 2419, 1742, 1502]
  , [ 2092, 1489, 1729, 2419]
  , [ 2093, 2420, 1744, 1504]
  , [ 2096, 1493, 1733, 2420]
  , [ 2097, 2421, 1730, 1490]
  , [ 2100, 1499, 1739, 2421]
  , [ 2101, 2422, 1722, 1482]
  , [ 2104, 1497, 1737, 2422]
  , [ 2105, 2423, 1772, 1514]
  , [ 1649, 2107, 2423, 2105]
  , [ 2108, 2424, 1795, 1537]
  , [ 1650, 2111, 2424, 2108]
  , [ 2111, 1536, 1794, 2424]
  , [ 1651, 2114, 2425, 2112]
  , [ 2114, 1525, 1783, 2425]
  , [ 2115, 2426, 1775, 1517]
  , [ 1652, 2117, 2426, 2115]
  , [ 2118, 2427, 1799, 1540]
  , [ 1653, 2121, 2427, 2118]
  , [ 2121, 1539, 1798, 2427]
  , [ 1654, 2124, 2428, 2122]
  , [ 2124, 1528, 1786, 2428]
  , [ 2125, 2429, 1778, 1520]
  , [ 1655, 2127, 2429, 2125]
  , [ 2128, 2430, 1803, 1543]
  , [ 1656, 2131, 2430, 2128]
  , [ 2131, 1542, 1802, 2430]
  , [ 1657, 2134, 2431, 2132]
  , [ 2134, 1531, 1789, 2431]
  , [ 2135, 2432, 1780, 1522]
  , [ 1658, 2137, 2432, 2135]
  , [ 2138, 2433, 1807, 1546]
  , [ 1659, 2141, 2433, 2138]
  , [ 2141, 1545, 1806, 2433]
  , [ 1660, 2144, 2434, 2142]
  , [ 2144, 1511, 1769, 2434]
  , [ 2145, 2435, 1790, 1532]
  , [ 1661, 2147, 2435, 2145]
  , [ 2148, 2436, 1811, 1549]
  , [ 1662, 2151, 2436, 2148]
  , [ 2151, 1548, 1810, 2436]
  , [ 1663, 2154, 2437, 2152]
  , [ 2154, 1517, 1775, 2437]
  , [ 2155, 2438, 1782, 1524]
  , [ 1664, 2157, 2438, 2155]
  , [ 2158, 2439, 1815, 1552]
  , [ 1665, 2161, 2439, 2158]
  , [ 2161, 1551, 1814, 2439]
  , [ 1666, 2164, 2440, 2162]
  , [ 2164, 1515, 1773, 2440]
  , [ 2165, 2441, 1970, 1526]
  , [ 2174, 1513, 1957, 2442]
  , [ 2175, 2443, 1973, 1529]
  , [ 2184, 1516, 1960, 2444]
  , [ 2185, 2445, 1976, 1532]
  , [ 2194, 1519, 1963, 2446]
  , [ 2195, 2447, 1978, 1534]
  , [ 2204, 1523, 1967, 2448]
  , [ 2205, 2449, 1964, 1520]
  , [ 2214, 1529, 1973, 2450]
  , [ 2215, 2451, 1956, 1512]
  , [ 2224, 1527, 1971, 2452]
  , [ 2225, 2453, 1916, 1484]
  , [ 2228, 1577, 1841, 2453]
  , [ 2231, 1578, 2010, 2454]
  , [ 2232, 2455, 2012, 1580]
  , [ 1686, 2235, 2455, 2232]
  , [ 1687, 2238, 2456, 2236]
  , [ 2238, 1581, 1845, 2456]
  , [ 2239, 2457, 2015, 1583]
  , [ 2242, 1582, 2014, 2457]
  , [ 2243, 2458, 2016, 1584]
  , [ 1688, 2245, 2458, 2243]
  , [ 1689, 2249, 2459, 2246]
  , [ 2249, 1585, 1849, 2459]
  , [ 2250, 2460, 2019, 1587]
  , [ 2253, 2461, 2020, 1588]
  , [ 2256, 1495, 1927, 2461]
  , [ 2257, 2462, 1919, 1487]
  , [ 2260, 1589, 1853, 2462]
  , [ 2263, 1590, 2022, 2463]
  , [ 2264, 2464, 2024, 1592]
  , [ 1692, 2267, 2464, 2264]
  , [ 1693, 2270, 2465, 2268]
  , [ 2270, 1593, 1857, 2465]
  , [ 2271, 2466, 2027, 1595]
  , [ 2274, 1594, 2026, 2466]
  , [ 2275, 2467, 2028, 1596]
  , [ 1694, 2277, 2467, 2275]
  , [ 1695, 2281, 2468, 2278]
  , [ 2281, 1597, 1861, 2468]
  , [ 2282, 2469, 2031, 1599]
  , [ 2285, 2470, 2032, 1600]
  , [ 2288, 1498, 1930, 2470]
  , [ 2289, 2471, 1922, 1490]
  , [ 2292, 1601, 1865, 2471]
  , [ 2295, 1602, 2034, 2472]
  , [ 2296, 2473, 2036, 1604]
  , [ 1698, 2299, 2473, 2296]
  , [ 1699, 2302, 2474, 2300]
  , [ 2302, 1605, 1869, 2474]
  , [ 2303, 2475, 2039, 1607]
  , [ 2306, 1606, 2038, 2475]
  , [ 2307, 2476, 2040, 1608]
  , [ 1700, 2309, 2476, 2307]
  , [ 1701, 2313, 2477, 2310]
  , [ 2313, 1609, 1873, 2477]
  , [ 2314, 2478, 2043, 1611]
  , [ 2317, 2479, 2044, 1612]
  , [ 2320, 1501, 1933, 2479]
  , [ 2321, 2480, 1924, 1492]
  , [ 2324, 1613, 1877, 2480]
  , [ 2327, 1614, 2046, 2481]
  , [ 2328, 2482, 2048, 1616]
  , [ 1704, 2331, 2482, 2328]
  , [ 1705, 2334, 2483, 2332]
  , [ 2334, 1617, 1881, 2483]
  , [ 2335, 2484, 2051, 1619]
  , [ 2338, 1618, 2050, 2484]
  , [ 2339, 2485, 2052, 1620]
  , [ 1706, 2341, 2485, 2339]
  , [ 1707, 2345, 2486, 2342]
  , [ 2345, 1621, 1885, 2486]
  , [ 2346, 2487, 2055, 1623]
  , [ 2349, 2488, 2056, 1624]
  , [ 2352, 1481, 1913, 2488]
  , [ 2353, 2489, 1934, 1502]
  , [ 2356, 1625, 1889, 2489]
  , [ 2359, 1626, 2058, 2490]
  , [ 2360, 2491, 2060, 1628]
  , [ 1710, 2363, 2491, 2360]
  , [ 1711, 2366, 2492, 2364]
  , [ 2366, 1629, 1893, 2492]
  , [ 2367, 2493, 2063, 1631]
  , [ 2370, 1630, 2062, 2493]
  , [ 2371, 2494, 2064, 1632]
  , [ 1712, 2373, 2494, 2371]
  , [ 1713, 2377, 2495, 2374]
  , [ 2377, 1633, 1897, 2495]
  , [ 2378, 2496, 2067, 1635]
  , [ 2381, 2497, 2068, 1636]
  , [ 2384, 1487, 1919, 2497]
  , [ 2385, 2498, 1926, 1494]
  , [ 2388, 1637, 1901, 2498]
  , [ 2391, 1638, 2070, 2499]
  , [ 2392, 2500, 2072, 1640]
  , [ 1716, 2395, 2500, 2392]
  , [ 1717, 2398, 2501, 2396]
  , [ 2398, 1641, 1905, 2501]
  , [ 2399, 2502, 2075, 1643]
  , [ 2402, 1642, 2074, 2502]
  , [ 2403, 2503, 2076, 1644]
  , [ 1718, 2405, 2503, 2403]
  , [ 1719, 2409, 2504, 2406]
  , [ 2409, 1645, 1909, 2504]
  , [ 2410, 2505, 2079, 1647]
  , [ 2413, 2506, 2080, 1648]
  , [ 2416, 1485, 1917, 2506]
  , [ 1817, 2507, 1928, 1424]
  , [ 1553, 2083, 2507, 1817]
  , [ 1985, 2508, 2083, 1553]
  , [ 1457, 1820, 2508, 1985]
  , [ 1820, 1556, 2082, 2508]
  , [ 1556, 1988, 2509, 2082]
  , [ 1988, 1411, 1915, 2509]
  , [ 1821, 2510, 1931, 1427]
  , [ 1557, 2087, 2510, 1821]
  , [ 1989, 2511, 2087, 1557]
  , [ 1458, 1824, 2511, 1989]
  , [ 1824, 1560, 2086, 2511]
  , [ 1560, 1992, 2512, 2086]
  , [ 1992, 1414, 1918, 2512]
  , [ 1825, 2513, 1934, 1430]
  , [ 1561, 2091, 2513, 1825]
  , [ 1993, 2514, 2091, 1561]
  , [ 1459, 1828, 2514, 1993]
  , [ 1828, 1564, 2090, 2514]
  , [ 1564, 1996, 2515, 2090]
  , [ 1996, 1417, 1921, 2515]
  , [ 1829, 2516, 1936, 1432]
  , [ 1565, 2095, 2516, 1829]
  , [ 1997, 2517, 2095, 1565]
  , [ 1460, 1832, 2517, 1997]
  , [ 1832, 1568, 2094, 2517]
  , [ 1568, 2000, 2518, 2094]
  , [ 2000, 1421, 1925, 2518]
  , [ 1833, 2519, 1922, 1418]
  , [ 1569, 2099, 2519, 1833]
  , [ 2001, 2520, 2099, 1569]
  , [ 1461, 1836, 2520, 2001]
  , [ 1836, 1572, 2098, 2520]
  , [ 1572, 2004, 2521, 2098]
  , [ 2004, 1427, 1931, 2521]
  , [ 1837, 2522, 1914, 1410]
  , [ 1573, 2103, 2522, 1837]
  , [ 2005, 2523, 2103, 1573]
  , [ 1462, 1840, 2523, 2005]
  , [ 1840, 1576, 2102, 2523]
  , [ 1576, 2008, 2524, 2102]
  , [ 2008, 1425, 1929, 2524]
  , [ 1841, 2525, 1958, 1412]
  , [ 1463, 1844, 2526, 2009]
  , [ 1844, 1580, 2106, 2526]
  , [ 2106, 2527, 2107, 1649]
  , [ 1580, 2012, 2527, 2106]
  , [ 2012, 1433, 1937, 2527]
  , [ 1581, 2110, 2528, 1845]
  , [ 2110, 1650, 2108, 2528]
  , [ 2109, 2529, 2111, 1650]
  , [ 1584, 2016, 2529, 2109]
  , [ 1849, 2530, 1979, 1436]
  , [ 1585, 2113, 2530, 1849]
  , [ 2113, 1651, 2112, 2530]
  , [ 2017, 2531, 2113, 1585]
  , [ 1465, 1852, 2531, 2017]
  , [ 2020, 1423, 1969, 2532]
  , [ 1853, 2533, 1961, 1415]
  , [ 1466, 1856, 2534, 2021]
  , [ 1856, 1592, 2116, 2534]
  , [ 2116, 2535, 2117, 1652]
  , [ 1592, 2024, 2535, 2116]
  , [ 2024, 1437, 1940, 2535]
  , [ 1593, 2120, 2536, 1857]
  , [ 2120, 1653, 2118, 2536]
  , [ 2119, 2537, 2121, 1653]
  , [ 1596, 2028, 2537, 2119]
  , [ 1861, 2538, 1980, 1440]
  , [ 1597, 2123, 2538, 1861]
  , [ 2123, 1654, 2122, 2538]
  , [ 2029, 2539, 2123, 1597]
  , [ 1468, 1864, 2539, 2029]
  , [ 2032, 1426, 1972, 2540]
  , [ 1865, 2541, 1964, 1418]
  , [ 1469, 1868, 2542, 2033]
  , [ 1868, 1604, 2126, 2542]
  , [ 2126, 2543, 2127, 1655]
  , [ 1604, 2036, 2543, 2126]
  , [ 2036, 1441, 1943, 2543]
  , [ 1605, 2130, 2544, 1869]
  , [ 2130, 1656, 2128, 2544]
  , [ 2129, 2545, 2131, 1656]
  , [ 1608, 2040, 2545, 2129]
  , [ 1873, 2546, 1981, 1444]
  , [ 1609, 2133, 2546, 1873]
  , [ 2133, 1657, 2132, 2546]
  , [ 2041, 2547, 2133, 1609]
  , [ 1471, 1876, 2547, 2041]
  , [ 2044, 1429, 1975, 2548]
  , [ 1877, 2549, 1966, 1420]
  , [ 1472, 1880, 2550, 2045]
  , [ 1880, 1616, 2136, 2550]
  , [ 2136, 2551, 2137, 1658]
  , [ 1616, 2048, 2551, 2136]
  , [ 2048, 1445, 1946, 2551]
  , [ 1617, 2140, 2552, 1881]
  , [ 2140, 1659, 2138, 2552]
  , [ 2139, 2553, 2141, 1659]
  , [ 1620, 2052, 2553, 2139]
  , [ 1885, 2554, 1982, 1448]
  , [ 1621, 2143, 2554, 1885]
  , [ 2143, 1660, 2142, 2554]
  , [ 2053, 2555, 2143, 1621]
  , [ 1474, 1888, 2555, 2053]
  , [ 2056, 1409, 1955, 2556]
  , [ 1889, 2557, 1976, 1430]
  , [ 1475, 1892, 2558, 2057]
  , [ 1892, 1628, 2146, 2558]
  , [ 2146, 2559, 2147, 1661]
  , [ 1628, 2060, 2559, 2146]
  , [ 2060, 1449, 1949, 2559]
  , [ 1629, 2150, 2560, 1893]
  , [ 2150, 1662, 2148, 2560]
  , [ 2149, 2561, 2151, 1662]
  , [ 1632, 2064, 2561, 2149]
  , [ 1897, 2562, 1983, 1452]
  , [ 1633, 2153, 2562, 1897]
  , [ 2153, 1663, 2152, 2562]
  , [ 2065, 2563, 2153, 1633]
  , [ 1477, 1900, 2563, 2065]
  , [ 2068, 1415, 1961, 2564]
  , [ 1901, 2565, 1968, 1422]
  , [ 1478, 1904, 2566, 2069]
  , [ 1904, 1640, 2156, 2566]
  , [ 2156, 2567, 2157, 1664]
  , [ 1640, 2072, 2567, 2156]
  , [ 2072, 1453, 1952, 2567]
  , [ 1641, 2160, 2568, 1905]
  , [ 2160, 1665, 2158, 2568]
  , [ 2159, 2569, 2161, 1665]
  , [ 1644, 2076, 2569, 2159]
  , [ 1909, 2570, 1984, 1456]
  , [ 1645, 2163, 2570, 1909]
  , [ 2163, 1666, 2162, 2570]
  , [ 2077, 2571, 2163, 1645]
  , [ 1480, 1912, 2571, 2077]
  , [ 2080, 1413, 1959, 2572]
  , [ 1745, 2573, 1784, 1400]
  , [ 2167, 1667, 2165, 2573]
  , [ 1433, 1819, 2574, 1937]
  , [ 1819, 1555, 2166, 2574]
  , [ 1555, 1987, 2575, 2166]
  , [ 1987, 1457, 1985, 2575]
  , [ 2170, 1668, 2168, 2576]
  , [ 1793, 2577, 2170, 1535]
  , [ 1748, 1505, 2169, 2577]
  , [ 2169, 2578, 2171, 1668]
  , [ 1986, 2579, 1820, 1457]
  , [ 1554, 2173, 2579, 1986]
  , [ 1818, 2580, 2173, 1554]
  , [ 1436, 1979, 2580, 1818]
  , [ 2172, 2581, 2174, 1669]
  , [ 1796, 1399, 1771, 2581]
  , [ 1749, 2582, 1787, 1403]
  , [ 2177, 1670, 2175, 2582]
  , [ 1437, 1823, 2583, 1940]
  , [ 1823, 1559, 2176, 2583]
  , [ 1559, 1991, 2584, 2176]
  , [ 1991, 1458, 1989, 2584]
  , [ 2180, 1671, 2178, 2585]
  , [ 1797, 2586, 2180, 1538]
  , [ 1752, 1506, 2179, 2586]
  , [ 2179, 2587, 2181, 1671]
  , [ 1990, 2588, 1824, 1458]
  , [ 1558, 2183, 2588, 1990]
  , [ 1822, 2589, 2183, 1558]
  , [ 1440, 1980, 2589, 1822]
  , [ 2182, 2590, 2184, 1672]
  , [ 1800, 1402, 1774, 2590]
  , [ 1753, 2591, 1790, 1406]
  , [ 2187, 1673, 2185, 2591]
  , [ 1441, 1827, 2592, 1943]
  , [ 1827, 1563, 2186, 2592]
  , [ 1563, 1995, 2593, 2186]
  , [ 1995, 1459, 1993, 2593]
  , [ 2190, 1674, 2188, 2594]
  , [ 1801, 2595, 2190, 1541]
  , [ 1756, 1507, 2189, 2595]
  , [ 2189, 2596, 2191, 1674]
  , [ 1994, 2597, 1828, 1459]
  , [ 1562, 2193, 2597, 1994]
  , [ 1826, 2598, 2193, 1562]
  , [ 1444, 1981, 2598, 1826]
  , [ 2192, 2599, 2194, 1675]
  , [ 1804, 1405, 1777, 2599]
  , [ 1757, 2600, 1792, 1408]
  , [ 2197, 1676, 2195, 2600]
  , [ 1445, 1831, 2601, 1946]
  , [ 1831, 1567, 2196, 2601]
  , [ 1567, 1999, 2602, 2196]
  , [ 1999, 1460, 1997, 2602]
  , [ 2200, 1677, 2198, 2603]
  , [ 1805, 2604, 2200, 1544]
  , [ 1760, 1508, 2199, 2604]
  , [ 2199, 2605, 2201, 1677]
  , [ 1998, 2606, 1832, 1460]
  , [ 1566, 2203, 2606, 1998]
  , [ 1830, 2607, 2203, 1566]
  , [ 1448, 1982, 2607, 1830]
  , [ 2202, 2608, 2204, 1678]
  , [ 1808, 1397, 1781, 2608]
  , [ 1761, 2609, 1778, 1406]
  , [ 2207, 1679, 2205, 2609]
  , [ 1449, 1835, 2610, 1949]
  , [ 1835, 1571, 2206, 2610]
  , [ 1571, 2003, 2611, 2206]
  , [ 2003, 1461, 2001, 2611]
  , [ 2210, 1680, 2208, 2612]
  , [ 1809, 2613, 2210, 1547]
  , [ 1764, 1509, 2209, 2613]
  , [ 2209, 2614, 2211, 1680]
  , [ 2002, 2615, 1836, 1461]
  , [ 1570, 2213, 2615, 2002]
  , [ 1834, 2616, 2213, 1570]
  , [ 1452, 1983, 2616, 1834]
  , [ 2212, 2617, 2214, 1681]
  , [ 1812, 1403, 1787, 2617]
  , [ 1765, 2618, 1770, 1398]
  , [ 2217, 1682, 2215, 2618]
  , [ 1453, 1839, 2619, 1952]
  , [ 1839, 1575, 2216, 2619]
  , [ 1575, 2007, 2620, 2216]
  , [ 2007, 1462, 2005, 2620]
  , [ 2220, 1683, 2218, 2621]
  , [ 1813, 2622, 2220, 1550]
  , [ 1768, 1510, 2219, 2622]
  , [ 2219, 2623, 2221, 1683]
  , [ 2006, 2624, 1840, 1462]
  , [ 1574, 2223, 2624, 2006]
  , [ 1838, 2625, 2223, 1574]
  , [ 1456, 1984, 2625, 1838]
  , [ 2222, 2626, 2224, 1684]
  , [ 1816, 1401, 1785, 2626]
  , [ 1733, 2627, 1724, 1389]
  , [ 1493, 2227, 2627, 1733]
  , [ 1925, 2628, 2227, 1493]
  , [ 1421, 1843, 2628, 1925]
  , [ 1843, 1579, 2226, 2628]
  , [ 1579, 2011, 2629, 2226]
  , [ 2011, 1463, 2009, 2629]
  , [ 1967, 2630, 1843, 1421]
  , [ 1523, 2230, 2630, 1967]
  , [ 1781, 2631, 2230, 1523]
  , [ 1397, 1747, 2631, 1781]
  , [ 2229, 2632, 2231, 1685]
  , [ 1939, 1435, 1842, 2632]
  , [ 1842, 2633, 2234, 1578]
  , [ 2233, 2634, 2235, 1686]
  , [ 1537, 1795, 2634, 2233]
  , [ 1769, 2635, 1747, 1397]
  , [ 1511, 2237, 2635, 1769]
  , [ 2237, 1687, 2236, 2635]
  , [ 1955, 2636, 2237, 1511]
  , [ 1409, 1847, 2636, 1955]
  , [ 2015, 1464, 2013, 2637]
  , [ 1913, 2638, 1847, 1409]
  , [ 1481, 2241, 2638, 1913]
  , [ 1721, 2639, 2241, 1481]
  , [ 1393, 1734, 2639, 1721]
  , [ 1734, 1494, 2240, 2639]
  , [ 1494, 1926, 2640, 2240]
  , [ 1926, 1422, 1846, 2640]
  , [ 2014, 2641, 1848, 1464]
  , [ 1422, 1968, 2642, 1846]
  , [ 1968, 1524, 2244, 2642]
  , [ 2244, 2643, 2245, 1688]
  , [ 1524, 1782, 2643, 2244]
  , [ 1782, 1398, 1746, 2643]
  , [ 1536, 2248, 2644, 1794]
  , [ 2248, 1689, 2246, 2644]
  , [ 1851, 1587, 2247, 2645]
  , [ 1938, 2646, 1851, 1434]
  , [ 2252, 1690, 2250, 2646]
  , [ 1398, 1770, 2647, 1746]
  , [ 1770, 1512, 2251, 2647]
  , [ 1512, 1956, 2648, 2251]
  , [ 1956, 1410, 1850, 2648]
  , [ 2018, 2649, 1852, 1465]
  , [ 1586, 2255, 2649, 2018]
  , [ 1850, 2650, 2255, 1586]
  , [ 1410, 1914, 2650, 1850]
  , [ 1914, 1482, 2254, 2650]
  , [ 1482, 1722, 2651, 2254]
  , [ 1722, 1394, 1735, 2651]
  , [ 1723, 2652, 1727, 1390]
  , [ 1483, 2259, 2652, 1723]
  , [ 1915, 2653, 2259, 1483]
  , [ 1411, 1855, 2653, 1915]
  , [ 1855, 1591, 2258, 2653]
  , [ 1591, 2023, 2654, 2258]
  , [ 2023, 1466, 2021, 2654]
  , [ 1957, 2655, 1855, 1411]
  , [ 1513, 2262, 2655, 1957]
  , [ 1771, 2656, 2262, 1513]
  , [ 1399, 1751, 2656, 1771]
  , [ 2261, 2657, 2263, 1691]
  , [ 1942, 1439, 1854, 2657]
  , [ 1854, 2658, 2266, 1590]
  , [ 2265, 2659, 2267, 1692]
  , [ 1540, 1799, 2659, 2265]
  , [ 1783, 2660, 1751, 1399]
  , [ 1525, 2269, 2660, 1783]
  , [ 2269, 1693, 2268, 2660]
  , [ 1969, 2661, 2269, 1525]
  , [ 1423, 1859, 2661, 1969]
  , [ 2027, 1467, 2025, 2662]
  , [ 1927, 2663, 1859, 1423]
  , [ 1495, 2273, 2663, 1927]
  , [ 1735, 2664, 2273, 1495]
  , [ 1394, 1737, 2664, 1735]
  , [ 1737, 1497, 2272, 2664]
  , [ 1497, 1929, 2665, 2272]
  , [ 1929, 1425, 1858, 2665]
  , [ 2026, 2666, 1860, 1467]
  , [ 1425, 1971, 2667, 1858]
  , [ 1971, 1527, 2276, 2667]
  , [ 2276, 2668, 2277, 1694]
  , [ 1527, 1785, 2668, 2276]
  , [ 1785, 1401, 1750, 2668]
  , [ 1539, 2280, 2669, 1798]
  , [ 2280, 1695, 2278, 2669]
  , [ 1863, 1599, 2279, 2670]
  , [ 1941, 2671, 1863, 1438]
  , [ 2284, 1696, 2282, 2671]
  , [ 1401, 1773, 2672, 1750]
  , [ 1773, 1515, 2283, 2672]
  , [ 1515, 1959, 2673, 2283]
  , [ 1959, 1413, 1862, 2673]
  , [ 2030, 2674, 1864, 1468]
  , [ 1598, 2287, 2674, 2030]
  , [ 1862, 2675, 2287, 1598]
  , [ 1413, 1917, 2675, 1862]
  , [ 1917, 1485, 2286, 2675]
  , [ 1485, 1725, 2676, 2286]
  , [ 1725, 1395, 1738, 2676]
  , [ 1726, 2677, 1730, 1391]
  , [ 1486, 2291, 2677, 1726]
  , [ 1918, 2678, 2291, 1486]
  , [ 1414, 1867, 2678, 1918]
  , [ 1867, 1603, 2290, 2678]
  , [ 1603, 2035, 2679, 2290]
  , [ 2035, 1469, 2033, 2679]
  , [ 1960, 2680, 1867, 1414]
  , [ 1516, 2294, 2680, 1960]
  , [ 1774, 2681, 2294, 1516]
  , [ 1402, 1755, 2681, 1774]
  , [ 2293, 2682, 2295, 1697]
  , [ 1945, 1443, 1866, 2682]
  , [ 1866, 2683, 2298, 1602]
  , [ 2297, 2684, 2299, 1698]
  , [ 1543, 1803, 2684, 2297]
  , [ 1786, 2685, 1755, 1402]
  , [ 1528, 2301, 2685, 1786]
  , [ 2301, 1699, 2300, 2685]
  , [ 1972, 2686, 2301, 1528]
  , [ 1426, 1871, 2686, 1972]
  , [ 2039, 1470, 2037, 2687]
  , [ 1930, 2688, 1871, 1426]
  , [ 1498, 2305, 2688, 1930]
  , [ 1738, 2689, 2305, 1498]
  , [ 1395, 1740, 2689, 1738]
  , [ 1740, 1500, 2304, 2689]
  , [ 1500, 1932, 2690, 2304]
  , [ 1932, 1428, 1870, 2690]
  , [ 2038, 2691, 1872, 1470]
  , [ 1428, 1974, 2692, 1870]
  , [ 1974, 1530, 2308, 2692]
  , [ 2308, 2693, 2309, 1700]
  , [ 1530, 1788, 2693, 2308]
  , [ 1788, 1404, 1754, 2693]
  , [ 1542, 2312, 2694, 1802]
  , [ 2312, 1701, 2310, 2694]
  , [ 1875, 1611, 2311, 2695]
  , [ 1944, 2696, 1875, 1442]
  , [ 2316, 1702, 2314, 2696]
  , [ 1404, 1776, 2697, 1754]
  , [ 1776, 1518, 2315, 2697]
  , [ 1518, 1962, 2698, 2315]
  , [ 1962, 1416, 1874, 2698]
  , [ 2042, 2699, 1876, 1471]
  , [ 1610, 2319, 2699, 2042]
  , [ 1874, 2700, 2319, 1610]
  , [ 1416, 1920, 2700, 1874]
  , [ 1920, 1488, 2318, 2700]
  , [ 1488, 1728, 2701, 2318]
  , [ 1728, 1396, 1741, 2701]
  , [ 1729, 2702, 1732, 1392]
  , [ 1489, 2323, 2702, 1729]
  , [ 1921, 2703, 2323, 1489]
  , [ 1417, 1879, 2703, 1921]
  , [ 1879, 1615, 2322, 2703]
  , [ 1615, 2047, 2704, 2322]
  , [ 2047, 1472, 2045, 2704]
  , [ 1963, 2705, 1879, 1417]
  , [ 1519, 2326, 2705, 1963]
  , [ 1777, 2706, 2326, 1519]
  , [ 1405, 1759, 2706, 1777]
  , [ 2325, 2707, 2327, 1703]
  , [ 1948, 1447, 1878, 2707]
  , [ 1878, 2708, 2330, 1614]
  , [ 2329, 2709, 2331, 1704]
  , [ 1546, 1807, 2709, 2329]
  , [ 1789, 2710, 1759, 1405]
  , [ 1531, 2333, 2710, 1789]
  , [ 2333, 1705, 2332, 2710]
  , [ 1975, 2711, 2333, 1531]
  , [ 1429, 1883, 2711, 1975]
  , [ 2051, 1473, 2049, 2712]
  , [ 1933, 2713, 1883, 1429]
  , [ 1501, 2337, 2713, 1933]
  , [ 1741, 2714, 2337, 1501]
  , [ 1396, 1743, 2714, 1741]
  , [ 1743, 1503, 2336, 2714]
  , [ 1503, 1935, 2715, 2336]
  , [ 1935, 1431, 1882, 2715]
  , [ 2050, 2716, 1884, 1473]
  , [ 1431, 1977, 2717, 1882]
  , [ 1977, 1533, 2340, 2717]
  , [ 2340, 2718, 2341, 1706]
  , [ 1533, 1791, 2718, 2340]
  , [ 1791, 1407, 1758, 2718]
  , [ 1545, 2344, 2719, 1806]
  , [ 2344, 1707, 2342, 2719]
  , [ 1887, 1623, 2343, 2720]
  , [ 1947, 2721, 1887, 1446]
  , [ 2348, 1708, 2346, 2721]
  , [ 1407, 1779, 2722, 1758]
  , [ 1779, 1521, 2347, 2722]
  , [ 1521, 1965, 2723, 2347]
  , [ 1965, 1419, 1886, 2723]
  , [ 2054, 2724, 1888, 1474]
  , [ 1622, 2351, 2724, 2054]
  , [ 1886, 2725, 2351, 1622]
  , [ 1419, 1923, 2725, 1886]
  , [ 1923, 1491, 2350, 2725]
  , [ 1491, 1731, 2726, 2350]
  , [ 1731, 1393, 1721, 2726]
  , [ 1732, 2727, 1742, 1392]
  , [ 1492, 2355, 2727, 1732]
  , [ 1924, 2728, 2355, 1492]
  , [ 1420, 1891, 2728, 1924]
  , [ 1891, 1627, 2354, 2728]
  , [ 1627, 2059, 2729, 2354]
  , [ 2059, 1475, 2057, 2729]
  , [ 1966, 2730, 1891, 1420]
  , [ 1522, 2358, 2730, 1966]
  , [ 1780, 2731, 2358, 1522]
  , [ 1408, 1763, 2731, 1780]
  , [ 2357, 2732, 2359, 1709]
  , [ 1951, 1451, 1890, 2732]
  , [ 1890, 2733, 2362, 1626]
  , [ 2361, 2734, 2363, 1710]
  , [ 1549, 1811, 2734, 2361]
  , [ 1792, 2735, 1763, 1408]
  , [ 1534, 2365, 2735, 1792]
  , [ 2365, 1711, 2364, 2735]
  , [ 1978, 2736, 2365, 1534]
  , [ 1432, 1895, 2736, 1978]
  , [ 2063, 1476, 2061, 2737]
  , [ 1936, 2738, 1895, 1432]
  , [ 1504, 2369, 2738, 1936]
  , [ 1744, 2739, 2369, 1504]
  , [ 1389, 1724, 2739, 1744]
  , [ 1724, 1484, 2368, 2739]
  , [ 1484, 1916, 2740, 2368]
  , [ 1916, 1412, 1894, 2740]
  , [ 2062, 2741, 1896, 1476]
  , [ 1412, 1958, 2742, 1894]
  , [ 1958, 1514, 2372, 2742]
  , [ 2372, 2743, 2373, 1712]
  , [ 1514, 1772, 2743, 2372]
  , [ 1772, 1400, 1762, 2743]
  , [ 1548, 2376, 2744, 1810]
  , [ 2376, 1713, 2374, 2744]
  , [ 1899, 1635, 2375, 2745]
  , [ 1950, 2746, 1899, 1450]
  , [ 2380, 1714, 2378, 2746]
  , [ 1400, 1784, 2747, 1762]
  , [ 1784, 1526, 2379, 2747]
  , [ 1526, 1970, 2748, 2379]
  , [ 1970, 1424, 1898, 2748]
  , [ 2066, 2749, 1900, 1477]
  , [ 1634, 2383, 2749, 2066]
  , [ 1898, 2750, 2383, 1634]
  , [ 1424, 1928, 2750, 1898]
  , [ 1928, 1496, 2382, 2750]
  , [ 1496, 1736, 2751, 2382]
  , [ 1736, 1390, 1727, 2751]
  , [ 1731, 2752, 1734, 1393]
  , [ 1491, 2387, 2752, 1731]
  , [ 1923, 2753, 2387, 1491]
  , [ 1419, 1903, 2753, 1923]
  , [ 1903, 1639, 2386, 2753]
  , [ 1639, 2071, 2754, 2386]
  , [ 2071, 1478, 2069, 2754]
  , [ 1965, 2755, 1903, 1419]
  , [ 1521, 2390, 2755, 1965]
  , [ 1779, 2756, 2390, 1521]
  , [ 1407, 1767, 2756, 1779]
  , [ 2389, 2757, 2391, 1715]
  , [ 1954, 1455, 1902, 2757]
  , [ 1902, 2758, 2394, 1638]
  , [ 2393, 2759, 2395, 1716]
  , [ 1552, 1815, 2759, 2393]
  , [ 1791, 2760, 1767, 1407]
  , [ 1533, 2397, 2760, 1791]
  , [ 2397, 1717, 2396, 2760]
  , [ 1977, 2761, 2397, 1533]
  , [ 1431, 1907, 2761, 1977]
  , [ 2075, 1479, 2073, 2762]
  , [ 1935, 2763, 1907, 1431]
  , [ 1503, 2401, 2763, 1935]
  , [ 1743, 2764, 2401, 1503]
  , [ 1396, 1728, 2764, 1743]
  , [ 1728, 1488, 2400, 2764]
  , [ 1488, 1920, 2765, 2400]
  , [ 1920, 1416, 1906, 2765]
  , [ 2074, 2766, 1908, 1479]
  , [ 1416, 1962, 2767, 1906]
  , [ 1962, 1518, 2404, 2767]
  , [ 2404, 2768, 2405, 1718]
  , [ 1518, 1776, 2768, 2404]
  , [ 1776, 1404, 1766, 2768]
  , [ 1551, 2408, 2769, 1814]
  , [ 2408, 1719, 2406, 2769]
  , [ 1911, 1647, 2407, 2770]
  , [ 1953, 2771, 1911, 1454]
  , [ 2412, 1720, 2410, 2771]
  , [ 1404, 1788, 2772, 1766]
  , [ 1788, 1530, 2411, 2772]
  , [ 1530, 1974, 2773, 2411]
  , [ 1974, 1428, 1910, 2773]
  , [ 2078, 2774, 1912, 1480]
  , [ 1646, 2415, 2774, 2078]
  , [ 1910, 2775, 2415, 1646]
  , [ 1428, 1932, 2775, 1910]
  , [ 1932, 1500, 2414, 2775]
  , [ 1500, 1740, 2776, 2414]
  , [ 1740, 1395, 1725, 2776]
  , [ 1005, 164, 1552, 2393]
  , [ 406, 1036, 2424, 1794]
  , [ 877, 152, 1540, 2265]
  , [ 1304, 482, 1870, 2692]
  , [ 923, 313, 1701, 2311]
  , [ 242, 674, 2062, 1630]
  , [ 158, 750, 2138, 1546]
  , [ 1276, 885, 2273, 2664]
  , [ 1271, 409, 1797, 2659]
  , [ 700, 1124, 2512, 2088]
  , [ 79, 637, 2025, 1467]
  , [ 1095, 944, 2332, 2483]
  , [ 995, 1361, 2749, 2383]
  , [ 1214, 808, 2196, 2602]
  , [ 623, 1066, 2454, 2011]
  , [ 1006, 250, 1638, 2394]
  , [ 1185, 779, 2167, 2573]
  , [ 408, 1037, 2425, 1796]
  , [ 174, 803, 2191, 1562]
  , [ 878, 202, 1590, 2266]
  , [ 920, 1304, 2692, 2308]
  , [ 477, 1153, 2541, 1865]
  , [ 675, 243, 1631, 2063]
  , [ 751, 232, 1620, 2139]
  , [ 1272, 363, 1751, 2660]
  , [ 1243, 841, 2229, 2631]
  , [ 609, 1214, 2602, 1997]
  , [ 1066, 843, 2231, 2454]
  , [ 430, 48, 1436, 1818]
  , [ 1333, 960, 2348, 2721]
  , [ 357, 1185, 2573, 1745]
  , [ 1305, 921, 2309, 2693]
  , [ 925, 221, 1609, 2313]
  , [ 229, 752, 2140, 1617]
  , [ 1153, 737, 2125, 2541]
  , [ 1124, 698, 2086, 2512]
  , [ 444, 180, 1568, 1832]
  , [ 1361, 993, 2381, 2749]
  , [ 443, 1215, 2603, 1831]
  , [ 45, 431, 1819, 1433]
  , [ 559, 1333, 2721, 1947]
  , [ 1037, 724, 2112, 2425]
  , [ 287, 805, 2193, 1675]
  , [ 314, 926, 2314, 1702]
  , [ 245, 677, 2065, 1633]
  , [ 884, 1276, 2664, 2272]
  , [ 50, 640, 2028, 1438]
  , [ 1244, 551, 1939, 2632]
  , [ 1096, 950, 2338, 2484]
  , [ 445, 181, 1569, 1833]
  , [ 1362, 995, 2383, 2750]
  , [ 1215, 812, 2200, 2603]
  , [ 1067, 624, 2012, 2455]
  , [ 329, 1010, 2398, 1717]
  , [ 779, 1186, 2574, 2167]
  , [ 305, 882, 2270, 1693]
  , [ 927, 314, 1702, 2315]
  , [ 678, 246, 1634, 2066]
  , [ 1154, 645, 2033, 2542]
  , [ 886, 1277, 2665, 2274]
  , [ 880, 1272, 2660, 2268]
  , [ 641, 80, 1468, 2029]
  , [ 841, 1244, 2632, 2229]
  , [ 947, 1096, 2484, 2335]
  , [ 847, 1067, 2455, 2235]
  , [ 960, 1334, 2722, 2348]
  , [ 288, 807, 2195, 1676]
  , [ 366, 1305, 2693, 1754]
  , [ 679, 247, 1635, 2067]
  , [ 272, 756, 2144, 1660]
  , [ 738, 1154, 2542, 2126]
  , [ 703, 1125, 2513, 2091]
  , [ 434, 52, 1440, 1822]
  , [ 1186, 549, 1937, 2574]
  , [ 729, 1038, 2426, 2117]
  , [ 808, 288, 1676, 2196]
  , [ 368, 1306, 2694, 1756]
  , [ 680, 248, 1636, 2068]
  , [ 1155, 739, 2127, 2543]
  , [ 1277, 884, 2272, 2665]
  , [ 80, 643, 2031, 1468]
  , [ 448, 184, 1572, 1836]
  , [ 994, 1362, 2750, 2382]
  , [ 1216, 372, 1760, 2604]
  , [ 49, 435, 1823, 1437]
  , [ 551, 1068, 2456, 1939]
  , [ 1334, 370, 1758, 2722]
  , [ 681, 249, 1637, 2069]
  , [ 1125, 701, 2089, 2513]
  , [ 454, 1245, 2633, 1842]
  , [ 449, 185, 1573, 1837]
  , [ 953, 1097, 2485, 2341]
  , [ 996, 1363, 2751, 2384]
  , [ 417, 1216, 2604, 1805]
  , [ 289, 810, 2198, 1677]
  , [ 1038, 361, 1749, 2426]
  , [ 1306, 414, 1802, 2694]
  , [ 250, 682, 2070, 1638]
  , [ 1126, 703, 2091, 2514]
  , [ 1245, 845, 2233, 2633]
  , [ 1068, 848, 2236, 2456]
  , [ 1187, 778, 2166, 2575]
  , [ 1039, 411, 1799, 2427]
  , [ 251, 683, 2071, 1639]
  , [ 161, 760, 2148, 1549]
  , [ 555, 1155, 2543, 1943]
  , [ 315, 938, 2326, 1703]
  , [ 638, 1278, 2666, 2026]
  , [ 646, 81, 1469, 2034]
  , [ 1097, 559, 1947, 2485]
  , [ 1363, 994, 2382, 2751]
  , [ 438, 56, 1444, 1826]
  , [ 1335, 959, 2347, 2723]
  , [ 597, 1187, 2575, 1985]
  , [ 924, 1307, 2695, 2312]
  , [ 761, 244, 1632, 2149]
  , [ 1278, 887, 2275, 2666]
  , [ 407, 1246, 2634, 1795]
  , [ 452, 188, 1576, 1840]
  , [ 811, 1217, 2605, 2199]
  , [ 1018, 122, 1510, 2406]
  , [ 53, 439, 1827, 1441]
  , [ 498, 1335, 2723, 1886]
  , [ 431, 1188, 2576, 1819]
  , [ 890, 118, 1506, 2278]
  , [ 178, 813, 2201, 1566]
  , [ 1307, 487, 1875, 2695]
  , [ 685, 253, 1641, 2073]
  , [ 241, 762, 2150, 1629]
  , [ 1156, 481, 1869, 2544]
  , [ 940, 316, 1704, 2328]
  , [ 648, 53, 1441, 2036]
  , [ 702, 1126, 2514, 2090]
  , [ 189, 453, 1841, 1577]
  , [ 1098, 954, 2342, 2486]
  , [ 1217, 442, 1830, 2605]
  , [ 259, 1019, 2407, 1647]
  , [ 1069, 854, 2242, 2457]
  , [ 1188, 782, 2170, 2576]
  , [ 211, 891, 2279, 1599]
  , [ 410, 1039, 2427, 1798]
  , [ 740, 1156, 2544, 2128]
  , [ 254, 686, 2074, 1642]
  , [ 1279, 470, 1858, 2667]
  , [ 82, 649, 2037, 1470]
  , [ 704, 1127, 2515, 2092]
  , [ 1246, 405, 1793, 2634]
  , [ 497, 1098, 2486, 1885]
  , [ 999, 1364, 2752, 2387]
  , [ 1218, 444, 1832, 2606]
  , [ 163, 1020, 2408, 1551]
  , [ 851, 1069, 2457, 2239]
  , [ 963, 1336, 2724, 2351]
  , [ 151, 892, 2280, 1539]
  , [ 412, 1040, 2428, 1800]
  , [ 290, 815, 2203, 1678]
  , [ 1157, 743, 2131, 2545]
  , [ 316, 942, 2330, 1704]
  , [ 687, 255, 1643, 2075]
  , [ 888, 1279, 2667, 2276]
  , [ 1247, 359, 1747, 2635]
  , [ 455, 191, 1579, 1843]
  , [ 815, 1218, 2606, 2203]
  , [ 331, 1021, 2409, 1719]
  , [ 442, 60, 1448, 1830]
  , [ 307, 893, 2281, 1695]
  , [ 1308, 928, 2316, 2696]
  , [ 275, 766, 2154, 1663]
  , [ 652, 1157, 2545, 2040]
  , [ 156, 943, 2331, 1544]
  , [ 1280, 889, 2277, 2668]
  , [ 1127, 702, 2090, 2515]
  , [ 958, 1099, 2487, 2346]
  , [ 456, 192, 1580, 1844]
  , [ 1364, 997, 2385, 2752]
  , [ 57, 443, 1831, 1445]
  , [ 1336, 961, 2349, 2724]
  , [ 1189, 360, 1748, 2577]
  , [ 1040, 734, 2122, 2428]
  , [ 556, 1308, 2696, 1944]
  , [ 257, 689, 2077, 1645]
  , [ 54, 652, 2040, 1442]
  , [ 1099, 666, 2054, 2487]
  , [ 1365, 999, 2387, 2753]
  , [ 857, 1070, 2458, 2245]
  , [ 1337, 963, 2351, 2725]
  , [ 405, 1189, 2577, 1793]
  , [ 1158, 593, 1981, 2546]
  , [ 945, 317, 1705, 2333]
  , [ 690, 258, 1646, 2078]
  , [ 653, 83, 1471, 2041]
  , [ 848, 1247, 2635, 2236]
  , [ 458, 194, 1582, 1846]
  , [ 594, 1219, 2607, 1982]
  , [ 928, 1309, 2697, 2316]
  , [ 691, 259, 1647, 2079]
  , [ 362, 1280, 2668, 1750]
  , [ 707, 1128, 2516, 2095]
  , [ 1248, 849, 2237, 2636]
  , [ 1100, 964, 2352, 2488]
  , [ 195, 459, 1847, 1583]
  , [ 446, 64, 1452, 1834]
  , [ 1070, 550, 1938, 2458]
  , [ 739, 1041, 2429, 2127]
  , [ 164, 770, 2158, 1552]
  , [ 692, 260, 1648, 2080]
  , [ 364, 1281, 2669, 1752]
  , [ 83, 655, 2043, 1471]
  , [ 459, 1248, 2636, 1847]
  , [ 961, 1100, 2488, 2349]
  , [ 196, 460, 1848, 1584]
  , [ 998, 1365, 2753, 2386]
  , [ 1219, 814, 2202, 2607]
  , [ 61, 447, 1835, 1449]
  , [ 962, 1337, 2725, 2350]
  , [ 781, 1190, 2578, 2169]
  , [ 1309, 366, 1754, 2697]
  , [ 744, 1158, 2546, 2132]
  , [ 951, 318, 1706, 2339]
  , [ 771, 256, 1644, 2159]
  , [ 1128, 705, 2093, 2516]
  , [ 1000, 1366, 2754, 2388]
  , [ 1071, 858, 2246, 2459]
  , [ 964, 1338, 2726, 2352]
  , [ 1190, 430, 1818, 2578]
  , [ 1041, 365, 1753, 2429]
  , [ 1159, 745, 2133, 2547]
  , [ 318, 952, 2340, 1706]
  , [ 253, 772, 2160, 1641]
  , [ 1281, 410, 1798, 2669]
  , [ 1129, 707, 2095, 2517]
  , [ 850, 1249, 2637, 2238]
  , [ 198, 462, 1850, 1586]
  , [ 1220, 420, 1808, 2608]
  , [ 461, 1071, 2459, 1849]
  , [ 1191, 432, 1820, 2579]
  , [ 1042, 415, 1803, 2430]
  , [ 488, 1159, 2547, 1876]
  , [ 658, 84, 1472, 2046]
  , [ 1249, 627, 2015, 2637]
  , [ 1101, 968, 2356, 2489]
  , [ 1366, 998, 2386, 2754]
  , [ 814, 1220, 2608, 2202]
  , [ 450, 68, 1456, 1838]
  , [ 1338, 962, 2350, 2726]
  , [ 785, 1191, 2579, 2173]
  , [ 1310, 927, 2315, 2698]
  , [ 955, 319, 1707, 2343]
  , [ 892, 1282, 2670, 2280]
  , [ 965, 1101, 2489, 2353]
  , [ 200, 464, 1852, 1588]
  , [ 65, 451, 1839, 1453]
  , [ 862, 1072, 2460, 2250]
  , [ 486, 1310, 2698, 1874]
  , [ 746, 1160, 2548, 2134]
  , [ 278, 776, 2164, 1666]
  , [ 1282, 475, 1863, 2670]
  , [ 706, 1129, 2517, 2094]
  , [ 660, 57, 1445, 2048]
  , [ 201, 465, 1853, 1589]
  , [ 1367, 515, 1903, 2755]
  , [ 1072, 630, 2018, 2460]
  , [ 414, 1042, 2430, 1802]
  , [ 907, 309, 1697, 2295]
  , [ 1160, 656, 2044, 2548]
  , [ 957, 233, 1621, 2345]
  , [ 708, 1130, 2518, 2096]
  , [ 85, 661, 2049, 1473]
  , [ 853, 1250, 2638, 2241]
  , [ 671, 1102, 2490, 2059]
  , [ 1002, 1367, 2755, 2390]
  , [ 1221, 819, 2207, 2609]
  , [ 967, 1339, 2727, 2355]
  , [ 591, 1192, 2580, 1979]
  , [ 416, 1043, 2431, 1804]
  , [ 216, 908, 2296, 1604]
  , [ 931, 1311, 2699, 2319]
  , [ 320, 958, 2346, 1708]
  , [ 717, 261, 1649, 2105]
  , [ 291, 817, 2205, 1679]
  , [ 1102, 971, 2359, 2490]
  , [ 467, 203, 1591, 1855]
  , [ 373, 1221, 2609, 1761]
  , [ 1073, 868, 2256, 2461]
  , [ 47, 454, 1842, 1435]
  , [ 909, 155, 1543, 2297]
  , [ 959, 320, 1708, 2347]
  , [ 261, 718, 2106, 1649]
  , [ 780, 167, 1555, 2168]
  , [ 1283, 896, 2284, 2671]
  , [ 1130, 706, 2094, 2518]
  , [ 818, 291, 1679, 2206]
  , [ 1250, 851, 2239, 2638]
  , [ 468, 204, 1592, 1856]
  , [ 865, 1073, 2461, 2253]
  , [ 1339, 965, 2353, 2727]
  , [ 1192, 784, 2172, 2580]
  , [ 1043, 744, 2132, 2431]
  , [ 910, 214, 1602, 2298]
  , [ 1311, 929, 2317, 2699]
  , [ 489, 1161, 2549, 1877]
  , [ 117, 781, 2169, 1505]
  , [ 553, 1283, 2671, 1941]
  , [ 165, 597, 1985, 1553]
  , [ 58, 664, 2052, 1446]
  , [ 1251, 853, 2241, 2639]
  , [ 1103, 672, 2060, 2491]
  , [ 379, 1368, 2756, 1767]
  , [ 819, 1222, 2610, 2207]
  , [ 75, 456, 1844, 1463]
  , [ 1340, 967, 2355, 2728]
  , [ 1312, 931, 2319, 2700]
  , [ 1161, 747, 2135, 2549]
  , [ 262, 721, 2109, 1650]
  , [ 782, 147, 1535, 2170]
  , [ 292, 820, 2208, 1680]
  , [ 598, 166, 1554, 1986]
  , [ 665, 86, 1474, 2053]
  , [ 975, 1103, 2491, 2363]
  , [ 470, 206, 1594, 1858]
  , [ 457, 47, 1435, 1845]
  , [ 1193, 408, 1796, 2581]
  , [ 722, 262, 1650, 2110]
  , [ 783, 280, 1668, 2171]
  , [ 896, 1284, 2672, 2284]
  , [ 711, 1131, 2519, 2099]
  , [ 167, 599, 1987, 1555]
  , [ 207, 471, 1859, 1595]
  , [ 1368, 1001, 2389, 2756]
  , [ 1222, 561, 1949, 2610]
  , [ 1074, 872, 2260, 2462]
  , [ 784, 1193, 2581, 2172]
  , [ 749, 1044, 2432, 2137]
  , [ 311, 914, 2302, 1699]
  , [ 1162, 657, 2045, 2550]
  , [ 723, 148, 1536, 2111]
  , [ 168, 600, 1988, 1556]
  , [ 86, 667, 2055, 1474]
  , [ 852, 1251, 2639, 2240]
  , [ 563, 1104, 2492, 1951]
  , [ 208, 472, 1860, 1596]
  , [ 869, 1074, 2462, 2257]
  , [ 966, 1340, 2728, 2354]
  , [ 930, 1312, 2700, 2318]
  , [ 748, 1162, 2550, 2136]
  , [ 321, 970, 2358, 1709]
  , [ 786, 281, 1669, 2174]
  , [ 1284, 362, 1750, 2672]
  , [ 1131, 709, 2097, 2519]
  , [ 182, 823, 2211, 1570]
  , [ 169, 601, 1989, 1557]
  , [ 854, 1252, 2640, 2242]
  , [ 1369, 566, 1954, 2757]
  , [ 460, 76, 1464, 1848]
  , [ 968, 1341, 2729, 2356]
  , [ 1044, 369, 1757, 2432]
  , [ 932, 1313, 2701, 2320]
  , [ 1163, 749, 2137, 2551]
  , [ 725, 263, 1651, 2113]
  , [ 1132, 711, 2099, 2520]
  , [ 602, 170, 1558, 1990]
  , [ 1104, 976, 2364, 2492]
  , [ 210, 474, 1862, 1598]
  , [ 1001, 1369, 2757, 2389]
  , [ 1223, 818, 2206, 2611]
  , [ 635, 1075, 2463, 2023]
  , [ 48, 461, 1849, 1436]
  , [ 1194, 789, 2177, 2582]
  , [ 1045, 419, 1807, 2433]
  , [ 972, 322, 1710, 2360]
  , [ 293, 825, 2213, 1681]
  , [ 171, 603, 1991, 1559]
  , [ 670, 87, 1475, 2058]
  , [ 1252, 852, 2240, 2640]
  , [ 613, 1223, 2611, 2001]
  , [ 1075, 875, 2263, 2463]
  , [ 1341, 966, 2354, 2729]
  , [ 361, 1194, 2582, 1749]
  , [ 1313, 930, 2318, 2701]
  , [ 727, 264, 1652, 2115]
  , [ 790, 171, 1559, 2178]
  , [ 1285, 895, 2283, 2673]
  , [ 172, 604, 1992, 1560]
  , [ 212, 476, 1864, 1600]
  , [ 447, 1224, 2612, 1835]
  , [ 463, 46, 1434, 1851]
  , [ 558, 1163, 2551, 1946]
  , [ 322, 974, 2362, 1710]
  , [ 264, 728, 2116, 1652]
  , [ 118, 791, 2179, 1506]
  , [ 474, 1285, 2673, 1862]
  , [ 710, 1132, 2520, 2098]
  , [ 294, 827, 2215, 1682]
  , [ 173, 605, 1993, 1561]
  , [ 672, 61, 1449, 2060]
  , [ 1105, 982, 2370, 2493]
  , [ 213, 477, 1865, 1601]
  , [ 514, 1370, 2758, 1902]
  , [ 1224, 822, 2210, 2612]
  , [ 1076, 636, 2024, 2464]
  , [ 1342, 503, 1891, 2730]
  , [ 789, 1195, 2583, 2177]
  , [ 418, 1045, 2433, 1806]
  , [ 159, 975, 2363, 1547]
  , [ 792, 150, 1538, 2180]
  , [ 712, 1133, 2521, 2100]
  , [ 828, 294, 1682, 2216]
  , [ 606, 174, 1562, 1994]
  , [ 88, 673, 2061, 1476]
  , [ 626, 1253, 2641, 2014]
  , [ 979, 1105, 2493, 2367]
  , [ 1370, 1005, 2393, 2758]
  , [ 879, 1076, 2464, 2267]
  , [ 970, 1342, 2730, 2358]
  , [ 420, 1046, 2434, 1808]
  , [ 922, 119, 1507, 2310]
  , [ 935, 1314, 2702, 2323]
  , [ 1164, 493, 1881, 2552]
  , [ 265, 731, 2119, 1653]
  , [ 793, 283, 1671, 2181]
  , [ 899, 1286, 2674, 2287]
  , [ 175, 607, 1995, 1563]
  , [ 1253, 855, 2243, 2641]
  , [ 479, 215, 1603, 1867]
  , [ 51, 466, 1854, 1439]
  , [ 1195, 552, 1940, 2583]
  , [ 223, 923, 2311, 1611]
  , [ 750, 1164, 2552, 2138]
  , [ 977, 323, 1711, 2365]
  , [ 732, 265, 1653, 2120]
  , [ 1133, 710, 2098, 2521]
  , [ 295, 830, 2218, 1683]
  , [ 176, 608, 1996, 1564]
  , [ 480, 216, 1604, 1868]
  , [ 427, 1371, 2759, 1815]
  , [ 1225, 376, 1764, 2613]
  , [ 554, 1077, 2465, 1942]
  , [ 1046, 754, 2142, 2434]
  , [ 154, 924, 2312, 1542]
  , [ 1314, 933, 2321, 2702]
  , [ 1165, 753, 2141, 2553]
  , [ 733, 151, 1539, 2121]
  , [ 796, 284, 1672, 2184]
  , [ 1286, 897, 2285, 2674]
  , [ 177, 609, 1997, 1565]
  , [ 62, 676, 2064, 1450]
  , [ 1254, 458, 1846, 2642]
  , [ 985, 1106, 2494, 2373]
  , [ 421, 1225, 2613, 1809]
  , [ 78, 468, 1856, 1466]
  , [ 375, 1343, 2731, 1763]
  , [ 313, 925, 2313, 1701]
  , [ 1315, 935, 2323, 2703]
  , [ 664, 1165, 2553, 2052]
  , [ 1287, 899, 2287, 2675]
  , [ 610, 178, 1566, 1998]
  , [ 677, 89, 1477, 2065]
  , [ 856, 1254, 2642, 2244]
  , [ 482, 218, 1606, 1870]
  , [ 1371, 425, 1813, 2759]
  , [ 1077, 880, 2268, 2465]
  , [ 469, 51, 1439, 1857]
  , [ 1196, 788, 2176, 2584]
  , [ 983, 324, 1712, 2371]
  , [ 735, 266, 1654, 2123]
  , [ 715, 1134, 2522, 2103]
  , [ 186, 833, 2221, 1574]
  , [ 179, 611, 1999, 1567]
  , [ 1255, 857, 2245, 2643]
  , [ 1106, 562, 1950, 2494]
  , [ 219, 483, 1871, 1607]
  , [ 1372, 379, 1767, 2760]
  , [ 1343, 969, 2357, 2731]
  , [ 601, 1196, 2584, 1989]
  , [ 759, 1047, 2435, 2147]
  , [ 1166, 594, 1982, 2554]
  , [ 324, 984, 2372, 1712]
  , [ 800, 175, 1563, 2188]
  , [ 180, 612, 2000, 1568]
  , [ 89, 679, 2067, 1477]
  , [ 220, 484, 1872, 1608]
  , [ 821, 1226, 2614, 2209]
  , [ 435, 1197, 2585, 1823]
  , [ 934, 1315, 2703, 2322]
  , [ 737, 267, 1655, 2125]
  , [ 119, 801, 2189, 1507]
  , [ 898, 1287, 2675, 2286]
  , [ 1134, 713, 2101, 2522]
  , [ 296, 835, 2223, 1684]
  , [ 181, 613, 2001, 1569]
  , [ 1107, 986, 2374, 2495]
  , [ 1226, 446, 1834, 2614]
  , [ 1078, 886, 2274, 2466]
  , [ 472, 79, 1467, 1860]
  , [ 1344, 563, 1951, 2732]
  , [ 1197, 792, 2180, 2585]
  , [ 1047, 373, 1761, 2435]
  , [ 936, 1316, 2704, 2324]
  , [ 987, 325, 1713, 2375]
  , [ 267, 738, 2126, 1655]
  , [ 802, 153, 1541, 2190]
  , [ 900, 1288, 2676, 2288]
  , [ 1135, 715, 2103, 2523]
  , [ 614, 182, 1570, 2002]
  , [ 358, 1255, 2643, 1746]
  , [ 509, 1107, 2495, 1897]
  , [ 222, 486, 1874, 1610]
  , [ 1008, 1372, 2760, 2396]
  , [ 1227, 448, 1836, 2615]
  , [ 883, 1078, 2466, 2271]
  , [ 52, 473, 1861, 1440]
  , [ 969, 1344, 2732, 2357]
  , [ 1048, 423, 1811, 2436]
  , [ 754, 1166, 2554, 2142]
  , [ 803, 286, 1674, 2191]
  , [ 183, 615, 2003, 1571]
  , [ 682, 90, 1478, 2070]
  , [ 360, 1256, 2644, 1748]
  , [ 1373, 1009, 2397, 2761]
  , [ 825, 1227, 2615, 2213]
  , [ 1316, 934, 2322, 2704]
  , [ 1167, 755, 2143, 2555]
  , [ 989, 245, 1633, 2377]
  , [ 268, 741, 2129, 1656]
  , [ 1288, 898, 2286, 2676]
  , [ 184, 616, 2004, 1572]
  , [ 990, 1108, 2496, 2378]
  , [ 224, 488, 1876, 1612]
  , [ 519, 1373, 2761, 1907]
  , [ 475, 50, 1438, 1863]
  , [ 1198, 364, 1752, 2586]
  , [ 500, 1167, 2555, 1888]
  , [ 326, 990, 2378, 1714]
  , [ 742, 268, 1656, 2130]
  , [ 806, 287, 1675, 2194]
  , [ 714, 1135, 2523, 2102]
  , [ 297, 842, 2230, 1685]
  , [ 185, 617, 2005, 1573]
  , [ 684, 65, 1453, 2072]
  , [ 1256, 406, 1794, 2644]
  , [ 1108, 678, 2066, 2496]
  , [ 225, 489, 1877, 1613]
  , [ 889, 1079, 2467, 2277]
  , [ 502, 1345, 2733, 1890]
  , [ 409, 1198, 2586, 1797]
  , [ 422, 1048, 2436, 1810]
  , [ 1317, 491, 1879, 2705]
  , [ 991, 326, 1714, 2379]
  , [ 743, 154, 1542, 2131]
  , [ 716, 1136, 2524, 2104]
  , [ 618, 186, 1574, 2006]
  , [ 91, 685, 2073, 1479]
  , [ 1010, 1374, 2762, 2398]
  , [ 595, 1228, 2616, 1983]
  , [ 1345, 973, 2361, 2733]
  , [ 424, 1049, 2437, 1812]
  , [ 938, 1317, 2705, 2326]
  , [ 756, 1168, 2556, 2144]
  , [ 903, 1289, 2677, 2291]
  , [ 844, 298, 1686, 2232]
  , [ 187, 619, 2007, 1575]
  , [ 860, 1257, 2645, 2248]
  , [ 1109, 996, 2384, 2497]
  , [ 491, 227, 1615, 1879]
  , [ 1374, 687, 2075, 2762]
  , [ 1079, 553, 1941, 2467]
  , [ 55, 478, 1866, 1443]
  , [ 939, 315, 1703, 2327]
  , [ 1168, 668, 2056, 2556]
  , [ 745, 269, 1657, 2133]
  , [ 810, 179, 1567, 2198]
  , [ 1136, 714, 2102, 2524]
  , [ 188, 620, 2008, 1576]
  , [ 1257, 463, 1851, 2645]
  , [ 993, 1109, 2497, 2381]
  , [ 492, 228, 1616, 1880]
  , [ 1228, 824, 2212, 2616]
  , [ 423, 1346, 2734, 1811]
  , [ 791, 1199, 2587, 2179]
  , [ 1049, 764, 2152, 2437]
  , [ 228, 940, 2328, 1616]
  , [ 120, 811, 2199, 1508]
  , [ 1289, 901, 2289, 2677]
  , [ 298, 846, 2234, 1686]
  , [ 621, 189, 1577, 2009]
  , [ 66, 688, 2076, 1454]
  , [ 1080, 890, 2278, 2468]
  , [ 81, 480, 1868, 1469]
  , [ 1199, 434, 1822, 2587]
  , [ 941, 158, 1546, 2329]
  , [ 371, 1318, 2706, 1759]
  , [ 747, 270, 1658, 2135]
  , [ 812, 156, 1544, 2200]
  , [ 1290, 903, 2291, 2678]
  , [ 147, 847, 2235, 1535]
  , [ 190, 622, 2010, 1578]
  , [ 689, 92, 1480, 2077]
  , [ 494, 230, 1618, 1882]
  , [ 1013, 1375, 2763, 2401]
  , [ 1229, 424, 1812, 2617]
  , [ 473, 1080, 2468, 1861]
  , [ 481, 55, 1443, 1869]
  , [ 1346, 421, 1809, 2734]
  , [ 1200, 436, 1824, 2588]
  , [ 942, 226, 1614, 2330]
  , [ 327, 1002, 2390, 1715]
  , [ 270, 748, 2136, 1658]
  , [ 813, 289, 1677, 2201]
  , [ 501, 1169, 2557, 1889]
  , [ 453, 1137, 2525, 1841]
  , [ 191, 623, 2011, 1579]
  , [ 1258, 864, 2252, 2646]
  , [ 1110, 1000, 2388, 2498]
  , [ 231, 495, 1883, 1619]
  , [ 824, 1229, 2617, 2212]
  , [ 1347, 375, 1763, 2735]
  , [ 795, 1200, 2588, 2183]
  , [ 769, 1050, 2438, 2157]
  , [ 1318, 937, 2325, 2706]
  , [ 1169, 757, 2145, 2557]
  , [ 1137, 717, 2105, 2525]
  , [ 849, 299, 1687, 2237]
  , [ 92, 691, 2079, 1480]
  , [ 550, 1258, 2646, 1938]
  , [ 997, 1110, 2498, 2385]
  , [ 232, 496, 1884, 1620]
  , [ 1375, 1011, 2399, 2763]
  , [ 894, 1081, 2469, 2282]
  , [ 1004, 328, 1716, 2392]
  , [ 271, 751, 2139, 1659]
  , [ 816, 290, 1678, 2204]
  , [ 902, 1290, 2678, 2290]
  , [ 625, 193, 1581, 2013]
  , [ 1376, 1013, 2401, 2764]
  , [ 1081, 642, 2030, 2469]
  , [ 484, 82, 1470, 1872]
  , [ 1050, 377, 1765, 2438]
  , [ 317, 946, 2334, 1705]
  , [ 1319, 560, 1948, 2707]
  , [ 752, 271, 1659, 2140]
  , [ 1170, 669, 2057, 2558]
  , [ 904, 1291, 2679, 2292]
  , [ 194, 626, 2014, 1582]
  , [ 1138, 621, 2009, 2526]
  , [ 864, 1259, 2647, 2252]
  , [ 234, 498, 1886, 1622]
  , [ 683, 1111, 2499, 2071]
  , [ 1230, 829, 2217, 2618]
  , [ 56, 485, 1873, 1444]
  , [ 976, 1347, 2735, 2364]
  , [ 592, 1201, 2589, 1980]
  , [ 1051, 427, 1815, 2439]
  , [ 937, 1319, 2707, 2325]
  , [ 328, 1006, 2394, 1716]
  , [ 753, 157, 1545, 2141]
  , [ 758, 1170, 2558, 2146]
  , [ 855, 300, 1688, 2243]
  , [ 627, 195, 1583, 2015]
  , [ 718, 1138, 2526, 2106]
  , [ 1111, 1003, 2391, 2499]
  , [ 377, 1230, 2618, 1765]
  , [ 1082, 900, 2288, 2470]
  , [ 1348, 977, 2365, 2736]
  , [ 162, 1007, 2395, 1550]
  , [ 820, 183, 1571, 2208]
  , [ 1171, 759, 2147, 2559]
  , [ 1291, 902, 2290, 2679]
  , [ 300, 856, 2244, 1688]
  , [ 1139, 719, 2107, 2527]
  , [ 1259, 358, 1746, 2647]
  , [ 236, 500, 1888, 1624]
  , [ 1012, 1376, 2764, 2400]
  , [ 487, 54, 1442, 1875]
  , [ 897, 1082, 2470, 2285]
  , [ 507, 1348, 2736, 1895]
  , [ 1201, 794, 2182, 2589]
  , [ 755, 272, 1660, 2143]
  , [ 121, 821, 2209, 1509]
  , [ 197, 629, 2017, 1585]
  , [ 237, 501, 1889, 1625]
  , [ 1112, 684, 2072, 2500]
  , [ 1014, 1377, 2765, 2402]
  , [ 829, 1231, 2619, 2217]
  , [ 426, 1051, 2439, 1814]
  , [ 490, 1320, 2708, 1878]
  , [ 822, 159, 1547, 2210]
  , [ 1009, 329, 1717, 2397]
  , [ 1292, 479, 1867, 2680]
  , [ 859, 301, 1689, 2247]
  , [ 630, 198, 1586, 2018]
  , [ 1007, 1112, 2500, 2395]
  , [ 978, 1349, 2737, 2366]
  , [ 1202, 412, 1800, 2590]
  , [ 428, 1052, 2440, 1816]
  , [ 1320, 941, 2329, 2708]
  , [ 757, 273, 1661, 2145]
  , [ 823, 292, 1680, 2211]
  , [ 561, 1171, 2559, 1949]
  , [ 906, 1292, 2680, 2294]
  , [ 631, 199, 1587, 2019]
  , [ 549, 1139, 2527, 1937]
  , [ 1260, 863, 2251, 2648]
  , [ 503, 239, 1627, 1891]
  , [ 1377, 1012, 2400, 2765]
  , [ 1231, 564, 1952, 2619]
  , [ 59, 490, 1878, 1447]
  , [ 1083, 904, 2292, 2471]
  , [ 1349, 675, 2063, 2737]
  , [ 794, 1202, 2590, 2182]
  , [ 273, 758, 2146, 1661]
  , [ 632, 200, 1588, 2020]
  , [ 861, 197, 1585, 2249]
  , [ 462, 1260, 2648, 1850]
  , [ 504, 240, 1628, 1892]
  , [ 566, 1113, 2501, 1954]
  , [ 901, 1083, 2471, 2289]
  , [ 954, 120, 1508, 2342]
  , [ 1052, 774, 2162, 2440]
  , [ 419, 1321, 2709, 1807]
  , [ 826, 293, 1681, 2214]
  , [ 1172, 505, 1893, 2560]
  , [ 1015, 330, 1718, 2403]
  , [ 633, 201, 1589, 2021]
  , [ 1140, 457, 1845, 2528]
  , [ 302, 862, 2250, 1690]
  , [ 84, 492, 1880, 1472]
  , [ 235, 955, 2343, 1623]
  , [ 760, 1172, 2560, 2148]
  , [ 330, 1016, 2404, 1718]
  , [ 274, 761, 2149, 1662]
  , [ 367, 1293, 2681, 1755]
  , [ 202, 634, 2022, 1590]
  , [ 720, 1140, 2528, 2108]
  , [ 863, 302, 1690, 2251]
  , [ 867, 1261, 2649, 2255]
  , [ 506, 242, 1630, 1894]
  , [ 1113, 1008, 2396, 2501]
  , [ 686, 1378, 2766, 2074]
  , [ 1232, 828, 2216, 2620]
  , [ 493, 59, 1447, 1881]
  , [ 647, 1084, 2472, 2035]
  , [ 981, 1350, 2738, 2369]
  , [ 1203, 799, 2187, 2591]
  , [ 157, 956, 2344, 1545]
  , [ 1321, 417, 1805, 2709]
  , [ 1173, 763, 2151, 2561]
  , [ 762, 274, 1662, 2150]
  , [ 1141, 723, 2111, 2529]
  , [ 203, 635, 2023, 1591]
  , [ 243, 507, 1895, 1631]
  , [ 69, 598, 1986, 1457]
  , [ 1378, 1015, 2403, 2766]
  , [ 617, 1232, 2620, 2005]
  , [ 1084, 907, 2295, 2472]
  , [ 365, 1203, 2591, 1753]
  , [ 319, 957, 2345, 1707]
  , [ 777, 1053, 2441, 2165]
  , [ 1322, 371, 1759, 2710]
  , [ 830, 187, 1575, 2218]
  , [ 676, 1173, 2561, 2064]
  , [ 1019, 331, 1719, 2407]
  , [ 763, 160, 1548, 2151]
  , [ 1293, 905, 2293, 2681]
  , [ 628, 1141, 2529, 2016]
  , [ 1261, 865, 2253, 2649]
  , [ 599, 69, 1457, 1987]
  , [ 244, 508, 1896, 1632]
  , [ 451, 1233, 2621, 1839]
  , [ 1350, 979, 2367, 2738]
  , [ 1053, 429, 1817, 2441]
  , [ 122, 831, 2219, 1510]
  , [ 637, 205, 1593, 2025]
  , [ 1262, 867, 2255, 2650]
  , [ 1114, 1014, 2402, 2502]
  , [ 1379, 518, 1906, 2767]
  , [ 1233, 832, 2220, 2621]
  , [ 496, 85, 1473, 1884]
  , [ 1085, 648, 2036, 2473]
  , [ 1351, 981, 2369, 2739]
  , [ 799, 1204, 2592, 2187]
  , [ 600, 1054, 2442, 1988]
  , [ 832, 162, 1550, 2220]
  , [ 1174, 595, 1983, 2562]
  , [ 1021, 257, 1645, 2409]
  , [ 765, 275, 1663, 2153]
  , [ 1294, 557, 1945, 2682]
  , [ 1142, 591, 1979, 2530]
  , [ 206, 638, 2026, 1594]
  , [ 1011, 1114, 2502, 2399]
  , [ 246, 510, 1898, 1634]
  , [ 1016, 1379, 2767, 2404]
  , [ 60, 497, 1885, 1448]
  , [ 911, 1085, 2473, 2299]
  , [ 1054, 786, 2174, 2442]
  , [ 944, 1322, 2710, 2332]
  , [ 833, 295, 1683, 2221]
  , [ 332, 1022, 2410, 1720]
  , [ 905, 1294, 2682, 2293]
  , [ 303, 874, 2262, 1691]
  , [ 639, 207, 1595, 2027]
  , [ 70, 602, 1990, 1458]
  , [ 1380, 1017, 2405, 2768]
  , [ 1204, 555, 1943, 2592]
  , [ 1323, 945, 2333, 2711]
  , [ 1023, 332, 1720, 2411]
  , [ 767, 276, 1664, 2155]
  , [ 866, 1262, 2650, 2254]
  , [ 603, 70, 1458, 1991]
  , [ 248, 512, 1900, 1636]
  , [ 1234, 380, 1768, 2622]
  , [ 499, 58, 1446, 1887]
  , [ 557, 1086, 2474, 1945]
  , [ 980, 1351, 2739, 2368]
  , [ 495, 1323, 2711, 1883]
  , [ 764, 1174, 2562, 2152]
  , [ 276, 768, 2156, 1664]
  , [ 836, 296, 1684, 2224]
  , [ 724, 1142, 2530, 2112]
  , [ 876, 304, 1692, 2264]
  , [ 209, 641, 2029, 1597]
  , [ 868, 1263, 2651, 2256]
  , [ 1017, 1115, 2503, 2405]
  , [ 249, 513, 1901, 1637]
  , [ 425, 1234, 2622, 1813]
  , [ 982, 1352, 2740, 2370]
  , [ 787, 1055, 2443, 2175]
  , [ 1175, 765, 2153, 2563]
  , [ 478, 1295, 2683, 1866]
  , [ 1143, 725, 2113, 2531]
  , [ 642, 210, 1598, 2030]
  , [ 378, 1380, 2768, 1766]
  , [ 1086, 912, 2300, 2474]
  , [ 1205, 798, 2186, 2593]
  , [ 1055, 433, 1821, 2443]
  , [ 946, 1324, 2712, 2334]
  , [ 512, 1175, 2563, 1900]
  , [ 277, 771, 2159, 1665]
  , [ 1295, 909, 2297, 2683]
  , [ 464, 1143, 2531, 1852]
  , [ 304, 878, 2266, 1692]
  , [ 643, 211, 1599, 2031]
  , [ 1263, 866, 2254, 2651]
  , [ 1115, 565, 1953, 2503]
  , [ 515, 251, 1639, 1903]
  , [ 71, 606, 1994, 1459]
  , [ 380, 1381, 2769, 1768]
  , [ 63, 502, 1890, 1451]
  , [ 1352, 980, 2368, 2740]
  , [ 605, 1205, 2593, 1993]
  , [ 604, 1056, 2444, 1992]
  , [ 1324, 663, 2051, 2712]
  , [ 1029, 696, 2084, 2417]
  , [ 772, 277, 1665, 2160]
  , [ 150, 879, 2267, 1538]
  , [ 644, 212, 1600, 2032]
  , [ 516, 252, 1640, 1904]
  , [ 607, 71, 1459, 1995]
  , [ 831, 1235, 2623, 2219]
  , [ 439, 1206, 2594, 1827]
  , [ 1056, 796, 2184, 2444]
  , [ 766, 1176, 2564, 2154]
  , [ 693, 1029, 2417, 2081]
  , [ 773, 163, 1551, 2161]
  , [ 415, 1296, 2684, 1803]
  , [ 726, 1144, 2532, 2114]
  , [ 645, 213, 1601, 2033]
  , [ 1116, 1018, 2406, 2504]
  , [ 1381, 426, 1814, 2769]
  , [ 1235, 450, 1838, 2623]
  , [ 1087, 918, 2306, 2475]
  , [ 87, 504, 1892, 1475]
  , [ 1206, 802, 2190, 2594]
  , [ 971, 321, 1709, 2359]
  , [ 1176, 680, 2068, 2564]
  , [ 843, 297, 1685, 2231]
  , [ 1144, 632, 2020, 2532]
  , [ 881, 305, 1693, 2269]
  , [ 214, 646, 2034, 1602]
  , [ 871, 1264, 2652, 2259]
  , [ 521, 1116, 2504, 1909]
  , [ 518, 254, 1642, 1906]
  , [ 1236, 452, 1840, 2624]
  , [ 915, 1087, 2475, 2303]
  , [ 505, 63, 1451, 1893]
  , [ 674, 1353, 2741, 2062]
  , [ 240, 972, 2360, 1628]
  , [ 949, 1325, 2713, 2337]
  , [ 775, 278, 1666, 2163]
  , [ 192, 844, 2232, 1580]
  , [ 1296, 413, 1801, 2684]
  , [ 215, 647, 2035, 1603]
  , [ 149, 720, 2108, 1537]
  , [ 255, 519, 1907, 1643]
  , [ 72, 610, 1998, 1460]
  , [ 1020, 1382, 2770, 2408]
  , [ 835, 1236, 2624, 2223]
  , [ 1353, 983, 2371, 2741]
  , [ 797, 1057, 2445, 2185]
  , [ 973, 161, 1549, 2361]
  , [ 1030, 700, 2088, 2418]
  , [ 845, 149, 1537, 2233]
  , [ 1297, 367, 1755, 2685]
  , [ 721, 196, 1584, 2109]
  , [ 1264, 869, 2257, 2652]
  , [ 1022, 1117, 2505, 2410]
  , [ 256, 520, 1908, 1644]
  , [ 611, 72, 1460, 1999]
  , [ 1382, 523, 1911, 2770]
  , [ 1207, 368, 1756, 2595]
  , [ 1057, 437, 1825, 2445]
  , [ 974, 238, 1626, 2362]
  , [ 1325, 947, 2335, 2713]
  , [ 513, 1177, 2565, 1901]
  , [ 697, 1030, 2418, 2085]
  , [ 279, 777, 2165, 1667]
  , [ 846, 190, 1578, 2234]
  , [ 465, 1145, 2533, 1853]
  , [ 887, 306, 1694, 2275]
  , [ 649, 217, 1605, 2037]
  , [ 193, 722, 2110, 1581]
  , [ 1265, 871, 2259, 2653]
  , [ 1117, 690, 2078, 2505]
  , [ 921, 1088, 2476, 2309]
  , [ 508, 88, 1476, 1896]
  , [ 1354, 506, 1894, 2742]
  , [ 413, 1207, 2595, 1801]
  , [ 608, 1058, 2446, 1996]
  , [ 1326, 949, 2337, 2714]
  , [ 1177, 767, 2155, 2565]
  , [ 778, 279, 1667, 2166]
  , [ 1145, 727, 2115, 2533]
  , [ 306, 888, 2276, 1694]
  , [ 218, 650, 2038, 1606]
  , [ 258, 522, 1910, 1646]
  , [ 596, 1237, 2625, 1984]
  , [ 64, 509, 1897, 1452]
  , [ 984, 1354, 2742, 2372]
  , [ 1058, 806, 2194, 2446]
  , [ 912, 1297, 2685, 2300]
  , [ 651, 219, 1607, 2039]
  , [ 1118, 1028, 2416, 2506]
  , [ 73, 614, 2002, 1461]
  , [ 1383, 1024, 2412, 2771]
  , [ 1088, 556, 1944, 2476]
  , [ 1355, 985, 2373, 2743]
  , [ 323, 978, 2366, 1711]
  , [ 1178, 681, 2069, 2566]
  , [ 1031, 704, 2092, 2419]
  , [ 280, 780, 2168, 1668]
  , [ 299, 850, 2238, 1687]
  , [ 1298, 913, 2301, 2686]
  , [ 1146, 633, 2021, 2534]
  , [ 891, 307, 1695, 2279]
  , [ 263, 726, 2114, 1651]
  , [ 870, 1265, 2653, 2258]
  , [ 1025, 1118, 2506, 2413]
  , [ 260, 524, 1912, 1648]
  , [ 615, 73, 1461, 2003]
  , [ 565, 1383, 2771, 1953]
  , [ 1237, 834, 2222, 2625]
  , [ 511, 62, 1450, 1899]
  , [ 801, 1208, 2596, 2189]
  , [ 948, 1326, 2714, 2336]
  , [ 768, 1178, 2566, 2156]
  , [ 701, 1031, 2419, 2089]
  , [ 483, 1298, 2686, 1871]
  , [ 728, 1146, 2534, 2116]
  , [ 221, 653, 2041, 1609]
  , [ 872, 1266, 2654, 2260]
  , [ 1089, 922, 2310, 2477]
  , [ 1208, 438, 1826, 2596]
  , [ 807, 1059, 2447, 2195]
  , [ 950, 1327, 2715, 2338]
  , [ 1179, 769, 2157, 2567]
  , [ 1147, 729, 2117, 2535]
  , [ 893, 209, 1597, 2281]
  , [ 654, 222, 1610, 2042]
  , [ 1024, 1384, 2772, 2412]
  , [ 1238, 428, 1816, 2626]
  , [ 485, 1089, 2477, 1873]
  , [ 374, 1355, 2743, 1762]
  , [ 1209, 440, 1828, 2597]
  , [ 1059, 441, 1829, 2447]
  , [ 166, 783, 2171, 1554]
  , [ 914, 1299, 2687, 2302]
  , [ 308, 894, 2282, 1696]
  , [ 655, 223, 1611, 2043]
  , [ 1266, 870, 2258, 2654]
  , [ 695, 1119, 2507, 2083]
  , [ 74, 618, 2006, 1462]
  , [ 834, 1238, 2626, 2222]
  , [ 67, 514, 1902, 1455]
  , [ 376, 1356, 2744, 1764]
  , [ 805, 1209, 2597, 2193]
  , [ 612, 1060, 2448, 2000]
  , [ 1327, 948, 2336, 2715]
  , [ 1032, 708, 2096, 2420]
  , [ 1299, 651, 2039, 2687]
  , [ 895, 308, 1696, 2283]
  , [ 656, 224, 1612, 2044]
  , [ 152, 730, 2118, 1540]
  , [ 619, 74, 1462, 2007]
  , [ 1384, 378, 1766, 2772]
  , [ 926, 1090, 2478, 2314]
  , [ 1060, 816, 2204, 2448]
  , [ 564, 1179, 2567, 1952]
  , [ 705, 1032, 2420, 2093]
  , [ 281, 785, 2173, 1669]
  , [ 552, 1147, 2535, 1940]
  , [ 657, 225, 1613, 2045]
  , [ 731, 208, 1596, 2119]
  , [ 1267, 467, 1855, 2655]
  , [ 1119, 693, 2081, 2507]
  , [ 1090, 654, 2042, 2478]
  , [ 90, 516, 1904, 1478]
  , [ 1356, 422, 1810, 2744]
  , [ 226, 658, 2046, 1614]
  , [ 205, 732, 2120, 1593]
  , [ 874, 1267, 2655, 2262]
  , [ 1120, 695, 2083, 2508]
  , [ 839, 1239, 2627, 2227]
  , [ 517, 67, 1455, 1905]
  , [ 593, 1210, 2598, 1981]
  , [ 986, 121, 1509, 2374]
  , [ 662, 1328, 2716, 2050]
  , [ 1180, 517, 1905, 2568]
  , [ 282, 787, 2175, 1670]
  , [ 858, 117, 1505, 2246]
  , [ 917, 1300, 2688, 2305]
  , [ 1148, 469, 1857, 2536]
  , [ 227, 659, 2047, 1615]
  , [ 622, 75, 1463, 2010]
  , [ 1385, 1023, 2411, 2773]
  , [ 1091, 932, 2320, 2479]
  , [ 988, 1357, 2745, 2376]
  , [ 817, 1061, 2449, 2205]
  , [ 247, 987, 2375, 1635]
  , [ 1328, 951, 2339, 2716]
  , [ 770, 1180, 2568, 2158]
  , [ 1033, 712, 2100, 2421]
  , [ 788, 282, 1670, 2176]
  , [ 199, 859, 2247, 1587]
  , [ 730, 1148, 2536, 2118]
  , [ 522, 1385, 2773, 1910]
  , [ 1239, 837, 2225, 2627]
  , [ 929, 1091, 2479, 2317]
  , [ 1357, 511, 1899, 2745]
  , [ 1210, 804, 2192, 2598]
  , [ 1061, 445, 1833, 2449]
  , [ 160, 988, 2376, 1548]
  , [ 1181, 773, 2161, 2569]
  , [ 709, 1033, 2421, 2097]
  , [ 148, 860, 2248, 1536]
  , [ 1300, 915, 2303, 2688]
  , [ 1149, 733, 2121, 2537]
  , [ 309, 906, 2294, 1697]
  , [ 661, 229, 1617, 2049]
  , [ 266, 736, 2124, 1654]
  , [ 363, 1268, 2656, 1751]
  , [ 694, 1120, 2508, 2082]
  , [ 624, 45, 1433, 2012]
  , [ 1240, 839, 2227, 2628]
  , [ 429, 165, 1553, 1817]
  , [ 520, 91, 1479, 1908]
  , [ 616, 1062, 2450, 2004]
  , [ 325, 989, 2377, 1713]
  , [ 1329, 494, 1882, 2717]
  , [ 688, 1181, 2569, 2076]
  , [ 283, 790, 2178, 1671]
  , [ 301, 861, 2249, 1689]
  , [ 1301, 917, 2305, 2689]
  , [ 640, 1149, 2537, 2028]
  , [ 230, 662, 2050, 1618]
  , [ 696, 1121, 2509, 2084]
  , [ 76, 625, 2013, 1464]
  , [ 1027, 1386, 2774, 2415]
  , [ 68, 521, 1909, 1456]
  , [ 1211, 416, 1804, 2599]
  , [ 1062, 826, 2214, 2450]
  , [ 952, 1329, 2717, 2340]
  , [ 908, 310, 1698, 2296]
  , [ 663, 231, 1619, 2051]
  , [ 1268, 873, 2261, 2656]
  , [ 1092, 936, 2324, 2480]
  , [ 1358, 992, 2380, 2746]
  , [ 804, 1211, 2599, 2192]
  , [ 1330, 953, 2341, 2718]
  , [ 1182, 596, 1984, 2570]
  , [ 1034, 716, 2104, 2422]
  , [ 1150, 592, 1980, 2538]
  , [ 1273, 881, 2269, 2661]
  , [ 1121, 694, 2082, 2509]
  , [ 1386, 1025, 2413, 2774]
  , [ 838, 1240, 2628, 2226]
  , [ 933, 1092, 2480, 2321]
  , [ 432, 168, 1556, 1820]
  , [ 523, 66, 1454, 1911]
  , [ 562, 1358, 2746, 1950]
  , [ 713, 1034, 2422, 2101]
  , [ 170, 793, 2181, 1558]
  , [ 916, 1301, 2689, 2304]
  , [ 310, 910, 2298, 1698]
  , [ 233, 665, 2053, 1621]
  , [ 155, 740, 2128, 1543]
  , [ 471, 1273, 2661, 1859]
  , [ 1269, 554, 1942, 2657]
  , [ 46, 628, 2016, 1434]
  , [ 1387, 1027, 2415, 2775]
  , [ 840, 1241, 2629, 2228]
  , [ 433, 169, 1557, 1821]
  , [ 827, 1063, 2451, 2215]
  , [ 918, 1302, 2690, 2306]
  , [ 153, 911, 2299, 1541]
  , [ 666, 234, 1622, 2054]
  , [ 741, 220, 1608, 2129]
  , [ 873, 1269, 2657, 2261]
  , [ 629, 77, 1465, 2017]
  , [ 659, 1093, 2481, 2047]
  , [ 992, 1359, 2747, 2380]
  , [ 1212, 809, 2197, 2600]
  , [ 1063, 449, 1837, 2451]
  , [ 370, 1330, 2718, 1758]
  , [ 774, 1182, 2570, 2162]
  , [ 284, 795, 2183, 1672]
  , [ 734, 1150, 2538, 2122]
  , [ 667, 235, 1623, 2055]
  , [ 217, 742, 2130, 1605]
  , [ 882, 1274, 2662, 2270]
  , [ 699, 1122, 2510, 2087]
  , [ 1241, 838, 2226, 2629]
  , [ 1093, 939, 2327, 2481]
  , [ 369, 1212, 2600, 1757]
  , [ 620, 1064, 2452, 2008]
  , [ 372, 1331, 2719, 1760]
  , [ 1183, 775, 2163, 2571]
  , [ 719, 1035, 2423, 2107]
  , [ 1302, 916, 2304, 2690]
  , [ 1151, 735, 2123, 2539]
  , [ 913, 311, 1699, 2301]
  , [ 668, 236, 1624, 2056]
  , [ 1274, 639, 2027, 2662]
  , [ 77, 631, 2019, 1465]
  , [ 1026, 1387, 2775, 2414]
  , [ 436, 172, 1560, 1824]
  , [ 1359, 374, 1762, 2747]
  , [ 1064, 836, 2224, 2452]
  , [ 524, 1183, 2571, 1912]
  , [ 285, 797, 2185, 1673]
  , [ 476, 1151, 2539, 1864]
  , [ 669, 237, 1625, 2057]
  , [ 466, 1270, 2658, 1854]
  , [ 1122, 697, 2085, 2510]
  , [ 1028, 1388, 2776, 2416]
  , [ 1242, 455, 1843, 2630]
  , [ 1094, 660, 2048, 2482]
  , [ 437, 173, 1561, 1825]
  , [ 809, 1213, 2601, 2197]
  , [ 1331, 418, 1806, 2719]
  , [ 1035, 357, 1745, 2423]
  , [ 798, 285, 1673, 2186]
  , [ 238, 670, 2058, 1626]
  , [ 269, 746, 2134, 1657]
  , [ 1270, 877, 2265, 2658]
  , [ 1123, 699, 2087, 2511]
  , [ 842, 1242, 2630, 2230]
  , [ 943, 1094, 2482, 2331]
  , [ 776, 1184, 2572, 2164]
  , [ 1036, 407, 1795, 2424]
  , [ 650, 1303, 2691, 2038]
  , [ 736, 1152, 2540, 2124]
  , [ 919, 312, 1700, 2307]
  , [ 239, 671, 2059, 1627]
  , [ 885, 1275, 2663, 2273]
  , [ 634, 78, 1466, 2022]
  , [ 1388, 1026, 2414, 2776]
  , [ 1360, 991, 2379, 2748]
  , [ 1213, 558, 1946, 2601]
  , [ 1065, 840, 2228, 2453]
  , [ 1003, 327, 1715, 2391]
  , [ 956, 1332, 2720, 2344]
  , [ 1184, 692, 2080, 2572]
  , [ 286, 800, 2188, 1674]
  , [ 875, 303, 1691, 2263]
  , [ 1303, 919, 2307, 2691]
  , [ 1152, 644, 2032, 2540]
  , [ 312, 920, 2308, 1700]
  , [ 411, 1271, 2659, 1799]
  , [ 560, 1095, 2483, 1948]
  , [ 440, 176, 1564, 1828]
  , [ 510, 1360, 2748, 1898]
  , [ 837, 1065, 2453, 2225]
  , [ 252, 1004, 2392, 1640]
  , [ 1332, 499, 1887, 2720]
  , [ 204, 876, 2264, 1592]
  , [ 673, 241, 1629, 2061]
  , [ 1275, 883, 2271, 2663]
  , [ 698, 1123, 2511, 2086]
  , [ 636, 49, 1437, 2024]
  , [ 359, 1243, 2631, 1747]
  , [ 441, 177, 1565, 1829]
  ]
