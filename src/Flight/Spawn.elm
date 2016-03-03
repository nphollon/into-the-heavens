module Flight.Spawn (spawn) where

import Color
import Dict
import String
import Types exposing (..)
import Flight.Init as Init
import Generate.Ship as Ship
import Math.Collision as Collision
import Math.Transform as Transform
import Math.Vector as Vector


spawn : EntityType -> GameState -> ( GameState, String )
spawn objType model =
  let
    name =
      entityString objType ++ toString model.nextId

    body =
      entityBody objType

    graphics =
      entityGraphics name objType
  in
    (,)
      { model
        | universe = Dict.insert name body model.universe
        , nextId = model.nextId + 1
        , graphics = graphics :: model.graphics
      }
      name


entityString : EntityType -> String
entityString objType =
  case objType of
    Ship _ ->
      "visitor"

    Missile _ _ ->
      "missile"


entityBody : EntityType -> Body
entityBody objType =
  case objType of
    Ship seed ->
      { position = Vector.vector 5 200 -20
      , velocity = Vector.vector 0 -50 0
      , orientation = Vector.vector (-0.5 * pi) 0 0
      , angVelocity = Vector.vector 0 0 0
      , hull = Collision.hull .position Ship.triangles
      , health = 1
      , ai =
          Just
            (Aimless
              { seed = seed
              , lifespan = 4
              , cockpit =
                  { action = Init.inaction
                  , target = "ship"
                  , trigger = Ready
                  }
              }
            )
      }

    Missile parent target ->
      { position = Transform.fromBodyFrame (Vector.vector 0 -0.5 0.1) parent
      , velocity =
          Vector.vector 0 0 -20
            |> Transform.rotate parent.orientation
            |> Vector.add parent.velocity
      , orientation = parent.orientation
      , angVelocity = Vector.vector 0 0 0
      , hull = []
      , health = 1
      , ai = Just (Seeking 4 target)
      }


entityGraphics : String -> EntityType -> GraphicsObject
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


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member "ship" model.universe)


updatePlayer : (Cockpit -> Cockpit) -> GameState -> GameState
updatePlayer aiUpdate model =
  let
    bodyUpdate body =
      case body.ai of
        Just (PlayerControlled cockpit) ->
          { body | ai = Just (PlayerControlled (aiUpdate cockpit)) }

        _ ->
          body
  in
    { model
      | universe =
          Dict.update "ship" (Maybe.map bodyUpdate) model.universe
    }


getPlayer : (Body -> GameState) -> GameState -> GameState
getPlayer f model =
  case Dict.get "ship" model.universe of
    Just ship ->
      f ship

    Nothing ->
      model
