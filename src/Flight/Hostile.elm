module Flight.Hostile exposing (init, update, faces, angleSpring, draw)

import Dict exposing (Dict)
import Color
import Maybe.Extra as MaybeX
import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion
import Math.Transform as Transform
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


init : Library -> Placement -> Body
init library placement =
    { position = placement.position
    , orientation = placement.orientation
    , velocity = placement.velocity
    , angVelocity = placement.angVelocity
    , bounds = Library.getBounds "Ship" library
    , health = 1
    , ai =
        Hostile
            { target = Mechanics.playerId
            , trigger = { value = 0, decay = 4 }
            }
    , collisionClass = Solid
    }


update : Dict Id Body -> Id -> Body -> HostileCockpit -> ( Body, List EngineEffect )
update universe id actor cockpit =
    let
        newAi =
            Hostile
                { cockpit
                    | trigger =
                        Mechanics.repeat Mechanics.delta
                            (faces cockpit.target actor universe)
                            cockpit.trigger
                }

        moved =
            case Dict.get cockpit.target universe of
                Nothing ->
                    Mechanics.glide actor

                Just target ->
                    Mechanics.evolveObject (smartAccel target) actor

        effects =
            if cockpit.trigger.value == 1 then
                [ SpawnMissile id cockpit.target ]
            else
                []
    in
        ( { moved | ai = newAi }, effects )


smartAccel : Body -> Body -> Acceleration
smartAccel target object =
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

        targetVelocity =
            Vector.vector 0 0 -speed
                |> Quaternion.rotateVector object.orientation
    in
        { linear =
            Vector.scale accel (Vector.sub targetVelocity object.velocity)
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


faces : Id -> Body -> Dict Id Body -> Bool
faces targetId viewer universe =
    let
        inRange t =
            Transform.degreesFromForward viewer t.position < degrees 15
    in
        Dict.get targetId universe
            |> MaybeX.mapDefault False inRange


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    [ Foreground.entity (Matte Color.purple)
        (Transform.toMat4 body)
        camera
        (Library.getMesh "Ship" library)
    ]
