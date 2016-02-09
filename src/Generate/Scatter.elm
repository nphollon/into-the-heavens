module Generate.Scatter (scatter) where

import Random
import Color
import Mesh exposing (Mesh)
import Generate.Constellation as Constellation


type alias Point =
  ( Float, Float )


scatter : Int -> Mesh
scatter n =
  let
    seed =
      Random.initialSeed 2

    ( randomPoints, seed' ) =
      Random.generate (Random.list n starPoint) seed
  in
    List.concatMap (uncurry (Constellation.star Color.blue)) randomPoints


starPoint : Random.Generator Point
starPoint =
  let
    az =
      Random.float 0 (turns 1)

    alt =
      Random.map acos (Random.float -1 1)
  in
    Random.pair az alt
