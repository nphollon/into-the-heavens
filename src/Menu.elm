module Menu (update, transition, view) where

import Html exposing (..)
import Char
import Set
import Update exposing (..)
import Html.Attributes exposing (..)
import Http
import Frame


update : Update -> MenuState -> MenuState
update input model =
  case input of
    FPS dt ->
      model

    Meshes response ->
      { model | response = response }

    Keys keySet ->
      { model | continue = Set.member (Char.toCode 'N') keySet }


transition : MenuState -> Maybe Mode
transition data =
  case ( data.response, data.continue ) of
    ( Just (Ok library), True ) ->
      Just (Update.game library)

    otherwise ->
      Nothing


view : Signal.Address Update -> MenuState -> Html
view address state =
  let
    top =
      case state.response of
        Nothing ->
          loading

        Just (Err e) ->
          resourceFailure e

        Just (Ok lib) ->
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
