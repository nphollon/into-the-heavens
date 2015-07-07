module Scatter (scatter) where

import Random
import List
import Graphics.Collage as Graphics
import Color

type alias Point = 
  (Float, Float)


type alias Image = 
  { points : List Point
  , draw : List Point -> Graphics.Form
  }


scatter : Int -> Image
scatter n =
  let
    seed =
      Random.initialSeed 2

    (randomPoints, seed') =
      Random.generate (Random.list n starPoint) seed

    drawStar position = 
      Graphics.circle 2
      |> Graphics.filled Color.darkBlue 
      |> Graphics.move position
  in
    { points = randomPoints
    , draw = Graphics.group << List.map drawStar
    }

starPoint : Random.Generator Point
starPoint =
  let
    randAz =
      Random.float 0 (turns 1)

    randSinZen =
      Random.float -1 1
  in
    Random.customGenerator
      (\seed ->
        let
          (az, seed') =
            Random.generate randAz seed

          (sinZen, seed'') =
            Random.generate randSinZen seed'

          alt = asin sinZen
        in
          ((az, alt), seed'')
      )
