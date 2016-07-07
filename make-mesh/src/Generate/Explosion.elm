module Generate.Explosion exposing (mesh)

import WebGL exposing (Drawable(..))
import Math.Vector4 as Vec4
import Math.Vector as Vector exposing (Vector)
import Math.Spherical as Spherical
import Generate.Json exposing (Vertex)


mesh : Drawable Vertex
mesh =
    basePoints
        |> List.map toVertex
        |> Points


toVertex : Vector -> Vertex
toVertex position =
    { position = position
    , normal = Vector.normalize position
    , color = Vec4.vec4 1 1 0 1
    }


basePoints : List Vector
basePoints =
    [ ( 90, 0 )
    , ( 26.56505117707802, 0 )
    , ( 26.56505117707802, 72 )
    , ( 26.56505117707802, 144 )
    , ( 26.56505117707802, 216 )
    , ( 26.56505117707802, 288 )
    , ( -26.56505117707802, 36 )
    , ( -26.56505117707802, 108 )
    , ( -26.56505117707802, 180 )
    , ( -26.56505117707802, 252 )
    , ( -26.56505117707802, 324 )
    , ( -90, 0 )
    ]
        |> List.map (\( a, b ) -> ( degrees a, degrees b ))
        |> List.map (uncurry (Spherical.toRect 1))
