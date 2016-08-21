module Flight.Mechanics exposing (evolveObject, glide, repeat, drain, timeDelta, playerId)

import Types exposing (..)
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Math.Frame exposing (Frame)


evolveObject : (Body -> Frame) -> Body -> Body
evolveObject acceleration object =
    { object
        | frame = nudgeFrame timeDelta object.delta object.frame
        , delta = nudgeFrame timeDelta (acceleration object) object.delta
    }


glide : Body -> Body
glide body =
    { body | frame = nudgeFrame timeDelta body.delta body.frame }


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
