module Flight.Mechanics exposing (evolveObject, glide, repeat, drain, delta, playerId)

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
                    , orientation = state.angVelocity
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
            Vector.add (Vector.scale delta dpdelta.position)
                p.position
        , velocity =
            Vector.add (Vector.scale delta dpdelta.velocity)
                p.velocity
        , orientation =
            Quaternion.compose
                (Quaternion.scale delta dpdelta.orientation)
                p.orientation
        , angVelocity =
            Quaternion.compose
                (Quaternion.scale delta dpdelta.angVelocity)
                p.angVelocity
    }


glide : Body -> Body
glide body =
    let
        positionChange =
            Vector.scale delta body.velocity

        orientationChange =
            Quaternion.scale delta body.angVelocity
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


playerId : Id
playerId =
    0
