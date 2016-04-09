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
    , squareDiamond
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


generate : Random.Generator a -> a
generate generator =
  Random.initialSeed 0
    |> Random.generate generator
    |> fst


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


squareDiamond : Test
squareDiamond =
  let
    sphere =
      init 2 0
  in
    suite
      "square-diamond interpolation"
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
