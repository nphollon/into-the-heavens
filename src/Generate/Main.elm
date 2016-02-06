module Main (..) where

import Task exposing (Task)
import Console exposing (IO, (>>>))
import Mesh exposing (Mesh)
import Generate.Json as Json
import Generate.Sphere as Sphere
import Generate.Background as Background
import Generate.Ship as Ship


writeModels : IO ()
writeModels =
  List.foldl
    (\x io -> io >>> (uncurry write x))
    (Console.pure ())
    [ ( Sphere.sphere, "sphere.json" )
    , ( Background.mesh, "background.json" )
    , ( Ship.mesh, "ship.json" )
    ]


write : Mesh -> String -> IO ()
write model filename =
  Console.writeFile
    { file = "public_html/data/" ++ filename
    , content = Json.encode model
    }


port runner : Signal (Task x ())
port runner =
  Console.run writeModels
