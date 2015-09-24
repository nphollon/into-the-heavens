module Generate.Background where

import Graphics.Element

import Mesh exposing (Mesh)
import Constellation
import Scatter
import Grid

mesh : Mesh
mesh = List.concat
       [ Constellation.crux
       , Constellation.ursaMajor
       , Constellation.aquarius
       , Scatter.scatter 100 
       , Grid.grid 0 2 
       ]
      
