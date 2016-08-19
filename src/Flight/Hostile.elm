module Flight.Hostile exposing (init, update, angleSpring, draw)

import Dict exposing (Dict)
import Color
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
            , trigger = { value = 0, decay = 0.3 }
            , status = LockingOn
            }
    , collisionClass = Solid
    }


update : Dict Id Body -> Id -> Body -> HostileCockpit -> ( Body, List EngineEffect )
update universe id actor cockpit =
    case Dict.get cockpit.target universe of
        Nothing ->
            ( Mechanics.glide actor, [] )

        Just target ->
            let
                facesTarget =
                    Transform.degreesFromForward actor target.position < degrees 1

                distance =
                    Vector.distance actor.position target.position

                damping =
                    case cockpit.status of
                        LockingOn ->
                            0.15

                        Fleeing ->
                            10

                newStatus =
                    if distance < 20 then
                        Fleeing
                    else if facesTarget || distance > 100 then
                        LockingOn
                    else
                        cockpit.status

                newAi =
                    Hostile
                        { cockpit
                            | trigger =
                                Mechanics.repeat Mechanics.delta
                                    facesTarget
                                    cockpit.trigger
                            , status = newStatus
                        }

                moved =
                    Mechanics.evolveObject (smartAccel damping target) actor

                effects =
                    if cockpit.trigger.value == 1 then
                        [ SpawnMissile id cockpit.target ]
                    else
                        []
            in
                ( { moved | ai = newAi }, effects )


smartAccel : Float -> Body -> Body -> Acceleration
smartAccel damping target object =
    let
        speed =
            30.0

        accel =
            100.0

        targetVelocity =
            Vector.vector 0 0 -speed
                |> Quaternion.rotateVector object.orientation
    in
        { linear =
            Vector.scale accel (Vector.sub targetVelocity object.velocity)
        , angular =
            angleSpring damping target.position object
                |> Vector.scale 3
                |> Quaternion.fromVector
        }


angleSpring : Float -> Vector -> Body -> Vector
angleSpring damping targetPosition body =
    let
        rotation =
            Transform.rotationFor (Vector.vector 0 0 -1)
                (Transform.toBodyFrame body targetPosition)
    in
        Vector.sub (Vector.scale (0.25 / damping) (Quaternion.toVector rotation))
            (Quaternion.toVector body.angVelocity)


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    [ Foreground.entity (Matte Color.purple)
        (Transform.toMat4 body)
        camera
        (Library.getMesh "Ship" library)
    ]
