module Finance exposing (init, wealth, pay, statLevel, nextLevel, upgrade)

import Dict exposing (Dict)


type alias Finance =
    { wealth : Money
    , stats :
        Dict String Stat
    }


type alias Stat =
    { timesUpgraded : Int
    , value : Float
    , upgrades : List ( Money, Float )
    }


type alias Money =
    Int


init : Dict String ( Float, List ( Money, Float ) ) -> Finance
init upgrades =
    { wealth = 0
    , stats = Dict.map initStat upgrades
    }


initStat : String -> ( Float, List ( Money, Float ) ) -> Stat
initStat _ ( value, upgrades ) =
    { timesUpgraded = 0
    , value = value
    , upgrades = upgrades
    }


wealth : Finance -> Money
wealth =
    .wealth


pay : Money -> Finance -> Finance
pay amount finance =
    { finance | wealth = finance.wealth + amount }


statLevel : String -> Finance -> Maybe { timesUpgraded : Int, value : Float }
statLevel statName finance =
    case Dict.get statName finance.stats of
        Nothing ->
            Nothing

        Just stat ->
            Just
                { timesUpgraded = stat.timesUpgraded
                , value = stat.value
                }


nextLevel : String -> Finance -> Maybe { price : Money, value : Float }
nextLevel statName finance =
    Dict.get statName finance.stats
        |> Maybe.map .upgrades
        |> andThen List.head
        |> Maybe.map (\( price, value ) -> { price = price, value = value })


andThen : (a -> Maybe b) -> Maybe a -> Maybe b
andThen =
    flip Maybe.andThen


upgrade : String -> Finance -> Maybe Finance
upgrade statName finance =
    case Dict.get statName finance.stats of
        Nothing ->
            Nothing

        Just stat ->
            case stat.upgrades of
                [] ->
                    Nothing

                ( price, newValue ) :: remaining ->
                    if finance.wealth < price then
                        Nothing
                    else
                        let
                            newStat =
                                { timesUpgraded = stat.timesUpgraded + 1
                                , value = newValue
                                , upgrades = remaining
                                }
                        in
                            Just
                                { finance
                                    | wealth = finance.wealth - price
                                    , stats = Dict.insert statName newStat finance.stats
                                }
