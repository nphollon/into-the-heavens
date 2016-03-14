module Graphics.Format (tag, float, percent) where

import String


tag : String -> String -> String
tag label value =
  String.concat [ label, ": ", value ]


float : Float -> String
float x =
  let
    sign =
      if x > -5.0e-3 then
        "+"
      else
        "-"

    intPart =
      floor (abs x)

    centPart =
      round (abs x * 100) - (intPart * 100)

    decimal =
      if centPart < 10 then
        ".0"
      else
        "."
  in
    String.concat [ sign, toString intPart, decimal, toString centPart ]


percent : Float -> Int
percent x =
  round (x * 100)
