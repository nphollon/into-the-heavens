module Math.Vector (Vector, vector, getX, getY, getZ, add, sub, negate, scale, dot, cross, normalize, direction, length, lengthSquared, distance, distanceSquared, toVec3, fromVec3, equal, toRecord) where

import Math.Vector3 as Vec3 exposing (Vec3)


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
  if length v == 0 then
    v
  else
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


toVec3 : Vector -> Vec3
toVec3 =
  Vec3.fromRecord


fromVec3 : Vec3 -> Vector
fromVec3 =
  Vec3.toRecord


equal : Vector -> Vector -> Bool
equal u v =
  let
    equalFloat p q =
      (p - q) ^ 2 < 1.0e-5
  in
    (equalFloat u.x v.x)
      && (equalFloat u.y v.y)
      && (equalFloat u.z v.z)


toRecord : Vector -> { x : Float, y : Float, z : Float }
toRecord v =
  v
