module Palette where

import Color
import Text

import Infix exposing (..)

type alias Color = Color.Color


funcBlend : (Float -> Float) -> Color -> Color -> Float -> Color
funcBlend f x y a =
  blend x y (f a)

            
blend : Color -> Color -> Float -> Color
blend x' y' ratio =
  let
    x = Color.toRgb x'
    y = Color.toRgb y'
    intMean u v = (u .* ratio) + (v .* (1 - ratio)) |> round
    floatMean u v = u * ratio + v * (1 - ratio)
  in
    Color.rgba
           (intMean x.red y.red)
           (intMean x.green y.green)
           (intMean x.blue y.blue)
           (floatMean x.alpha y.alpha)

           
white : Color
white = Color.rgba 204 255 238 1

blue : Color
blue = Color.rgba 0 0 85 1

red : Color
red = Color.red

yellow : Color
yellow = Color.rgba 255 214 52 1

black : Color
black = Color.black


titleStyle : Text.Style
titleStyle =
  { typeface = [ "Bitter", "serif" ]
  , height = Just 36
  , color = white
  , bold = False
  , italic = True
  , line = Nothing
  }


subtitleStyle : Text.Style
subtitleStyle =
  { typeface = [ "Fira Sans", "sans-serif" ]
  , height = Just 26
  , color = white
  , bold = False
  , italic = False
  , line = Nothing
  }
