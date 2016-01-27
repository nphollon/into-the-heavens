module Main (..) where

import Graphics.Element as Layout
import Keyboard
import Dict exposing (Dict)
import Time exposing (Time)
import Task exposing (Task)
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


main : Signal Layout.Element
main =
    Signal.foldp update init inputs
        |> Signal.map view


inputs : Signal Update
inputs =
    Signal.mergeMany
        [ Signal.map Keys Keyboard.keysDown
        , Signal.map FPS (Time.fpsWhen 60 hasFocus)
        , Signal.map Meshes Mesh.response
        ]


init : Model
init =
    { mode = MenuMode
    , data = defaultData
    }


update : Update -> Model -> Model
update up model =
    let
        engine =
            chooseEngine model.mode

        data =
            engine.update up model.data

        transition =
            engine.transition data
    in
        case transition of
            Nothing ->
                { model | data = data }

            Just mode ->
                { mode = mode
                , data = .init (chooseEngine mode) data
                }


view : Model -> Layout.Element
view model =
    model.data |> chooseView model.mode


chooseEngine : Mode -> Engine
chooseEngine mode =
    case mode of
        GameMode ->
            Flight.engine

        GameOverMode ->
            GameOver.engine

        MenuMode ->
            Menu.engine


chooseView : Mode -> Data -> Layout.Element
chooseView mode =
    case mode of
        GameMode ->
            Flight.view

        GameOverMode ->
            GameOver.view

        MenuMode ->
            Menu.view


port getResources : Task Http.Error ()
port getResources =
    Dict.fromList
        [ ( "Sphere", "$DOMAIN/data/sphere.json" )
        , ( "Background", "$DOMAIN/data/background.json" )
        ]
        |> Mesh.request


port hasFocus : Signal Bool
