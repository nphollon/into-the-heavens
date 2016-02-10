module Main (..) where

import Keyboard
import Dict exposing (Dict)
import Time exposing (Time)
import Html exposing (Html)
import StartApp
import Effects exposing (Effects, Never)
import Task exposing (Task)
import Mesh
import Update exposing (..)
import Menu
import Flight
import GameOver


main : Signal Html
main =
  app.html


app : StartApp.App Mode
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
  ]


update : Update -> Mode -> ( Mode, Effects a )
update up mode =
  case mode of
    GameMode data ->
      Flight.update up data

    GameOverMode data ->
      GameOver.update up data

    MenuMode data ->
      Menu.update up data


view : Signal.Address Update -> Mode -> Html
view address mode =
  case mode of
    GameMode data ->
      Flight.view address data

    GameOverMode data ->
      GameOver.view address data

    MenuMode data ->
      Menu.view address data


init : ( Mode, Effects Update )
init =
  let
    resources =
      Dict.fromList
        [ ( "Sphere", "$DOMAIN/data/sphere.json" )
        , ( "Background", "$DOMAIN/data/background.json" )
        , ( "Ship", "$DOMAIN/data/ship.json" )
        ]
  in
    ( Update.menu, Mesh.request resources )


port hasFocus : Signal Bool
port tasks : Signal (Task Never ())
port tasks =
  app.tasks
