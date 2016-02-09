module Menu (engine, view) where

import Html exposing (Html)
import Update exposing (Engine)
import Menu.View as View
import Char
import Set
import Update exposing (Update(..), Engine, Data, Mode, MenuState(..))


engine : Engine
engine =
  { init = init
  , update = update
  , transition = transition
  }


view : Signal.Address Update -> Data -> Html
view =
  View.view


init : Data -> Data
init model =
  { model | continue = False }


update : Update -> Data -> Data
update input model =
  case input of
    FPS dt ->
      model

    Meshes response ->
      case response of
        Just (Ok lib) ->
          { model
            | resources = Ready
            , lib = lib
          }

        Just (Err err) ->
          { model | resources = Failure err }

        Nothing ->
          { model | resources = Waiting }

    Keys keySet ->
      { model | continue = Set.member (Char.toCode 'N') keySet }


transition : Data -> Maybe Mode
transition data =
  if data.continue then
    Just Update.GameMode
  else
    Nothing
