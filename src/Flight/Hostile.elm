module Flight.Hostile exposing (init, update, angleSpring, draw)

import Dict exposing (Dict)
import Color
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion
import Math.Transform as Transform
import Flight.Util as Util
import Flight.Mechanics as Mechanics
import Flight.Spawn as Spawn
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
            { target = Spawn.playerId
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
                        Mechanics.repeat Util.delta
                            (Util.faces cockpit.target actor universe)
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


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    [ Foreground.entity (Matte Color.purple)
        (placement body)
        camera
        (Library.getMesh "Ship" library)
    ]


placement : Body -> Mat4
placement body =
    Mat4.mul (Mat4.makeTranslate (Vector.toVec3 body.position))
        (Quaternion.toMat4 body.orientation)
