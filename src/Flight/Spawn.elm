module Flight.Spawn (spawnShip, visitorBodyAt, spawnMissile, visitorCount) where

import Color
import Dict
import String
import Random.PCG as Random
import Types exposing (..)
import Math.Collision as Collision
import Math.Transform as Transform
import Math.Vector as Vector exposing (Vector)
import Math.Spherical as Spherical
import Generate.Ship as Ship
import Flight.Init as Init


spawnShip : Random.Seed -> GameState -> GameState
spawnShip seed model =
  let
    name =
      "visitor" ++ toString model.nextId

    body =
      Spherical.random (always 300)
        |> visitorBodyAt
        |> flip Random.generate seed
        |> fst

    graphics =
      Object
        { bodyName = name
        , meshName = "Ship"
        , shader = Matte Color.purple
        }
  in
    spawn name body graphics model


visitorBodyAt : Random.Generator Vector -> Random.Generator Body
visitorBodyAt positionGenerator =
  let
    orientationFor position =
      Transform.rotationFor (Vector.vector 0 0 1) position

    place position =
      { position = position
      , velocity = Vector.scale -0.1 position
      , orientation = orientationFor position
      , angVelocity = Vector.vector 0 0 0
      , hull = Collision.hull .position Ship.triangles
      , health = 1
      , ai =
          Hostile
            { target = Init.playerName
            , trigger = { value = 0, decay = 4 }
            }
      }
  in
    Random.map place positionGenerator


spawnMissile : Body -> String -> GameState -> GameState
spawnMissile parent targetName model =
  let
    name =
      "missile" ++ toString model.nextId

    body =
      { position = Transform.fromBodyFrame (Vector.vector 0 -0.5 0.1) parent
      , velocity =
          Vector.vector 0 0 -30
            |> Transform.rotate parent.orientation
            |> Vector.add parent.velocity
      , orientation = parent.orientation
      , angVelocity = Vector.vector 0 0 0
      , hull = []
      , health = 1
      , ai = Seeking 4 targetName
      }

    graphics =
      Object
        { bodyName = name
        , meshName = "Missile"
        , shader = Decoration
        }
  in
    spawn name body graphics model


spawn : String -> Body -> GraphicsObject -> GameState -> GameState
spawn name body graphics model =
  { model
    | universe = Dict.insert name body model.universe
    , nextId = model.nextId + 1
    , graphics = graphics :: model.graphics
  }


visitorCount : GameState -> Int
visitorCount model =
  Dict.keys model.universe
    |> List.filter (String.startsWith "visitor")
    |> List.length
