module Flight.Hostile exposing (init, update, angleSpring, draw)

import Dict exposing (Dict)
import Color
import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Vector exposing (Vector)
import Quaternion
import Frame exposing (Frame)
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground
import Graphics.Material as Material


init : Library -> Frame -> Frame -> Body
init library frame delta =
    { frame = frame
    , delta = delta
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
                    bearing actor target < degrees 1

                distance =
                    Vector.distance
                        (Mechanics.position actor)
                        (Mechanics.position target)

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
                                Mechanics.repeat Mechanics.timeDelta
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


smartAccel : Float -> Body -> Body -> Frame
smartAccel damping target object =
    let
        speed =
            30.0

        accel =
            100.0

        targetVelocity =
            Vector.vector 0 0 -speed
                |> Quaternion.rotate (Mechanics.orientation object)
    in
        { position =
            Mechanics.velocity object
                |> Vector.sub targetVelocity
                |> Vector.scale accel
        , orientation =
            angleSpring damping (Mechanics.position target) object
                |> Quaternion.fromVector
        }


angleSpring : Float -> Vector -> Body -> Vector
angleSpring damping targetPosition body =
    let
        rotation =
            Quaternion.rotationFor (Vector.vector 0 0 -1)
                (Frame.transformInto body.frame targetPosition)
    in
        Vector.sub (Vector.scale (0.25 / damping) (Quaternion.toVector rotation))
            (Quaternion.toVector (Mechanics.angVelocity body))


bearing : Body -> Body -> Float
bearing viewer target =
    Frame.transformInto viewer.frame (Mechanics.position target)
        |> Vector.normalize
        |> Maybe.map (Vector.dot (Vector.vector 0 0 -1) >> acos)
        |> Maybe.withDefault 0


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    let
        mesh =
            Library.getMesh "Ship" library

        material =
            Material.matte Color.purple
    in
        [ Foreground.entity material body.frame camera mesh ]
