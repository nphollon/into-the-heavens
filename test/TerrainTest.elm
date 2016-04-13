module TerrainTest (testSuite) where

import Array
import ElmTest exposing (..)
import Assertion exposing (..)
import Random.PCG as Random
import Generate.Terrain exposing (..)


testSuite : Test
testSuite =
  suite
    "terrain generation"
    [ faceAdjacency
    , initialization
    , setting
    , getting
    , offsets
    , pointLists
    , squareDiamondStep
    , resolutionStep
    , triangulation
    ]


faceAdjacency : Test
faceAdjacency =
  suite
    "face adjacency"
    [ test "right"
        <| assertEqual
            [ Blue, Yellow, Red, Orange, White, Green ]
            (List.map rightOf faces)
    , test "left"
        <| assertEqual
            [ Green, White, Orange, Red, Yellow, Blue ]
            (List.map leftOf faces)
    , test "above"
        <| assertEqual
            [ Orange, Green, White, Yellow, Blue, Red ]
            (List.map above faces)
    , test "below"
        <| assertEqual
            [ Red, Blue, Yellow, White, Green, Orange ]
            (List.map below faces)
    , test "pole"
        <| assertEqual
            [ North, North, North, South, South, South ]
            (List.map poleFor faces)
    ]


faces : List Face
faces =
  [ Yellow
  , Red
  , Blue
  , Green
  , Orange
  , White
  ]


initialization : Test
initialization =
  let
    initSphere =
      init 4 0
  in
    suite
      "intializing terrain sphere"
      [ test "resolution is 4"
          <| assertEqual 4 initSphere.resolution
      , testGridSize "yellow is 16 x 16" 16 initSphere.yellow
      , testGridSize "red is 16 x 16" 16 initSphere.red
      , testGridSize "blue is 16 x 16" 16 initSphere.blue
      , testGridSize "white is 16 x 16" 16 initSphere.white
      , testGridSize "orange is 16 x 16" 16 initSphere.orange
      , testGridSize "green is 16 x 16" 16 initSphere.green
      ]


testGridSize : String -> Int -> Grid a -> Test
testGridSize name expectedLength grid =
  let
    actualArea =
      Array.toList grid
        |> List.map Array.length
        |> List.sum
  in
    suite
      name
      [ test "length"
          <| assertEqual expectedLength (Array.length grid)
      , test "area"
          <| assertEqual (expectedLength ^ 2) actualArea
      ]


getting : Test
getting =
  suite
    "accessing a value in the grid"
    [ suite
        "granularity = resolution"
        [ test "origin point"
            <| assertEqual
                (Just 1)
                (gridPoint 2 0 0 Yellow getSetSphere)
        , test "normal point"
            <| assertEqual
                (Just 7)
                (gridPoint 2 1 2 Yellow getSetSphere)
        , test "pole"
            <| assertEqual
                (Just -1)
                (gridPoint 2 4 0 Yellow getSetSphere)
        , test "right boundary"
            <| assertEqual
                (Just 37)
                (gridPoint 2 4 3 Yellow getSetSphere)
        , test "upper right corner"
            <| assertEqual
                (Just 33)
                (gridPoint 2 4 4 Yellow getSetSphere)
        , test "upper boundary"
            <| assertEqual
                (Just 68)
                (gridPoint 2 3 4 Yellow getSetSphere)
        , test "upper boundary on x axis"
            <| assertEqual
                (Just 65)
                (gridPoint 2 0 4 Yellow getSetSphere)
        , test "left boundary"
            <| assertEqual
                (Just 64)
                (gridPoint 2 -1 3 Yellow getSetSphere)
        , test "left boundary on y axis"
            <| assertEqual
                (Just 52)
                (gridPoint 2 -1 0 Yellow getSetSphere)
        , test "lower boundary on x axis"
            <| assertEqual
                (Just 52)
                (gridPoint 2 0 -1 Yellow getSetSphere)
        , test "lower boundary"
            <| assertEqual
                (Just 30)
                (gridPoint 2 3 -1 Yellow getSetSphere)
        ]
    , suite
        "granularity = 1"
        [ test "origin point"
            <| assertEqual
                (Just 1)
                (gridPoint 1 0 0 Yellow getSetSphere)
        , test "normal point"
            <| assertEqual
                (Just 11)
                (gridPoint 1 1 1 Yellow getSetSphere)
        , test "pole"
            <| assertEqual
                (Just -1)
                (gridPoint 1 2 0 Yellow getSetSphere)
        , test "right boundary"
            <| assertEqual
                (Just 41)
                (gridPoint 1 2 1 Yellow getSetSphere)
        , test "upper right corner"
            <| assertEqual
                (Just 33)
                (gridPoint 1 2 2 Yellow getSetSphere)
        , test "upper boundary"
            <| assertEqual
                (Just 67)
                (gridPoint 1 1 2 Yellow getSetSphere)
        , test "upper boundary on x axis"
            <| assertEqual
                (Just 65)
                (gridPoint 1 0 2 Yellow getSetSphere)
        , test "left boundary"
            <| assertEqual
                (Just 59)
                (gridPoint 1 -1 1 Yellow getSetSphere)
        , test "left boundary on y axis"
            <| assertEqual
                (Just 51)
                (gridPoint 1 -1 0 Yellow getSetSphere)
        , test "lower boundary on x axis"
            <| assertEqual
                (Just 51)
                (gridPoint 1 0 -1 Yellow getSetSphere)
        , test "lower boundary"
            <| assertEqual
                (Just 27)
                (gridPoint 1 1 -1 Yellow getSetSphere)
        ]
    ]


