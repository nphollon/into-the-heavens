module Loading.Init (menu, library) where

import Types exposing (..)
import Effects exposing (Effects, Never)
import Dict exposing (Dict)
import Http
import Task exposing (Task)
import Json.Encode as Encode
import Json.Decode as Decode exposing (Decoder, Value, (:=))
import Random.PCG as Random
import WebGL exposing (Drawable(..))
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Generate.Guides as Guides


menu : ( Int, Int ) -> Mode
menu seed =
  LoadingMode
    { response = Nothing
    , seed = uncurry Random.initialSeed2 seed
    }


library : Effects Update
library =
  let
    remoteResources =
      [ ( "Sphere", "sphere.json" )
      , ( "Background", "background.json" )
      , ( "Ship", "ship.json" )
      , ( "Missile", "missile.json" )
      , ( "Explosion", "explosion.json" )
      , ( "Column", "column.json" )
      ]

    localResources =
      Dict.fromList
        [ ( "Reticule", Guides.crosshair )
        , ( "TargetDecor", Guides.target )
        , ( "IncomingDecor", Guides.incoming )
        , ( "VisitorDecor", Guides.targetable )
        , ( "Shield", Guides.shield )
        , ( "EnergyBar", Guides.bar )
        ]

    get ( id, file ) =
      ("$DOMAIN/data/" ++ file)
        |> Http.get Decode.value
        |> Task.map ((,) id)
  in
    List.map get remoteResources
      |> Task.sequence
      |> Task.map (addTo localResources)
      |> flip Task.onError (Err >> Task.succeed)
      |> Effects.task
      |> Effects.map LoadingUpdate


addTo : Library -> List ( String, Value ) -> Response
addTo localResources responses =
  Encode.object responses
    |> Decode.decodeValue decode
    |> Result.formatError Http.UnexpectedPayload
    |> Result.map (Dict.union localResources)


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
