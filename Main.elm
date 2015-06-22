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
  toForm (curve, color) = L.map fromRaDec curve |> Graphics.path |> Graphics.traced (Graphics.solid color)
  in L.map toForm [
    (parallel 0, Color.blue),
    (parallel 23.5, Color.red),
    (parallel -23.5, Color.red),
    (meridian 6, Color.blue),
    (meridian 18, Color.red)
  ]

parallel : Float -> List (Float, Float)
parallel declination = A.initialize 24 (\i -> (toFloat i, declination)) |> A.toList

meridian : Float -> List (Float, Float)
meridian rightAscension = A.initialize 19 (\i -> (rightAscension, 10 * toFloat i - 90)) |> A.toList

fromRaDec (ra, dec) = (ra * 15 - 180, dec)
