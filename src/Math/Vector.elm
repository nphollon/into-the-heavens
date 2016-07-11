module Math.Vector exposing (Vector, vector, getX, getY, getZ, add, sub, negate, scale, dot, cross, normalize, direction, length, lengthSquared, distance, distanceSquared, equal, fromTuple, toTuple, unique, encode, decode, toVec3)

import Set
import Json.Encode as Encode exposing (Value)
import Json.Decode as Decode exposing (Decoder)
import Math.Vector3 as Vec3 exposing (Vec3)


type alias Vector =
    { x : Float, y : Float, z : Float }


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
    vector (getX a + getX b)
        (getY a + getY b)
        (getZ a + getZ b)


sub : Vector -> Vector -> Vector
sub a b =
    vector (getX a - getX b)
        (getY a - getY b)
        (getZ a - getZ b)


negate : Vector -> Vector
negate =
    sub (vector 0 0 0)


scale : Float -> Vector -> Vector
scale c v =
    vector (c * getX v)
        (c * getY v)
        (c * getZ v)


dot : Vector -> Vector -> Float
dot u v =
    (getX u * getX v) + (getY u * getY v) + (getZ u * getZ v)


cross : Vector -> Vector -> Vector
cross u v =
    vector ((getY u * getZ v) - (getZ u * getY v))
        ((getZ u * getX v) - (getX u * getZ v))
        ((getX u * getY v) - (getY u * getX v))


normalize : Vector -> Maybe Vector
normalize v =
    if length v == 0 then
        Nothing
    else
        Just (scale (1 / length v) v)


direction : Vector -> Vector -> Maybe Vector
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


equal : Vector -> Vector -> Bool
equal u v =
    let
        equalFloat p q =
            (p - q) ^ 2 < 1.0e-10
    in
        (equalFloat (getX u) (getX v))
            && (equalFloat (getY u) (getY v))
            && (equalFloat (getZ u) (getZ v))


fromTuple : ( Float, Float, Float ) -> Vector
fromTuple ( x, y, z ) =
    vector x y z


toTuple : Vector -> ( Float, Float, Float )
toTuple v =
    ( getX v, getY v, getZ v )


unique : List Vector -> List Vector
unique points =
    List.map toTuple points
        |> Set.fromList
        |> Set.toList
        |> List.map fromTuple


encode : Vector -> Value
encode v =
    Encode.list
        [ Encode.float (getX v)
        , Encode.float (getY v)
        , Encode.float (getZ v)
        ]


decode : Decoder Vector
decode =
    Decode.tuple3 vector Decode.float Decode.float Decode.float


toVec3 : Vector -> Vec3
toVec3 =
    Vec3.fromRecord
