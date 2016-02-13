module Generate.Json (encode, Mesh, Vertex) where

import String
import Graphics.Element as Layout
import Json.Encode as Json
import Text
import Math.Vector as Vector exposing (Vector)
import Math.Vector4 as Vec4 exposing (Vec4)


encode : Mesh -> String
encode =
  encodeMesh >> Json.encode 0


encodeMesh : Mesh -> Json.Value
encodeMesh =
  encodeList encodeTriple


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
    , ( "color", encodeVec4 att.color )
    , ( "normal", encodeVector att.normal )
    ]


type alias Vertex =
  { position : Vector
  , color : Vec4
  , normal : Vector
  }


type alias Mesh =
  List ( Vertex, Vertex, Vertex )
