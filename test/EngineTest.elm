module EngineTest (testSuite) where

import ElmTest exposing (..)
import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vec
import Math.Collision as Collision
import Flight.Init exposing (defaultBody, defaultCockpit)
import Flight.Engine exposing (..)


testSuite : Test
testSuite =
  suite
    "Crash rules"
    [ test "No collision, no effects"
        <| assertEqual
            []
        <| shouldCrash
        <| Dict.fromList
            [ ( "missile", missile 1 )
            , ( "visitor", object 1 farHull )
            ]
    , test "Missiles ignore each other"
        <| assertEqual
            []
        <| shouldCrash
        <| Dict.fromList
            [ ( "missile A", missile 1 )
            , ( "missile B", missile 1 )
            ]
    , test "1 HP missile deducts 1 HP from ship"
        <| assertEqual
            [ Destroy "missile"
            , DeductHealth 1 "visitor"
            ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "missile", missile 1 )
            , ( "visitor", object 1 hitHull )
            ]
    , test "2 HP missile deducts 2 HP from ship"
        <| assertEqual
            [ Destroy "missile"
            , DeductHealth 2 "visitor"
            ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "missile", missile 2 )
            , ( "visitor", object 1 hitHull )
            ]
    , test "shielded ship is protected from missile"
        <| assertEqual
            [ Destroy "missile" ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "missile", missile 1 )
            , ( "visitor", shielded 1 hitHull )
            ]
    , test "ships deduct their health from each other"
        <| assertEqual
            [ DeductHealth 3 "small ship"
            , DeductHealth 2 "big ship"
            ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "small ship", object 2 outHull )
            , ( "big ship", object 3 hitHull )
            ]
    , test "ships colliding ignore shields"
        <| assertEqual
            [ DeductHealth 3 "unshielded"
            , DeductHealth 2 "shielded"
            ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "unshielded", object 2 outHull )
            , ( "shielded", shielded 3 hitHull )
            ]
    , test "ship collisions are commutative"
        <| assertEqual
            [ DeductHealth 3 "first"
            , DeductHealth 3 "second"
            ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "first", shielded 3 outHull )
            , ( "second", object 3 hitHull )
            ]
    , test "Accumulate effects from multiple collisions"
        <| assertEqual
            [ Destroy "missile B"
            , Destroy "missile A"
            ]
        <| shouldCrash
        <| Dict.fromList
            [ ( "missile A", missile 1 )
            , ( "missile B", missile 1 )
            , ( "visitor", shielded 1 hitHull )
            ]
    ]


missile : Float -> Body
missile x =
  { defaultBody | health = x }


object : Float -> Hull -> Body
object x hull =
  { defaultBody
    | health = x
    , hull = hull
  }


shielded : Float -> Hull -> Body
shielded x hull =
  { defaultBody
    | health = x
    , hull = hull
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


hitHull : Hull
hitHull =
  Collision.hull
    identity
    [ ( Vec.vector 0 0 1, Vec.vector 1 0 1, Vec.vector 0 1 1 ) ]


outHull : Hull
outHull =
  Collision.hull
    identity
    [ ( Vec.vector 1 1 0, Vec.vector 1 0 0, Vec.vector 1 0 1 ) ]


farHull : Hull
farHull =
  Collision.hull
    identity
    [ ( Vec.vector 0 0 -1, Vec.vector 1 0 -1, Vec.vector 0 1 -1 ) ]
