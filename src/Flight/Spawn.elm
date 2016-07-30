module Flight.Spawn exposing (spawnShip, spawnMissile, spawnExplosion, spawnCheckpoint, defaultBody, playerId, placeAt)

import Color
import Dict exposing (Dict)
import Random.Pcg as Random
import Collision exposing (Bounds)
import Types exposing (..)
import Library
import Math.Transform as Transform
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Math.Spherical as Spherical


spawnShip : Int -> GameState -> GameState
spawnShip n model =
    let
        ( placements, newSeed ) =
            Spherical.random (always 300)
                |> placeAt
                |> Random.list n
                |> flip Random.step model.seed

        graphics id =
            Object
                { bodyId = id
                , meshName = "Ship"
                , shader = Matte Color.purple
                }

        bounds =
            Library.getBounds "Ship" model.library

        ai =
            Hostile
                { target = playerId
                , trigger = { value = 0, decay = 4 }
                }

        place placement =
            { position = placement.position
            , orientation = placement.orientation
            , velocity = placement.velocity
            , angVelocity = placement.angVelocity
            , bounds = bounds
            , health = 1
            , ai = ai
            , collisionClass = Solid
            }
    in
        List.map place placements
            |> List.foldl (spawn graphics) { model | seed = newSeed }


type alias Placement =
    { position : Vector
    , orientation : Quaternion
    , velocity : Vector
    , angVelocity : Vector
    }


placeAt : Random.Generator Vector -> Random.Generator Placement
placeAt positionGenerator =
    let
        orientationFor position =
            Transform.rotationFor (Vector.vector 0 0 1) position

        place position =
            { position = position
            , velocity = Vector.scale -0.1 position
            , orientation = orientationFor position
            , angVelocity = Vector.vector 0 0 0
            }
    in
        Random.map place positionGenerator


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
            , ai = Waiting 3
            , collisionClass = Scenery
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
