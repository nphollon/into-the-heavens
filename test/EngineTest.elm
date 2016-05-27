module EngineTest (testSuite) where

import ElmTest exposing (..)
import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vec
import Math.BoundingBox as BoundingBox exposing (BoundingBox)
import Math.Tree as Tree exposing (Tree(..))
import Flight.Spawn exposing (defaultBody, defaultCockpit)
import Flight.Engine exposing (..)


testSuite : Test
testSuite =
  let
    ids =
      { missile = 1
      , visitor = 2
      , missileA = 3
      , missileB = 4
      , smallShip = 5
      , bigShip = 6
      , unshielded = 7
      , shielded = 8
      , first = 9
      , second = 10
      , checkpoint = 11
      }
  in
    suite
      "Crash rules"
      [ test "no collision, no effects"
          <| assertEqual
              []
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.missile, missile 1 )
              , ( ids.visitor, object 1 "farHull" )
              ]
      , test "missiles ignore each other"
          <| assertEqual
              []
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.missileA, missile 1 )
              , ( ids.missileB, missile 1 )
              ]
      , test "1 HP missile deducts 1 HP from ship"
          <| assertEqual
              [ Destroy ids.missile
              , DeductHealth 1 ids.visitor
              ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.missile, missile 1 )
              , ( ids.visitor, object 1 "hitHull" )
              ]
      , test "2 HP missile deducts 2 HP from ship"
          <| assertEqual
              [ Destroy ids.missile
              , DeductHealth 2 ids.visitor
              ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.missile, missile 2 )
              , ( ids.visitor, object 1 "hitHull" )
              ]
      , test "shielded ship is protected from missile"
          <| assertEqual
              [ Destroy ids.missile ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.missile, missile 1 )
              , ( ids.visitor, shielded 1 "hitHull" )
              ]
      , test "ships deduct their health from each other"
          <| assertEqual
              [ DeductHealth 3 ids.smallShip
              , DeductHealth 2 ids.bigShip
              ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.smallShip, object 2 "outHull" )
              , ( ids.bigShip, object 3 "hitHull" )
              ]
      , test "ships colliding ignore shields"
          <| assertEqual
              [ DeductHealth 3 ids.unshielded
              , DeductHealth 2 ids.shielded
              ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.unshielded, object 2 "outHull" )
              , ( ids.shielded, shielded 3 "hitHull" )
              ]
      , test "ship collisions are commutative"
          <| assertEqual
              [ DeductHealth 3 ids.first
              , DeductHealth 3 ids.second
              ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.first, shielded 3 "outHull" )
              , ( ids.second, object 3 "hitHull" )
              ]
      , test "accumulate effects from multiple collisions"
          <| assertEqual
              [ Destroy ids.missileB
              , Destroy ids.missileA
              ]
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.missileA, missile 1 )
              , ( ids.missileB, missile 1 )
              , ( ids.visitor, shielded 1 "hitHull" )
              ]
      , test "ethereal objects do not collide"
          <| assertEqual
              []
          <| shouldCrash boxLibrary
          <| Dict.fromList
              [ ( ids.checkpoint, checkpoint )
              , ( ids.visitor, object 1 "hitHull" )
              ]
      ]


missile : Float -> Body
missile x =
  { defaultBody
    | health = x
    , bounds =
        Just "Missile"
  }


object : Float -> String -> Body
object x hull =
  { defaultBody
    | health = x
    , bounds = Just hull
  }


shielded : Float -> String -> Body
shielded x hull =
  { defaultBody
    | health = x
    , bounds = Just hull
    , ai =
        PlayerControlled
          { defaultCockpit
            | shields =
                { value = 0
                , decay = 1
                , recover = 1
                , on = True
                }
          }
  }


checkpoint : Body
checkpoint =
  { defaultBody | bounds = Nothing }


boxLibrary =
  Dict.fromList
    [ ( "hitHull"
      , Leaf
          { a = 2
          , b = 2
          , c = 2
          , position = Vec.vector 0 0 1
          , orientation = Vec.vector 0 0 0
          }
      )
    , ( "outHull"
      , Leaf
          { a = 2
          , b = 2
          , c = 2
          , position = Vec.vector 0 0 3
          , orientation = Vec.vector 0 0 0
          }
      )
    , ( "farHull"
      , Leaf
          { a = 2
          , b = 2
          , c = 2
          , position = Vec.vector 0 0 10
          , orientation = Vec.vector 0 0 0
          }
      )
    , ( "Missile"
      , Leaf
          { a = 0
          , b = 0
          , c = 0
          , position = Vec.vector 0 0 0
          , orientation = Vec.vector 0 0 0
          }
      )
    ]
