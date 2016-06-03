module Main exposing (..)

import Html exposing (Html)
import Html.App as App
import Types exposing (..)
import Loading
import Loading.Init
import Menu
import Flight


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
    ( Loading.Init.menu flags, Loading.Init.library )


subscriptions : Mode -> Sub Update
subscriptions mode =
    Sub.none --Keyboard and AnimationFrame


update : Update -> Mode -> ( Mode, Cmd Update )
update action mode =
    case ( action, mode ) of
        ( Tick clockTime, GameMode data ) ->
            Flight.timeUpdate clockTime data

        ( Keys keys, GameMode data ) ->
            Flight.controlUpdate keys data

        ( Keys keys, MenuMode data ) ->
            Menu.keyUpdate keys data

        ( Keys keys, LoadingMode data ) ->
            Loading.keyUpdate keys data

        ( LoadingUpdate response, LoadingMode data ) ->
            Loading.meshesUpdate response data

        ( MenuUpdate action, MenuMode data ) ->
            Menu.actionUpdate action data

        _ ->
            mode ! []


view : Mode -> Html Update
view mode =
    case mode of
        GameMode data ->
            Flight.view data

        LoadingMode data ->
            Loading.view data

        MenuMode data ->
            App.map MenuUpdate (Menu.view data)
