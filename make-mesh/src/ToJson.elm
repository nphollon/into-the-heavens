module ToJson exposing (encodeMesh, encodeModel, encodeBounds, Vertex)

import Array exposing (Array)
import String
import Json.Encode as Json
import Maybe.Extra as MaybeX
import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL exposing (Drawable(..))
import Vector exposing (Vector)
import Collision exposing (Bounds, Face)
import ObjParser exposing (MeshData)


type alias Vertex =
    { position : Vector
    , normal : Vector
    }


boxFromData : MeshData -> Bounds
boxFromData data =
    Collision.create (toFaces data)


encodeBounds : MeshData -> String
encodeBounds data =
    toFaces data
        |> Collision.create
        |> Collision.encode
        |> Json.encode 0


encodeModel : MeshData -> String
encodeModel data =
    toFaces data
        |> List.filterMap toVertexTriangle
        |> Triangle
        |> encodeMesh


encodeMesh : Drawable Vertex -> String
encodeMesh mesh =
    let
        json =
            case mesh of
                Triangle triangles ->
                    Json.object
                        [ ( "primitive", Json.string "Triangle" )
                        , ( "attributes", encodeList encodeTriple triangles )
                        ]

                Points points ->
                    Json.object
                        [ ( "primitive", Json.string "Points" )
                        , ( "attributes", encodeList encodeAttribute points )
                        ]

                _ ->
                    Json.null
    in
        Json.encode 0 json


encodeTriple : ( Vertex, Vertex, Vertex ) -> Json.Value
encodeTriple ( a, b, c ) =
    encodeList encodeAttribute [ a, b, c ]


encodeVector : Vector -> Json.Value
encodeVector a =
    encodeFloatList a [ Vector.getX, Vector.getY, Vector.getZ ]


encodeVec4 : Vec4 -> Json.Value
encodeVec4 a =
    encodeFloatList a [ Vec4.getX, Vec4.getY, Vec4.getZ, Vec4.getW ]


encodeFloatList : a -> List (a -> Float) -> Json.Value
encodeFloatList a =
    encodeList (\i -> Json.float (i a))


encodeList : (a -> Json.Value) -> List a -> Json.Value
encodeList f =
    List.map f >> Json.list


encodeAttribute : Vertex -> Json.Value
encodeAttribute att =
    Json.object
        [ ( "position", encodeVector att.position )
        , ( "normal", encodeVector att.normal )
        ]


flatFace : MeshData -> Drawable Vertex
flatFace data =
    toFaces data
        |> List.filterMap toVertexTriangle
        |> Triangle


toFaces : MeshData -> List Face
toFaces { vertexPositions, vertexIndexes } =
    let
        lookup =
            MaybeX.traverse (flip Array.get vertexPositions)

        decomposePolygon points =
            case points of
                i :: (j :: (k :: list)) ->
                    List.map2 (Collision.face i)
                        (j :: k :: list)
                        (k :: list)

                otherwise ->
                    []
    in
        List.filterMap lookup vertexIndexes
            |> List.concatMap decomposePolygon


toVertexTriangle : Face -> Maybe ( Vertex, Vertex, Vertex )
toVertexTriangle face =
    let
        cross =
            Vector.cross
                (Vector.sub face.q face.p)
                (Vector.sub face.r face.p)

        toTriangle normal =
            ( toVertex face.p normal
            , toVertex face.q normal
            , toVertex face.r normal
            )
    in
        Maybe.map toTriangle (Vector.normalize cross)


toVertex : Vector -> Vector -> Vertex
toVertex position normal =
    { position = position
    , normal = normal
    }
