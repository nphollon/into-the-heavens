module Main exposing (..)

import Task exposing (Task)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App


{-
   models : List ( String, String )
   models =
       [ ( encodeMesh Cluster.mesh, "background.json" )
       , ( encodeMesh Explosion.mesh, "explosion.json" )
       , ( encodeModel Sphere.model, "sphere.json" )
       , ( encodeModel Ship.model, "ship.json" )
       , ( encodeModel Missile.model, "missile.json" )
       , ( encodeModel Column.model, "column.json" )
       , ( encodeModel Donut.model, "donut.json" )
       , ( encodeModel Cage.model, "cage.json" )
       , ( encodeModel OrthoVertex.model, "ortho-vertex.json" )
       , ( encodeBoundingBox Donut.model, "donut.box" )
       , ( encodeBoundingBox Ship.model, "ship.box" )
       , ( encodeBoundingBox SimpleSphere.model, "sphere.box" )
       , ( encodeBoundingBox Cage.model, "cage.box" )
       , ( encodeBoundingBox SimpleColumn.model, "column.box" )
       , ( encodeBoundingBox OrthoVertex.model, "ortho-vertex.box" )
       ]
-}


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
                , checked model.generateModel
                , onCheck ModelChecked
                ]
                []
            , text "Model (.json)"
            ]
        , p []
            [ input
                [ type' "checkbox"
                , checked model.generateBounds
                , onCheck BoundsChecked
                ]
                []
            , text "OBBTree (.box)"
            ]
        , button [ onClick Submit ] [ text "Generate outputs" ]
        , logView model.log
        ]


logView : List String -> Html a
logView =
    List.map (\msg -> p [] [ em [] [ text msg ] ])
        >> div []


update : Action -> Model -> ( Model, Cmd a )
update action model =
    case action of
        RenameInput newName ->
            { model | inputName = newName } ! []

        RenameOutput newName ->
            { model | outputPrefix = newName } ! []

        ModelChecked isChecked ->
            { model | generateModel = isChecked } ! []

        BoundsChecked isChecked ->
            { model | generateBounds = isChecked } ! []

        Submit ->
            { model | log = "What were you expecting to happen?" :: model.log } ! []


init : ( Model, Cmd a )
init =
    { inputName = "daffodil.obj"
    , outputPrefix = "officer_tiger"
    , generateModel = False
    , generateBounds = False
    , log = [ "Everything is fine." ]
    }
        ! []


type alias Model =
    { inputName : String
    , outputPrefix : String
    , generateModel : Bool
    , generateBounds : Bool
    , log : List String
    }


type Action
    = RenameInput String
    | RenameOutput String
    | ModelChecked Bool
    | BoundsChecked Bool
    | Submit
