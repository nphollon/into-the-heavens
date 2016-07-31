module Flight.Seeking exposing (update)

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector
import Flight.Mechanics as Mechanics


update : Dict Id Body -> Id -> Body -> MissileCockpit -> ( Body, List EngineEffect )
update universe id actor cockpit =
    if cockpit.lifespan > 0 then
        let
            moved =
                case Dict.get cockpit.target universe of
                    Nothing ->
                        Mechanics.glide actor

                    Just target ->
                        Mechanics.evolveObject (accelTowards 0.7 target)
                            actor

            agedCockpit =
                { cockpit | lifespan = cockpit.lifespan - Mechanics.delta }
        in
            ( { moved | ai = Seeking agedCockpit }, [] )
    else
        ( actor, [ Destroy id ] )


accelTowards : Float -> Body -> Body -> Acceleration
accelTowards scale target missile =
    let
        range =
            Vector.sub target.position missile.position

        velocity =
            Vector.sub target.velocity missile.velocity

        rSquared =
            Vector.distanceSquared target.position missile.position

        lineOfSightRotation =
            Vector.scale (scale / rSquared) (Vector.cross range velocity)
    in
        { linear = Vector.cross velocity lineOfSightRotation
        , angular = Vector.vector 0 0 0
        }
