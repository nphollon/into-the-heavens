module Menu.View (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Mesh
import Update exposing (Update, Data)
import Frame


view : Signal.Address Update -> Data -> Html
view address model =
    let
        top =
            case model.resources of
                Mesh.Waiting ->
                    loading

                Mesh.Error e ->
                    resourceFailure e

                Mesh.Success lib ->
                    ready
    in
        Frame.view
            [ top ]
            [ p
                []
                [ text
                    "\"Your task is not to foresee the future, but to enable it.\" ~ Antoine de St. Exupéry"
                ]
            ]


ready : Html
ready =
    div
        []
        [ h1 [ class "title" ] [ text "Into the Heavens" ]
        , h2 [ class "subtitle" ] [ text "Press 'N'" ]
        ]


loading : Html
loading =
    div
        []
        [ h1 [ class "title" ] [ text "Into the Heavens" ]
        , h2 [ class "subtitle" ] [ text "Loading..." ]
        ]


resourceFailure : Http.Error -> Html
resourceFailure e =
    let
        message =
            case e of
                Http.Timeout ->
                    "Nobody is listening to me."

                Http.NetworkError ->
                    "I can't find what I am looking for."

                Http.UnexpectedPayload _ ->
                    "I am hearing things I just don't understand."

                Http.BadResponse code _ ->
                    "HTTP Error Code: " ++ toString code
    in
        div
            []
            [ h1 [ class "title" ] [ text "Error" ]
            , h2 [ class "subtitle" ] [ text message ]
            ]
