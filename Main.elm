import Graphics.Element as Element
import Graphics.Collage as Graphics
import Array as A
import Color

main = Graphics.collage 360 180 (mapForms)
  |> Element.color Color.white
  |> Element.container 600 200 Element.middle
  |> Element.color Color.black
  |> Element.container 620 220 Element.middle

mapForms : List Graphics.Form
mapForms = A.initialize 24 (\i -> plot (toFloat i, 0.0)) |> A.toList

plot : (Float, Float) -> Graphics.Form
plot (ra, dec) = 
  let
    x = ra * 15 - 180
    y = dec
  in Graphics.circle 5 |> Graphics.filled Color.blue |> Graphics.move (x, y)
