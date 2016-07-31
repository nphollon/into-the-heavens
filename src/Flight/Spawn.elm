module Flight.Spawn exposing (spawnMissile, spawnExplosion, spawnCheckpoint, defaultBody, playerId)

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

        graphics id =
            Object
                { bodyId = id
                , meshName = "Missile"
                , shader = Bright Color.red
                }
    in
        spawn graphics body model


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
            { defaultBody
                | position = position
                , angVelocity = Vector.vector 0 0 1
            }

        graphics id =
            Object
                { bodyId = id
                , meshName = "Explosion"
                , shader = Bright Color.yellow
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


defaultBody : Body
defaultBody =
    { position = Vector.vector 0 0 0
    , velocity = Vector.vector 0 0 0
    , orientation = Quaternion.identity
    , angVelocity = Vector.vector 0 0 0
    , bounds = Collision.empty
    , health = 0
    , ai = Dumb
    , collisionClass = Scenery
    }


playerId : Id
playerId =
    0
