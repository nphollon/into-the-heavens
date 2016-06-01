module Loading.Init (menu, library) where

import Types exposing (..)
import Effects exposing (Effects, Never)
import Dict exposing (Dict)
import Http
import Task exposing (Task)
import Json.Decode as Decode exposing (Decoder, Value, (:=))
import Random.PCG as Random
import WebGL exposing (Drawable(..))
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector as Vector exposing (Vector)
import Math.BoundingBox as BoundingBox exposing (BoundingBox)
import Math.Tree as Tree exposing (Tree(..))
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
    remoteMeshes =
      [ ( "Sphere", "sphere.json" )
      , ( "Background", "background.json" )
      , ( "Ship", "ship.json" )
      , ( "Missile", "missile.json" )
      , ( "Explosion", "explosion.json" )
      , ( "Column", "column.json" )
      , ( "Donut", "donut.json" )
      , ( "Cage", "cage.json" )
      ]
        |> List.map (get decodeMesh)
        |> Task.sequence

    remoteBoxes =
      [ ( "Donut", "donut.box" )
      , ( "Ship", "ship.box" )
      , ( "Sphere", "sphere.box" )
      , ( "Cage", "cage.box" )
      ]
        |> List.map (get (Tree.decode BoundingBox.decode))
        |> Task.sequence

    library =
      { meshes =
          Dict.fromList
            [ ( "Reticule", Guides.crosshair )
            , ( "TargetDecor", Guides.target )
            , ( "IncomingDecor", Guides.incoming )
            , ( "VisitorDecor", Guides.targetable )
            , ( "Shield", Guides.shield )
            , ( "EnergyBar", Guides.bar )
            ]
      , boxes =
          Dict.fromList
            [ ( "Missile"
              , Leaf
                  { a = 0
                  , b = 0
                  , c = 0
                  , position = Vector.vector 0 0 0
                  , orientation = Vector.vector 0 0 0
                  }
              )
            , ( "Player"
              , Leaf
                  { a = 0.5
                  , b = 0.3
                  , c = 0.5
                  , position = Vector.vector 0 0 0
                  , orientation = Vector.vector 0 0 0
                  }
              )
            ]
      }

    get decoder ( id, file ) =
      ("$DOMAIN/data/" ++ file)
        |> Http.get decoder
        |> Task.map ((,) id)

    addTo library meshes boxes =
      { meshes = Dict.fromList meshes |> Dict.union library.meshes
      , boxes = Dict.fromList boxes |> Dict.union library.boxes
      }
  in
    Task.map2 (addTo library) remoteMeshes remoteBoxes
      |> Task.toResult
      |> Effects.task
      |> Effects.map LoadingUpdate


decodeMesh : Decoder (Drawable Vertex)
decodeMesh =
  let
    decodeItem primitive =
      case primitive of
        "Triangle" ->
          Decode.object1 Triangle ("attributes" := decodeTriangles)

        "Points" ->
          Decode.object1 Points ("attributes" := Decode.list vertex)

        _ ->
          Decode.fail "Unrecognized attribute"
  in
    ("primitive" := Decode.string) `Decode.andThen` decodeItem


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
