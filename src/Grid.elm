module Grid (parallel, meridian) where

import Graphics.Collage as Graphics exposing (Form)
import Color
import Array as A
import List as L

type alias Point = 
  (Float, Float)


type alias Image = 
  { points : List Point
  , draw : List Point -> Form
  }
  

parallel : Float -> Image
parallel declination =
  let
    init i =
      skyPoint (0.05 * toFloat i) declination
  in
    { points = A.initialize 500 init |> A.toList
    , draw = drawLine Color.red
    }


meridian : Float -> Image
meridian rightAscension =
  let
    init i =
      skyPoint rightAscension (toFloat i * 0.36 - 90)
  in
    { points = A.initialize 500 init |> A.toList
    , draw = drawLine Color.blue
    }


skyPoint : Float -> Float -> Point
skyPoint ra dec =
  (turns ra / 24, degrees dec)


drawLine : Color.Color -> List Point -> Form
drawLine color path =
  L.map
    (Graphics.traced (Graphics.solid color))
    (splitPath path)
  |> Graphics.group


splitPath : List Point -> List (List Point)
splitPath points = 
  let
    prevPoints = 
      (L.take 1 points) ++ points

    jumps = 
      L.map2 markJumps prevPoints points
  in 
    splitAtJumps jumps


splitAtJumps : List (a, Bool) -> List (List a)
splitAtJumps = 
  let
    addElement (x, mark) (inProgress, finished) =
      case mark of
        True ->
          ([], (x :: inProgress) :: finished)
        False ->
          (x :: inProgress, finished)

    finalize (inProgress, finished) =
      inProgress :: finished
  in
    L.foldr addElement ([], [])
    >> finalize


addElement : (a, Bool) -> (List a, List (List a)) -> (List a, List (List a))
addElement (x, mark) (inProgress, finished) =
  case mark of
    True ->
      ([], (x :: inProgress) :: finished)

    False -> 
      (x :: inProgress, finished)


markJumps : Point -> Point -> (Point, Bool)
markJumps a b = 
  (b, round ((fst a - fst b) / 300.0) /= 0)