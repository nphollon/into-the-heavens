module Generate.Missile (model) where

import Array
import Generate.FlatFace as FlatFace exposing (ModelData)
import Math.Vector as Vector exposing (Vector)


model : ModelData
model =
  let
    zPeak =
      0

    zBase =
      0.1

    rBase =
      0.1
  in
    { vertexPositions =
        Array.fromList
          [ Vector.vector 0 0 zPeak
          , Vector.vector 0 rBase zBase
          , Vector.vector rBase 0 zBase
          , Vector.vector 0 -rBase zBase
          , Vector.vector -rBase 0 zBase
          ]
    , vertexIndexes =
        [ [ 0, 2, 1 ]
        , [ 0, 3, 2 ]
        , [ 0, 4, 3 ]
        , [ 0, 1, 4 ]
        , [ 1, 2, 3, 4 ]
        ]
    }
