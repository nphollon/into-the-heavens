module Flight.PlayerBullet exposing (init, update, draw)

import Color
import Dict exposing (Dict)
import WebGL exposing (Renderable)
import Types exposing (..)
import Math.Transform as Transform
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Library
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


init : Library -> Body -> Body
init library parent =
    { position = Transform.fromBodyFrame parent (Vector.vector 0 -1.5 0)
    , velocity =
        Vector.vector 0 0 -100
            |> Quaternion.rotateVector parent.orientation
            |> Vector.add parent.velocity
    , orientation = parent.orientation
    , angVelocity = Vector.vector 0 0 0
    , bounds = Library.getBounds "Bullet" library
    , health = 1
    , ai = PlayerBullet 3
    , collisionClass = Friendly
    }


update : Dict Id Body -> Id -> Body -> Float -> ( Body, List EngineEffect )
update universe id actor lifespan =
    if lifespan > 0 then
        ( Mechanics.glide { actor | ai = PlayerBullet (lifespan - Mechanics.delta) }
        , []
        )
    else
        ( actor, [ Destroy id ] )


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    [ Foreground.entity (Bright Color.red)
        (Transform.toMat4 body)
        camera
        (Library.getMesh "Missile" library)
    ]
