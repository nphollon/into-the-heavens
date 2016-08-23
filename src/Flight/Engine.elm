module Flight.Engine exposing (update, placeAt)

import Dict exposing (Dict)
import List.Extra as ListX
import Random.Pcg as Random
import Collision exposing (Bounds)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion
import Math.Spherical as Spherical
import Math.Frame as Frame exposing (Frame)
import Flight.Player as Player
import Flight.Hostile as Hostile
import Flight.Seeking as Seeking
import Flight.Explosion as Explosion
import Flight.Dumb as Dumb
import Flight.PlayerBullet as PlayerBullet


update : GameState -> GameState
update state =
    state
        |> checkCollisions
        |> aiUpdate


checkCollisions : GameState -> GameState
checkCollisions model =
    let
        collide a b =
            Collision.collide
                { bounds = a.bounds
                , position = Frame.position a
                , orientation = Frame.orientation a
                }
                { bounds = b.bounds
                , position = Frame.position b
                , orientation = Frame.orientation b
                }

        checkPair ( idA, bodyA ) ( idB, bodyB ) =
            case ( bodyA.collisionClass, bodyB.collisionClass ) of
                ( Scenery, Scenery ) ->
                    []

                ( Scenery, _ ) ->
                    if collide bodyA bodyB then
                        collideWith bodyA idB bodyB
                    else
                        []

                ( _, Scenery ) ->
                    if collide bodyA bodyB then
                        collideWith bodyB idA bodyA
                    else
                        []

                _ ->
                    if collide bodyA bodyB then
                        (collideWith bodyB idA bodyA)
                            ++ (collideWith bodyA idB bodyB)
                    else
                        []

        allEffects =
            Dict.toList model.universe
                |> ListX.selectSplit
                |> List.concatMap
                    (\( _, object, others ) ->
                        List.concatMap (checkPair object) others
                    )
    in
        applyEffects allEffects model


collideWith : Body -> Id -> Body -> List EngineEffect
collideWith other id object =
    case object.ai of
        PlayerControlled cockpit ->
            Player.collideWith other id cockpit

        Hostile _ ->
            solidCollision other id

        Seeking _ ->
            projectileCollision other id

        PlayerBullet _ ->
            projectileCollision other id

        Explosion _ ->
            []

        Dumb _ ->
            solidCollision other id


solidCollision : Body -> Id -> List EngineEffect
solidCollision other objectId =
    case other.collisionClass of
        Ethereal ->
            []

        _ ->
            [ DeductHealth other.health objectId ]


projectileCollision : Body -> Id -> List EngineEffect
projectileCollision other objectId =
    case other.collisionClass of
        Blockable ->
            []

        Ethereal ->
            []

        Scenery ->
            [ Explode objectId ]

        Solid ->
            [ Explode objectId ]


applyEffects : List EngineEffect -> GameState -> GameState
applyEffects effects model =
    List.foldl applyEffect model effects


applyEffect : EngineEffect -> GameState -> GameState
applyEffect effect model =
    case effect of
        SpawnShips n ->
            let
                ( placements, newSeed ) =
                    Spherical.random (always 200)
                        |> placeAt
                        |> Random.list n
                        |> flip Random.step model.seed

                init frame =
                    Hostile.init model.library
                        frame
                        { position = Vector.scale -0.1 frame.position
                        , orientation = Quaternion.identity
                        }
            in
                List.foldl (init >> spawn)
                    { model | seed = newSeed }
                    placements

        SpawnMissile sourceId targetId ->
            case Dict.get sourceId model.universe of
                Just source ->
                    spawn (Seeking.init model.library source targetId) model

                Nothing ->
                    model

        SpawnFriendly sourceId ->
            case Dict.get sourceId model.universe of
                Just source ->
                    spawn (PlayerBullet.init model.library source) model

                Nothing ->
                    model

        Destroy id ->
            { model | universe = Dict.remove id model.universe }

        Explode id ->
            case Dict.get id model.universe of
                Just object ->
                    spawn (Explosion.init object)
                        { model | universe = Dict.remove id model.universe }

                Nothing ->
                    model

        DeductHealth damage id ->
            case Dict.get id model.universe of
                Just object ->
                    if object.health > damage then
                        { model
                            | universe =
                                Dict.insert id
                                    { object | health = object.health - damage }
                                    model.universe
                        }
                    else
                        applyEffect (Explode id) model

                Nothing ->
                    model

        Notify message ->
            { model
                | log = ( model.gameTime, message ) :: model.log
            }

        Victory ->
            { model | victory = True }


spawn : Body -> GameState -> GameState
spawn body model =
    { model
        | universe = Dict.insert model.nextId body model.universe
        , nextId = model.nextId + 1
    }


placeAt : Random.Generator Vector -> Random.Generator Frame
placeAt positionGenerator =
    let
        orientationFor position =
            Frame.rotationFor (Vector.vector 0 0 1) position

        place position =
            { position = position
            , orientation = orientationFor position
            }
    in
        Random.map place positionGenerator


aiUpdate : GameState -> GameState
aiUpdate model =
    let
        updateAll =
            Dict.map (act model) model.universe

        allEffects =
            Dict.foldl (\_ ( _, effects ) -> (::) effects) [] updateAll
                |> List.concat

        newUniverse =
            Dict.map (\_ ( body, _ ) -> body) updateAll
    in
        applyEffects allEffects { model | universe = newUniverse }


act : GameState -> Id -> Body -> ( Body, List EngineEffect )
act model id actor =
    case actor.ai of
        PlayerControlled cockpit ->
            Player.update model actor cockpit

        Hostile cockpit ->
            Hostile.update model.universe id actor cockpit

        Seeking cockpit ->
            Seeking.update model.universe id actor cockpit

        PlayerBullet lifespan ->
            PlayerBullet.update model.universe id actor lifespan

        Explosion lifespan ->
            Explosion.update id actor lifespan

        Dumb _ ->
            Dumb.update actor
