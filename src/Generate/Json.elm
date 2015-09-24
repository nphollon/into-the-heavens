module Generate.Json (encode) where

import String
import Graphics.Element as Layout
import Json.Encode as Json
import Text

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)

import Triple exposing (Triple)
import Mesh exposing (Mesh)


encode : Mesh -> String
encode = encodeMesh >> Json.encode 0
         

encodeMesh : Mesh -> Json.Value
encodeMesh =
  encodeList encodeTriple

       
encodeTriple : Triple Mesh.Vertex -> Json.Value
encodeTriple (a, b, c) =
  encodeList encodeAttribute [a, b, c]

  
encodeVec3 : Vec3 -> Json.Value
encodeVec3 a =
  encodeFloatList a [ Vec3.getX, Vec3.getY, Vec3.getZ ]
       
  
encodeVec4 : Vec4 -> Json.Value
encodeVec4 a =
  encodeFloatList a [ Vec4.getX, Vec4.getY, Vec4.getZ, Vec4.getW ]

                  
encodeFloatList : a -> List (a -> Float) -> Json.Value
encodeFloatList a =
  encodeList (\i -> Json.float (i a))
             

encodeList : (a -> Json.Value) -> List a -> Json.Value
encodeList f =
  List.map f >> Json.list

      
encodeAttribute : Mesh.Vertex -> Json.Value
encodeAttribute att =
  Json.object
        [ ("position", encodeVec3 att.vertPosition)
        , ("color", encodeVec4 att.vertColor)
        ]
