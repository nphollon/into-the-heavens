import Graphics.Element as Element
import Graphics.Collage as Graphics
import Array as A
import List as L
import Color

main = Graphics.collage 360 180 (mapForms)
  |> Element.color Color.white
  |> Element.container 600 200 Element.middle
  |> Element.color Color.black
  |> Element.container 620 220 Element.middle

mapForms : List Graphics.Form
mapForms = [ L.map fromRaDec equator |> plotCurve Color.blue ]

equator : List (Float, Float)
equator = 
  let
    toRaDec i = (toFloat i, 0.0)
  in A.initialize 24 toRaDec |> A.toList

fromRaDec (ra, dec) = (ra * 15 - 180, dec)

plotCurve : Color.Color -> List (Float, Float) -> Graphics.Form
plotCurve color = Graphics.path >> Graphics.traced (Graphics.solid color)