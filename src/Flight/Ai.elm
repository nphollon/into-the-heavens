module Flight.Ai exposing (acceleration, angleSpring)

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion
import Math.Transform as Transform


acceleration : Dict Id Body -> Body -> Acceleration
acceleration universe object =
    case object.ai of
        Dumb ->
            noAcceleration

        Hostile ai ->
            case Dict.get ai.target universe of
                Nothing ->
                    noAcceleration

                Just target ->
                    smartAccel object target

        PlayerControlled cockpit ->
            accelFromAction cockpit.action object

        Seeking _ targetName ->
            case Dict.get targetName universe of
                Just target ->
                    accelTowards 0.7 target object

                Nothing ->
                    noAcceleration

        Waiting _ ->
            noAcceleration


smartAccel : Body -> Body -> Acceleration
smartAccel object target =
    let
        relativePosition =
            Vector.sub target.position object.position

        relativeVelocity =
            Vector.sub target.velocity object.velocity

        scale =
            1.0

        damping =
            0.3

        max m v =
            let
                mag =
                    Vector.length v
            in
                if mag > m then
                    Vector.scale (m / mag) v
                else
                    v
    in
        { linear =
            Vector.scale (0.25 / damping) relativePosition
                |> Vector.add relativeVelocity
                |> Vector.scale scale
                |> max 10
        , angular =
            angleSpring 0.5 target.position object
                |> Vector.scale 3
        }


angleSpring : Float -> Vector -> Body -> Vector
angleSpring damping targetPosition body =
    let
        rotation =
            Transform.rotationFor (Vector.vector 0 0 -1)
                (Transform.toBodyFrame body targetPosition)
    in
        Vector.sub (Vector.scale (0.25 / damping) (Quaternion.toVector rotation))
            body.angVelocity


accelFromAction : Action -> Body -> Acceleration
accelFromAction action object =
    let
        turningSpeed =
            2.0

        turningAccel =
            5.0

        speed =
            5.0

        accel =
            5.0

        goOrStop dir vel =
            turningAccel * (turningSpeed * toFloat dir - vel)

        targetSpeed =
            speed * (1 + toFloat action.thrust)

        targetVelocity =
            Vector.vector 0 0 -targetSpeed
                |> Quaternion.rotateVector object.orientation
    in
        { linear =
            Vector.scale accel (Vector.sub targetVelocity object.velocity)
        , angular =
            Vector.vector (goOrStop action.pitch (Vector.getX object.angVelocity))
                (goOrStop action.yaw (Vector.getY object.angVelocity))
                (goOrStop action.roll (Vector.getZ object.angVelocity))
        }


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


noAcceleration : Acceleration
noAcceleration =
    { linear = Vector.vector 0 0 0
    , angular = Vector.vector 0 0 0
    }
