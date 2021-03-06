port module Main exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Html.App as App
import AnimationFrame
import Keyboard
import Types exposing (..)
import Loading
import Loading.Init
import Menu
import Flight
import Pause
import Pause.Init


main : Program Flags
main =
    App.programWithFlags
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : Flags -> ( Mode, Cmd Update )
init flags =
    Loading.Init.loadResources flags


subscriptions : Mode -> Sub Update
subscriptions mode =
    case mode of
        GameMode _ ->
            Sub.batch
                [ Keyboard.downs KeyDown
                , Keyboard.ups KeyUp
                , AnimationFrame.times Tick
                , lostFocus (always LoseVisibility)
                ]

        _ ->
            Keyboard.downs KeyDown


port lostFocus : ({} -> msg) -> Sub msg


update : Update -> Mode -> ( Mode, Cmd Update )
update action mode =
    case ( action, mode ) of
        ( Tick clockTime, GameMode data ) ->
            Flight.timeUpdate clockTime data

        ( KeyDown key, GameMode data ) ->
            Flight.keyDown key data

        ( KeyUp key, GameMode data ) ->
            Flight.keyUp key data

        ( LoseVisibility, GameMode data ) ->
            Pause.Init.pause data

        ( KeyDown key, LoadingMode data ) ->
            Loading.keyUpdate key data

        ( LoadingUpdate response, LoadingMode data ) ->
            Loading.meshesUpdate response data

        ( KeyDown key, MenuMode data ) ->
            Menu.keyUpdate key data

        ( MenuUpdate action, MenuMode data ) ->
            Menu.actionUpdate action data

        ( KeyDown key, PauseMode data ) ->
            Pause.keyUpdate key data

        _ ->
            mode ! []


view : Mode -> Html Update
view mode =
    Html.div
        [ class "app container" ]
        [ case mode of
            GameMode data ->
                Flight.view data

            LoadingMode data ->
                Loading.view data

            MenuMode data ->
                App.map MenuUpdate (Menu.view data)

            PauseMode data ->
                Pause.view data
        ]
