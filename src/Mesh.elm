module Mesh (Mesh, Vertex, Response(..), response, request) where

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


type Response
  = Waiting
  | Error Http.Error
  | Success Library


response : Signal Response
response =
  libraryMailbox.signal


request : Dict String String -> Task Http.Error ()
request requests =
  let
    get ( id, url ) =
      Task.map ((,) id) (Http.get Json.value url)

    fetch =
      Dict.toList requests
        |> List.map get
        |> Task.sequence
        |> Task.toResult

    resolve r =
      case r of
        Ok a ->
          Success a

        Err a ->
          Error a

    notify r =
      r
        `Result.andThen` toLibrary
        |> resolve
        |> Signal.send libraryMailbox.address
  in
    fetch `Task.andThen` notify


toLibrary : List ( String, Value ) -> Result Http.Error Library
toLibrary list =
  Encode.object list
    |> Json.decodeValue decode
    |> Result.formatError Http.UnexpectedPayload


libraryMailbox : Signal.Mailbox Response
libraryMailbox =
  Signal.mailbox Waiting


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
