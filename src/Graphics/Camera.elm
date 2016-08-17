module Graphics.Camera exposing (at, ortho, aspect, fovy)

import Math.Matrix4 as Mat4
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Types exposing (Body, Camera)


at : Body -> Camera
at object =
    { perspective = Mat4.makePerspective fovy aspect 0.1 1000000.0
    , position = object.position
    , orientation = Quaternion.negate object.orientation
    }


ortho : Camera
ortho =
    let
        scale =
            20
    in
        { perspective =
            Mat4.makeOrtho2D (-scale * aspect) (scale * aspect) -scale scale
        , position = Vector.vector 0 0 0
        , orientation = Quaternion.identity
        }


aspect : Float
aspect =
    1.5


fovy : Float
fovy =
    60
