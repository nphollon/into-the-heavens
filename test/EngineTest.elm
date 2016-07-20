module EngineTest exposing (testSuite)

import ElmTest exposing (..)
import Dict exposing (Dict)
import Collision exposing (Bounds)
import Types exposing (..)
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
        suite "Crash rules"
            [ test "no collision, no effects"
                <| assertEqual []
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.missile, missile 1 )
                    , ( ids.visitor, object 1 "farHull" )
                    ]
            , test "missiles ignore each other"
                <| assertEqual []
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.missileA, missile 1 )
                    , ( ids.missileB, missile 1 )
                    ]
            , test "1 HP missile deducts 1 HP from ship"
                <| assertEqual
                    [ Destroy ids.missile
                    , DeductHealth 1 ids.visitor
                    ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.missile, missile 1 )
                    , ( ids.visitor, object 1 "hitHull" )
                    ]
            , test "2 HP missile deducts 2 HP from ship"
                <| assertEqual
                    [ Destroy ids.missile
                    , DeductHealth 2 ids.visitor
                    ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.missile, missile 2 )
                    , ( ids.visitor, object 1 "hitHull" )
                    ]
            , test "shielded ship is protected from missile"
                <| assertEqual [ Destroy ids.missile ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.missile, missile 1 )
                    , ( ids.visitor, shielded 1 "hitHull" )
                    ]
            , test "ships deduct their health from each other"
                <| assertEqual
                    [ DeductHealth 3 ids.smallShip
                    , DeductHealth 2 ids.bigShip
                    ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.smallShip, object 2 "outHull" )
                    , ( ids.bigShip, object 3 "hitHull" )
                    ]
            , test "ships colliding ignore shields"
                <| assertEqual
                    [ DeductHealth 3 ids.unshielded
                    , DeductHealth 2 ids.shielded
                    ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.unshielded, object 2 "outHull" )
                    , ( ids.shielded, shielded 3 "hitHull" )
                    ]
            , test "ship collisions are commutative"
                <| assertEqual
                    [ DeductHealth 3 ids.first
                    , DeductHealth 3 ids.second
                    ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.first, shielded 3 "outHull" )
                    , ( ids.second, object 3 "hitHull" )
                    ]
            , test "accumulate effects from multiple collisions"
                <| assertEqual
                    [ Destroy ids.missileB
                    , Destroy ids.missileA
                    ]
                <| shouldCrash
                <| Dict.fromList
                    [ ( ids.missileA, missile 1 )
                    , ( ids.missileB, missile 1 )
                    , ( ids.visitor, shielded 1 "hitHull" )
                    ]
            ]


missile : Float -> Body
missile x =
    { defaultBody
        | health = x
        , bounds = getBounds "hitHull"
        , isMissile = True
    }


object : Float -> String -> Body
object x hull =
    { defaultBody
        | health = x
        , bounds = getBounds hull
    }


shielded : Float -> String -> Body
shielded x hull =
    { defaultBody
        | health = x
        , bounds = getBounds hull
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


getBounds : String -> Bounds
getBounds name =
    Dict.get name boxLibrary |> Maybe.withDefault Collision.empty


boxLibrary : Dict String Bounds
boxLibrary =
    Dict.fromList
        [ ( "hitHull"
          , Collision.create
                [ Collision.face (Collision.vector 2 1 0)
                    (Collision.vector -2 1 0)
                    (Collision.vector -2 -2 0)
                ]
          )
        , ( "outHull"
          , Collision.create
                [ Collision.face (Collision.vector 1 2 1)
                    (Collision.vector 1 2 -1)
                    (Collision.vector 1 -2 -1)
                ]
          )
        , ( "farHull"
          , Collision.create
                [ Collision.face (Collision.vector 2 1 100)
                    (Collision.vector -2 1 100)
                    (Collision.vector -2 -2 100)
                ]
          )
        , ( "Missile"
          , Collision.create
                [ Collision.face (Collision.vector 0 1 1)
                    (Collision.vector 0 1 -1)
                    (Collision.vector 0 -1 -1)
                ]
          )
        ]
