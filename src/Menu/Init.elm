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
import Generate.Guides as Guides


menu : ( Int, Int ) -> ( Mode, Effects Update )
menu seed =
  let
    pathTo =
      (++) "$DOMAIN/data/"

    remoteResources =
      Dict.fromList
        [ ( "Sphere", pathTo "sphere.json" )
        , ( "Background", pathTo "background.json" )
        , ( "Ship", pathTo "ship.json" )
        , ( "Missile", pathTo "missile.json" )
        ]

    localResources =
      Dict.fromList
        [ ( "Reticule", Guides.crosshair )
        , ( "TargetDecor", Guides.target )
        , ( "IncomingDecor", Guides.incoming )
        , ( "Shield", Guides.shield )
        ]
  in
    (,)
      (MenuMode
        { response = Nothing
        , seed = uncurry Random.initialSeed2 seed
        }
      )
      (buildLibrary localResources remoteResources)


buildLibrary : Library -> Dict String String -> Effects Update
buildLibrary localResources remoteResources =
  let
    get ( id, url ) =
      Task.map ((,) id) (Http.get Decode.value url)
  in
    Dict.toList remoteResources
      |> List.map get
      |> Task.sequence
      |> Task.map (addTo localResources)
      |> flip
          Task.onError
          (\e -> Task.succeed (Meshes (Err e)))
      |> Effects.task


addTo : Library -> List ( String, Value ) -> Update
addTo localResources responses =
  Encode.object responses
    |> Decode.decodeValue decode
    |> Result.formatError Http.UnexpectedPayload
    |> Result.map (Dict.union localResources)
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
