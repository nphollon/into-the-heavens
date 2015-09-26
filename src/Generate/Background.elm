module Generate.Background where

import Graphics.Element

import Mesh exposing (Mesh)
import Generate.Constellation as Constellation
import Generate.Scatter as Scatter
import Generate.Grid as Grid

mesh : Mesh
mesh = List.concat
       [ Constellation.crux
       , Constellation.ursaMajor
       , Constellation.aquarius
       , Scatter.scatter 100 
       ]
      
