module Main exposing (..)

import Json.Decode as Decode
import Task exposing (Task)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App
import Http
import ToJson
import Explosion
import ObjParser exposing (MeshData)


main : Program Never
main =
    Html.App.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }


view : Model -> Html Action
view model =
    div []
        [ p []
            [ text "OBJ file: "
            , input
                [ value model.inputName
                , onInput RenameInput
                ]
                []
            ]
        , p []
            [ text "Output prefix: "
            , input
                [ value model.outputPrefix
                , onInput RenameOutput
                ]
                []
            ]
        , p []
            [ input
                [ type' "checkbox"
                , checked model.generateMesh
                , onCheck MeshChecked
                ]
                []
            , text "Mesh"
            ]
        , p []
            [ input
                [ type' "checkbox"
                , checked model.generateBounds
                , onCheck BoundsChecked
                ]
                []
            , text "OBBTree"
            ]
        , p [] [ button [ onClick Submit ] [ text "Generate outputs" ] ]
        , p [] [ button [ onClick Presets ] [ text "Generate preset outputs" ] ]
        , hr [] []
        , logView model.log
        ]


logView : List String -> Html a
logView =
    List.map (\msg -> p [] [ em [] [ text msg ] ])
        >> div []


update : Action -> Model -> ( Model, Cmd Action )
update action model =
    case action of
        RenameInput newName ->
            { model | inputName = newName } ! []

        RenameOutput newName ->
            { model | outputPrefix = newName } ! []

        MeshChecked isChecked ->
            { model | generateMesh = isChecked } ! []

        BoundsChecked isChecked ->
            { model | generateBounds = isChecked } ! []

        Submit ->
            loadFile { model | log = "..." :: model.log }

        HttpError e ->
            logError e model

        ReadSuccess obj ->
            generateMesh { model | data = ObjParser.parse obj }

        MeshSuccess ->
            generateBounds model

        FinalSuccess ->
            log "All finished." model

        Presets ->
            generatePresets { model | log = "..." :: model.log }


do : Action -> Model -> ( Model, Cmd Action )
do action model =
    ( model, Task.perform never identity (Task.succeed action) )


never : Never -> a
never _ =
    Debug.crash "unreachable"


loadFile : Model -> ( Model, Cmd Action )
loadFile model =
    if model.inputName == "" || model.outputPrefix == "" then
        log "You need to fill out the form." model
    else if not (model.generateMesh || model.generateBounds) then
        log "You need to check at least one of the boxes." model
    else
        logCmd ("Loading " ++ model.inputName)
            ((host ++ model.inputName)
                |> Http.getString
                |> Task.perform HttpError ReadSuccess
            )
            model


generateMesh : Model -> ( Model, Cmd Action )
generateMesh model =
    if model.generateMesh then
        writeFile ".json" ToJson.encodeModel MeshSuccess model
    else
        do MeshSuccess model


generateBounds : Model -> ( Model, Cmd Action )
generateBounds model =
    if model.generateBounds then
        writeFile ".box" ToJson.encodeBounds FinalSuccess model
    else
        do FinalSuccess model


writeFile : String -> (MeshData -> String) -> Action -> Model -> ( Model, Cmd Action )
writeFile extension encode onSuccess model =
    let
        outputName =
            model.outputPrefix ++ extension
    in
        case model.data of
            Err error ->
                log ("I can't parse the OBJ file: " ++ error) model

            Ok data ->
                logCmd ("Writing " ++ outputName)
                    (encode data
                        |> post outputName
                        |> Task.perform HttpError (always onSuccess)
                    )
                    model


generatePresets : Model -> ( Model, Cmd Action )
generatePresets model =
    logCmd "Generating programmatically-defined models"
        ([ post "explosion.json" (ToJson.encodeMesh Explosion.mesh)
         ]
            |> Task.sequence
            |> Task.perform HttpError (always FinalSuccess)
        )
        model


post : String -> String -> Task Http.Error ()
post outputName body =
    Http.string body
        |> Http.post (Decode.succeed ()) (host ++ outputName)


logError : Http.Error -> Model -> ( Model, Cmd a )
logError error =
    case error of
        Http.Timeout ->
            log "The response took too long."

        Http.NetworkError ->
            log "There was no response."

        Http.UnexpectedPayload payload ->
            let
                _ =
                    Debug.log "Unexpected Payload" payload
            in
                log "I couldn't decode the server response. See console."

        Http.BadResponse code message ->
            if code == 404 then
                log "The file you are trying to read doesn't exist."
            else if code == 500 then
                log "The file you are trying to write already exists. I won't overwrite it."
            else
                log (toString code ++ ": " ++ message)


log : String -> Model -> ( Model, Cmd a )
log msg model =
    logCmd msg Cmd.none model


logCmd : String -> Cmd a -> Model -> ( Model, Cmd a )
logCmd msg cmd model =
    ( { model | log = msg :: model.log }, cmd )


init : ( Model, Cmd a )
init =
    { inputName = ""
    , outputPrefix = ""
    , generateMesh = True
    , generateBounds = True
    , log = [ "Everything is fine." ]
    , data = Err "No file loaded yet."
    }
        ! []


host : String
host =
    "http://localhost:8090/"


type alias Model =
    { inputName : String
    , outputPrefix : String
    , generateMesh : Bool
    , generateBounds : Bool
    , log : List String
    , data : Result String MeshData
    }


type Action
    = RenameInput String
    | RenameOutput String
    | MeshChecked Bool
    | BoundsChecked Bool
    | Submit
    | HttpError Http.Error
    | ReadSuccess String
    | FinalSuccess
    | MeshSuccess
    | Presets
