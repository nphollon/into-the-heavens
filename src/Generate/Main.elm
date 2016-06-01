module Main (..) where

import Task exposing (Task)
import Console exposing (IO, (>>>))
import WebGL exposing (Drawable)
import Generate.Json as Json exposing (..)
import Generate.Sphere as Sphere
import Generate.SimpleSphere as SimpleSphere
import Generate.Cluster as Cluster
import Generate.Ship as Ship
import Generate.Missile as Missile
import Generate.Explosion as Explosion
import Generate.Column as Column
import Generate.Donut as Donut
import Generate.Cage as Cage


writeModels : IO ()
writeModels =
  List.foldl
    (\x io -> io >>> (uncurry write x))
    (Console.pure ())
    [ ( encodeMesh Cluster.mesh, "background.json" )
    , ( encodeMesh Explosion.mesh, "explosion.json" )
    , ( encodeModel Sphere.model, "sphere.json" )
    , ( encodeModel Ship.model, "ship.json" )
    , ( encodeModel Missile.model, "missile.json" )
    , ( encodeModel Column.model, "column.json" )
    , ( encodeModel Donut.model, "donut.json" )
    , ( encodeModel Cage.model, "cage.json" )
    , ( encodeBoundingBox 11 Donut.model, "donut.box" )
    , ( encodeBoundingBox 1 Ship.model, "ship.box" )
    , ( encodeBoundingBox 11 SimpleSphere.model, "sphere.box" )
    , ( encodeBoundingBox 0 Cage.model, "cage.box" )
    ]


write : String -> String -> IO ()
write content filename =
  Console.writeFile
    { file = "public_html/data/" ++ filename
    , content = content
    }


port runner : Signal (Task x ())
port runner =
  Console.run writeModels
