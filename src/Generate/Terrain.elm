module Generate.Terrain (TerrainSphere, Grid, Point, Face(..), Pole(..), init, gridPoint, polePoint, above, below, leftOf, rightOf, poleFor, setGridPoint, offset, faceCenteredPoints, edgeCenteredPoints) where

import Array exposing (Array)
import List.Extra as ListX
import Random.PCG as Random


type alias TerrainSphere =
  { resolution : Int
  , yellow : Grid Point
  , red : Grid Point
  , blue : Grid Point
  , green : Grid Point
  , orange : Grid Point
  , white : Grid Point
  , northPole : Point
  , southPole : Point
  }


type alias Grid a =
  Array (Array a)


type alias Point =
  { lat : Float
  , lon : Float
  , value : Float
  }


type Face
  = Yellow
  | Red
  | Blue
  | Green
  | Orange
  | White


type Pole
  = North
  | South


init : Int -> TerrainSphere
init r =
  let
    pt =
      { lat = 0, lon = 0, value = 0 }
  in
    { resolution = r
    , yellow = blankGrid (2 ^ r) pt
    , red = blankGrid (2 ^ r) pt
    , blue = blankGrid (2 ^ r) pt
    , green = blankGrid (2 ^ r) pt
    , orange = blankGrid (2 ^ r) pt
    , white = blankGrid (2 ^ r) pt
    , northPole = pt
    , southPole = pt
    }


blankGrid : Int -> a -> Grid a
blankGrid r =
  Array.repeat r >> Array.repeat r


gridPoint : Int -> Int -> Int -> Face -> TerrainSphere -> Maybe Point
gridPoint r i j face sphere =
  let
    limit =
      2 ^ r

    max =
      limit - 1

    delta =
      2 ^ (sphere.resolution - r)
  in
    if (i == limit) && (j == 0) then
      Just (polePoint (poleFor face) sphere)
    else if (i == 0) && (j == -1) then
      gridPoint r 0 max (leftOf face) sphere
    else if (i == limit) then
      gridPoint r (limit - j) 0 (rightOf face) sphere
    else if (j == limit) then
      gridPoint r 0 i (above face) sphere
    else if (i == -1) then
      gridPoint r j max (leftOf face) sphere
    else if (j == -1) then
      gridPoint r max (limit - i) (below face) sphere
    else
      getFaceGrid face sphere
        |> Array.get (i * delta)
        |> flip Maybe.andThen (Array.get (j * delta))


setGridPoint : Int -> Int -> Int -> Face -> Point -> TerrainSphere -> TerrainSphere
setGridPoint r i j face point sphere =
  let
    delta =
      2 ^ (sphere.resolution - r)

    update grid =
      Array.get (i * delta) grid
        |> Maybe.map (Array.set (j * delta) point)
        |> Maybe.map (\row -> Array.set (i * delta) row grid)
        |> Maybe.withDefault grid
  in
    updateFaceGrid face update sphere


getFaceGrid : Face -> TerrainSphere -> Grid Point
getFaceGrid face =
  case face of
    Yellow ->
      .yellow

    Red ->
      .red

    Blue ->
      .blue

    Green ->
      .green

    Orange ->
      .orange

    White ->
      .white


updateFaceGrid : Face -> (Grid Point -> Grid Point) -> TerrainSphere -> TerrainSphere
updateFaceGrid face gridFunc sphere =
  case face of
    Yellow ->
      { sphere | yellow = gridFunc sphere.yellow }

    Red ->
      { sphere | red = gridFunc sphere.red }

    Blue ->
      { sphere | blue = gridFunc sphere.blue }

    Green ->
      { sphere | green = gridFunc sphere.green }

    Orange ->
      { sphere | orange = gridFunc sphere.orange }

    White ->
      { sphere | white = gridFunc sphere.white }


polePoint : Pole -> TerrainSphere -> Point
polePoint pole sphere =
  case pole of
    North ->
      sphere.northPole

    South ->
      sphere.southPole


rightOf : Face -> Face
rightOf face =
  case face of
    Yellow ->
      Blue

    Red ->
      Yellow

    Blue ->
      Red

    Green ->
      Orange

    Orange ->
      White

    White ->
      Green


leftOf : Face -> Face
leftOf face =
  case face of
    Yellow ->
      Green

    Red ->
      White

    Blue ->
      Orange

    Green ->
      Red

    Orange ->
      Yellow

    White ->
      Blue


above : Face -> Face
above face =
  case face of
    Yellow ->
      Orange

    Red ->
      Green

    Blue ->
      White

    Green ->
      Yellow

    Orange ->
      Blue

    White ->
      Red


below : Face -> Face
below face =
  case face of
    Yellow ->
      Red

    Red ->
      Blue

    Blue ->
      Yellow

    Green ->
      White

    Orange ->
      Green

    White ->
      Orange


poleFor : Face -> Pole
poleFor face =
  case face of
    Yellow ->
      North

    Red ->
      North

    Blue ->
      North

    Green ->
      South

    Orange ->
      South

    White ->
      South


offset : Int -> Random.Generator Float
offset r =
  let
    limit =
      2 ^ -r
  in
    Random.float -limit limit


faceCenteredPoints : Int -> List ( Int, Int )
faceCenteredPoints r =
  let
    odds =
      List.filter isOdd (validIndexes r)
  in
    ListX.lift2 (,) odds odds


edgeCenteredPoints : Int -> List ( Int, Int )
edgeCenteredPoints r =
  let
    ( odds, evens ) =
      List.partition isOdd (validIndexes r)
  in
    ListX.lift2 (,) evens odds
      ++ ListX.lift2 (,) odds evens


validIndexes : Int -> List Int
validIndexes resolution =
  [0..(2 ^ resolution - 1)]


isOdd : Int -> Bool
isOdd i =
  i % 2 == 1
