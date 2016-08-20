module Flight.PlayerBullet exposing (init, update, draw)

import Color
import Dict exposing (Dict)
import WebGL exposing (Renderable)
import Types exposing (..)
import Math.Frame as Frame
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Library
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


init : Library -> Body -> Body
init library parent =
    { frame =
        Frame.compose parent.frame
            { position = Vector.vector 0 -1.5 0
            , orientation = Quaternion.identity
            }
    , delta =
        Frame.composeDelta parent
            { position = Vector.vector 0 0 -100
            , orientation = Quaternion.identity
            }
    , bounds = Library.getBounds "Bullet" library
    , health = 1
    , ai = PlayerBullet 3
    , collisionClass = Blockable
    }


update : Dict Id Body -> Id -> Body -> Float -> ( Body, List EngineEffect )
update universe id actor lifespan =
    if lifespan > 0 then
        ( Mechanics.glide { actor | ai = PlayerBullet (lifespan - Mechanics.timeDelta) }
        , []
        )
    else
        ( actor, [ Destroy id ] )


draw : Camera -> Library -> Body -> List Renderable
draw camera library body =
    let
        mesh =
            Library.getMesh "Missile" library
    in
        [ Foreground.entity (Bright Color.red) body.frame camera mesh ]
