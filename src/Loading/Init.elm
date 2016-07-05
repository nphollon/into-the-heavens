module Loading.Init exposing (menu, library)

import Types exposing (..)
import Dict exposing (Dict)
import Http
import Task exposing (Task)
import Json.Decode as Decode exposing (Decoder, Value, (:=))
import Random.Pcg as Random
import WebGL exposing (Drawable(..))
import Collision
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Graphics.Guides as Guides


menu : Flags -> Mode
menu flags =
    LoadingMode
        { response = Nothing
        , seed = uncurry Random.initialSeed2 flags.seed
        , isMobile = flags.isMobile
        }


library : Cmd Update
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
            , ( "OrthoVertex", "ortho-vertex.json" )
            ]
                |> List.map (get decodeMesh)
                |> Task.sequence

        remoteBoxes =
            [ ( "Donut", "donut.box" )
            , ( "Ship", "ship.box" )
            , ( "Sphere", "sphere.box" )
            , ( "Cage", "cage.box" )
            , ( "OrthoVertex", "ortho-vertex.box" )
            , ( "Column", "column.box" )
            , ( "Missile", "missile.box" )
            , ( "Player", "player.box" )
            ]
                |> List.map (get Collision.decode)
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
                Dict.empty
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
            |> Task.perform (Err >> LoadingUpdate)
                (Ok >> LoadingUpdate)


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
        Decode.object3 init
            ("position" := vec3)
            ("color" := vec4)
            ("normal" := vec3)


vec3 : Decoder Vec3
vec3 =
    Decode.tuple3 Vec3.vec3 Decode.float Decode.float Decode.float


vec4 : Decoder Vec4
vec4 =
    Decode.tuple4 Vec4.vec4 Decode.float Decode.float Decode.float Decode.float
