module Scatter (scatter) where

import Random
import List
import Color

import Graphics
import Constellation


type alias Point = 
  (Float, Float)


scatter : Int -> Graphics.Uniform -> Graphics.Entity
scatter n =
  let
    seed =
      Random.initialSeed 2

    (randomPoints, seed') =
      Random.generate (Random.list n starPoint) seed

    mesh =
      List.concatMap (uncurry (Constellation.star Color.blue 0.01)) randomPoints
  in
    Graphics.entity mesh

starPoint : Random.Generator Point
starPoint =
  let
    randAz =
      Random.float 0 (turns 1)

    randCosTheta =
      Random.float -1 1
  in
    Random.customGenerator
      (\seed ->
        let
          (az, seed') =
            Random.generate randAz seed

          (cosTheta, seed'') =
            Random.generate randCosTheta seed'

          alt = acos cosTheta
        in
          ((az, alt), seed'')
      )
