module Loading exposing (keyUpdate, meshesUpdate, view)

import Char exposing (KeyCode)
import Set exposing (Set)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Types exposing (..)
import Graphics.AppFrame as AppFrame
import Menu.Init


keyUpdate : Set KeyCode -> LoadingState -> ( Mode, Cmd Update )
keyUpdate keySet model =
    case ( model.response, Set.member (Char.toCode 'N') keySet ) of
        ( Just (Ok library), True ) ->
            Menu.Init.mainMenu model.seed library

        _ ->
            (LoadingMode model) ! []


meshesUpdate : Response -> LoadingState -> ( Mode, Cmd Update )
meshesUpdate response model =
    (LoadingMode { model | response = Just response }) ! []


view : LoadingState -> Html a
view state =
    let
        top =
            case state.response of
                Nothing ->
                    loading state.isMobile

                Just (Err e) ->
                    resourceFailure e

                Just (Ok lib) ->
                    ready state.isMobile
    in
        AppFrame.view [ top ]
            [ p []
                [ text "\"Your task is not to foresee the future, but to enable it.\" ~ Antoine de St. Exupéry"
                ]
            ]


ready : Bool -> Html a
ready isMobile =
    div []
        [ h1 [ class "title" ] [ text "Into the Heavens" ]
        , h2 [ class "subtitle" ] [ text "Press 'N'" ]
        , mobileWarning isMobile
        ]


loading : Bool -> Html a
loading isMobile =
    div []
        [ h1 [ class "title" ] [ text "Into the Heavens" ]
        , h2 [ class "subtitle" ] [ text "Loading..." ]
        , mobileWarning isMobile
        ]


resourceFailure : Http.Error -> Html a
resourceFailure e =
    let
        message =
            case e of
                Http.Timeout ->
                    "Nobody is listening to me."

                Http.NetworkError ->
                    "I can't find what I am looking for."

                Http.UnexpectedPayload a ->
                    let
                        _ =
                            Debug.log "error" a
                    in
                        "I am hearing things I just don't understand."

                Http.BadResponse code _ ->
                    "HTTP Error Code: " ++ toString code
    in
        div []
            [ h1 [ class "title" ] [ text "Error" ]
            , h2 [ class "subtitle" ] [ text message ]
            ]


mobileWarning : Bool -> Html a
mobileWarning isMobile =
    if isMobile then
        h3 [ class "subtitle" ]
            [ text "You can only play if you have a keyboard. Sorry mobile." ]
    else
        div [] []
