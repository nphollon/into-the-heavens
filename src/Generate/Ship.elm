module Generate.Ship (mesh) where

import Mesh exposing (Mesh)
import Array
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Maybe.Extra as MaybeX


mesh : Mesh
mesh =
  let
    zPeak =
      (1 + sqrt 2) * 2 ^ -0.25

    zMid =
      -(2 ^ -0.25)

    rMid =
      2 ^ -0.5

    vertexes =
      List.map
        toVertex
        [ ( Vec3.vec3 0 0 zPeak, Vec3.vec3 0 0 1 )
        , ( Vec3.vec3 rMid rMid zMid, Vec3.vec3 rMid rMid 0 )
        , ( Vec3.vec3 rMid -rMid zMid, Vec3.vec3 rMid -rMid 0 )
        , ( Vec3.vec3 -rMid -rMid zMid, Vec3.vec3 -rMid -rMid 0 )
        , ( Vec3.vec3 -rMid rMid zMid, Vec3.vec3 -rMid rMid 0 )
        , ( Vec3.vec3 1 0 -zPeak, Vec3.vec3 rMid 0 -rMid )
        , ( Vec3.vec3 0 -1 -zPeak, Vec3.vec3 0 -rMid -rMid )
        , ( Vec3.vec3 -1 0 -zPeak, Vec3.vec3 -rMid 0 -rMid )
        , ( Vec3.vec3 0 1 -zPeak, Vec3.vec3 0 rMid -rMid )
        ]
        |> Array.fromList

    indexes =
      [ ( 0, 2, 6 )
      , ( 0, 6, 3 )
      , ( 0, 3, 7 )
      , ( 0, 7, 4 )
      , ( 0, 4, 8 )
      , ( 0, 8, 1 )
      , ( 0, 1, 5 )
      , ( 0, 5, 2 )
      , ( 6, 5, 8 )
      , ( 8, 7, 6 )
      , ( 7, 3, 6 )
      , ( 6, 2, 5 )
      , ( 5, 1, 8 )
      , ( 8, 4, 7 )
      ]

    toVertex ( position, normal ) =
      { vertPosition = position
      , normal = normal
      , vertColor = Vec4.vec4 0.28125 0.234375 0.47265625 1
      }

    lookup i =
      Array.get i vertexes

    triangle ( i, j, k ) =
      MaybeX.map3 (,,) (lookup i) (lookup j) (lookup k)
  in
    List.filterMap triangle indexes
