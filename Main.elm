import Graphics.Element as Element
import Graphics.Collage as Graphics
import Array as A
import List as L
import Color

type alias Dimensions = (Float, Float)
type WorldPoint = WPt (Float, Float)
type CameraPoint = CPt (Float, Float)
type alias ScreenPoint = (Float, Float)

main = canvas <| cartography (600, 400) -4 <| [
    (parallel 0, Color.blue),
    (parallel 23.5, Color.red),
    (parallel -23.5, Color.red),
    (meridian 0, Color.blue),
    (meridian 12, Color.red)
  ]

canvas : List Graphics.Form -> Element.Element
canvas forms = 
  let 
    width = 600
    height = 400
    xBox = 900
    yBox = 450
    padding = 20
  in Graphics.collage width height forms
    |> Element.color Color.white
    |> Element.container xBox yBox Element.middle
    |> Element.color Color.black
    |> Element.container (xBox + padding) (yBox + padding) Element.middle

cartography : Dimensions -> Float -> List (List WorldPoint, Color.Color) -> List Graphics.Form
cartography bounds azimuth = 
  let
    transform = toCamera azimuth >> toScreen bounds
    drawCurve (curve, color) = L.map transform curve |> Graphics.path |> Graphics.traced (Graphics.solid color)
  in L.map drawCurve

parallel : Float -> List WorldPoint
parallel declination = A.initialize 12 (\i -> WPt (toFloat i, declination)) |> A.toList

meridian : Float -> List WorldPoint
meridian rightAscension = A.initialize 19 (\i -> WPt (rightAscension, 10 * toFloat i - 90)) |> A.toList

toCamera : Float -> WorldPoint -> CameraPoint
toCamera azimuth (WPt (ra, dec)) = 
  let
    lon = degrees <| (ra - azimuth) * 15
    lat = degrees dec
  in CPt (lon, lat)

toScreen : Dimensions -> CameraPoint -> ScreenPoint
toScreen (width, height) (CPt (lon, lat)) =
  let
    x = (lon / pi - 1) * 0.5 * width
    y = lat / pi * height
  in (x, y)