setting : Test
setting =
  suite
    "setting a value in the grid"
    [ suite
        "granularity = resolution"
        [ test "origin point gets set"
            <| assertPointSet 2 0 0 Yellow
        , test "normal point gets set"
            <| assertPointSet 2 3 2 Yellow
        , test "out-of-bounds y not set"
            <| assertPointNotSet 2 3 4 Yellow
        , test "out-of-bounds x not set"
            <| assertPointNotSet 2 4 3 Yellow
        , test "negative y not set"
            <| assertPointNotSet 2 3 -1 Yellow
        , test "negative x not set"
            <| assertPointNotSet 2 -1 3 Yellow
        ]
    , suite
        "granularity = 1"
        [ test "origin point gets set"
            <| assertPointSet 1 0 0 Yellow
        , test "normal point gets set"
            <| assertPointSet 1 1 1 Yellow
        , test "out-of-bounds y not set"
            <| assertPointNotSet 1 1 2 Yellow
        , test "out-of-bounds x not set"
            <| assertPointNotSet 1 2 1 Yellow
        , test "negative y not set"
            <| assertPointNotSet 1 1 -1 Yellow
        , test "negative x not set"
            <| assertPointNotSet 1 -1 1 Yellow
        ]
    ]


assertPointSet : Int -> Int -> Int -> Face -> Assertion
assertPointSet r i j face =
  let
    modifiedSphere =
      setGridPoint r i j face 123 getSetSphere
  in
    assertEqual
      (Just 123)
      (gridPoint r i j face modifiedSphere)


assertPointNotSet : Int -> Int -> Int -> Face -> Assertion
assertPointNotSet r i j face =
  let
    modifiedSphere =
      setGridPoint r i j face 123 getSetSphere

    modifiedPoint =
      gridPoint r i j face modifiedSphere

    originalPoint =
      gridPoint r i j face getSetSphere
  in
    if modifiedPoint /= originalPoint then
      assertEqual modifiedPoint originalPoint
    else
      assertEqual getSetSphere modifiedSphere


