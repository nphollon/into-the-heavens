import Graphics.Element as Element
import Graphics.Collage as Graphics
import Array as A
import List as L
import Color

main = Graphics.collage 360 180 (cartography)
  |> Element.color Color.white
  |> Element.container 600 200 Element.middle
  |> Element.color Color.black
  |> Element.container 620 220 Element.middle

cartography : List Graphics.Form
cartography = let
  toForm (curve, color) = L.map fromRaDec curve |> plotCurve color
  in L.map toForm [ (equator, Color.blue), (primeMeridian, Color.blue), (cancer, Color.red), (capricorn, Color.red) ]

equator = A.initialize 24 (\i -> (toFloat i, 0.0)) |> A.toList
primeMeridian = A.initialize 19 (\i -> (12, 10 * toFloat i - 90)) |> A.toList
cancer = A.initialize 24 (\i -> (toFloat i, 23.5)) |> A.toList
capricorn = A.initialize 24 (\i -> (toFloat i, -23.5)) |> A.toList

fromRaDec (ra, dec) = (ra * 15 - 180, dec)

plotCurve : Color.Color -> List (Float, Float) -> Graphics.Form
plotCurve color = Graphics.path >> Graphics.traced (Graphics.solid color)