module Flight.PlayerBullet exposing (init, update, draw)

import Color
import Dict exposing (Dict)
import WebGL exposing (Renderable)
import Frame
import Vector
import Quaternion
import Types exposing (..)
import Library
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground
import Graphics.Material as Material


init : Library -> Body -> Body
init library parent =
    { frame =
        Frame.compose parent.frame
            { position = Vector.vector 0 -1.5 0
            , orientation = Quaternion.identity
            }
    , delta =
        Mechanics.composeDelta parent
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

        material =
            Material.bright Color.red
    in
        [ Foreground.entity material body.frame camera mesh ]
