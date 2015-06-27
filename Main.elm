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

type alias CameraPosition = (Float, Float)
type alias CameraDimensions = (Float, Float)
type alias Dimensions = (Int, Int)
type alias WorldPoint = (Float, Float)
type alias ScreenPoint = (Float, Float)

type alias Entity = (List WorldPoint, Color)
type alias Image = (List ScreenPoint, Color)

tau = 2 * pi

entities = [
    (parallel 0, Color.blue),
    (parallel 23.5, Color.red),
    (parallel -23.5, Color.red),
    (meridian 0, Color.blue),
    (meridian 12, Color.red),
    ([(1, 15), (7, 50)], Color.black)
  ]

main = graphics << (*) 0.01 <~ Time.every (Time.millisecond * 10)

graphics : Float -> Element
graphics cRa = project (cRa, 0) entities
  |> tile (degrees 360, degrees 180)
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
    x = lon * width
    y = lat * height * 2
  in (x, y)

project : CameraPosition -> List Entity -> List Image
project center = L.map (\(pts, color) -> (L.map (toCamera center) pts, color))

toCamera : CameraPosition -> WorldPoint -> ScreenPoint
toCamera (cRa, cDec) (pRa, pDec) = 
  let
    lon = (pRa - cRa) / 24
    lat = (pDec - cDec) / 360
  in (lon, lat)

tile : CameraDimensions -> List Image -> List Image
tile _ = L.concatMap tileImage

tileImage : Image -> List Image
tileImage (pts, color) =
  let
    addIfEmpty key f dict = if D.member key dict then dict else D.insert key (f key) dict
    offset dx = L.map (\(x, y) -> (x - dx, y))
    addImage (x,_) = addIfEmpty (round x) (\i -> (offset (toFloat i) pts, color))
  in L.foldl addImage D.empty pts |> D.values

parallel : Float -> List WorldPoint
parallel declination = A.initialize 25 (\i -> (toFloat i, declination)) |> A.toList

meridian : Float -> List WorldPoint
meridian rightAscension = A.initialize 19 (\i -> (rightAscension, 10 * toFloat i - 90)) |> A.toList
