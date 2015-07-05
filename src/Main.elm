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

tau = turns 1

type alias CameraPosition = WorldPoint
type alias Dimensions = (Int, Int)
type alias WorldPoint = (Float, Float)
type alias ScreenPoint = (Float, Float)

type alias Entity = (List WorldPoint, Color)
type alias Image = (List ScreenPoint, Color)

type alias Layer = List Image

grid = [
    (parallel 0, Color.blue),
    (parallel 23.5, Color.red),
    (parallel -23.5, Color.red),
    (parallel 66.5, Color.red),
    (parallel -66.5, Color.red),
    (meridian 0, Color.blue),
    (meridian 12, Color.blue),
    (meridian 6, Color.red),
    (meridian 18, Color.red)
  ]

stars = [
    (star 12.43 -63.08, Color.grey),
    (star 12.78 -59.68, Color.grey),
    (star 12.52 -57.10, Color.grey),
    (star 12.25 -58.75, Color.grey),
    (star 12.35 -60.40, Color.grey)
  ]

main =
  let
    model = Signal.foldp update (skyPoint 0 90) keyboardSignal
    dummy = (Signal.mailbox ()).address
  in
    view dummy <~ model

type alias Action = { x : Int, y : Int }

update : Action -> CameraPosition -> CameraPosition
update action (ra, dec) = 
  let
    delta = skyPoint 0.3 5
    dRa = toFloat action.x * fst delta
    dDec = toFloat action.y * snd delta
  in (ra + dRa, dec + dDec)

keyboardSignal : Signal Action
keyboardSignal = Signal.sampleOn (Time.every (10 * Time.millisecond)) Keyboard.wasd

view : Signal.Address a-> WorldPoint -> Html
view address model =
  graphics [ grid, stars ] model |> Html.fromElement

graphics : List Layer -> CameraPosition -> Element
graphics layers center = 
  let 
    screenDim = (600, 400)
    frameDim = (900, 450)
    entitiesToForms = project center >> split >> plot screenDim
  in L.map entitiesToForms layers |> render screenDim |> frame frameDim

frame : Dimensions -> Element -> Element
frame (width, height) = 
  let padding = 20
  in Element.container width height Element.middle
    >> Element.color Color.black
    >> Element.container (width + padding) (height + padding) Element.middle

render : Dimensions -> List Form -> Element
render (width, height) layers =
  let midnight = Color.hsl (degrees 240) 1 0.1
  in Graphics.collage width height layers |> Element.color midnight

plot : Dimensions -> List Image -> Form
plot dim = L.map (scale dim >> toForm) >> Graphics.group

toForm : Image -> Form
toForm (pts, color) = Graphics.traced (Graphics.solid color) pts

scale : Dimensions -> Image -> Image
scale dim (pts, color) = (L.map (toScreen dim) pts, color)

toScreen : Dimensions -> ScreenPoint -> ScreenPoint
toScreen (width, height) (lon, lat) =
  let
    x = lon * (toFloat width) / tau
    y = lat * (toFloat height) * 2 / tau
  in (x, y)

split : List Image -> List Image
split = L.concatMap splitImage

splitImage : Image -> List Image
splitImage (path, color) = splitPath path |> L.map (\p -> (p, color))

splitPath : List ScreenPoint -> List (List ScreenPoint)
splitPath points = 
  let
    prevPoints = (L.take 1 points) ++ points
    jumps = L.map2 markJumps prevPoints points
  in splitAtJumps jumps

splitAtJumps : List (a, Bool) -> List (List a)
splitAtJumps = 
  let
    addElement (x, mark) (inProgress, finished) = case mark of
      True -> ([], (x :: inProgress) :: finished)
      False -> (x :: inProgress, finished)
    finalize (inProgress, finished) = inProgress :: finished
  in L.foldr addElement ([], []) >> finalize

addElement : (a, Bool) -> (List a, List (List a)) -> (List a, List (List a))
addElement (x, mark) (inProgress, finished) = case mark of
  True -> ([], (x :: inProgress) :: finished)
  False -> (x :: inProgress, finished)

markJumps : ScreenPoint -> ScreenPoint -> (ScreenPoint, Bool)
markJumps a b = (b, round ((fst a - fst b) / tau) /= 0)

project : CameraPosition -> List Entity -> List Image
project center = L.map (\(pts, color) -> (L.map (toCamera center) pts, color))

toCamera : CameraPosition -> WorldPoint -> ScreenPoint
toCamera (lon, lat) (ra, dec) = 
  let
    hour = lon - ra
    alt = asin ((sin lat) * (sin dec) + (cos lat) * (cos dec) * (cos hour))
    az = atan2 (sin hour) ((cos hour) * (sin lat) - (tan dec) * (cos lat))
  in (az, alt)

skyPoint : Float -> Float -> WorldPoint
skyPoint ra dec =
  (turns ra / 24, degrees dec)

star : Float -> Float -> List WorldPoint
star ra dec = [skyPoint ra (dec+0.5), skyPoint (ra+0.1) dec, skyPoint ra (dec-0.5), skyPoint (ra-0.1) dec, skyPoint ra (dec+0.5)]

parallel : Float -> List WorldPoint
parallel declination = A.initialize 500 (\i -> skyPoint (0.05 * toFloat i) declination) |> A.toList

meridian : Float -> List WorldPoint
meridian rightAscension = A.initialize 500 (\i -> skyPoint rightAscension (toFloat i * 0.36 - 90)) |> A.toList
