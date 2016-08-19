module Pause exposing (keyUpdate, view)

import Char exposing (KeyCode)
import Html exposing (..)
import Html.Attributes exposing (class)
import Types exposing (..)
import Flight.Init
import Menu.Init


keyUpdate : KeyCode -> PauseState -> ( Mode, Cmd Update )
keyUpdate key model =
    case Char.fromCode key of
        'R' ->
            Flight.Init.resume model.inProgress

        'X' ->
            Menu.Init.mainMenu
                model.inProgress.seed
                model.inProgress.library

        _ ->
            PauseMode model ! []


view : PauseState -> Html a
view state =
    div []
        [ h1 [ class "title" ] [ text "Paused" ]
        , h2 [ class "subtitle" ] [ text "Press 'R' to resume" ]
        , h2 [ class "subtitle" ] [ text "Press 'X' to return to main menu" ]
        ]
