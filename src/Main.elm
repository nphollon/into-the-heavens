module Main where

import Graphics.Element as Element exposing (Element)
import Graphics.Collage as Graphics exposing (Form)
import Html exposing (Html)
import Array as A
import Dict as D
import List as L
import Time
import Signal exposing ((<~))
import Color exposing (Color)
import Keyboard

type alias CameraPosition = 
  Point

type alias Dimensions = 
  (Int, Int)

type alias Point = 
  (Float, Float)

type alias Image = 
  { points : List Point
  , draw : List Point -> Form
  }

type alias Layer = 
  List Image

type alias Action = 
  { x : Int
  , y : Int 
  }

type alias Model =
  { camera : CameraPosition
  , entities : Layer
  }


tau : Float
tau =
  turns 1


main : Signal Html
main =
  let
    startState =
      { camera = (skyPoint 0 90)
      , entities =
        [ parallel 0
        , parallel 23.5
        , parallel -23.5
        , parallel 66.5
        , parallel -66.5
        , meridian 0
        , meridian 12
        , meridian 6
        , meridian 18
        , crux
        ]
      }

    model =
      Signal.foldp update startState keyboardSignal
  in
    view <~ model


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


view : Model -> Html
view model =
  let
    screenDims = 
      (600, 400)

    frameDims =
      (900, 450)
  in
    project model.camera model.entities
    |> split
    |> plot screenDims
    |> uncurry Graphics.collage screenDims
    |> Element.color (Color.hsl (degrees 240) 1 0.1)
    |> uncurry Element.container frameDims Element.middle
    |> Element.color Color.black
    |> Html.fromElement


plot : Dimensions -> List Image -> List Form
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


split : List Image -> List Image
split =
  let
    splitImage image =
      L.map
        (\p -> { image | points <- p })
        (splitPath image.points)
  in
    L.concatMap splitImage


splitPath : List Point -> List (List Point)
splitPath points = 
  let
    prevPoints = 
      (L.take 1 points) ++ points

    jumps = 
      L.map2 markJumps prevPoints points
  in 
    splitAtJumps jumps


splitAtJumps : List (a, Bool) -> List (List a)
splitAtJumps = 
  let
    addElement (x, mark) (inProgress, finished) =
      case mark of
        True ->
          ([], (x :: inProgress) :: finished)
        False ->
          (x :: inProgress, finished)

    finalize (inProgress, finished) =
      inProgress :: finished
  in
    L.foldr addElement ([], [])
    >> finalize


addElement : (a, Bool) -> (List a, List (List a)) -> (List a, List (List a))
addElement (x, mark) (inProgress, finished) =
  case mark of
    True ->
      ([], (x :: inProgress) :: finished)

    False -> 
      (x :: inProgress, finished)


markJumps : Point -> Point -> (Point, Bool)
markJumps a b = 
  (b, round ((fst a - fst b) / tau) /= 0)


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


parallel : Float -> Image
parallel declination =
  let
    init i =
      skyPoint (0.05 * toFloat i) declination
  in
    { points = A.initialize 500 init |> A.toList
    , draw = Graphics.traced (Graphics.solid Color.red)
    }


meridian : Float -> Image
meridian rightAscension =
  let
    init i =
      skyPoint rightAscension (toFloat i * 0.36 - 90)
  in
    { points = A.initialize 500 init |> A.toList
    , draw = Graphics.traced (Graphics.solid Color.blue)
    }


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