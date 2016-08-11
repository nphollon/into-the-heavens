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
            , ( "Ship", "boxy.json" )
            , ( "Missile", "sphere-eighth.json" )
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
            , ( "Ship", "boxy.box" )
            , ( "Sphere", "sphere.box" )
            , ( "Cage", "cage.box" )
            , ( "OrthoVertex", "ortho-vertex.box" )
            , ( "Column", "column.box" )
            , ( "Missile", "sphere-quarter.box" )
            , ( "Bullet", "sphere-half.box" )
            , ( "Player", "player.box" )
            ]
                |> List.map (get Collision.decode)
                |> Task.sequence

        library meshes boxes =
            { meshes = Dict.fromList meshes
            , boxes = Dict.fromList boxes
            }

        get decoder ( id, file ) =
            ("$DOMAIN/data/" ++ file)
                |> Http.get decoder
                |> Task.map ((,) id)
    in
        Task.map2 library remoteMeshes remoteBoxes
            |> Task.perform (Err >> LoadingUpdate) (Ok >> LoadingUpdate)


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
        init pos norm =
            { vertPosition = pos
            , normal = norm
            }
    in
        Decode.object2 init
            ("position" := vec3)
            ("normal" := vec3)


vec3 : Decoder Vec3
vec3 =
    Decode.tuple3 Vec3.vec3 Decode.float Decode.float Decode.float


vec4 : Decoder Vec4
vec4 =
    Decode.tuple4 Vec4.vec4 Decode.float Decode.float Decode.float Decode.float
