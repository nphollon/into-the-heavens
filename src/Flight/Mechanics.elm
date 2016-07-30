module Flight.Mechanics exposing (evolveObject, glide, repeat, drain)

import Types exposing (..)
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Flight.Util as Util


evolveObject : (Body -> Acceleration) -> Body -> Body
evolveObject acceleration object =
    let
        dt =
            Util.delta

        stateDerivative state =
            let
                accel =
                    acceleration state
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


glide : Body -> Body
glide body =
    let
        positionChange =
            Vector.scale Util.delta body.velocity

        orientationChange =
            Quaternion.fromVector body.angVelocity
                |> Quaternion.scale Util.delta
    in
        { body
            | position = Vector.add positionChange body.position
            , orientation = Quaternion.compose orientationChange body.orientation
        }


repeat : Float -> Bool -> RepeatSwitch -> RepeatSwitch
repeat dt isOn switch =
    let
        dv =
            dt / switch.decay
    in
        if switch.value > dv then
            { switch | value = switch.value - dv }
        else if isOn then
            { switch | value = 1 }
        else
            { switch | value = 0 }


drain : Float -> Bool -> DrainSwitch -> DrainSwitch
drain dt isOn switch =
    if isOn then
        { switch
            | value = max 0 (switch.value - dt / switch.decay)
            , on = dt < switch.value * switch.decay
        }
    else
        { switch
            | value = min 1 (switch.value + dt / switch.recover)
            , on = False
        }
