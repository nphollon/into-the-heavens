module Mesh where

import Http
import Task exposing (Task)
import Json.Decode as Json exposing ((:=))


type Mesh =
  Data Bool

       
type alias Download =
  Result Http.Error Mesh


resolve : (Http.Error -> a) -> (Mesh -> a) -> Download -> a
resolve error success download =
  case download of
    Result.Err e ->
      error e
    Result.Ok m ->
      success m
              
          
decode : Json.Decoder Mesh
decode = Json.object1 Data ("disaster" := Json.bool)

         
download : String -> Signal.Address (Maybe Download) -> Task Http.Error ()
download url resultAddress =
  let
    fetch =
      Http.get decode url |> Task.toResult

    notify =
      Just >> Signal.send resultAddress
  in
    fetch `Task.andThen` notify
