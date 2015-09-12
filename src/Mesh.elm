module Mesh (
             Mesh, Vertex, Library,
             response, request
            ) where

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
                
       
type alias Library =
  Dict String Mesh


response : (Http.Error -> a) -> (Library -> a) -> Signal a
response errCallback okCallback =
  let
    format r =
      case r of
        Result.Ok lib -> okCallback lib
        Result.Err err -> errCallback err
  in
    Signal.map format libraryMailbox.signal


request : Dict String String -> Task Http.Error ()
request requests =
  let
    get (id, url) =
      Task.map ((,) id) (Http.get decode url)
          
    fetch =
      Dict.toList requests
        |> List.map get
        |> Task.sequence
        |> Task.toResult
        
    notify =
      Result.map Dict.fromList >> Signal.send libraryMailbox.address
  in
    fetch `Task.andThen` notify


libraryMailbox : Signal.Mailbox (Result Http.Error Library)
libraryMailbox =
  Signal.mailbox (Result.Ok Dict.empty)


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

