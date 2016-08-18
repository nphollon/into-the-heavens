module Pause exposing (keyUpdate, view)

import Char exposing (KeyCode)
import Html exposing (Html)
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
    Html.text "Paused"
