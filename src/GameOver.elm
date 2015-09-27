module GameOver where

import Color
import Graphics.Element as Layout
import Text
import Time exposing (Time)

import Palette
import Mesh
import Update exposing (Update(..))


type alias Model =
  { time: Time
  , resources : ()
  }


init : () -> Model
init lib =
  { time = 0
  , resources = lib
  }

           
view : Model -> Layout.Element
view model =
  let
    lightness =
      1 - Time.inSeconds model.time

    hue =
      Palette.yellow |> Color.toHsl |> .hue

    color =
      Color.hsl hue 1 lightness
  in
    Text.fromString "You Crashed"
      |> Text.style Palette.titleStyle
      |> Layout.centered
      |> Layout.container 900 600 Layout.middle
      |> Layout.color color

         
update : Update -> Model -> Model
update input model =
  case input of
    FPS dt ->
      { model | time <- dt + model.time }

    otherwise ->
      model
