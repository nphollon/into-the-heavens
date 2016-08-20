module Flight.Mechanics exposing (evolveObject, glide, repeat, drain, timeDelta, playerId)

import Types exposing (..)
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Math.Frame exposing (Frame)


evolveObject : (Body -> Frame) -> Body -> Body
evolveObject acceleration object =
    let
        stateDerivative state =
            { state
                | frame = state.delta
                , delta = acceleration state
            }

        a =
            stateDerivative object

        b =
            stateDerivative (nudge (timeDelta / 2) a object)

        c =
            stateDerivative (nudge (timeDelta / 2) b object)

        d =
            stateDerivative (nudge timeDelta c object)
    in
        object
            |> nudge (timeDelta / 6) a
            |> nudge (timeDelta / 3) b
            |> nudge (timeDelta / 3) c
            |> nudge (timeDelta / 6) d


nudge : Float -> Body -> Body -> Body
nudge dt dpdt p =
    { p
        | frame = nudgeFrame dt dpdt.frame p.frame
        , delta = nudgeFrame dt dpdt.delta p.delta
    }


nudgeFrame : Float -> Frame -> Frame -> Frame
nudgeFrame dt deltaFrame frame =
    { position =
        Vector.add
            (Vector.scale dt deltaFrame.position)
            frame.position
    , orientation =
        Quaternion.compose
            (Quaternion.scale dt deltaFrame.orientation)
            frame.orientation
    }


glide : Body -> Body
glide body =
    { body | frame = nudgeFrame timeDelta body.delta body.frame }


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


timeDelta : Float
timeDelta =
    1 / 60


playerId : Id
playerId =
    0
