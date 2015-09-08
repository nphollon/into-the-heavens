module Mesh where

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
                
       
type alias Download =
  Result Http.Error Mesh


resolve : (Http.Error -> a) -> (Mesh -> a) -> Download -> a
resolve error success download =
  case download of
    Result.Err e ->
      error e
    Result.Ok m ->
      success m


vec3 : Json.Decoder Vec3
vec3 =
  Json.tuple3 Vec3.vec3 Json.float Json.float Json.float


vec4 : Json.Decoder Vec4
vec4 =
  Json.tuple4 Vec4.vec4 Json.float Json.float Json.float Json.float
      

vertex : Json.Decoder Vertex
vertex =
  Json.object2
        (\a b -> { vertPosition = a, vertColor = b })
        ("position" := vec3)
        ("color" := vec4)

         
decode : Json.Decoder Mesh
decode =
  Json.tuple3 (,,) vertex vertex vertex |> Json.list

         
download : String -> Signal.Address (Maybe Download) -> Task Http.Error ()
download url resultAddress =
  let
    fetch =
      Http.get decode url |> Task.toResult

    notify =
      Just >> Signal.send resultAddress
  in
    fetch `Task.andThen` notify
