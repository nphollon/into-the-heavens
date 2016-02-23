module Main (..) where

import Task exposing (Task)
import Console
import ElmTest exposing (..)
import Math.Vector as Vec exposing (Vector)
import Math.Collision as Collision exposing (isInside)
import Types exposing (Hull, Body)
import Flight.Init


testSuite : Test
testSuite =
  suite
    "Collision tests"
    [ noTransform
    , withTranslation
    , withRotation
    , withTranslationAndRotation
    ]


noTransform : Test
noTransform =
  let
    body =
      stillBody (Vec.vector 0 0 0) (Vec.vector 0 0 0)
  in
    suite
      "Hull with no transformation"
      [ assertBoundary "below" (Vec.vector 0.5 1 0) (Vec.vector 0 0 -1) body
      , assertBoundary "above" (Vec.vector 0.5 1 3) (Vec.vector 0 0 1) body
      , assertBoundary "north" (Vec.vector 0.5 2 1) (Vec.vector 0 1 0) body
      , assertBoundary "south" (Vec.vector 0.5 0 1) (Vec.vector 0 -1 0) body
      , assertBoundary "west" (Vec.vector 0 1 1) (Vec.vector -1 0 0) body
      , assertBoundary "east" (Vec.vector 1 1 1) (Vec.vector 1 0 0) body
      ]


withTranslation : Test
withTranslation =
  let
    body =
      stillBody (Vec.vector 5 4 3) (Vec.vector 0 0 0)
  in
    suite
      "Hull with translation"
      [ assertBoundary "below" (Vec.vector 5.5 5 3) (Vec.vector 0 0 -1) body
      , assertBoundary "above" (Vec.vector 5.5 5 6) (Vec.vector 0 0 1) body
      , assertBoundary "north" (Vec.vector 5.5 6 4) (Vec.vector 0 1 0) body
      , assertBoundary "south" (Vec.vector 5.5 4 4) (Vec.vector 0 -1 0) body
      , assertBoundary "west" (Vec.vector 5 5 4) (Vec.vector -1 0 0) body
      , assertBoundary "east" (Vec.vector 6 5 4) (Vec.vector 1 0 0) body
      ]


withRotation : Test
withRotation =
  let
    body =
      stillBody (Vec.vector 0 0 0) (Vec.vector 0 0 (pi / 2))
  in
    suite
      "Hull with rotation"
      [ assertBoundary "below" (Vec.vector -1 0.5 0) (Vec.vector 0 0 -1) body
      , assertBoundary "above" (Vec.vector -1 0.5 3) (Vec.vector 0 0 1) body
      , assertBoundary "north" (Vec.vector -1 1 1) (Vec.vector 0 1 0) body
      , assertBoundary "south" (Vec.vector -1 0 1) (Vec.vector 0 -1 0) body
      , assertBoundary "west" (Vec.vector -2 0.5 1) (Vec.vector -1 0 0) body
      , assertBoundary "east" (Vec.vector 0 0.5 1) (Vec.vector 1 0 0) body
      ]


withTranslationAndRotation : Test
withTranslationAndRotation =
  let
    body =
      stillBody (Vec.vector 5 4 3) (Vec.vector 0 0 (pi / 2))
  in
    suite
      "Hull with rotation and translation"
      [ assertBoundary "below" (Vec.vector 4 4.5 3) (Vec.vector 0 0 -1) body
      , assertBoundary "above" (Vec.vector 4 4.5 6) (Vec.vector 0 0 1) body
      , assertBoundary "north" (Vec.vector 4 5 4) (Vec.vector 0 1 0) body
      , assertBoundary "south" (Vec.vector 4 4 4) (Vec.vector 0 -1 0) body
      , assertBoundary "west" (Vec.vector 3 4.5 4) (Vec.vector -1 0 0) body
      , assertBoundary "east" (Vec.vector 5 4.5 4) (Vec.vector 1 0 0) body
      ]


assertBoundary : String -> Vector -> Vector -> Body -> Test
assertBoundary name position normal body =
  let
    delta =
      Vec.scale 1.0e-5 normal
  in
    suite
      name
      [ test "outside"
          <| assertEqual False
          <| isInside (Vec.add position delta) body
      , test "inside"
          <| assertEqual True
          <| isInside (Vec.sub position delta) body
      ]


stillBody : Vector -> Vector -> Body
stillBody position orientation =
  { position = position
  , orientation = orientation
  , velocity = Vec.vector 0 0 0
  , angVelocity = Vec.vector 0 0 0
  , hull = hull
  , ai = Nothing
  , health = 0
  }


hull : Hull
hull =
  Collision.hull
    identity
    [ ( Vec.vector 0 0 0, Vec.vector 1 0 0, Vec.vector 1 0 3 )
    , ( Vec.vector 0 0 0, Vec.vector 0 2 0, Vec.vector 1 2 0 )
    , ( Vec.vector 0 0 0, Vec.vector 0 0 3, Vec.vector 0 2 3 )
    , ( Vec.vector 1 2 3, Vec.vector 1 2 0, Vec.vector 0 2 0 )
    , ( Vec.vector 1 2 3, Vec.vector 0 2 3, Vec.vector 0 0 3 )
    , ( Vec.vector 1 2 3, Vec.vector 1 0 3, Vec.vector 1 0 0 )
    ]


delta : Float
delta =
  1.0e-5


port io : Signal (Task x ())
port io =
  Console.run (consoleRunner testSuite)
