module Main (..) where

import Keyboard
import Signal exposing (forwardTo)
import Html exposing (Html)
import StartApp exposing (App)
import Effects exposing (Effects, Never)
import Task exposing (Task)
import Types exposing (..)
import Loading
import Loading.Init
import Menu
import Flight
import GameOver


main : Signal Html
main =
  app.html


app : App Mode
app =
  StartApp.start
    { init = init
    , inputs = inputs
    , update = update
    , view = view
    }


init : ( Mode, Effects Update )
init =
  ( Loading.Init.menu seed, Loading.Init.library )


inputs : List (Signal Update)
inputs =
  [ Signal.map Keys Keyboard.keysDown ]


update : Update -> Mode -> ( Mode, Effects Update )
update action mode =
  case ( action, mode ) of
    ( Tick clockTime, GameMode data ) ->
      Flight.timeUpdate clockTime data

    ( Keys keys, GameMode data ) ->
      Flight.controlUpdate keys data

    ( Keys keys, GameOverMode data ) ->
      GameOver.keyUpdate keys data

    ( Keys keys, LoadingMode data ) ->
      Loading.keyUpdate keys data

    ( LoadingUpdate response, LoadingMode data ) ->
      Loading.meshesUpdate response data

    ( MenuUpdate action, MenuMode data ) ->
      Menu.update action data

    ( MenuUpdate action, GameOverMode data ) ->
      GameOver.actionUpdate action data

    _ ->
      noEffects mode


view : Signal.Address Update -> Mode -> Html
view address mode =
  case mode of
    GameMode data ->
      Flight.view data

    GameOverMode data ->
      GameOver.view (forwardTo address MenuUpdate) data

    LoadingMode data ->
      Loading.view isMobile data

    MenuMode data ->
      Menu.view (forwardTo address MenuUpdate) data


port isMobile : Bool
port seed : ( Int, Int )
port tasks : Signal (Task Never ())
port tasks =
  app.tasks
