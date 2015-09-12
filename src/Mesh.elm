module Mesh where

import Dict exposing (Dict)
import Task exposing (Task)
import Json.Decode as Json exposing ((:=))

import Http
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)

import Triple exposing (Triple)


type alias Vertex =
  { vertPosition : Vec3
  , vertColor : Vec4
  }

                  
type alias Mesh =
  List (Triple Vertex)
                
       
type alias MeshLibrary =
  Dict String Mesh


type alias Request =
  { id: String
  , url: String
  }


type alias Download =
  { id: String
  , response: Result Http.Error Mesh
  }


type alias DownloadLibrary =
  Result Http.Error MeshLibrary


responseMailbox : Signal.Mailbox Download
responseMailbox =
  Signal.mailbox (tagResponse "" (Result.Ok []))

           
download : Request -> Task Http.Error ()
download request =
  let
    fetch =
      Http.get decode request.url |> Task.toResult

    notify =
      tagResponse request.id >> Signal.send responseMailbox.address
  in
    fetch `Task.andThen` notify

          
downloadLibrary : Signal DownloadLibrary
downloadLibrary =
  let
    update d lib =
      Result.map2 (flip (Dict.insert d.id)) lib d.response
  in
    Signal.foldp update (Result.Ok Dict.empty) responseMailbox.signal

      
resolve : (Http.Error -> a) -> (MeshLibrary -> a) -> DownloadLibrary -> a
resolve error success download =
  case download of
    Result.Err e ->
      error e
    Result.Ok m ->
      success m


tagResponse : String -> Result Http.Error Mesh -> Download
tagResponse id response =
  { id = id
  , response = response
  }


decode : Json.Decoder Mesh
decode =
  Json.tuple3 (,,) vertex vertex vertex |> Json.list
      

vertex : Json.Decoder Vertex
vertex =
  Json.object2
        (\a b -> { vertPosition = a, vertColor = b })
        ("position" := vec3)
        ("color" := vec4)


vec3 : Json.Decoder Vec3
vec3 =
  Json.tuple3 Vec3.vec3 Json.float Json.float Json.float


vec4 : Json.Decoder Vec4
vec4 =
  Json.tuple4 Vec4.vec4 Json.float Json.float Json.float Json.float

