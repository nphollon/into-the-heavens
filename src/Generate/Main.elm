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
import Generate.Prism as Prism


writeModels : IO ()
writeModels =
  List.foldl
    (\x io -> io >>> (uncurry write x))
    (Console.pure ())
    [ ( Sphere.mesh, "sphere.json" )
    , ( Cluster.mesh, "background.json" )
    , ( Ship.mesh, "ship.json" )
    , ( Missile.mesh, "missile.json" )
    , ( Explosion.mesh, "explosion.json" )
    , ( Column.mesh, "column.json" )
    , ( Prism.mesh, "prism.json" )
    , ( Prism.hull, "prism-hull.json" )
    , ( Prism.box, "prism-box.json" )
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
