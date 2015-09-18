module Menu.View (view) where

import Graphics.Element as Layout
import Text

import Http

import Mesh
import Menu.Model as Model exposing (Model)


ready : a -> Layout.Element
ready = Layout.show

        
loading : a -> Layout.Element
loading _ =
  fullscreenText "Loading..."


view : Model -> Layout.Element
view model =
  case model.resources of
    Mesh.Waiting ->
      loading model.time

    Mesh.Error e ->
      resourceFailure e

    Mesh.Success lib ->
      ready model.time

            
resourceFailure : Http.Error -> Layout.Element
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
    fullscreenText ("I couldn't load the game for you.\n" ++ message)

                   
fullscreenText : String -> Layout.Element
fullscreenText message =
  Text.fromString message
    |> Layout.leftAligned
    |> Layout.size 900 100
