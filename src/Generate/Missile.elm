module Generate.Missile (mesh) where

import Generate.Json exposing (Vertex)
import Generate.FlatFace as FlatFace
import WebGL exposing (Drawable(..))
import Array
import Math.Vector as Vector exposing (Vector)
import Math.Vector4 as Vec4 exposing (Vec4)


mesh : Drawable Vertex
mesh =
  let
    zPeak =
      0

    zBase =
      0.1

    rBase =
      0.1

    cornerPositions =
      Array.fromList
        [ Vector.vector 0 0 zPeak
        , Vector.vector 0 rBase zBase
        , Vector.vector rBase 0 zBase
        , Vector.vector 0 -rBase zBase
        , Vector.vector -rBase 0 zBase
        ]

    cornerIndexes =
      [ [ 0, 2, 1 ]
      , [ 0, 3, 2 ]
      , [ 0, 4, 3 ]
      , [ 0, 1, 4 ]
      , [ 1, 2, 3, 4 ]
      ]
  in
    FlatFace.triangles cornerPositions cornerIndexes
