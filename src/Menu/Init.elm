module Menu.Init (menu) where

import Types exposing (..)
import Effects exposing (Effects)
import Dict exposing (Dict)
import Http
import Task
import Json.Encode as Encode
import Json.Decode as Decode exposing (Decoder, Value, (:=))
import Random.PCG as Random
import WebGL exposing (Drawable(..))
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)


menu : ( Int, Int ) -> ( Mode, Effects Update )
menu seed =
  let
    resources =
      Dict.fromList
        [ ( "Sphere", "$DOMAIN/data/sphere.json" )
        , ( "Background", "$DOMAIN/data/background.json" )
        , ( "Ship", "$DOMAIN/data/ship.json" )
        ]
  in
    (,)
      (MenuMode
        { response = Nothing
        , seed = uncurry Random.initialSeed2 seed
        }
      )
      (request resources)


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
  Decode.dict
    (("primitive" := Decode.string) `Decode.andThen` decodeItem)


decodeItem : String -> Decoder (Drawable Vertex)
decodeItem primitive =
  case primitive of
    "Triangle" ->
      Decode.object1 Triangle ("attributes" := decodeTriangles)

    "Points" ->
      Decode.object1 Points ("attributes" := Decode.list vertex)

    _ ->
      Decode.fail "Unrecognized attribute"


decodeTriangles : Decoder (List ( Vertex, Vertex, Vertex ))
decodeTriangles =
  Decode.list (Decode.tuple3 (,,) vertex vertex vertex)


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
