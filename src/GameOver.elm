module GameOver (engine, view) where

import Color
import Graphics.Element as Layout
import Text
import Set
import Char
import Time exposing (Time)

import Graphics.Flat as Flat
import Graphics.Palette as Palette
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
  { model | time <- 0
          , continue <- False
  }

           
update : Update -> Update.Data -> Update.Data
update input model =
  case input of
    FPS dt ->
      { model | time <- dt + model.time }

    Keys keySet ->
      { model | continue <- Set.member (Char.toCode 'N') keySet }
      
    otherwise ->
      model


transition : Update.Data -> Maybe Update.Mode
transition data =
  if | data.continue -> Just Update.GameMode
     | otherwise -> Nothing
             
      
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
    Flat.screen color
          [ Flat.text Palette.titleStyle (0, 0) "You crashed"
          , Flat.text Palette.subtitleStyle (0, -70) "Press 'N'"
          ]
