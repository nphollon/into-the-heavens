module BackgroundWriter where

import Graphics.Element

import Mesh exposing (Mesh)
import Constellation
import Scatter
import Grid
import Entity.Writer

main =
  Entity.Writer.source mesh

mesh : Mesh
mesh = List.concat
       [ Constellation.crux
       , Constellation.ursaMajor
       , Constellation.aquarius
       , Scatter.scatter 100 
       , Grid.grid 0 2 
       ]
      
