module Math.Vector (vector, add, subtract, scale, Vector) where


type alias Vector =
  { x : Float
  , y : Float
  , z : Float
  }


vector : Float -> Float -> Float -> Vector
vector x y z =
  { x = x, y = y, z = z }


add : Vector -> Vector -> Vector
add a b =
  { x = a.x + b.x
  , y = a.y + b.y
  , z = a.z + b.z
  }


subtract : Vector -> Vector -> Vector
subtract a b =
  { x = a.x - b.x
  , y = a.y - b.y
  , z = a.z - b.z
  }


scale : Float -> Vector -> Vector
scale c v =
  { x = v.x * c
  , y = v.y * c
  , z = v.z * c
  }
