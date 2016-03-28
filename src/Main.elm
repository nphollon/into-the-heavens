module Main (..) where

import Keyboard
import Signal exposing (forwardTo)
import Html exposing (Html)
import StartApp
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


app : StartApp.App Mode
app =
  StartApp.start
    { init = Loading.Init.menu seed |> wrap
    , inputs = inputs
    , update = update
    , view = view
    }


inputs : List (Signal MainUpdate)
inputs =
  [ Signal.map (Keys >> Normal) Keyboard.keysDown
  , Signal.map (Focus >> Normal) hasFocus
  ]


wrap : ( a, Effects Update ) -> ( a, Effects MainUpdate )
wrap ( a, b ) =
  ( a, Effects.map Normal b )


update : MainUpdate -> Mode -> ( Mode, Effects MainUpdate )
update action mode =
  case ( action, mode ) of
    ( Normal up, GameMode data ) ->
      Flight.update up data |> wrap

    ( Normal up, GameOverMode data ) ->
      GameOver.update up data |> wrap

    ( Normal up, LoadingMode data ) ->
      Loading.update up data |> wrap

    ( MenuOption up, MenuMode data ) ->
      Menu.update up data |> wrap

    _ ->
      ( mode, Effects.none )


view : Signal.Address MainUpdate -> Mode -> Html
view address mode =
  case mode of
    GameMode data ->
      Flight.view (forwardTo address Normal) data

    GameOverMode data ->
      GameOver.view (forwardTo address Normal) data

    LoadingMode data ->
      Loading.view isMobile (forwardTo address Normal) data

    MenuMode data ->
      Menu.view (forwardTo address MenuOption) data


type MainUpdate
  = Normal Update
  | MenuOption Menu.Action


port hasFocus : Signal Bool
port isMobile : Bool
port seed : ( Int, Int )
port tasks : Signal (Task Never ())
port tasks =
  app.tasks
