module Level exposing (data, update)

import Types exposing (..)
import Level.FlightTest


data : Level -> Library -> LevelData
data level library =
    case level of
        SimplePlatform ->
            Level.FlightTest.data library


update : GameState -> ( MissionStatus, List EngineEffect )
update model =
    case model.level of
        SimplePlatform ->
            Level.FlightTest.update model
