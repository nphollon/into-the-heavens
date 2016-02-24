module Menu (update, view) where

import Html exposing (..)
import Char
import Set
import Types exposing (Update(..), Mode(..), MenuState)
import Html.Attributes exposing (..)
import Http
import Effects exposing (Effects)
import Frame
import Flight.Init
import Dict
import Generate.Guides as Guides


update : Update -> MenuState -> ( Mode, Effects Update )
update input model =
  let
    noEffects =
      flip (,) Effects.none
  in
    case input of
      Meshes response ->
        noEffects (MenuMode { model | response = Just response })

      Keys keySet ->
        case ( model.response, Set.member (Char.toCode 'N') keySet ) of
          ( Just (Ok library), True ) ->
            Dict.insert "Crosshair" Guides.crosshair library
              |> Flight.Init.game model.seed

          ( _, _ ) ->
            noEffects (MenuMode model)

      otherwise ->
        noEffects (MenuMode model)


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
