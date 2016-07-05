module Main exposing (..)

import Task exposing (Task)
import Html
import Html.App
import WebGL exposing (Drawable)
import Generate.Json as Json exposing (..)
import Generate.Sphere as Sphere
import Generate.SimpleSphere as SimpleSphere
import Generate.Cluster as Cluster
import Generate.Ship as Ship
import Generate.Missile as Missile
import Generate.Explosion as Explosion
import Generate.Column as Column
import Generate.SimpleColumn as SimpleColumn
import Generate.Donut as Donut
import Generate.Cage as Cage
import Generate.OrthoVertex as OrthoVertex


{-
   models : List ( String, String )
   models =
       [ ( encodeMesh Cluster.mesh, "background.json" )
       , ( encodeMesh Explosion.mesh, "explosion.json" )
       , ( encodeModel Sphere.model, "sphere.json" )
       , ( encodeModel Ship.model, "ship.json" )
       , ( encodeModel Missile.model, "missile.json" )
       , ( encodeModel Column.model, "column.json" )
       , ( encodeModel Donut.model, "donut.json" )
       , ( encodeModel Cage.model, "cage.json" )
       , ( encodeModel OrthoVertex.model, "ortho-vertex.json" )
       , ( encodeBoundingBox Donut.model, "donut.box" )
       , ( encodeBoundingBox Ship.model, "ship.box" )
       , ( encodeBoundingBox SimpleSphere.model, "sphere.box" )
       , ( encodeBoundingBox Cage.model, "cage.box" )
       , ( encodeBoundingBox SimpleColumn.model, "column.box" )
       , ( encodeBoundingBox OrthoVertex.model, "ortho-vertex.box" )
       ]
-}


main : Program Never
main =
    Html.App.program
        { init = ( Nothing, Cmd.none )
        , update = \_ _ -> Nothing ! []
        , subscriptions = \_ -> Sub.none
        , view = \_ -> Html.text "Hello"
        }
