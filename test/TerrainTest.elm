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
    terrainSphere =
      init 4
  in
    suite
      "intializing terrain sphere"
      [ test "resolution is 4"
          <| assertEqual 4 terrainSphere.resolution
      , testGridSize "yellow is 16 x 16" 16 terrainSphere.yellow
      , testGridSize "red is 16 x 16" 16 terrainSphere.red
      , testGridSize "blue is 16 x 16" 16 terrainSphere.blue
      , testGridSize "white is 16 x 16" 16 terrainSphere.white
      , testGridSize "orange is 16 x 16" 16 terrainSphere.orange
      , testGridSize "green is 16 x 16" 16 terrainSphere.green
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
                (Just (pt 1))
                (gridPoint 2 0 0 Yellow testSphere)
        , test "normal point"
            <| assertEqual
                (Just (pt 7))
                (gridPoint 2 1 2 Yellow testSphere)
        , test "pole"
            <| assertEqual
                (Just (pt -1))
                (gridPoint 2 4 0 Yellow testSphere)
        , test "right boundary"
            <| assertEqual
                (Just (pt 37))
                (gridPoint 2 4 3 Yellow testSphere)
        , test "upper right corner"
            <| assertEqual
                (Just (pt 33))
                (gridPoint 2 4 4 Yellow testSphere)
        , test "upper boundary"
            <| assertEqual
                (Just (pt 68))
                (gridPoint 2 3 4 Yellow testSphere)
        , test "upper boundary on x axis"
            <| assertEqual
                (Just (pt 65))
                (gridPoint 2 0 4 Yellow testSphere)
        , test "left boundary"
            <| assertEqual
                (Just (pt 64))
                (gridPoint 2 -1 3 Yellow testSphere)
        , test "left boundary on y axis"
            <| assertEqual
                (Just (pt 52))
                (gridPoint 2 -1 0 Yellow testSphere)
        , test "lower boundary on x axis"
            <| assertEqual
                (Just (pt 52))
                (gridPoint 2 0 -1 Yellow testSphere)
        , test "lower boundary"
            <| assertEqual
                (Just (pt 30))
                (gridPoint 2 3 -1 Yellow testSphere)
        ]
    , suite
        "granularity = 1"
        [ test "origin point"
            <| assertEqual
                (Just (pt 1))
                (gridPoint 1 0 0 Yellow testSphere)
        , test "normal point"
            <| assertEqual
                (Just (pt 11))
                (gridPoint 1 1 1 Yellow testSphere)
        , test "pole"
            <| assertEqual
                (Just (pt -1))
                (gridPoint 1 2 0 Yellow testSphere)
        , test "right boundary"
            <| assertEqual
                (Just (pt 41))
                (gridPoint 1 2 1 Yellow testSphere)
        , test "upper right corner"
            <| assertEqual
                (Just (pt 33))
                (gridPoint 1 2 2 Yellow testSphere)
        , test "upper boundary"
            <| assertEqual
                (Just (pt 67))
                (gridPoint 1 1 2 Yellow testSphere)
        , test "upper boundary on x axis"
            <| assertEqual
                (Just (pt 65))
                (gridPoint 1 0 2 Yellow testSphere)
        , test "left boundary"
            <| assertEqual
                (Just (pt 59))
                (gridPoint 1 -1 1 Yellow testSphere)
        , test "left boundary on y axis"
            <| assertEqual
                (Just (pt 51))
                (gridPoint 1 -1 0 Yellow testSphere)
        , test "lower boundary on x axis"
            <| assertEqual
                (Just (pt 51))
                (gridPoint 1 0 -1 Yellow testSphere)
        , test "lower boundary"
            <| assertEqual
                (Just (pt 27))
                (gridPoint 1 1 -1 Yellow testSphere)
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
    testPoint =
      { lat = 1, lon = 1, value = 0 }

    modifiedSphere =
      setGridPoint r i j face testPoint testSphere
  in
    assertEqual
      (Just testPoint)
      (gridPoint r i j face modifiedSphere)


assertPointNotSet : Int -> Int -> Int -> Face -> Assertion
assertPointNotSet r i j face =
  let
    testPoint =
      { lat = 1, lon = 1, value = 0 }

    modifiedSphere =
      setGridPoint r i j face testPoint testSphere

    modifiedPoint =
      gridPoint r i j face modifiedSphere

    originalPoint =
      gridPoint r i j face testSphere
  in
    if modifiedPoint /= originalPoint then
      assertEqual modifiedPoint originalPoint
    else
      assertEqual testSphere modifiedSphere


pt : Float -> Point
pt v =
  { lat = 0, lon = 0, value = v }


testSphere : TerrainSphere
testSphere =
  { resolution = 2
  , yellow =
      Array.fromList
        [ Array.fromList [ pt 1, pt 2, pt 3, pt 4 ]
        , Array.fromList [ pt 5, pt 6, pt 7, pt 8 ]
        , Array.fromList [ pt 9, pt 10, pt 11, pt 12 ]
        , Array.fromList [ pt 13, pt 14, pt 15, pt 16 ]
        ]
  , red =
      Array.fromList
        [ Array.fromList [ pt 17, pt 18, pt 19, pt 20 ]
        , Array.fromList [ pt 21, pt 22, pt 23, pt 24 ]
        , Array.fromList [ pt 25, pt 26, pt 27, pt 28 ]
        , Array.fromList [ pt 29, pt 30, pt 31, pt 32 ]
        ]
  , blue =
      Array.fromList
        [ Array.fromList [ pt 33, pt 34, pt 35, pt 36 ]
        , Array.fromList [ pt 37, pt 38, pt 39, pt 40 ]
        , Array.fromList [ pt 41, pt 42, pt 43, pt 44 ]
        , Array.fromList [ pt 45, pt 46, pt 47, pt 48 ]
        ]
  , green =
      Array.fromList
        [ Array.fromList [ pt 49, pt 50, pt 51, pt 52 ]
        , Array.fromList [ pt 53, pt 54, pt 55, pt 56 ]
        , Array.fromList [ pt 57, pt 58, pt 59, pt 60 ]
        , Array.fromList [ pt 61, pt 62, pt 63, pt 64 ]
        ]
  , orange =
      Array.fromList
        [ Array.fromList [ pt 65, pt 66, pt 67, pt 68 ]
        , Array.fromList [ pt 69, pt 70, pt 71, pt 72 ]
        , Array.fromList [ pt 73, pt 74, pt 75, pt 76 ]
        , Array.fromList [ pt 77, pt 78, pt 79, pt 80 ]
        ]
  , white =
      Array.fromList
        [ Array.fromList [ pt 81, pt 82, pt 83, pt 84 ]
        , Array.fromList [ pt 85, pt 86, pt 87, pt 88 ]
        , Array.fromList [ pt 89, pt 90, pt 91, pt 92 ]
        , Array.fromList [ pt 93, pt 94, pt 95, pt 96 ]
        ]
  , northPole = pt -1
  , southPole = pt -2
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


generate : Random.Generator a -> a
generate generator =
  Random.initialSeed 0
    |> Random.generate generator
    |> fst
