module Flight.Spawn (spawnPlayer, spawnShip, visitorBodyAt, spawnMissile, spawnExplosion, spawnCheckpoint, defaultCockpit, defaultBody, playerId, emptyId, inaction) where

import Color
import Dict exposing (Dict)
import Random.PCG as Random
import Types exposing (..)
import Math.Transform as Transform
import Math.Vector as Vector exposing (Vector)
import Math.Spherical as Spherical
import Math.Tree as Tree exposing (Tree(..))


spawnPlayer : Dict Id Body -> Dict Id Body
spawnPlayer =
  let
    playerBody =
      { defaultBody
        | bounds =
            Just
              (Leaf
                { a = 0.5
                , b = 0.5
                , c = 0.3
                , position = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                }
              )
        , health = 1
        , ai = PlayerControlled defaultCockpit
      }
  in
    Dict.insert playerId playerBody


spawnShip : Int -> GameState -> GameState
spawnShip n model =
  let
    ( bodies, newSeed ) =
      Spherical.random (always 300)
        |> visitorBodyAt
        |> Random.list n
        |> flip Random.generate model.seed

    graphics id =
      Object
        { bodyId = id
        , meshName = "Ship"
        , shader = Matte Color.purple
        }
  in
    List.foldl
      (spawn graphics)
      { model | seed = newSeed }
      bodies


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
      , bounds =
          Just
            (Leaf
              { a = 0.5
              , b = 0.5
              , c = 0.3
              , position = Vector.vector 0 0 0
              , orientation = Vector.vector 0 0 0
              }
            )
      , health = 1
      , ai =
          Hostile
            { target = playerId
            , trigger = { value = 0, decay = 4 }
            }
      }
  in
    Random.map place positionGenerator


spawnMissile : Body -> Id -> GameState -> GameState
spawnMissile parent targetId model =
  let
    body =
      { position = Transform.fromBodyFrame (Vector.vector 0 -0.5 0.1) parent
      , velocity =
          Vector.vector 0 0 -30
            |> Transform.rotate parent.orientation
            |> Vector.add parent.velocity
      , orientation = parent.orientation
      , angVelocity = Vector.vector 0 0 0
      , bounds =
          Just
            (Leaf
              { a = 0
              , b = 0
              , c = 0
              , position = Vector.vector 0 0 0
              , orientation = Vector.vector 0 0 0
              }
            )
      , health = 1
      , ai = Seeking 4 targetId
      }

    graphics id =
      Object
        { bodyId = id
        , meshName = "Missile"
        , shader = NoLighting
        }
  in
    spawn graphics body model


spawnExplosion : Body -> GameState -> GameState
spawnExplosion parent model =
  let
    body =
      { position = parent.position
      , velocity = parent.velocity
      , orientation = Vector.vector 0 0 0
      , angVelocity = Vector.vector 0 0 0
      , bounds = Nothing
      , health = 1
      , ai = Waiting 3
      }

    graphics id =
      Explosion
        { bodyId = id
        , meshName = "Explosion"
        }
  in
    spawn graphics body model


spawnCheckpoint : String -> Vector -> GameState -> GameState
spawnCheckpoint name position model =
  let
    body =
      { defaultBody
        | position = position
        , angVelocity = Vector.vector 0 1 0
      }

    graphics id =
      Object
        { bodyId = id
        , meshName = "Explosion"
        , shader = NoLighting
        }
  in
    spawnWithName name graphics body model


spawn : (Id -> GraphicsObject) -> Body -> GameState -> GameState
spawn graphics body model =
  let
    id =
      model.nextId
  in
    { model
      | universe = Dict.insert id body model.universe
      , graphics = graphics id :: model.graphics
      , nextId = id + 1
    }


spawnWithName : String -> (Id -> GraphicsObject) -> Body -> GameState -> GameState
spawnWithName name graphics body model =
  { model | names = Dict.insert name model.nextId model.names }
    |> spawn graphics body


defaultCockpit : Cockpit
defaultCockpit =
  { action = inaction
  , target = emptyId
  , trigger = { value = 0, decay = 0.3 }
  , shields = { value = 1, decay = 5, recover = 10, on = False }
  }


defaultBody : Body
defaultBody =
  { position = Vector.vector 0 0 0
  , velocity = Vector.vector 0 0 0
  , orientation = Vector.vector 0 0 0
  , angVelocity = Vector.vector 0 0 0
  , bounds = Nothing
  , health = 0
  , ai = Dumb
  }


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


playerId : Id
playerId =
  0


emptyId : Id
emptyId =
  -1
