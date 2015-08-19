module Entity.Writer (source) where

import String
import List
import Math.Vector3 as Vec3
import Math.Vector4 as Vec4
import Triple exposing (Triple)
import Graphics

source : String -> Graphics.Mesh -> String
source moduleName mesh =
  String.join "\n"
    [ "module " ++ moduleName ++ " where"
    , "import Math.Vector3 as V3"
    , "import Math.Vector4 as V4"
    , "mesh ="
    , printMesh mesh
    ]


printMesh : Graphics.Mesh -> String
printMesh triples = 
  let
    tripleText =
      List.map printTriple triples
  in
    String.concat
      [ "  ["
      , String.join "," tripleText
      , "]"
      ]


printTriple : Triple Graphics.Attribute -> String
printTriple (a, b, c) =
  String.concat
    [ "(", printAttribute a
    , ",", printAttribute b
    , ",", printAttribute c
    , ")"
    ]


printAttribute : Graphics.Attribute -> String
printAttribute att =
  String.concat
    [ "{vertPosition=V3.fromTuple "
    , toString (Vec3.toTuple att.vertPosition)
    , ",vertColor=V4.fromTuple "
    , toString (Vec4.toTuple att.vertColor)
    , "}"
    ]
