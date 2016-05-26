module BoundingBoxTest (testSuite) where

import ElmTest exposing (..)
import Json.Decode as Decode
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Matrix as Matrix
import Math.Tree exposing (Tree(..))
import Math.Face as Face
import Math.BoundingBox as BoundingBox exposing (BoundingBox)
import Flight.Spawn exposing (defaultBody)


testSuite : Test
testSuite =
  suite
    "Collision detection"
    [ obbSuite
    , bodySuite
    , projectAndSplitSuite
    , jsonSuite
    ]


obbSuite : Test
obbSuite =
  let
    assertCollide v =
      (assertEqual True)
        (BoundingBox.boxCollide boxA { boxB | position = v })

    assertMiss v =
      (assertEqual False)
        (BoundingBox.boxCollide boxA { boxB | position = v })
  in
    suite
      "Oriented bounding box primitives"
      [ test "concentric boxes collide"
          <| assertCollide (Vector.vector 0 0 0)
      , suite
          "no collision on face axis projections"
          [ test "A major axis"
              <| assertMiss (Vector.vector 6.7 0 0)
          , test "A secondary axis"
              <| assertMiss (Vector.vector 0 5.07 0)
          , test "A minor axis"
              <| assertMiss (Vector.vector 0 0 3.33)
          , test "B major axis"
              <| assertMiss (Vector.vector 6.1 2.2 -1.6)
          , test "B secondary axis"
              <| assertMiss (Vector.vector -1.2 4.6 1.7)
          , test "B minor axis"
              <| assertMiss (Vector.vector 1.2 -1.2 3)
          ]
      , suite
          "no collision on edge-pair axis projections"
          [ test "A major x B major"
              <| assertMiss (Vector.vector 0 4 3)
          , test "A major x B middle"
              <| assertMiss (Vector.vector -1 -3 3)
          , test "A major x B minor"
              <| assertMiss (Vector.vector 0 5 1)
          , test "A middle x B major"
              <| assertMiss (Vector.vector 5 4 2.2)
          , test "A middle x B middle"
              <| assertMiss (Vector.vector 6.5 0 1)
          , test "A middle x B minor"
              <| assertMiss (Vector.vector 6.5 0 -2)
          , test "A minor x B major"
              <| assertMiss (Vector.vector 6 -3.5 0)
          , test "A minor x B middle"
              <| assertMiss (Vector.vector 6 3.5 0)
          , test "A minor x B minor"
              <| assertMiss (Vector.vector 5.1 5 -1)
          ]
      , suite
          "Moving box A"
          [ test "collision with box A translated"
              <| (assertEqual True)
                  (BoundingBox.boxCollide
                    { boxA | position = Vector.vector 0.2 0.2 0.2 }
                    { boxB | position = Vector.vector 5 4 2.2 }
                  )
          , test "collision with box A rotated"
              <| (assertEqual True)
                  (BoundingBox.boxCollide
                    boxB
                    { boxA | position = Vector.vector 0 4 2.2 }
                  )
          ]
      , suite
          "degenerate cases"
          [ test "collision when boxes are aligned"
              <| (assertEqual True)
                  (BoundingBox.boxCollide
                    { boxA | position = Vector.vector 0 1 0 }
                    { boxA | position = Vector.vector 0 -1 0 }
                  )
          ]
      ]


boxA : BoundingBox
boxA =
  { a = 3
  , b = 2
  , c = 1
  , position = Vector.vector 0 0 0
  , orientation = Vector.vector 0 0 0
  }


boxB : BoundingBox
boxB =
  let
    comp =
      pi / 6 / sqrt 3
  in
    { a = 3
    , b = 2
    , c = 1
    , position = Vector.vector 0 0 0
    , orientation = Vector.vector comp comp comp
    }


bodySuite : Test
bodySuite =
  suite
    "Body collisions"
    [ test "body with no bounds"
        <| assertEqual
            False
            (BoundingBox.collide defaultBody defaultBody)
    , test "bodies that do not collide"
        <| assertEqual
            False
            (BoundingBox.collide
              { defaultBody
                | position = Vector.vector 0 0 0
                , bounds = Just (Leaf boxA)
              }
              { defaultBody
                | position = Vector.vector 10 0 0
                , bounds = Just (Leaf boxA)
              }
            )
    , test "aligned bodies that do collide"
        <| assertEqual
            True
            (BoundingBox.collide
              { defaultBody
                | position = Vector.vector 0 0 0
                , bounds = Just (Leaf boxA)
              }
              { defaultBody
                | position = Vector.vector 1 0 0
                , bounds = Just (Leaf boxA)
              }
            )
    , test "unaligned bodies that do collide"
        <| assertEqual
            True
            (BoundingBox.collide
              { defaultBody
                | position = Vector.vector 0 0 -2
                , orientation = Vector.vector (degrees -36.9) 0 0
                , bounds = Just (Leaf boxA)
              }
              { defaultBody
                | position = Vector.vector 0 0 2
                , orientation = Vector.vector 0 (degrees 20.8) 0
                , bounds = Just (Leaf boxA)
              }
            )
    , test "unaligned bodies that do not collide"
        <| assertEqual
            False
            (BoundingBox.collide
              { defaultBody
                | position = Vector.vector 0 0 -2
                , orientation = Vector.vector (degrees -36.8) 0 0
                , bounds = Just (Leaf boxA)
              }
              { defaultBody
                | position = Vector.vector 0 0 2
                , orientation = Vector.vector 0 (degrees 20.7) 0
                , bounds = Just (Leaf boxA)
              }
            )
    ]


