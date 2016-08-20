module Flight.Dumb exposing (update, draw)

import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


update : Body -> ( Body, List EngineEffect )
update actor =
    ( Mechanics.glide actor, [] )


draw : Camera -> Library -> Body -> { meshName : String, shader : ShaderType } -> List Renderable
draw camera library body { meshName, shader } =
    let
        mesh =
            Library.getMesh meshName library
    in
        [ Foreground.entity shader body.frame camera mesh ]
