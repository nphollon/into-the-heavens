module Flight.Init (game, inaction, spawn, visitorCount, hasCrashed, updatePlayer, getPlayer) where

import Color
import Dict
import String
import Random.PCG as Random exposing (Seed)
import Effects exposing (Effects)
import Types exposing (..)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision
import Math.Transform as Transform
import Math.Vector as Vector


game : Seed -> Library -> ( Mode, Effects Update )
game seed library =
  (,)
    (GameMode
      { library = library
      , hasFocus = True
      , clockTime = Nothing
      , lag = 0
      , seed = seed
      , nextId = 0
      , missileTrigger = Ready
      , target = ""
      , score = -1
      , universe =
          Dict.fromList
            [ ( "ship"
              , { position = Vector.vector 0 0 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 0 0
                , hull = []
                , health = 1
                , ai = Just (PlayerControlled inaction)
                }
              )
            , ( "planet"
              , { position = Vector.vector 0 -20 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 3.0e-2 0
                , hull = Collision.hull .position Sphere.mesh
                , health = 1.0e10
                , ai = Nothing
                }
              )
            ]
      , graphics =
          [ Background "Background"
          , Object
              { bodyName = "planet"
              , meshName = "Sphere"
              , shader = Planet
              , scale = Nothing
              }
          ]
      }
    )
    (Effects.tick Tick)


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


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
      , hull = Collision.hull .position Ship.mesh
      , health = 1
      , ai = Just (Aimless seed 4 inaction)
      }

    Missile parent target ->
      { parent
        | position = Transform.fromBodyFrame (Vector.vector 0 -0.2 0.2) parent
        , velocity =
            Vector.vector 0 0 -20
              |> Transform.rotate parent.orientation
              |> Vector.add parent.velocity
        , hull = []
        , health = 1
        , ai = Just (Seeking 3 target)
      }


entityGraphics : String -> EntityType -> GraphicsObject
entityGraphics name objType =
  case objType of
    Ship _ ->
      Object
        { bodyName = name
        , meshName = "Ship"
        , shader = Matte Color.purple
        , scale = Nothing
        }

    Missile _ _ ->
      Object
        { bodyName = name
        , meshName = "Ship"
        , shader = Matte Color.red
        , scale = Just 0.1
        }


visitorCount : GameState -> Int
visitorCount model =
  Dict.keys model.universe
    |> List.filter (String.startsWith "visitor")
    |> List.length


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member "ship" model.universe)


updatePlayer : (Body -> Body) -> GameState -> GameState
updatePlayer up model =
  { model | universe = Dict.update "ship" (Maybe.map up) model.universe }


getPlayer : (Body -> GameState) -> GameState -> GameState
getPlayer f model =
  case Dict.get "ship" model.universe of
    Just ship ->
      f ship

    Nothing ->
      model