projectAndSplitSuite : Test
projectAndSplitSuite =
  let
    one =
      Face.face
        (Vector.vector 1 1 1)
        (Vector.vector 1 1 1)
        (Vector.vector 1 1 1)

    two =
      Face.face
        (Vector.vector 2 2 2)
        (Vector.vector 2 2 2)
        (Vector.vector 2 2 2)

    three =
      Face.face
        (Vector.vector 3 3 3)
        (Vector.vector 3 3 3)
        (Vector.vector 3 3 3)

    four =
      Face.face
        (Vector.vector 4 4 4)
        (Vector.vector 4 4 4)
        (Vector.vector 4 4 4)

    five =
      Face.face
        (Vector.vector 5 5 5)
        (Vector.vector 5 5 5)
        (Vector.vector 5 5 5)

    facts x face =
      { face = face
      , area = 0
      , center = Vector.vector x 0 0
      }

    projectAndSplit =
      BoundingBox.projectAndSplit (Vector.vector 1 0 0)
  in
    suite
      "Box splitting"
      [ test "split fails if projections are identical"
          <| assertEqual
              Nothing
              (projectAndSplit
                [ facts 1 one
                , facts 1 two
                , facts 1 three
                , facts 1 four
                , facts 1 five
                ]
              )
      , test "split halfway point if projections are different and list size is even"
          <| assertEqual
              (Just ( [ one, two ], [ three, four ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 2 two
                , facts 3 three
                , facts 4 four
                ]
              )
      , test "split just after halfway point if projections are different and list size is odd"
          <| assertEqual
              (Just ( [ one, two, three ], [ four, five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 2 two
                , facts 3 three
                , facts 4 four
                , facts 5 five
                ]
              )
      , test "split by value if 4 items of lower and 1 of higher"
          <| assertEqual
              (Just ( [ one, two, three, four ], [ five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 1 two
                , facts 1 three
                , facts 1 four
                , facts 2 five
                ]
              )
      , test "split by value if 3 items of lower and 2 of higher"
          <| assertEqual
              (Just ( [ one, two, three ], [ four, five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 1 two
                , facts 1 three
                , facts 2 four
                , facts 2 five
                ]
              )
      , test "split by value if 2 items of lower and 3 of higher"
          <| assertEqual
              (Just ( [ one, two ], [ three, four, five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 1 two
                , facts 2 three
                , facts 2 four
                , facts 2 five
                ]
              )
      , test "split by value if 1 item of lower and 4 of higher"
          <| assertEqual
              (Just ( [ one ], [ two, three, four, five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 2 two
                , facts 2 three
                , facts 2 four
                , facts 2 five
                ]
              )
      , test "median group goes to first half even if split is very unbalanced"
          <| assertEqual
              (Just ( [ one, two, three, four ], [ five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 1 two
                , facts 2 three
                , facts 2 four
                , facts 3 five
                ]
              )
      , test "median group goes to first half even if split is unbalanced"
          <| assertEqual
              (Just ( [ one, two, three ], [ four, five ] ))
              (projectAndSplit
                [ facts 1 one
                , facts 2 two
                , facts 2 three
                , facts 3 four
                , facts 3 five
                ]
              )
      , test "tolerance in floating point comparisons"
          <| assertEqual
              Nothing
              (projectAndSplit
                [ facts 0 one
                , facts 1.0e-10 two
                , facts -1.0e-10 three
                ]
              )
      ]


jsonSuite : Test
jsonSuite =
  let
    box =
      { a = 1.5
      , b = 2.5
      , c = 3.5
      , position = Vector.vector -1 -2 -3
      , orientation = Vector.vector 0.4 0.6 0
      }
  in
    test "Json encoding & decoding"
      <| assertEqual
          (Ok box)
          (Decode.decodeValue BoundingBox.decode (BoundingBox.encode box))
