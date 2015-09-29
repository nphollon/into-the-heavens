module Graphics.Flat where

import Color exposing (Color)
import Graphics.Element as Layout
import Graphics.Collage as Collage
import Text


text : Text.Style -> (Float, Float) -> String -> Collage.Form
text style position =
  Text.fromString >> Text.style style >> Collage.text >> Collage.move position
       
           
screen : Color -> List Collage.Form -> Layout.Element
screen bkg =
  Collage.collage 900 600 >> Layout.color bkg
