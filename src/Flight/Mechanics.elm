module Flight.Mechanics exposing (evolveObject, glide, repeat, drain, timeDelta, playerId, position, velocity, orientation, angVelocity, composeDelta)

import Types exposing (..)
import Vector exposing (Vector)
import Quaternion exposing (Quaternion)
import Frame exposing (Frame)


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
    let
        angle =
            2 * acos deltaFrame.orientation.scalar

        axis =
            deltaFrame.orientation.vector

        orientationOffset =
            Quaternion.fromAxisAngle axis (dt * angle)
                |> Maybe.withDefault deltaFrame.orientation
    in
        { position =
            Vector.add
                (Vector.scale dt deltaFrame.position)
                frame.position
        , orientation =
            Quaternion.compose orientationOffset frame.orientation
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


position : Body -> Vector
position body =
    body.frame.position


velocity : Body -> Vector
velocity body =
    body.delta.position


orientation : Body -> Quaternion
orientation body =
    body.frame.orientation


angVelocity : Body -> Quaternion
angVelocity body =
    body.delta.orientation


composeDelta : Body -> Frame -> Frame
composeDelta parent childDelta =
    { position =
        childDelta.position
            |> Quaternion.rotateVector (orientation parent)
            |> Vector.add (velocity parent)
    , orientation =
        childDelta.orientation
    }


timeDelta : Float
timeDelta =
    1 / 60


playerId : Id
playerId =
    0
