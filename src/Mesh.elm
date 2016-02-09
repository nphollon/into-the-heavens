module Mesh (Mesh, Vertex, response, request) where

import Dict exposing (Dict)
import Task exposing (Task)
import Json.Encode as Encode
import Json.Decode as Json exposing (Decoder, Value, (:=))
import Http
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import WebGL exposing (Drawable)


type alias Vertex =
  { vertPosition : Vec3
  , vertColor : Vec4
  , normal : Vec3
  }


type alias Mesh =
  List ( Vertex, Vertex, Vertex )


type alias Library =
  Dict String (Drawable Vertex)


type alias Response =
  Maybe (Result Http.Error Library)


response : Signal Response
response =
  libraryMailbox.signal


request : Dict String String -> Task Http.Error ()
request requests =
  let
    get ( id, url ) =
      Task.map ((,) id) (Http.get Json.value url)
  in
    Dict.toList requests
      |> List.map get
      |> Task.sequence
      |> Task.map toLibrary
      |> flip Task.onError (\err -> Task.succeed (Just (Err err)))
      |> flip Task.andThen (Signal.send libraryMailbox.address)


toLibrary : List ( String, Value ) -> Response
toLibrary list =
  Encode.object list
    |> Json.decodeValue decode
    |> Result.formatError Http.UnexpectedPayload
    |> Just


libraryMailbox : Signal.Mailbox Response
libraryMailbox =
  Signal.mailbox Nothing


decode : Json.Decoder Library
decode =
  Json.tuple3 (,,) vertex vertex vertex
    |> Json.list
    |> Json.dict
    |> Json.object1
        (Dict.map (\k v -> WebGL.Triangle v))


vertex : Json.Decoder Vertex
vertex =
  let
    init a b c =
      { vertPosition = a
      , vertColor = b
      , normal = c
      }
  in
    Json.object3
      init
      ("position" := vec3)
      ("color" := vec4)
      ("normal" := vec3)


vec3 : Json.Decoder Vec3
vec3 =
  Json.tuple3 Vec3.vec3 Json.float Json.float Json.float


vec4 : Json.Decoder Vec4
vec4 =
  Json.tuple4 Vec4.vec4 Json.float Json.float Json.float Json.float
