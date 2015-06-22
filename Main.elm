import Graphics.Element as Element
import Graphics.Collage as Graphics
import Array as A
import List as L
import Color

main = canvas <| cartography (600, 400) <| [
    (parallel 0, Color.blue),
    (parallel 23.5, Color.red),
    (parallel -23.5, Color.red),
    (meridian 6, Color.blue),
    (meridian 18, Color.red)
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

cartography : (Float, Float) -> List (List (Float, Float), Color.Color) -> List Graphics.Form
cartography bounds = L.map (\(curve, color) -> L.map (fromRaDec bounds) curve |> Graphics.path |> Graphics.traced (Graphics.solid color))

parallel : Float -> List (Float, Float)
parallel declination = A.initialize 24 (\i -> (toFloat i, declination)) |> A.toList

meridian : Float -> List (Float, Float)
meridian rightAscension = A.initialize 19 (\i -> (rightAscension, 10 * toFloat i - 90)) |> A.toList

fromRaDec : (Float, Float) -> (Float, Float) -> (Float, Float)
fromRaDec (width, height) (ra, dec) =
  let
    x = (ra / 24 - 0.5) * width
    y = dec / 180 * height
  in (x, y)
