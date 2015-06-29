import Graphics.Element as Element exposing (Element)
import Graphics.Collage as Graphics exposing (Form)
import Array as A
import Dict as D
import List as L
import Time
import Signal exposing ((<~))
import Color exposing (Color)

{-
We have a list of world elements

Transform all world coordinates to the reference frame of the camera
This is the transformed world

Boundaries of the camera
Tile the transformed world elements to cover the expanse of the camera
Clip the world elements that are outside the boundaries of the camera
This is the visible world

Boundaries of the canvas
transform the camera coordinates to screen coordinates
  -}

tau = turns 1

type alias CameraPosition = WorldPoint
type alias CameraDimensions = (Float, Float)
type alias Dimensions = (Int, Int)
type alias WorldPoint = (Float, Float)
type alias ScreenPoint = (Float, Float)

type alias Entity = (List WorldPoint, Color)
type alias Image = (List ScreenPoint, Color)

entities = [
    (parallel 0, Color.blue),
    (parallel 23.5, Color.red),
    (parallel -23.5, Color.red),
    (parallel 66.5, Color.red),
    (parallel -66.5, Color.red),
    (meridian 0, Color.blue),
    (meridian 12, Color.blue),
    (meridian 6, Color.red),
    (meridian 18, Color.red),
    ([skyPoint 1 15, skyPoint 3 30, skyPoint 7 50], Color.black)
  ]

main = graphics << (\t -> skyPoint (t * 0.01) (t * 0.01)) <~ Time.every (Time.millisecond * 10)

graphics : CameraPosition -> Element
graphics cameraPosition = 
  project cameraPosition entities
  |> split
  |> plot (600, 400)
  |> render (600, 400)
  |> frame (900, 450)

frame : Dimensions -> Element -> Element
frame (width, height) = 
  let padding = 20
  in Element.container width height Element.middle
    >> Element.color Color.black
    >> Element.container (width + padding) (height + padding) Element.middle

render : Dimensions -> List Form -> Element
render (width, height) = Graphics.collage width height >> Element.color Color.white

plot : CameraDimensions -> List Image -> List Form
plot dim = L.map (scale dim >> toForm)

toForm : Image -> Form
toForm (pts, color) = Graphics.traced (Graphics.solid color) pts

scale : CameraDimensions -> Image -> Image
scale dim (pts, color) = (L.map (toScreen dim) pts, color)

toScreen : CameraDimensions -> ScreenPoint -> ScreenPoint
toScreen (width, height) (lon, lat) =
  let
    x = lon * width / tau
    y = lat * height * 2 / tau
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

parallel : Float -> List WorldPoint
parallel declination = A.initialize 500 (\i -> skyPoint (0.05 * toFloat i) declination) |> A.toList

meridian : Float -> List WorldPoint
meridian rightAscension = A.initialize 500 (\i -> skyPoint rightAscension (toFloat i * 0.36 - 90)) |> A.toList
