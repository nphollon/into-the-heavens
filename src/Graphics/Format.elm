module Graphics.Format exposing (tag, float, percent)

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

        cents =
            round (abs x * 100)

        integerPart =
            cents // 100

        centRemainder =
            cents % 100

        decimal =
            if centRemainder < 10 then
                ".0"
            else
                "."
    in
        String.concat [ sign, toString integerPart, decimal, toString centRemainder ]


percent : Float -> Int
percent x =
    round (x * 100)
