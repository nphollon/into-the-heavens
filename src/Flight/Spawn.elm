module Flight.Spawn exposing (spawnMissile, spawnExplosion, spawnCheckpoint, playerId)

import Color
import Dict exposing (Dict)
import Collision exposing (Bounds)
import Types exposing (..)
import Library
import Math.Transform as Transform
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)


spawnMissile : Body -> Id -> GameState -> GameState
spawnMissile parent targetId model =
    let
        body =
            { position = Transform.fromBodyFrame parent (Vector.vector 0 -1 0)
            , velocity =
                Vector.vector 0 0 -30
                    |> Quaternion.rotateVector parent.orientation
                    |> Vector.add parent.velocity
            , orientation = parent.orientation
            , angVelocity = Vector.vector 0 0 0
            , bounds = Library.getBounds "Missile" model.library
            , health = 1
            , ai = Seeking { lifespan = 4, target = targetId }
            , collisionClass = Blockable
            }
    in
        { model
            | universe = Dict.insert model.nextId body model.universe
            , nextId = model.nextId + 1
        }


spawnExplosion : Body -> GameState -> GameState
spawnExplosion parent model =
    let
        body =
            { position = parent.position
            , velocity = parent.velocity
            , orientation = Quaternion.identity
            , angVelocity = Vector.vector 0 0 0
            , bounds = Collision.empty
            , health = 1
            , ai = Explosion 3
            , collisionClass = Scenery
            }
    in
        { model
            | universe = Dict.insert model.nextId body model.universe
            , nextId = model.nextId + 1
        }


spawnCheckpoint : String -> Vector -> GameState -> GameState
spawnCheckpoint name position model =
    let
        body =
            { position = position
            , velocity = Vector.vector 0 0 0
            , orientation = Quaternion.identity
            , angVelocity = Vector.vector 0 0 1
            , bounds = Collision.empty
            , health = 0
            , ai =
                Dumb
                    { meshName = "Explosion"
                    , shader = Bright Color.yellow
                    }
            , collisionClass = Scenery
            }
    in
        { model
            | names = Dict.insert name model.nextId model.names
            , universe = Dict.insert model.nextId body model.universe
            , nextId = model.nextId + 1
        }


playerId : Id
playerId =
    0
