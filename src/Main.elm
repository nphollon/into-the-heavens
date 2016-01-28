module Main (..) where

import Keyboard
import Dict exposing (Dict)
import Time exposing (Time)
import Task exposing (Task)
import Html exposing (Html)
import StartApp
import Effects exposing (Effects)
import Http
import Mesh
import Update exposing (..)
import Menu
import Flight
import GameOver


type alias Model =
    { mode : Mode
    , data : Data
    }


main : Signal Html
main =
    app.html


app : StartApp.App Model
app =
    StartApp.start
        { init = init
        , inputs = inputs
        , update = update
        , view = view
        }


inputs : List (Signal Update)
inputs =
    [ Signal.map Keys Keyboard.keysDown
    , Signal.map FPS (Time.fpsWhen 60 hasFocus)
    , Signal.map Meshes Mesh.response
    ]


init : ( Model, Effects a )
init =
    (,)
        { mode = MenuMode
        , data = defaultData
        }
        Effects.none


update : Update -> Model -> ( Model, Effects a )
update up model =
    let
        engine =
            chooseEngine model.mode

        data =
            engine.update up model.data

        transition =
            engine.transition data

        newModel =
            case transition of
                Nothing ->
                    { model | data = data }

                Just mode ->
                    { mode = mode
                    , data = .init (chooseEngine mode) data
                    }
    in
        ( newModel, Effects.none )


view : Signal.Address Update -> Model -> Html
view address model =
    let
        v =
            case model.mode of
                GameMode ->
                    Flight.view

                GameOverMode ->
                    GameOver.view

                MenuMode ->
                    Menu.view
    in
        v address model.data


chooseEngine : Mode -> Engine
chooseEngine mode =
    case mode of
        GameMode ->
            Flight.engine

        GameOverMode ->
            GameOver.engine

        MenuMode ->
            Menu.engine


port getResources : Task Http.Error ()
port getResources =
    Dict.fromList
        [ ( "Sphere", "$DOMAIN/data/sphere.json" )
        , ( "Background", "$DOMAIN/data/background.json" )
        ]
        |> Mesh.request


port hasFocus : Signal Bool
