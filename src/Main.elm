module Main exposing (..)

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
    Sub.batch
        [ Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        , AnimationFrame.times Tick
        ]


update : Update -> Mode -> ( Mode, Cmd Update )
update action mode =
    case ( action, mode ) of
        ( Tick clockTime, GameMode data ) ->
            Flight.timeUpdate clockTime data

        ( KeyDown key, GameMode data ) ->
            Flight.keyDown key data

        ( KeyUp key, GameMode data ) ->
            Flight.keyUp key data

        ( KeyDown key, LoadingMode data ) ->
            Loading.keyUpdate key data

        ( LoadingUpdate response, LoadingMode data ) ->
            Loading.meshesUpdate response data

        ( KeyDown key, MenuMode data ) ->
            Menu.keyUpdate key data

        ( MenuUpdate action, MenuMode data ) ->
            Menu.actionUpdate action data

        _ ->
            mode ! []


view : Mode -> Html Update
view mode =
    Html.div [ class "app" ]
        [ case mode of
            GameMode data ->
                Flight.view data

            LoadingMode data ->
                Loading.view data

            MenuMode data ->
                App.map MenuUpdate (Menu.view data)
        ]
