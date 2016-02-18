module Math.Transform (toBodyFrame, fromBodyFrame) where

import Types exposing (Body)
import Math.Matrix as Matrix
import Math.Vector as Vector exposing (Vector)


toBodyFrame : Vector -> Body -> Vector
toBodyFrame point body =
  Matrix.rotate
    (Vector.negate body.orientation)
    (Vector.sub point body.position)


fromBodyFrame : Vector -> Body -> Vector
fromBodyFrame point body =
  Vector.add body.position (Matrix.rotate body.orientation point)
