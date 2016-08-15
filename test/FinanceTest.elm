module FinanceTest exposing (testSuite)

import ElmTest exposing (..)
import Dict
import Finance


testSuite : Test
testSuite =
    suite "Finance & Upgrade system"
        [ initializing
        , paying
        , upgrading
        , extractingStats
        ]


initializing : Test
initializing =
    let
        upgrades =
            Dict.singleton "speed" ( 0.3, [ ( 20, 0.5 ), ( 30, 0.7 ) ] )

        finances =
            Finance.init upgrades
    in
        suite "Initial finances"
            [ test "wealth is zero" <|
                assertEqual 0
                    (Finance.wealth finances)
            , test "speed has been upgraded zero times and has value 0.3" <|
                assertEqual
                    (Just
                        { timesUpgraded = 0
                        , value = 0.3
                        }
                    )
                    (Finance.statLevel "speed" finances)
            , test "non-existent upgrade has no upgrade count" <|
                assertEqual Nothing
                    (Finance.statLevel "hunger" finances)
            , test "next upgrade for speed costs $20 and has value 0.5" <|
                assertEqual
                    (Just
                        { price = 20
                        , value = 0.5
                        }
                    )
                    (Finance.nextLevel "speed" finances)
            ]


paying : Test
paying =
    let
        finances =
            Finance.init Dict.empty
    in
        suite "Receiving payment"
            [ test "initial payment of 10 increases wealth to 10" <|
                assertEqual 10
                    (Finance.wealth (Finance.pay 10 finances))
            , test "$10 + $6 = $16" <|
                assertEqual 16
                    (finances |> Finance.pay 10 |> Finance.pay 6 |> Finance.wealth)
              -- what should happen if we pass a negative amount?
            ]


upgrading : Test
upgrading =
    let
        upgrades =
            Dict.fromList
                [ ( "speed", ( 0.3, [ ( 20, 0.5 ), ( 30, 0.7 ) ] ) )
                , ( "health", ( 2, [ ( 100, 3 ) ] ) )
                ]

        finances =
            Finance.init upgrades
                |> Finance.pay 50
    in
        suite "Purchasing upgrades"
            [ test "cannot upgrade non-existent stat" <|
                assertEqual Nothing
                    (Finance.upgrade "temperature" finances)
            , test "cannot upgrade stat if not enough wealth" <|
                assertEqual Nothing
                    (Finance.upgrade "health" finances)
            , test "one speed upgrade deducts $20 from bank" <|
                assertEqual (Just 30)
                    (Finance.upgrade "speed" finances
                        |> Maybe.map Finance.wealth
                    )
            , test "one speed upgrade sets value to 0.5 and increments upgrade count" <|
                assertEqual
                    (Just
                        { timesUpgraded = 1
                        , value = 0.5
                        }
                    )
                    (Finance.upgrade "speed" finances
                        |> andThen (Finance.statLevel "speed")
                    )
            , test "one speed upgrade shortens the list of remaining upgrades" <|
                assertEqual
                    (Just
                        { price = 30
                        , value = 0.7
                        }
                    )
                    (Finance.upgrade "speed" finances
                        |> andThen (Finance.nextLevel "speed")
                    )
            , test "two speed upgrades sets value to 0.7 and increments upgrade count" <|
                assertEqual
                    (Just
                        { timesUpgraded = 2
                        , value = 0.7
                        }
                    )
                    (Finance.upgrade "speed" finances
                        |> andThen (Finance.upgrade "speed")
                        |> andThen (Finance.statLevel "speed")
                    )
            , test "one health upgrade deducts $100 from bank" <|
                assertEqual (Just 50)
                    (Finance.pay 100 finances
                        |> Finance.upgrade "health"
                        |> Maybe.map Finance.wealth
                    )
            , test "one health upgrade empties the list of remaining upgrades" <|
                assertEqual Nothing
                    (Finance.pay 100 finances
                        |> Finance.upgrade "health"
                        |> andThen (Finance.nextLevel "health")
                    )
            , test "cannot upgrade stat if no upgrades are left" <|
                assertEqual Nothing
                    (Finance.pay 100 finances
                        |> Finance.upgrade "health"
                        |> andThen (Finance.upgrade "health")
                    )
            , test "upgrading one stat leaves others unchanged" <|
                assertEqual
                    (Just
                        { timesUpgraded = 0
                        , value = 2
                        }
                    )
                    (Finance.upgrade "speed" finances
                        |> andThen (Finance.statLevel "health")
                    )
            ]


extractingStats : Test
extractingStats =
    suite "Getting character stats"
        []


andThen : (a -> Maybe b) -> Maybe a -> Maybe b
andThen =
    flip Maybe.andThen