getSetSphere : TerrainSphere
getSetSphere =
  { resolution = 2
  , yellow =
      Array.fromList
        [ Array.fromList [ 1, 2, 3, 4 ]
        , Array.fromList [ 5, 6, 7, 8 ]
        , Array.fromList [ 9, 10, 11, 12 ]
        , Array.fromList [ 13, 14, 15, 16 ]
        ]
  , red =
      Array.fromList
        [ Array.fromList [ 17, 18, 19, 20 ]
        , Array.fromList [ 21, 22, 23, 24 ]
        , Array.fromList [ 25, 26, 27, 28 ]
        , Array.fromList [ 29, 30, 31, 32 ]
        ]
  , blue =
      Array.fromList
        [ Array.fromList [ 33, 34, 35, 36 ]
        , Array.fromList [ 37, 38, 39, 40 ]
        , Array.fromList [ 41, 42, 43, 44 ]
        , Array.fromList [ 45, 46, 47, 48 ]
        ]
  , green =
      Array.fromList
        [ Array.fromList [ 49, 50, 51, 52 ]
        , Array.fromList [ 53, 54, 55, 56 ]
        , Array.fromList [ 57, 58, 59, 60 ]
        , Array.fromList [ 61, 62, 63, 64 ]
        ]
  , orange =
      Array.fromList
        [ Array.fromList [ 65, 66, 67, 68 ]
        , Array.fromList [ 69, 70, 71, 72 ]
        , Array.fromList [ 73, 74, 75, 76 ]
        , Array.fromList [ 77, 78, 79, 80 ]
        ]
  , white =
      Array.fromList
        [ Array.fromList [ 81, 82, 83, 84 ]
        , Array.fromList [ 85, 86, 87, 88 ]
        , Array.fromList [ 89, 90, 91, 92 ]
        , Array.fromList [ 93, 94, 95, 96 ]
        ]
  , northPole = -1
  , southPole = -2
  }


offsets : Test
offsets =
  let
    generate generator =
      Random.initialSeed 0
        |> Random.generate generator
        |> fst

    randomNumber =
      generate (Random.float 0 1)
  in
    suite
      "Randomly generated offset"
      [ test "resolution 1 generates offset between -0.5 and 0.5"
          <| assertEqual
              (randomNumber - 0.5)
              (generate (offset 1))
      , test "resolution 3 generates offset between -0.125 and 0.125"
          <| assertEqual
              (0.25 * randomNumber - 0.125)
              (generate (offset 3))
      ]


pointLists : Test
pointLists =
  suite
    "Lists of points"
    [ suite
        "face-centered points"
        [ test "resolution = 1 just includes (1,1)"
            <| assertListContents
                [ ( 1, 1 ) ]
                (faceCenteredPoints 1)
        , test "resolution = 3 includes all pairs of odd numbers 1 to 7"
            <| assertListContents
                ([ ( 1, 1 ), ( 1, 3 ), ( 1, 5 ), ( 1, 7 ) ]
                  ++ [ ( 3, 1 ), ( 3, 3 ), ( 3, 5 ), ( 3, 7 ) ]
                  ++ [ ( 5, 1 ), ( 5, 3 ), ( 5, 5 ), ( 5, 7 ) ]
                  ++ [ ( 7, 1 ), ( 7, 3 ), ( 7, 5 ), ( 7, 7 ) ]
                )
                (faceCenteredPoints 3)
        ]
    , suite
        "edge-centered points"
        [ test "resolution = 1 includes (0,1) and (1,0)"
            <| assertListContents
                [ ( 0, 1 ), ( 1, 0 ) ]
                (edgeCenteredPoints 1)
        , test "resolution = 3 includes all pairs of odds & evens below 8"
            <| assertListContents
                ([ ( 0, 1 ), ( 0, 3 ), ( 0, 5 ), ( 0, 7 ) ]
                  ++ [ ( 2, 1 ), ( 2, 3 ), ( 2, 5 ), ( 2, 7 ) ]
                  ++ [ ( 4, 1 ), ( 4, 3 ), ( 4, 5 ), ( 4, 7 ) ]
                  ++ [ ( 6, 1 ), ( 6, 3 ), ( 6, 5 ), ( 6, 7 ) ]
                  ++ [ ( 1, 0 ), ( 1, 2 ), ( 1, 4 ), ( 1, 6 ) ]
                  ++ [ ( 3, 0 ), ( 3, 2 ), ( 3, 4 ), ( 3, 6 ) ]
                  ++ [ ( 5, 0 ), ( 5, 2 ), ( 5, 4 ), ( 5, 6 ) ]
                  ++ [ ( 7, 0 ), ( 7, 2 ), ( 7, 4 ), ( 7, 6 ) ]
                )
                (edgeCenteredPoints 3)
        ]
    ]


