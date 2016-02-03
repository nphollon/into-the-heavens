module Math.Vector (Vector, vector, getX, getY, getZ, add, sub, negate, scale, dot, cross, normalize, direction, length, lengthSquared, distance, distanceSquared, orient) where


type alias Vector =
    { x : Float
    , y : Float
    , z : Float
    }


vector : Float -> Float -> Float -> Vector
vector x y z =
    { x = x, y = y, z = z }


getX : Vector -> Float
getX =
    .x


getY : Vector -> Float
getY =
    .y


getZ : Vector -> Float
getZ =
    .z


add : Vector -> Vector -> Vector
add a b =
    { x = a.x + b.x
    , y = a.y + b.y
    , z = a.z + b.z
    }


sub : Vector -> Vector -> Vector
sub a b =
    { x = a.x - b.x
    , y = a.y - b.y
    , z = a.z - b.z
    }


negate : Vector -> Vector
negate =
    sub (vector 0 0 0)


scale : Float -> Vector -> Vector
scale c v =
    { x = v.x * c
    , y = v.y * c
    , z = v.z * c
    }


dot : Vector -> Vector -> Float
dot u v =
    u.x * v.x + u.y * v.y + u.z * v.z


cross : Vector -> Vector -> Vector
cross u v =
    { x = u.y * v.z - u.z * v.y
    , y = u.z * v.x - u.x * v.z
    , z = u.x * v.y - u.y * v.x
    }


normalize : Vector -> Vector
normalize v =
    scale (1 / length v) v


direction : Vector -> Vector -> Vector
direction u v =
    normalize (u `sub` v)


length : Vector -> Float
length =
    lengthSquared >> sqrt


lengthSquared : Vector -> Float
lengthSquared v =
    v `dot` v


distance : Vector -> Vector -> Float
distance u v =
    length (u `sub` v)


distanceSquared : Vector -> Vector -> Float
distanceSquared u v =
    lengthSquared (u `sub` v)


orient : Vector -> Vector -> Vector
orient u v =
    compose (toQuaternion v) (toQuaternion u)
        |> fromQuaternion


type alias Quaternion =
    { vector : Vector
    , scalar : Float
    }


toQuaternion : Vector -> Quaternion
toQuaternion v =
    let
        angle = length v
    in
        if angle == 0 then
            { vector = v
            , scalar = 1
            }
        else
            { vector = scale (sin (0.5 * angle) / angle) v
            , scalar = cos (0.5 * angle)
            }


fromQuaternion : Quaternion -> Vector
fromQuaternion q =
    let
        halfSin = length q.vector
    in
        if halfSin == 0 then
            q.vector
        else
            scale (2 * acos q.scalar / halfSin) q.vector


compose : Quaternion -> Quaternion -> Quaternion
compose p q =
    { vector =
        (scale q.scalar p.vector)
            `add` (scale p.scalar q.vector)
            `add` (q.vector `cross` p.vector)
    , scalar =
        (q.scalar * p.scalar) - (q.vector `dot` p.vector)
    }
