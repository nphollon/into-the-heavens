module Math.Tree exposing (Tree(..), satisfies, leaves, encode, decode)

import Json.Encode as Encode exposing (Value)
import Json.Decode as Decode exposing (Decoder, (:=))


type Tree a
    = Leaf a
    | Node a (Tree a) (Tree a)


satisfies : (a -> a -> Bool) -> Tree a -> Tree a -> Bool
satisfies check a b =
    case ( a, b ) of
        ( Leaf aVal, Leaf bVal ) ->
            check aVal bVal

        ( Leaf aVal, Node bVal bFst bSnd ) ->
            if check aVal bVal then
                (satisfies check a bFst) || (satisfies check a bSnd)
            else
                False

        ( Node aVal aFst aSnd, Leaf bVal ) ->
            if check aVal bVal then
                (satisfies check aFst b) || (satisfies check aSnd b)
            else
                False

        ( Node aVal aFst aSnd, Node bVal bFst bSnd ) ->
            if check aVal bVal then
                (satisfies check aFst bFst)
                    || (satisfies check aFst bSnd)
                    || (satisfies check aSnd bFst)
                    || (satisfies check aSnd bSnd)
            else
                False


leaves : Tree a -> List a
leaves tree =
    case tree of
        Leaf a ->
            [ a ]

        Node _ left right ->
            leaves left ++ leaves right


encode : (a -> Value) -> Tree a -> Value
encode encoder tree =
    case tree of
        Leaf a ->
            Encode.object
                [ ( "nodeType", Encode.string "leaf" )
                , ( "value", encoder a )
                ]

        Node a left right ->
            Encode.object
                [ ( "nodeType", Encode.string "internal" )
                , ( "value", encoder a )
                , ( "left", encode encoder left )
                , ( "right", encode encoder right )
                ]


decode : Decoder a -> Decoder (Tree a)
decode decoder =
    let
        treeData nodeType =
            case nodeType of
                "leaf" ->
                    Decode.object1 Leaf ("value" := decoder)

                "internal" ->
                    Decode.object3 Node
                        ("value" := decoder)
                        ("left" := decode decoder)
                        ("right" := decode decoder)

                _ ->
                    Decode.fail ("unrecognized node type: " ++ nodeType)
    in
        Decode.andThen ("nodeType" := Decode.string) treeData
