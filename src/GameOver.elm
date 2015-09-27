module GameOver where

import Graphics.Element as Layout
import Text

import Palette
import Update exposing (Update)


type Model = GameOver

           
view : Model -> Layout.Element
view _ =
  Text.fromString "You Crashed"
    |> Text.style Palette.titleStyle
    |> Layout.centered
    |> Layout.container 900 600 Layout.middle
    |> Layout.color Palette.black

         
update : Update -> Model -> Model
update _ = identity
