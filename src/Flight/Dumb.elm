module Flight.Dumb exposing (update, draw)

import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


update : Body -> ( Body, List EngineEffect )
update actor =
    ( Mechanics.glide actor, [] )


draw : Camera -> Library -> Body -> Appearance -> List Renderable
draw camera library body appearance =
    let
        mesh =
            Library.getMesh appearance.meshName library
    in
        [ Foreground.entity appearance.material body.frame camera mesh ]
