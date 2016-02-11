module Menu.Init (menu) where

import Update exposing (Mode(..), Update(..), Library, Vertex)
import Effects exposing (Effects)
import Dict exposing (Dict)
import Http
import Task
import Json.Encode as Encode
import Json.Decode as Decode exposing (Decoder, Value, (:=))
import WebGL
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)


menu : ( Mode, Effects Update )
menu =
  let
    resources =
      Dict.fromList
        [ ( "Sphere", "$DOMAIN/data/sphere.json" )
        , ( "Background", "$DOMAIN/data/background.json" )
        , ( "Ship", "$DOMAIN/data/ship.json" )
        ]
  in
    ( MenuMode { response = Nothing }, request resources )


request : Dict String String -> Effects Update
request queries =
  let
    get ( id, url ) =
      Task.map ((,) id) (Http.get Decode.value url)
  in
    Dict.toList queries
      |> List.map get
      |> Task.sequence
      |> Task.map toLibrary
      |> flip
          Task.onError
          (\e -> Task.succeed (Meshes (Err e)))
      |> Effects.task


toLibrary : List ( String, Value ) -> Update
toLibrary list =
  Encode.object list
    |> Decode.decodeValue decode
    |> Result.formatError Http.UnexpectedPayload
    |> Meshes


decode : Decoder Library
decode =
  Decode.tuple3 (,,) vertex vertex vertex
    |> Decode.list
    |> Decode.dict
    |> Decode.object1
        (Dict.map (\k v -> WebGL.Triangle v))


vertex : Decoder Vertex
vertex =
  let
    init a b c =
      { vertPosition = a
      , vertColor = b
      , normal = c
      }
  in
    Decode.object3
      init
      ("position" := vec3)
      ("color" := vec4)
      ("normal" := vec3)


vec3 : Decoder Vec3
vec3 =
  Decode.tuple3 Vec3.vec3 Decode.float Decode.float Decode.float


vec4 : Decoder Vec4
vec4 =
  Decode.tuple4 Vec4.vec4 Decode.float Decode.float Decode.float Decode.float
