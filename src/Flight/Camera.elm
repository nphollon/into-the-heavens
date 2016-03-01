module Flight.Camera (at, ortho) where

import Math.Matrix as Matrix
import Math.Matrix4 as Mat4
import Math.Transform as Transform
import Math.Vector as Vector
import Types exposing (Body, Camera)


at : Float -> Body -> Camera
at aspect object =
  { perspective = Mat4.makePerspective 60 aspect 0.1 1000000.0
  , position = object.position
  , orientation =
      Transform.placement 1 (Vector.vector 0 0 0) object.orientation
        |> Matrix.transpose
  }


ortho : Float -> Camera
ortho aspect =
  let
    scale =
      20
  in
    { perspective =
        Mat4.makeOrtho2D (-scale * aspect) (scale * aspect) -scale scale
    , position = Vector.vector 0 0 0
    , orientation = Matrix.identity
    }
