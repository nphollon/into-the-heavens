module Main (..) where

import Task exposing (Task)
import Console exposing (IO, (>>>))
import Generate.Json as Json exposing (Mesh)
import Generate.Sphere as Sphere
import Generate.Constellation as Constellation
import Generate.Ship as Ship


writeModels : IO ()
writeModels =
  List.foldl
    (\x io -> io >>> (uncurry write x))
    (Console.pure ())
    [ ( Sphere.sphere, "sphere.json" )
    , ( Constellation.mesh, "background.json" )
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
