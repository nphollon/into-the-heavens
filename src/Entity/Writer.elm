module Entity.Writer (source) where

import String
import Graphics.Element as Layout
import Text

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)

import Triple exposing (Triple)
import Mesh exposing (Mesh)

source : Mesh -> Layout.Element
source mesh =
  Layout.leftAligned <| Text.fromString <| printMesh mesh


printMesh : Mesh -> String
printMesh triples = 
  let
    tripleText =
      List.map printTriple triples
  in
    String.concat
      [ "["
      , String.join "," tripleText
      , "]"
      ]


printTriple : Triple Mesh.Vertex -> String
printTriple (a, b, c) =
  String.concat
    [ "[", printAttribute a
    , ",", printAttribute b
    , ",", printAttribute c
    , "]"
    ]

  
printVec3 : Vec3 -> String
printVec3 a =
  String.concat
    [ "[", toString <| Vec3.getX a
    , ",", toString <| Vec3.getY a
    , ",", toString <| Vec3.getZ a
    , "]"
    ]

  
printVec4 : Vec4 -> String
printVec4 a =
  String.concat
    [ "[", toString <| Vec4.getX a
    , ",", toString <| Vec4.getY a
    , ",", toString <| Vec4.getZ a
    , ",", toString <| Vec4.getW a
    , "]"
    ]


printAttribute : Mesh.Vertex -> String
printAttribute att =
  String.concat
    [ "{\"position\":"
    , printVec3 att.vertPosition
    , ",\"color\":"
    , printVec4 att.vertColor
    , "}"
    ]
