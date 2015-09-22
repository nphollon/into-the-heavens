module Menu.View (view) where

import Array
import Graphics.Collage as Collage
import Graphics.Element as Layout
import Text
import Time exposing (Time)

import Http

import Mesh
import Palette
import Menu.Model as Model exposing (Model)
import Infix exposing (..)


view : Model -> Layout.Element
view model =
  case model.resources of
    Mesh.Waiting ->
      loading model.time

    Mesh.Error e ->
      resourceFailure e

    Mesh.Success lib ->
      ready model.time


ready : Time -> Layout.Element
ready t =
  [ skyCircles t, earthCircles t, mask, title, subtitle ]
    |> Collage.collage 900 600
    |> Layout.color background

       
mask : Collage.Form
mask =
  let
    shape =
      [ (0, -15), (0, 50), (450, 50), (450, -300)
      , (1, -300), (4, -70)
      ]

    reflection =
      List.map (\(x,y) -> (-x,y)) shape
  in
    [ shape, reflection ]
      |> List.map (Collage.polygon >> Collage.filled background)
      |> Collage.group
        

title : Collage.Form
title =
  let
    style =
      { typeface = [ "Bitter", "serif" ]
      , height = Just 40
      , color = Palette.white
      , bold = False
      , italic = True
      , line = Nothing
      }
  in
    Text.fromString "Into the Heavens"
    |> Text.style style
    |> Collage.text
    |> Collage.moveY 40

    
subtitle : Collage.Form
subtitle =
  let
    style =
      { typeface = [ "Fira Sans", "sans-serif" ]
      , height = Just 28
      , color = Palette.white
      , bold = False
      , italic = False
      , line = Nothing
      }
  in 
    Text.fromString "Press any key"
    |> Text.style style
    |> Collage.text
    |> Collage.move (340, -260)
       
           
skyCircles : Time -> Collage.Form
skyCircles t =
  let
    toPhase i =
      if (i % 2 == 0) then 0 else 0.25

    draw i =
      circleCol skyCircle (30 * Time.second) (toPhase i)

    toX i =
      30 * toFloat i - 450

    column i =
      draw i t |> Collage.moveX (toX i)
  in
    Array.initialize 32 column
      |> Array.toList
      |> Collage.group


earthCircles : Time -> Collage.Form
earthCircles t =
  circleCol earthCircle (6 * Time.second) 0 t
  

circleCol : (Float -> Collage.Form) -> Time -> Float -> Time -> Collage.Form
circleCol draw period offset t =
  let
    n = 10
        
    toPhase i =
      percent ((i ./. n) + offset) period t
  in
    Array.initialize n (toPhase >> draw)
      |> Array.toList
      |> Collage.group

        
skyCircle : Float -> Collage.Form
skyCircle p =
  let
    r =
      20 * (1 - p)
         
    y =
      330 - 300 * p
  in
    Collage.circle r
      |> Collage.filled Palette.blue
      |> Collage.moveY y


earthCircle : Float -> Collage.Form
earthCircle p =
  let
    r =
      1 + 27 * (1 - p)^2.2
         
    y =
      12 - 300 * p^0.75

    color =
      Palette.blend Palette.yellow Palette.white p
  in
    Collage.circle r
      |> Collage.filled color
      |> Collage.moveY y
             

percent : Float -> Float -> Float -> Float
percent offset bound x =
  let
    frac = x / bound + offset
  in
    frac - (toFloat <| truncate frac)

loading : a -> Layout.Element
loading _ =
  fullscreenText "Loading..."

            
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


background = Palette.black
