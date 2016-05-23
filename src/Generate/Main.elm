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
    , ( Prism.box 0, "prism-box0.json" )
    , ( Prism.box 1, "prism-box1.json" )
    , ( Prism.box 2, "prism-box2.json" )
    , ( Prism.box 3, "prism-box3.json" )
    , ( Prism.box 4, "prism-box4.json" )
    , ( Prism.box 5, "prism-box5.json" )
    , ( Prism.box 6, "prism-box6.json" )
    , ( Prism.box 7, "prism-box7.json" )
    , ( Prism.box 8, "prism-box8.json" )
    , ( Prism.box 12, "prism-box9.json" )
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
