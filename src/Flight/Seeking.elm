module Flight.Seeking exposing (init, update, draw)

import Dict exposing (Dict)
import Color
import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Math.Frame as Frame exposing (Frame)
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground
import Graphics.Material as Material


init : Library -> Body -> Id -> Body
init library parent target =
    { frame =
        Frame.compose parent.frame
            { position = Vector.vector 0 0 -3.5
            , orientation = Quaternion.identity
            }
    , delta =
        Frame.composeDelta parent
            { position = Vector.vector 0 0 -30
            , orientation = Quaternion.identity
            }
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
                { cockpit | lifespan = cockpit.lifespan - Mechanics.timeDelta }
        in
            ( { moved | ai = Seeking agedCockpit }, [] )
    else
        ( actor, [ Destroy id ] )


accelTowards : Float -> Body -> Body -> Frame
accelTowards scale target missile =
    let
        range =
            Vector.sub (Frame.position target) (Frame.position missile)

        velocity =
            Vector.sub (Frame.velocity target) (Frame.velocity missile)

        rSquared =
            Vector.distanceSquared (Frame.position target) (Frame.position missile)

        lineOfSightRotation =
            Vector.scale (scale / rSquared) (Vector.cross range velocity)
    in
        { position = Vector.cross velocity lineOfSightRotation
        , orientation = Quaternion.identity
        }


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    let
        mesh =
            Library.getMesh "Missile" library

        material =
            Material.bright Color.red
    in
        [ Foreground.entity material body.frame camera mesh ]
