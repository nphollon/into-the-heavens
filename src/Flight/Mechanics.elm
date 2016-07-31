module Flight.Mechanics exposing (evolveObject, glide, repeat, drain, delta)

import Types exposing (..)
import Math.Vector as Vector
import Math.Quaternion as Quaternion


evolveObject : (Body -> Acceleration) -> Body -> Body
evolveObject acceleration object =
    let
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
            stateDerivative (nudge (delta / 2) a object)

        c =
            stateDerivative (nudge (delta / 2) b object)

        d =
            stateDerivative (nudge delta c object)
    in
        object
            |> nudge (delta / 6) a
            |> nudge (delta / 3) b
            |> nudge (delta / 3) c
            |> nudge (delta / 6) d


nudge : Float -> Body -> Body -> Body
nudge delta dpdelta p =
    { p
        | position =
            Vector.add p.position (Vector.scale delta dpdelta.position)
        , velocity =
            Vector.add p.velocity (Vector.scale delta dpdelta.velocity)
        , orientation =
            Quaternion.compose (Quaternion.scale delta dpdelta.orientation) p.orientation
        , angVelocity =
            Vector.add p.angVelocity (Vector.scale delta dpdelta.angVelocity)
    }


glide : Body -> Body
glide body =
    let
        positionChange =
            Vector.scale delta body.velocity

        orientationChange =
            Quaternion.fromVector body.angVelocity
                |> Quaternion.scale delta
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


delta : Float
delta =
    1 / 60
