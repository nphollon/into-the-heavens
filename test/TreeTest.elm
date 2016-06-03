module TreeTest exposing (testSuite)

import ElmTest exposing (..)
import Math.Tree as Tree exposing (Tree(..))
import Json.Encode as Encode
import Json.Decode as Decode


testSuite : Test
testSuite =
    suite "Tree structure"
        [ satisfiesSuite
        , leavesSuite
        , jsonSuite
        ]


satisfiesSuite : Test
satisfiesSuite =
    let
        assertSatisfy a b =
            assertEqual True (Tree.satisfies (==) a b)

        assertMiss a b =
            assertEqual False (Tree.satisfies (==) a b)
    in
        suite "recursive condition checking"
            [ test "non-colliding leafs do not collide"
                <| assertMiss (Leaf 1)
                    (Leaf 2)
            , test "colliding leafs collide"
                <| assertSatisfy (Leaf 1)
                    (Leaf 1)
            , test "false if leaf collides with node but not children"
                <| assertMiss (Leaf 1)
                    (Node 1 (Leaf 2) (Leaf 3))
            , test "true if leaf collides with node and the first child"
                <| assertSatisfy (Leaf 1)
                    (Node 1 (Leaf 1) (Leaf 3))
            , test "true if leaf collides with node and the second child"
                <| assertSatisfy (Leaf 1)
                    (Node 1 (Leaf 3) (Leaf 1))
            , test "false if leaf collides with children but not node"
                <| assertMiss (Leaf 1)
                    (Node 2 (Leaf 1) (Leaf 2))
            , test "false if node but not children collide with leaf"
                <| assertMiss (Node 1 (Leaf 2) (Leaf 3))
                    (Leaf 1)
            , test "true if node and first child collide with leaf"
                <| assertSatisfy (Node 1 (Leaf 1) (Leaf 3))
                    (Leaf 1)
            , test "true if node and second child collide with leaf"
                <| assertSatisfy (Node 1 (Leaf 3) (Leaf 1))
                    (Leaf 1)
            , test "false if children but not node collide with leaf"
                <| assertMiss (Node 2 (Leaf 1) (Leaf 3))
                    (Leaf 1)
            , test "false if nodes but no children collide"
                <| assertMiss (Node 1 (Leaf 2) (Leaf 3))
                    (Node 1 (Leaf 4) (Leaf 5))
            , test "false if children but not nodes collide"
                <| assertMiss (Node 1 (Leaf 2) (Leaf 3))
                    (Node 4 (Leaf 2) (Leaf 3))
            , test "true if first children collide"
                <| assertSatisfy (Node 1 (Leaf 2) (Leaf 3))
                    (Node 1 (Leaf 2) (Leaf 4))
            , test "true if first child collides with second child"
                <| assertSatisfy (Node 1 (Leaf 2) (Leaf 3))
                    (Node 1 (Leaf 4) (Leaf 2))
            , test "true if second child collides with first child"
                <| assertSatisfy (Node 1 (Leaf 2) (Leaf 3))
                    (Node 1 (Leaf 3) (Leaf 4))
            , test "true if second children collide"
                <| assertSatisfy (Node 1 (Leaf 2) (Leaf 3))
                    (Node 1 (Leaf 4) (Leaf 3))
            ]


leavesSuite : Test
leavesSuite =
    suite "getting the leaves of a tree"
        [ test "Return leaf value as singleton list"
            <| assertEqual [ 5 ]
                (Tree.leaves (Leaf 5))
        , test "Return both leaves of a three-node tree"
            <| assertEqual [ 7, 8 ]
                (Tree.leaves (Node 9 (Leaf 7) (Leaf 8)))
        , test "Concatenate all leaves of a multi-level tree"
            <| assertEqual [ 1, 3, 2 ]
                (Tree.leaves (Node 0 (Leaf 1) (Node 4 (Leaf 3) (Leaf 2))))
        ]


jsonSuite : Test
jsonSuite =
    let
        assertLosslessJson tree =
            assertEqual (Ok tree)
                (Decode.decodeValue (Tree.decode Decode.int)
                    (Tree.encode Encode.int tree)
                )
    in
        suite "encoding and decoding json"
            [ test "leaf encodes and decodes again without losing data"
                <| assertLosslessJson (Leaf 5)
            , test "node encodes and decodes again without losing data"
                <| assertLosslessJson (Node 1 (Leaf 2) (Leaf 3))
            ]
