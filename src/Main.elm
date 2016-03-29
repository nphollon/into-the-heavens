module Main (..) where

import Set exposing (Set)
import Char exposing (KeyCode)
import Keyboard
import Time exposing (Time)
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


init : ( Mode, Effects MainUpdate )
init =
  (,)
    (Loading.Init.menu seed)
    (Effects.map Meshes Loading.Init.library)


inputs : List (Signal MainUpdate)
inputs =
  [ Signal.map Keys Keyboard.keysDown
  , Signal.map Focus hasFocus
  ]


update : MainUpdate -> Mode -> ( Mode, Effects MainUpdate )
update action mode =
  case ( action, mode ) of
    ( Tick clockTime, GameMode data ) ->
      mapTick (Flight.timeUpdate clockTime data)

    ( Focus focus, GameMode data ) ->
      mapTick (Flight.focusUpdate focus data)

    ( Keys keys, GameMode data ) ->
      noEffects (Flight.controlUpdate keys data)

    ( Keys keys, GameOverMode data ) ->
      mapTick (GameOver.keyUpdate keys data)

    ( Keys keys, LoadingMode data ) ->
      noEffects (Loading.keyUpdate keys data)

    ( Meshes response, LoadingMode data ) ->
      noEffects (Loading.meshesUpdate response data)

    ( MenuOption up, MenuMode data ) ->
      mapTick (Menu.update up data)

    _ ->
      noEffects mode


noEffects : Mode -> ( Mode, Effects a )
noEffects =
  flip (,) Effects.none


mapTick : ( Mode, Effects Time ) -> ( Mode, Effects MainUpdate )
mapTick ( m, e ) =
  ( m, Effects.map Tick e )


view : Signal.Address MainUpdate -> Mode -> Html
view address mode =
  case mode of
    GameMode data ->
      Flight.view data

    GameOverMode data ->
      GameOver.view data

    LoadingMode data ->
      Loading.view isMobile data

    MenuMode data ->
      Menu.view (forwardTo address MenuOption) data


type MainUpdate
  = MenuOption Menu.Action
  | Meshes Response
  | Keys (Set KeyCode)
  | Focus Bool
  | Tick Time


port hasFocus : Signal Bool
port isMobile : Bool
port seed : ( Int, Int )
port tasks : Signal (Task Never ())
port tasks =
  app.tasks
