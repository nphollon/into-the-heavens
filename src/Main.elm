module Main (..) where

import Keyboard
import Html exposing (Html)
import StartApp
import Effects exposing (Effects, Never)
import Task exposing (Task)
import Types exposing (..)
import Loading
import Loading.Init
import Flight
import GameOver


main : Signal Html
main =
  app.html


app : StartApp.App Mode
app =
  StartApp.start
    { init = Loading.Init.menu seed
    , inputs = inputs
    , update = update
    , view = view
    }


inputs : List (Signal Update)
inputs =
  [ Signal.map Keys Keyboard.keysDown
  , Signal.map Focus hasFocus
  ]


update : Update -> Mode -> ( Mode, Effects Update )
update up mode =
  case mode of
    GameMode data ->
      Flight.update up data

    GameOverMode data ->
      GameOver.update up data

    LoadingMode data ->
      Loading.update up data


view : Signal.Address Update -> Mode -> Html
view address mode =
  case mode of
    GameMode data ->
      Flight.view address data

    GameOverMode data ->
      GameOver.view address data

    LoadingMode data ->
      Loading.view isMobile address data


port hasFocus : Signal Bool
port isMobile : Bool
port seed : ( Int, Int )
port tasks : Signal (Task Never ())
port tasks =
  app.tasks
