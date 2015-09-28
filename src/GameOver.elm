module GameOver (engine, view) where

import Color
import Graphics.Element as Layout
import Text
import Time exposing (Time)

import Palette
import Mesh
import Update exposing (Update(..))


engine : Update.Engine
engine =
  { init = init
  , update = update
  , transition = transition
  }

         
init : Update.Data -> Update.Data
init model =
  { model | time <- 0 }

           
update : Update -> Update.Data -> Update.Data
update input model =
  case input of
    FPS dt ->
      { model | time <- dt + model.time }

    otherwise ->
      model


transition : Update.Data -> Maybe Update.Mode
transition = always Nothing
             
      
view : Update.Data -> Layout.Element
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

         
