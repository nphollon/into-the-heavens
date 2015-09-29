module Menu.View (view) where

import Array
import Graphics.Collage as Collage
import Graphics.Element as Layout
import Text
import Time exposing (Time)

import Http

import Mesh
import Graphics.Flat as Flat
import Graphics.Palette as Palette
import Update
import Infix exposing (..)


view : Update.Data -> Layout.Element
view model =
  case model.resources of
    Mesh.Waiting ->
      loading model.time

    Mesh.Error e ->
      resourceFailure e

    Mesh.Success lib ->
      ready model.time


ready : Time -> Layout.Element
ready = titleScreen
        [ Flat.text Palette.titleStyle (-280, -256) "Into the Heavens"
        , Flat.text Palette.subtitleStyle (340, -260) "Press 'N'"
        ]


loading : Time -> Layout.Element
loading = titleScreen
        [ Flat.text Palette.titleStyle (-280, -256) "Into the Heavens"
        , Flat.text Palette.subtitleStyle (340, -200) "Loading"
        ]


titleScreen : List Collage.Form -> Time -> Layout.Element
titleScreen titles t =
  titles
    |> List.append [ earthCircles t, mask, skyCircles t ]
    |> Flat.screen background

       
mask : Collage.Form
mask =
  let
    shape =
      [ (0, -40), (0, 50), (450, 50), (450, -300)
      , (3, -300), (4, -80)
      ]

    reflection =
      List.map (\(x,y) -> (-x,y)) shape
  in
    [ shape, reflection ]
      |> List.map (Collage.polygon >> Collage.filled background)
      |> Collage.group
        
       
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
      20 * (1 - p)^0.5
         
    y =
      330 - 330 * p
  in
    Collage.circle r
      |> Collage.filled Palette.blue
      |> Collage.moveY y


earthCircle : Float -> Collage.Form
earthCircle p =
  let
    r =
      28 * (1 - p)^1.8
         
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

    texts =
      [ Flat.text Palette.titleStyle (0, 0) "Error"
      , Flat.text Palette.subtitleStyle (0, -70) message
      ]
  in
    Flat.screen background texts


         
background : Palette.Color
background = Palette.black
