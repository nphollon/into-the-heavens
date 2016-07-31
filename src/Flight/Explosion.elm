module Flight.Explosion exposing (update)

import Types exposing (..)
import Flight.Mechanics as Mechanics


update : Id -> Body -> Float -> ( Body, List EngineEffect )
update id actor lifespan =
    if lifespan > 0 then
        ( Mechanics.glide { actor | ai = Waiting (lifespan - Mechanics.delta) }, [] )
    else
        ( actor, [ Destroy id ] )
