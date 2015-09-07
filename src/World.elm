module World where

import Math.Vector3 as Vec3 exposing (Vec3)

import Graphics
import Mesh exposing (Mesh)
import Triple exposing (Triple)


type alias World =
  { style : WorldStyle
  , radius : Float
  , position : Vec3
  }


type WorldStyle =
  Planet | Moon


world : Mesh.Mesh -> WorldStyle -> Float -> Triple Float -> World
world _ style radius position =
  { style = style
  , radius = radius
  , position = Vec3.fromTuple position
  }


toEntity : World -> Graphics.Camera -> Graphics.Entity
toEntity world =
  case world.style of
    Planet ->
      Graphics.planet world.radius world.position
    Moon ->
      Graphics.moon world.radius world.position
      