squareDiamondStep : Test
squareDiamondStep =
  let
    sphere =
      init 2 0
  in
    suite
      "square-diamond interpolation for a single point"
      [ test "face-centered point, lowest resolution"
          <| assertEqual
              (Just 2)
              (sphere
                |> setGridPoint 2 0 0 Yellow 1
                |> setGridPoint 2 0 0 Orange 3
                |> setGridPoint 2 0 0 Blue 4
                |> squareAverage 1 1 1 Yellow
              )
      , test "edge-centered point, lowest resolution"
          <| assertEqual
              (Just 3.5)
              (sphere
                |> setGridPoint 2 0 0 Blue 2
                |> setGridPoint 2 0 0 White 3
                |> setGridPoint 2 2 2 Orange 4
                |> setGridPoint 2 2 2 Blue 5
                |> diamondAverage 1 0 1 Blue
              )
      , test "face-centered point, highest resolution, no wrapping"
          <| assertEqual
              (Just 0)
              (sphere
                |> setGridPoint 2 0 0 Red 1
                |> setGridPoint 2 2 2 Red 1
                |> setGridPoint 2 0 2 Red 1
                |> setGridPoint 2 2 0 Red -3
                |> squareAverage 2 1 1 Red
              )
      , test "face-centered point, highest resolution, wrapping"
          <| assertEqual
              (Just 2)
              (sphere
                |> setGridPoint 2 2 2 Blue 5
                |> setGridPoint 2 2 0 Red 0
                |> setGridPoint 2 2 0 Blue 3
                |> squareAverage 2 3 1 Blue
              )
      , test "edge-centered point, highest resolution, no wrapping"
          <| assertEqual
              (Just 1)
              (sphere
                |> setGridPoint 2 2 2 Green 0
                |> setGridPoint 2 2 0 Green 0
                |> setGridPoint 2 1 1 Green 0
                |> setGridPoint 2 3 1 Green 4
                |> diamondAverage 2 2 1 Green
              )
      , test "edge-centered point, highest resolution, wrapping"
          <| assertEqual
              (Just 4.5)
              (sphere
                |> setGridPoint 2 3 1 Green 5
                |> setGridPoint 2 2 0 Orange 6
                |> setGridPoint 2 3 1 Orange 7
                |> diamondAverage 2 3 0 Orange
              )
      ]


resolutionStep : Test
resolutionStep =
  let
    offset =
      Random.constant -48

    seed =
      Random.initialSeed 0
  in
    suite
      "square-diamond interpolation for the entire sphere"
      [ test "low resolution"
          <| assertEqual
              middleStepSphere
              (fst (step offset 1 ( firstStepSphere, seed )))
      , test "high resolution"
          <| assertEqual
              lastStepSphere
              (fst (step offset 2 ( middleStepSphere, seed )))
      , test "full process"
          <| assertEqual
              lastStepSphere
              (fst (generate (\_ -> offset) ( firstStepSphere, seed )))
      ]


