module Flight.Dumb exposing (update, draw)

import WebGL exposing (Renderable)
import Types exposing (..)
import Library
import Math.Transform as Transform
import Flight.Mechanics as Mechanics
import Graphics.Foreground as Foreground


update : Body -> ( Body, List EngineEffect )
update actor =
    ( Mechanics.glide actor, [] )


draw : Camera -> Library -> Body -> { meshName : String, shader : ShaderType } -> List Renderable
draw camera library body { meshName, shader } =
    [ Foreground.entity shader
        (Transform.toMat4 body)
        camera
        (Library.getMesh meshName library)
    ]
