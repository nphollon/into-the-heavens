module Main where

import IO.IO as IO exposing (IO, (>>>))
import IO.Runner exposing (Request, Response)

import Mesh exposing (Mesh)
import Generate.Json as Json
import Generate.Sphere as Sphere
import Generate.Background as Background


writeModels: IO ()
writeModels =
  List.foldl
        (\x io -> io >>> (uncurry write x))
        (IO.pure ())
        [ (Sphere.sphere, "sphere.json")
        , (Background.mesh, "background.json")
        ]


write : Mesh -> String -> IO ()
write model filename =
  IO.writeFile
      { file = "public_html/data/" ++ filename
      , content = Json.encode model
      }

  
port requests : Signal Request
port requests = IO.Runner.run responses writeModels

port responses : Signal Response
