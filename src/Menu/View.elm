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
  [ circles t, mask, titles ]
    |> Collage.collage 900 600
    |> Layout.color background


circles : Time -> Collage.Form
circles t =
  let
    toPhase i =
      if (i % 2 == 0) then 0 else 0.25

    toX i =
      30 * toFloat i - 450

    toColor i =
      if (i % 2 == 0) then Palette.white else Palette.yellow
      
    column i =
      circleCol (toPhase i) (toColor i) t |> Collage.moveX (toX i)
  in
    Array.initialize 32 column
      |> Array.toList
      |> Collage.group


mask : Collage.Form
mask =
  {-
  List.map
        (\x -> Collage.oval 800 600
            |> Collage.filled background
            |> Collage.move (x, -90))
        [ -450, 450 ]
  -- -}
  List.map (Collage.filled background)
        [ Collage.polygon [ (0, 5), (-450, 5), (-450, -300), (-150, -300) ]
        , Collage.polygon [ (-0, 5), (450, 5), (450, -300), (150, -300) ]
        ]
    |> Collage.group


titles : Collage.Form
titles =
  let
    style =
      { typeface = [ "Bitter", "serif" ]
      , height = Just 40
      , color = Palette.white
      , bold = False
      , italic = True
      , line = Nothing
      }
  in Collage.group
       [ Text.fromString "Into the Heavens"
           |> Text.style style
           |> Collage.text
           |> Collage.moveY 40
       ]
  
circleCol : Float -> Palette.Color -> Time -> Collage.Form
circleCol offset color t =
  let
    n = 10
        
    toPhase i =
      (i ./. n) + offset
                
    phases =
      Array.initialize n
             (\i -> percent (toPhase i) (10 * Time.second) t)
             
    draw p =
      [ skyCircle p, earthCircle color p ]
  in
    Array.toList phases |> List.concatMap draw |> Collage.group

        
skyCircle : Float -> Collage.Form
skyCircle p =
  let
    r =
      20 * (1 - p)
         
    y =
      330 - 300 * p
  in
    Collage.circle r |> Collage.filled Palette.blue |> Collage.moveY y


earthCircle : Palette.Color -> Float -> Collage.Form
earthCircle color p =
  let
    r =
      1 + 19 * p^3
         
    y =
      -320 * p
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
