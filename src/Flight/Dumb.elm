module Flight.Dumb exposing (update)

import Types exposing (..)
import Flight.Mechanics as Mechanics


update : Body -> ( Body, List EngineEffect )
update actor =
    ( Mechanics.glide actor, [] )
