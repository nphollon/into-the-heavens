module Flight.Mechanics exposing (evolve)

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Flight.Ai as Ai
import Flight.Util as Util


evolve : Dict Id Body -> Dict Id Body
evolve universe =
    Dict.map (\k v -> evolveObject universe v) universe


evolveObject : Dict Id Body -> Body -> Body
evolveObject universe object =
    let
        dt =
            Util.delta

        stateDerivative state =
            let
                accel =
                    Ai.acceleration universe state
            in
                { state
                    | position = state.velocity
                    , velocity = accel.linear
                    , orientation = Quaternion.fromVector state.angVelocity
                    , angVelocity = accel.angular
                }

        a =
            stateDerivative object

        b =
            stateDerivative (nudge (dt / 2) a object)

        c =
            stateDerivative (nudge (dt / 2) b object)

        d =
            stateDerivative (nudge dt c object)
    in
        object
            |> nudge (dt / 6) a
            |> nudge (dt / 3) b
            |> nudge (dt / 3) c
            |> nudge (dt / 6) d


nudge : Float -> Body -> Body -> Body
nudge dt dpdt p =
    { p
        | position =
            Vector.add p.position (Vector.scale dt dpdt.position)
        , velocity =
            Vector.add p.velocity (Vector.scale dt dpdt.velocity)
        , orientation =
            Quaternion.compose (Quaternion.scale dt dpdt.orientation) p.orientation
        , angVelocity =
            Vector.add p.angVelocity (Vector.scale dt dpdt.angVelocity)
    }
