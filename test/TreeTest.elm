module TreeTest (testSuite) where

import ElmTest exposing (..)
import Math.Tree exposing (..)


testSuite : Test
testSuite =
  let
    assertCollide a b =
      assertEqual True (satisfies (==) a b)

    assertMiss a b =
      assertEqual False (satisfies (==) a b)
  in
    suite
      "recursive collision detection"
      [ test "non-colliding leafs do not collide"
          <| assertMiss
              (Leaf 1)
              (Leaf 2)
      , test "colliding leafs collide"
          <| assertCollide
              (Leaf 1)
              (Leaf 1)
      , test "false if leaf collides with node but not children"
          <| assertMiss
              (Leaf 1)
              (Node 1 (Leaf 2) (Leaf 3))
      , test "true if leaf collides with node and the first child"
          <| assertCollide
              (Leaf 1)
              (Node 1 (Leaf 1) (Leaf 3))
      , test "true if leaf collides with node and the second child"
          <| assertCollide
              (Leaf 1)
              (Node 1 (Leaf 3) (Leaf 1))
      , test "false if leaf collides with children but not node"
          <| assertMiss
              (Leaf 1)
              (Node 2 (Leaf 1) (Leaf 2))
      , test "false if node but not children collide with leaf"
          <| assertMiss
              (Node 1 (Leaf 2) (Leaf 3))
              (Leaf 1)
      , test "true if node and first child collide with leaf"
          <| assertCollide
              (Node 1 (Leaf 1) (Leaf 3))
              (Leaf 1)
      , test "true if node and second child collide with leaf"
          <| assertCollide
              (Node 1 (Leaf 3) (Leaf 1))
              (Leaf 1)
      , test "false if children but not node collide with leaf"
          <| assertMiss
              (Node 2 (Leaf 1) (Leaf 3))
              (Leaf 1)
      , test "false if nodes but no children collide"
          <| assertMiss
              (Node 1 (Leaf 2) (Leaf 3))
              (Node 1 (Leaf 4) (Leaf 5))
      , test "false if children but not nodes collide"
          <| assertMiss
              (Node 1 (Leaf 2) (Leaf 3))
              (Node 4 (Leaf 2) (Leaf 3))
      , test "true if first children collide"
          <| assertCollide
              (Node 1 (Leaf 2) (Leaf 3))
              (Node 1 (Leaf 2) (Leaf 4))
      , test "true if first child collides with second child"
          <| assertCollide
              (Node 1 (Leaf 2) (Leaf 3))
              (Node 1 (Leaf 4) (Leaf 2))
      , test "true if second child collides with first child"
          <| assertCollide
              (Node 1 (Leaf 2) (Leaf 3))
              (Node 1 (Leaf 3) (Leaf 4))
      , test "true if second children collide"
          <| assertCollide
              (Node 1 (Leaf 2) (Leaf 3))
              (Node 1 (Leaf 4) (Leaf 3))
      ]
