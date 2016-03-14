module Flight.Spawn (spawn, visitorCount) where

import Color
import Dict
import String
import Types exposing (..)
import Math.Collision as Collision
import Math.Transform as Transform
import Math.Vector as Vector
import Generate.Ship as Ship
import Flight.Init as Init


spawn : EntityConstructor -> GameState -> GameState
spawn objType model =
  let
    name =
      entityString objType ++ toString model.nextId

    body =
      entityBody objType

    graphics =
      entityGraphics name objType
  in
    { model
      | universe = Dict.insert name body model.universe
      , nextId = model.nextId + 1
      , graphics = graphics :: model.graphics
    }


entityString : EntityConstructor -> String
entityString objType =
  case objType of
    Ship _ ->
      "visitor"

    Missile _ _ ->
      "missile"


entityBody : EntityConstructor -> Body
entityBody objType =
  case objType of
    Ship seed ->
      { position = Vector.vector 5 -200 -20
      , velocity = Vector.vector 0 0 0
      , orientation = Vector.vector (0.5 * pi) 0 0
      , angVelocity = Vector.vector 0 0 0
      , hull = Collision.hull .position Ship.triangles
      , health = 1
      , ai =
          Hostile
            { target = Init.playerName
            , trigger = { value = 0, decay = 2 }
            }
      }

    Missile parent target ->
      { position = Transform.fromBodyFrame (Vector.vector 0 -0.5 0.1) parent
      , velocity =
          Vector.vector 0 0 -60
            |> Transform.rotate parent.orientation
            |> Vector.add parent.velocity
      , orientation = parent.orientation
      , angVelocity = Vector.vector 0 0 0
      , hull = []
      , health = 1
      , ai = Seeking 2 target
      }


entityGraphics : String -> EntityConstructor -> GraphicsObject
entityGraphics name objType =
  case objType of
    Ship _ ->
      Object
        { bodyName = name
        , meshName = "Ship"
        , shader = Matte Color.purple
        }

    Missile _ _ ->
      Object
        { bodyName = name
        , meshName = "Missile"
        , shader = Decoration
        }


visitorCount : GameState -> Int
visitorCount model =
  Dict.keys model.universe
    |> List.filter (String.startsWith "visitor")
    |> List.length
