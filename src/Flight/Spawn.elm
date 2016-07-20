module Flight.Spawn exposing (spawnPlayer, spawnShip, spawnMissile, spawnExplosion, spawnCheckpoint, defaultCockpit, defaultBody, playerId, emptyId, inaction, placeAt)

import Color
import Dict exposing (Dict)
import Random.Pcg as Random
import Collision exposing (Bounds)
import Types exposing (..)
import Math.Transform as Transform
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Math.Spherical as Spherical


spawnPlayer : GameState -> GameState
spawnPlayer model =
    let
        playerBody =
            { defaultBody
                | bounds = getBounds "Player" model.library
                , health = 1
                , ai = PlayerControlled defaultCockpit
            }
    in
        { model | universe = Dict.insert playerId playerBody model.universe }


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
            getBounds "Ship" model.library

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
            , isMissile = False
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
            , bounds = getBounds "Missile" model.library
            , health = 1
            , ai = Seeking 4 targetId
            , isMissile = True
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
            , orientation = Quaternion.identity
            , angVelocity = Vector.vector 0 0 0
            , bounds = Collision.empty
            , health = 1
            , ai = Waiting 3
            , isMissile = False
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


getBounds : String -> Library -> Bounds
getBounds name library =
    Dict.get name library.boxes
        |> Maybe.withDefault Collision.empty


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
    , orientation = Quaternion.identity
    , angVelocity = Vector.vector 0 0 0
    , bounds = Collision.empty
    , health = 0
    , ai = Dumb
    , isMissile = False
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
