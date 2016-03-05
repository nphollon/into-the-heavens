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
            Flight.Init.game model.seed library

          ( _, _ ) ->
            noEffects (MenuMode model)

      otherwise ->
        noEffects (MenuMode model)


view : Bool -> Signal.Address Update -> MenuState -> Html
view isMobile address state =
  let
    top =
      case state.response of
        Nothing ->
          loading isMobile

        Just (Err e) ->
          resourceFailure e

        Just (Ok lib) ->
          ready isMobile
  in
    Frame.view
      [ top ]
      [ p
          []
          [ text
              "\"Your task is not to foresee the future, but to enable it.\" ~ Antoine de St. Exupéry"
          ]
      ]


ready : Bool -> Html
ready isMobile =
  div
    []
    [ h1 [ class "title" ] [ text "Into the Heavens" ]
    , h2 [ class "subtitle" ] [ text "Press 'N'" ]
    , mobileWarning isMobile
    ]


loading : Bool -> Html
loading isMobile =
  div
    []
    [ h1 [ class "title" ] [ text "Into the Heavens" ]
    , h2 [ class "subtitle" ] [ text "Loading..." ]
    , mobileWarning isMobile
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


mobileWarning : Bool -> Html
mobileWarning isMobile =
  if isMobile then
    h3
      [ class "subtitle" ]
      [ text "You can only play if you have a keyboard. Sorry mobile." ]
  else
    div [] []
