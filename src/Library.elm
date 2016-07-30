module Library exposing (getBounds, getMesh)

import Dict
import WebGL exposing (Drawable(..))
import Collision exposing (Bounds)
import Types exposing (..)


getBounds : String -> Library -> Bounds
getBounds name library =
    Dict.get name library.boxes |> Maybe.withDefault Collision.empty


getMesh : String -> Library -> Drawable Vertex
getMesh name library =
    Dict.get name library.meshes |> Maybe.withDefault (Triangle [])
