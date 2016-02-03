module Math.Orientation (Orientation, fromVector) where

import Math.Vector exposing (..)


type alias Orientation =
    { vector : Vector
    , scalar : Float
    }


fromVector : Vector -> Orientation
fromVector v =
    let
        halfAngle = 0.5 * length v
    in
        { vector = scale (sin halfAngle) v
        , scalar = cos halfAngle
        }


product : Orientation -> Orientation -> Orientation
product p q =
    { vector =
        (scale p.scalar q.vector)
            `add` (scale q.scalar p.vector)
            `add` (p.vector `cross` q.vector)
    , scalar =
        p.scalar * q.scalar - (p.vector `dot` q.vector)
    }
