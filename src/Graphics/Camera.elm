module Graphics.Camera exposing (at, ortho, aspect, fovy)

import Math.Matrix4 as Mat4
import Math.Vector3 as Vec3
import Quaternion
import Vector
import Frame exposing (Frame)
import Types exposing (Body, Camera)


at : Frame -> Camera
at frame =
    { perspective = Mat4.makePerspective fovy aspect 0.1 1000000.0
    , position = Vector.toVec3 frame.position
    , orientation = Quaternion.toMat4 (Quaternion.conjugate frame.orientation)
    }


ortho : Camera
ortho =
    let
        scale =
            20
    in
        { perspective =
            Mat4.makeOrtho2D (-scale * aspect) (scale * aspect) -scale scale
        , position = Vec3.vec3 0 0 0
        , orientation = Mat4.identity
        }


aspect : Float
aspect =
    1.5


fovy : Float
fovy =
    60
