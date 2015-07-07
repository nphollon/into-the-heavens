module Main where

import Graphics.Element as Layout
import Graphics.Collage as Graphics
import Html
import Color
import Signal
import Time
import Keyboard
import List as L
import Grid

type alias CameraPosition = 
  Point

type alias Dimensions = 
  (Int, Int)

type alias Point = 
  (Float, Float)

type alias Image = 
  { points : List Point
  , draw : List Point -> Graphics.Form
  }

type alias Action = 
  { x : Int
  , y : Int 
  }

type alias Model =
  { camera : CameraPosition
  , entities : List Image
  }


tau : Float
tau =
  turns 1


main : Signal Html.Html
main =
  let
    startState =
      { camera = (skyPoint 0 90)
      , entities =
        [ Grid.parallel 0
        , Grid.parallel 23.5
        , Grid.parallel -23.5
        , Grid.parallel 66.5
        , Grid.parallel -66.5
        , Grid.meridian 0
        , Grid.meridian 12
        , Grid.meridian 6
        , Grid.meridian 18
        , crux
        ]
      }

    model =
      Signal.foldp update startState keyboardSignal
  in
    Signal.map view model


update : Action -> Model -> Model
update action model = 
  let
    delta =
      skyPoint 0.3 5

    newRa =
      toFloat action.x * fst delta + fst model.camera

    newDec =
      toFloat action.y * snd delta + snd model.camera
  in
    { model | camera <- (newRa, newDec) }


keyboardSignal : Signal Action
keyboardSignal = 
  Signal.sampleOn (Time.every (10 * Time.millisecond)) Keyboard.wasd


view : Model -> Html.Html
view model =
  let
    screenDims = 
      (600, 400)

    frameDims =
      (900, 450)
  in
    project model.camera model.entities
    |> plot screenDims
    |> uncurry Graphics.collage screenDims
    |> Layout.color (Color.hsl (degrees 240) 1 0.1)
    |> uncurry Layout.container frameDims Layout.middle
    |> Layout.color Color.black
    |> Html.fromElement


plot : Dimensions -> List Image -> List Graphics.Form
plot dim =
  L.map
    (\image -> L.map (toScreen dim) image.points |> image.draw )


toScreen : Dimensions -> Point -> Point
toScreen (width, height) (lon, lat) =
  let
    x = 
      lon * (toFloat width) / tau

    y = 
      lat * (toFloat height) * 2 / tau
  in
    (x, y)


project : CameraPosition -> List Image -> List Image
project center =
  L.map (\image -> { image | points <- L.map (toCamera center) image.points } )


toCamera : CameraPosition -> Point -> Point
toCamera (lon, lat) (ra, dec) = 
  let
    hour = 
      lon - ra

    alt = 
      asin ((sin lat) * (sin dec) + (cos lat) * (cos dec) * (cos hour))

    az =
      atan2 (sin hour) ((cos hour) * (sin lat) - (tan dec) * (cos lat))
  in 
    (az, alt)



skyPoint : Float -> Float -> Point
skyPoint ra dec =
  (turns ra / 24, degrees dec)


crux : Image
crux =
  let
    star position =
      Graphics.circle 1
      |> Graphics.filled Color.yellow 
      |> Graphics.move position
  in    
    { points = 
      [ skyPoint 12.43 -63.08
      , skyPoint 12.78 -59.68
      , skyPoint 12.52 -57.10
      , skyPoint 12.25 -58.75
      , skyPoint 12.35 -60.40
      ]
    , draw =
      Graphics.group << L.map star
    }