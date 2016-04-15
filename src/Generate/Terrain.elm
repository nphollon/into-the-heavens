module Generate.Terrain (TerrainSphere, Grid, Face(..), Pole(..), init, gridPoint, polePoint, above, below, leftOf, rightOf, poleFor, setGridPoint, offset, faceCenteredPoints, edgeCenteredPoints, squareAverage, diamondAverage, step, generate, triangulate, coordinatesFor) where

import Array exposing (Array)
import List.Extra as ListX
import Maybe.Extra as MaybeX
import Random.PCG as Random
import Math.Spherical as Spherical


type alias TerrainSphere =
  { resolution : Int
  , yellow : Grid Float
  , red : Grid Float
  , blue : Grid Float
  , green : Grid Float
  , orange : Grid Float
  , white : Grid Float
  , northPole : Float
  , southPole : Float
  }


type alias GenerateData =
  ( TerrainSphere, Random.Seed )


type alias Grid a =
  Array (Array a)


type Face
  = Yellow
  | Red
  | Blue
  | Green
  | Orange
  | White


faces : List Face
faces =
  [ Yellow, Red, Blue, Green, Orange, White ]


type Pole
  = North
  | South


init : Int -> Float -> TerrainSphere
init resolution value =
  let
    blankGrid =
      value
        |> Array.repeat (2 ^ resolution)
        |> Array.repeat (2 ^ resolution)
  in
    { resolution = resolution
    , yellow = blankGrid
    , red = blankGrid
    , blue = blankGrid
    , green = blankGrid
    , orange = blankGrid
    , white = blankGrid
    , northPole = value
    , southPole = value
    }


generate : (Int -> Random.Generator Float) -> GenerateData -> GenerateData
generate generatorGenerator ( firstSphere, firstSeed ) =
  List.foldl
    (\r -> step (generatorGenerator r) r)
    ( firstSphere, firstSeed )
    [1..firstSphere.resolution]


step : Random.Generator Float -> Int -> GenerateData -> GenerateData
step offsetGenerator r ( firstSphere, firstSeed ) =
  let
    forFace func ( ( i, j ), face ) ( sphere, seed ) =
      case (func r i j face sphere) of
        Nothing ->
          ( sphere, seed )

        Just v ->
          let
            ( offset, newSeed ) =
              Random.generate offsetGenerator seed
          in
            (,)
              (setGridPoint r i j face (v + offset) sphere)
              newSeed

    faceCenteredParams =
      ListX.lift2 (,) (faceCenteredPoints r) faces

    edgeCenteredParams =
      ListX.lift2 (,) (edgeCenteredPoints r) faces
  in
    ( firstSphere, firstSeed )
      |> flip (List.foldl (forFace squareAverage)) faceCenteredParams
      |> flip (List.foldl (forFace diamondAverage)) edgeCenteredParams


squareAverage : Int -> Int -> Int -> Face -> TerrainSphere -> Maybe Float
squareAverage r i j face sphere =
  MaybeX.map4
    quadAverage
    (gridPoint r (i + 1) (j - 1) face sphere)
    (gridPoint r (i + 1) (j + 1) face sphere)
    (gridPoint r (i - 1) (j + 1) face sphere)
    (gridPoint r (i - 1) (j - 1) face sphere)


diamondAverage : Int -> Int -> Int -> Face -> TerrainSphere -> Maybe Float
diamondAverage r i j face sphere =
  MaybeX.map4
    quadAverage
    (gridPoint r i (j - 1) face sphere)
    (gridPoint r i (j + 1) face sphere)
    (gridPoint r (i - 1) j face sphere)
    (gridPoint r (i + 1) j face sphere)


quadAverage : Float -> Float -> Float -> Float -> Float
quadAverage ne nw sw se =
  0.25 * (ne + nw + sw + se)


gridPoint : Int -> Int -> Int -> Face -> TerrainSphere -> Maybe Float
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


setGridPoint : Int -> Int -> Int -> Face -> Float -> TerrainSphere -> TerrainSphere
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


getFaceGrid : Face -> TerrainSphere -> Grid Float
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


updateFaceGrid : Face -> (Grid Float -> Grid Float) -> TerrainSphere -> TerrainSphere
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


polePoint : Pole -> TerrainSphere -> Float
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


offset : Float -> Int -> Random.Generator Float
offset roughness resolution =
  let
    limit =
      roughness * (2 ^ -(toFloat resolution))
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


triangulate : (Float -> Float -> Float -> a) -> TerrainSphere -> List ( a, a, a )
triangulate toVertex sphere =
  let
    params =
      ListX.lift3
        (,,)
        (validIndexes sphere.resolution)
        (validIndexes sphere.resolution)
        faces

    vertex i j face =
      let
        height =
          gridPoint sphere.resolution i j face sphere
            |> Maybe.withDefault 0

        coordinates =
          coordinatesFor sphere.resolution i j face
      in
        { height = height
        , vertex = uncurry toVertex coordinates height
        }

    isClockwise face =
      South == poleFor face

    quad a b c d pointList =
      ( a.vertex, b.vertex, c.vertex )
        :: ( c.vertex, d.vertex, a.vertex )
        :: pointList

    distance a b =
      abs (a.height - b.height)

    trianglesForPoint ( i, j, face ) pointList =
      let
        a =
          vertex i j face

        b =
          vertex i (j + 1) face

        c =
          vertex (i + 1) (j + 1) face

        d =
          vertex (i + 1) j face
      in
        case ( isClockwise face, distance b d < distance a c ) of
          ( True, True ) ->
            quad d a b c pointList

          ( True, False ) ->
            quad a b c d pointList

          ( False, True ) ->
            quad d c b a pointList

          ( False, False ) ->
            quad a d c b pointList
  in
    List.foldl trianglesForPoint [] params


coordinatesFor : Int -> Int -> Int -> Face -> ( Float, Float )
coordinatesFor r i j face =
  let
    radius =
      2 ^ (r - 1)

    latLon ix iy iz =
      let
        x =
          toFloat ix

        y =
          toFloat iy

        z =
          toFloat iz

        lat =
          asin (y / sqrt (x ^ 2 + y ^ 2 + z ^ 2))

        lon =
          atan2 z x
      in
        ( lat, lon )
  in
    case face of
      Yellow ->
        latLon (j - radius) radius (radius - i)

      Red ->
        latLon -radius (i - radius) (j - radius)

      Blue ->
        latLon (radius - i) (radius - j) -radius

      Green ->
        latLon (i - radius) (j - radius) radius

      Orange ->
        latLon radius (radius - i) (radius - j)

      White ->
        latLon (radius - j) -radius (i - radius)
