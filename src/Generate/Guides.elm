module Generate.Guides (crosshair, target, targetable, incoming, shield, bar) where

import WebGL exposing (Drawable(..))
import Types exposing (Vertex)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)


crosshair : Drawable Vertex
crosshair =
  ngon 4 1 (Vec4.vec4 0.9 0.9 0.9 1)
    |> (++) (ngon 4 1.1 (Vec4.vec4 0 0 0 1))
    |> LineLoop


target : Drawable Vertex
target =
  LineLoop (ngon 30 1 (Vec4.vec4 0.2 0.2 1 1))


targetable : Drawable Vertex
targetable =
  Lines (dashedNgon 15 1 (Vec4.vec4 0.2 0.2 1 1))


incoming : Drawable Vertex
incoming =
  LineLoop (ngon 30 0.4 (Vec4.vec4 1 0 0 1))


ngon : Int -> Float -> Vec4 -> List Vertex
ngon sides radius color =
  [0..sides]
    |> List.map (\i -> turns (toFloat i / toFloat sides))
    |> List.map (toVertex color radius)


dashedNgon : Int -> Float -> Vec4 -> List ( Vertex, Vertex )
dashedNgon sides radius color =
  let
    vertex i =
      toVertex color radius (turns (i / toFloat sides))
  in
    [0..sides]
      |> List.map toFloat
      |> List.map
          (\i -> ( vertex i, vertex (i + 0.4) ))


shield : Drawable Vertex
shield =
  let
    tip =
      ( 20, Vec4.vec4 0.6 0.6 0.3 1 )

    rim =
      ( 35, Vec4.vec4 0 0 0.1 1 )
  in
    skewStroke 25 tip rim
      |> (++) (skewStroke 25 rim tip)
      |> Lines


bar : Drawable Vertex
bar =
  let
    full =
      Vec4.vec4 1 1 1 1

    empty =
      Vec4.vec4 0 0 0 1

    topLeftX =
      28

    topLeftY =
      -5

    width =
      1

    height =
      15

    upperRight =
      { vertPosition = Vec3.vec3 (topLeftX + width) topLeftY 0
      , vertColor = full
      , normal = Vec3.vec3 0 0 0
      }

    upperLeft =
      { vertPosition = Vec3.vec3 topLeftX topLeftY 0
      , vertColor = full
      , normal = Vec3.vec3 0 0 0
      }

    lowerRight =
      { vertPosition = Vec3.vec3 (topLeftX + width) (topLeftY - height) 0
      , vertColor = empty
      , normal = Vec3.vec3 0 0 0
      }

    lowerLeft =
      { vertPosition = Vec3.vec3 topLeftX (topLeftY - height) 0
      , vertColor = empty
      , normal = Vec3.vec3 0 0 0
      }
  in
    Triangle
      [ ( upperRight, upperLeft, lowerRight )
      , ( lowerRight, upperLeft, lowerLeft )
      ]


skewStroke : Int -> ( Float, Vec4 ) -> ( Float, Vec4 ) -> List ( Vertex, Vertex )
skewStroke strokes ( innerRadius, innerColor ) ( outerRadius, outerColor ) =
  let
    angleOf i =
      turns (toFloat i / toFloat strokes)

    toStroke i =
      ( toVertex innerColor innerRadius (angleOf i)
      , toVertex outerColor outerRadius (angleOf (i + 1))
      )
  in
    List.map toStroke [0..strokes]


toVertex : Vec4 -> Float -> Float -> Vertex
toVertex color radius angle =
  { vertPosition = toPosition radius angle
  , vertColor = color
  , normal = Vec3.vec3 0 0 0
  }


toPosition : Float -> Float -> Vec3
toPosition radius angle =
  let
    ( x, y ) =
      fromPolar ( radius, angle )
  in
    Vec3.vec3 x y 0
