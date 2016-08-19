module Flight.Seeking exposing (init, update, draw)

import Dict exposing (Dict)
import Color
import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Math.Transform as Transform
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


init : Library -> Body -> Id -> Body
init library parent target =
    { position = Transform.fromBodyFrame parent (Vector.vector 0 0 -3.5)
    , velocity =
        Vector.vector 0 0 -30
            |> Quaternion.rotateVector parent.orientation
            |> Vector.add parent.velocity
    , orientation = parent.orientation
    , angVelocity = Quaternion.identity
    , bounds = Library.getBounds "Missile" library
    , health = 1
    , ai = Seeking { lifespan = 3, target = target }
    , collisionClass = Blockable
    }


update : Dict Id Body -> Id -> Body -> MissileCockpit -> ( Body, List EngineEffect )
update universe id actor cockpit =
    if cockpit.lifespan > 0 then
        let
            moved =
                case Dict.get cockpit.target universe of
                    Nothing ->
                        Mechanics.glide actor

                    Just target ->
                        Mechanics.evolveObject (accelTowards 0.2 target)
                            actor

            agedCockpit =
                { cockpit | lifespan = cockpit.lifespan - Mechanics.delta }
        in
            ( { moved | ai = Seeking agedCockpit }, [] )
    else
        ( actor, [ Destroy id ] )


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
        , angular = Quaternion.identity
        }


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    [ Foreground.entity (Bright Color.red)
        (Transform.toMat4 body)
        camera
        (Library.getMesh "Missile" library)
    ]
