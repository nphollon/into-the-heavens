module Main (..) where

import Task exposing (Task)
import Console exposing (IO, (>>>))
import WebGL exposing (Drawable)
import Generate.Json as Json exposing (Vertex)
import Generate.Sphere as Sphere
import Generate.Cluster as Cluster
import Generate.Ship as Ship
import Generate.Missile as Missile
import Generate.Explosion as Explosion
import Generate.Column as Column
import Generate.Donut as Donut
import Generate.FlatFace as FlatFace exposing (ModelData, flatFace)


writeModels : IO ()
writeModels =
  List.foldl
    (\x io -> io >>> (uncurry write x))
    (Console.pure ())
    [ ( Cluster.mesh, "background.json" )
    , ( Explosion.mesh, "explosion.json" )
    , ( flatFace Sphere.model, "sphere.json" )
    , ( flatFace Ship.model, "ship.json" )
    , ( flatFace Missile.model, "missile.json" )
    , ( flatFace Column.model, "column.json" )
    , ( flatFace Donut.model, "donut.json" )
    ]


write : Drawable Vertex -> String -> IO ()
write model filename =
  Console.writeFile
    { file = "public_html/data/" ++ filename
    , content = Json.encode model
    }


port runner : Signal (Task x ())
port runner =
  Console.run writeModels