firstStepSphere : TerrainSphere
firstStepSphere =
  { resolution = 2
  , yellow =
      Array.fromList
        [ Array.fromList [ 16, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , red =
      Array.fromList
        [ Array.fromList [ 32, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , blue =
      Array.fromList
        [ Array.fromList [ 48, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , green =
      Array.fromList
        [ Array.fromList [ 64, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , orange =
      Array.fromList
        [ Array.fromList [ 80, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , white =
      Array.fromList
        [ Array.fromList [ 96, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , northPole = -16
  , southPole = -32
  }


middleStepSphere : TerrainSphere
middleStepSphere =
  { resolution = 2
  , yellow =
      Array.fromList
        [ Array.fromList [ 16, 0, -32, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ -58, 0, -16, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , red =
      Array.fromList
        [ Array.fromList [ 32, 0, -32, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ -52, 0, -24, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , blue =
      Array.fromList
        [ Array.fromList [ 48, 0, -14, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ -46, 0, -8, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , green =
      Array.fromList
        [ Array.fromList [ 64, 0, -38, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ -46, 0, -16, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , orange =
      Array.fromList
        [ Array.fromList [ 80, 0, -20, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ -40, 0, 0, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , white =
      Array.fromList
        [ Array.fromList [ 96, 0, -20, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        , Array.fromList [ -34, 0, -8, 0 ]
        , Array.fromList [ 0, 0, 0, 0 ]
        ]
  , northPole = -16
  , southPole = -32
  }


lastStepSphere : TerrainSphere
lastStepSphere =
  { resolution = 2
  , yellow =
      Array.fromList
        [ Array.fromList [ 16, -86, -32, -59.75 ]
        , Array.fromList [ -94.625, -70.5, -88.875, -45 ]
        , Array.fromList [ -58, -104.625, -16, -82.375 ]
        , Array.fromList [ -108.375, -82, -98.125, -56.5 ]
        ]
  , red =
      Array.fromList
        [ Array.fromList [ 32, -78.5, -32, -67.25 ]
        , Array.fromList [ -84.75, -67, -92.625, -55.5 ]
        , Array.fromList [ -52, -105.125, -24, -95.875 ]
        , Array.fromList [ -106, -85.5, -108.375, -74 ]
        ]
  , blue =
      Array.fromList
        [ Array.fromList [ 48, -63.875, -14, -45.125 ]
        , Array.fromList [ -74.875, -53, -75.375, -34.5 ]
        , Array.fromList [ -46, -94.375, -8, -78.625 ]
        , Array.fromList [ -103.625, -78.5, -97.625, -60 ]
        ]
  , green =
      Array.fromList
        [ Array.fromList [ 64, -69.625, -38, -88.375 ]
        , Array.fromList [ -71.125, -57, -92.125, -65.5 ]
        , Array.fromList [ -46, -98.125, -16, -88.875 ]
        , Array.fromList [ -107.375, -81.5, -94.875, -50 ]
        ]
  , orange =
      Array.fromList
        [ Array.fromList [ 80, -55, -20, -66.25 ]
        , Array.fromList [ -61.25, -43, -74.875, -44.5 ]
        , Array.fromList [ -40, -87.375, 0, -71.625 ]
        , Array.fromList [ -105, -74.5, -84.125, -36 ]
        ]
  , white =
      Array.fromList
        [ Array.fromList [ 96, -47.5, -20, -73.75 ]
        , Array.fromList [ -51.375, -39.5, -78.625, -55 ]
        , Array.fromList [ -34, -87.875, -8, -85.125 ]
        , Array.fromList [ -102.625, -78, -94.375, -53.5 ]
        ]
  , northPole = -16
  , southPole = -32
  }


triangulation : Test
triangulation =
  let
    y00 =
      ( degrees 35.2643896828, degrees 135 )

    y10 =
      ( degrees 45, degrees 180 )

    y01 =
      ( degrees 45, degrees 90 )

    y11 =
      ( degrees 90, degrees 0 )

    r00 =
      ( degrees -35.2643896828, degrees -135 )

    r10 =
      ( degrees 0, degrees -135 )

    r01 =
      ( degrees -45, degrees 180 )

    r11 =
      ( degrees 0, degrees 180 )

    b00 =
      ( degrees 35.2643896828, degrees -45 )

    b10 =
      ( degrees 45, degrees -90 )

    b01 =
      ( degrees 0, degrees -45 )

    b11 =
      ( degrees 0, degrees -90 )

    g00 =
      ( degrees -35.2643896828, degrees 135 )

    g10 =
      ( degrees -45, degrees 90 )

    g01 =
      ( degrees 0, degrees 135 )

    g11 =
      ( degrees 0, degrees 90 )

    o00 =
      ( degrees 35.2643896828, degrees 45 )

    o10 =
      ( degrees 0, degrees 45 )

    o01 =
      ( degrees 45, degrees 0 )

    o11 =
      ( degrees 0, degrees 0 )

    w00 =
      ( degrees -35.2643896828, degrees -45 )

    w10 =
      ( degrees -45, degrees 0 )

    w01 =
      ( degrees -45, degrees -90 )

    w11 =
      ( degrees -90, degrees 0 )

    n =
      ( degrees 35.2643896828, degrees -135 )

    s =
      ( degrees -35.2643896828, degrees 45 )

    sphere =
      { resolution = 1
      , yellow =
          Array.fromList
            [ Array.fromList [ 0, 1 ]
            , Array.fromList [ 4, 2 ]
            ]
      , red =
          Array.fromList
            [ Array.fromList [ 1, 2 ]
            , Array.fromList [ 2, 0 ]
            ]
      , blue =
          Array.fromList
            [ Array.fromList [ 3, 3 ]
            , Array.fromList [ 3, 3 ]
            ]
      , green =
          Array.fromList
            [ Array.fromList [ 2, 4 ]
            , Array.fromList [ 3, 0 ]
            ]
      , orange =
          Array.fromList
            [ Array.fromList [ 1, 4 ]
            , Array.fromList [ 5, 3 ]
            ]
      , white =
          Array.fromList
            [ Array.fromList [ 3, 2 ]
            , Array.fromList [ 2, 3 ]
            ]
      , northPole = 0
      , southPole = 5
      }

    triangles =
      [ ( y00, y01, y11 )
      , ( y11, y10, y00 )
      , ( y10, y11, b10 )
      , ( b10, n, y10 )
      , ( y11, y01, o00 )
      , ( o00, o01, y11 )
      , ( y11, o01, b00 )
      , ( b00, b10, y11 )
      , ( r10, r00, r01 )
      , ( r01, r11, r10 )
      , ( n, r10, r11 )
      , ( r11, y10, n )
      , ( r01, g00, g01 )
      , ( g01, r11, r01 )
      , ( r11, g01, y00 )
      , ( y00, y10, r11 )
      , ( b00, b01, b11 )
      , ( b11, b10, b00 )
      , ( b10, b11, r10 )
      , ( r10, n, b10 )
      , ( b11, b01, w00 )
      , ( w00, w01, b11 )
      , ( r10, b11, w01 )
      , ( w01, r00, r10 )
      , ( g01, g00, g10 )
      , ( g10, g11, g01 )
      , ( y00, g01, g11 )
      , ( g11, y01, y00 )
      , ( g10, s, o10 )
      , ( o10, g11, g10 )
      , ( g11, o10, o00 )
      , ( o00, y01, g11 )
      , ( o01, o00, o10 )
      , ( o10, o11, o01 )
      , ( o11, o10, s )
      , ( s, w10, o11 )
      , ( b00, o01, o11 )
      , ( o11, b01, b00 )
      , ( o11, w10, w00 )
      , ( w00, b01, o11 )
      , ( w00, w10, w11 )
      , ( w11, w01, w00 )
      , ( w10, s, g10 )
      , ( g10, w11, w10 )
      , ( w01, w11, r01 )
      , ( r01, r00, w01 )
      , ( w11, g10, g00 )
      , ( g00, r01, w11 )
      ]
  in
    suite
      "positioning a terrain sphere in space"
      [ test "latitude and longitude for Yellow 1 0, resolution 1"
          <| assertEqualPair
              ( degrees 45, degrees 180 )
              (coordinatesFor 1 1 0 Yellow)
      , test "latitude and longitude for Yellow 0 1, resolution 1"
          <| assertEqualPair
              ( degrees 45, degrees 90 )
              (coordinatesFor 1 0 1 Yellow)
      , test "latitude and longitude for Yellow 0 0, resolution 1"
          <| assertEqualPair
              ( degrees 35.2643896828, degrees 135 )
              (coordinatesFor 1 0 0 Yellow)
      , test "latitude and longitude for White 0 0, resolution 1"
          <| assertEqualPair
              ( degrees -35.26439, degrees -45 )
              (coordinatesFor 1 0 0 White)
      , test "triangulating a terrain sphere"
          <| assertMesh
              triangles
              (triangulate (\lat lon value -> ( lat, lon )) sphere)
      ]
