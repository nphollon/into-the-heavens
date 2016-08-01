module Flight.Engine exposing (update, placeAt)

import Dict exposing (Dict)
import List.Extra as ListX
import Random.Pcg as Random
import Collision exposing (Bounds)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Spherical as Spherical
import Math.Transform as Transform
import Flight.Spawn as Spawn
import Flight.Player as Player
import Flight.Hostile as Hostile
import Flight.Seeking as Seeking
import Flight.Explosion as Explosion
import Flight.Dumb as Dumb


update : GameState -> GameState
update state =
    state
        |> checkCollisions
        |> aiUpdate
        |> checkSchedule


checkCollisions : GameState -> GameState
checkCollisions model =
    let
        checkPair a b effects =
            if Collision.collide (snd a) (snd b) then
                addEffects a b effects
            else
                effects

        allEffects =
            Dict.toList model.universe
                |> ListX.selectSplit
                |> List.foldl
                    (\( _, object, others ) effects ->
                        List.foldl (checkPair object) effects others
                    )
                    []
    in
        applyEffects allEffects model


type ObjectType
    = Missile
    | Shielded
    | Unshielded


objectType : Body -> ObjectType
objectType body =
    if body.collisionClass == Blockable then
        Missile
    else if isShielded body then
        Shielded
    else
        Unshielded


isShielded : Body -> Bool
isShielded body =
    case body.ai of
        PlayerControlled cockpit ->
            cockpit.shields.on

        _ ->
            False


addEffects : ( Id, Body ) -> ( Id, Body ) -> List EngineEffect -> List EngineEffect
addEffects ( idA, bodyA ) ( idB, bodyB ) effects =
    case ( objectType bodyA, objectType bodyB ) of
        ( Missile, Missile ) ->
            effects

        ( Missile, Unshielded ) ->
            Destroy idA
                :: DeductHealth bodyA.health idB
                :: effects

        ( Unshielded, Missile ) ->
            DeductHealth bodyB.health idA
                :: Destroy idB
                :: effects

        ( Missile, Shielded ) ->
            Destroy idA
                :: effects

        ( Shielded, Missile ) ->
            Destroy idB
                :: effects

        _ ->
            DeductHealth bodyB.health idA
                :: DeductHealth bodyA.health idB
                :: effects


hit : Float -> Id -> GameState -> GameState
hit damage id model =
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


checkSchedule : GameState -> GameState
checkSchedule model =
    case model.events of
        [] ->
            model

        ( condition, event ) :: events ->
            if isSatisfied condition model then
                { model
                    | events = events
                    , lastEventTime = model.gameTime
                }
                    |> applyEffects event
            else
                model


isSatisfied : EventCondition -> GameState -> Bool
isSatisfied condition model =
    case condition of
        Immediately ->
            True

        NoMoreVisitors ->
            Dict.values model.universe
                |> List.filter (.collisionClass >> (==) Solid)
                |> List.isEmpty

        SecondsLater wait ->
            model.lastEventTime + wait < model.gameTime

        ReachedCheckpoint bodyName ->
            distanceTo bodyName model
                |> Maybe.map (\r -> r < 1)
                |> Maybe.withDefault False


applyEffects : List EngineEffect -> GameState -> GameState
applyEffects effects model =
    List.foldl applyEffect model effects


applyEffect : EngineEffect -> GameState -> GameState
applyEffect effect model =
    case effect of
        SpawnShips n ->
            let
                ( placements, newSeed ) =
                    Spherical.random (always 300)
                        |> placeAt
                        |> Random.list n
                        |> flip Random.step model.seed
            in
                List.foldl
                    (\placement m ->
                        { m
                            | universe =
                                Dict.insert m.nextId
                                    (Hostile.init model.library placement)
                                    m.universe
                            , nextId = m.nextId + 1
                        }
                    )
                    { model | seed = newSeed }
                    placements

        SpawnMissile sourceId targetId ->
            case Dict.get sourceId model.universe of
                Just source ->
                    Spawn.spawnMissile source targetId model

                Nothing ->
                    model

        SpawnCheckpoint id position ->
            Spawn.spawnCheckpoint id position model

        Destroy id ->
            { model | universe = Dict.remove id model.universe }

        DestroyByName name ->
            Dict.get name model.names
                |> Maybe.map (Destroy >> flip applyEffect model)
                |> Maybe.withDefault model

        Explode id ->
            case Dict.get id model.universe of
                Just object ->
                    Spawn.spawnExplosion object
                        { model
                            | universe = Dict.remove id model.universe
                            , score = model.score + 1
                        }

                Nothing ->
                    model

        DeductHealth n id ->
            hit n id model

        Notify message ->
            { model
                | log = ( model.gameTime, message ) :: model.log
            }

        Victory ->
            { model | victory = True }


distanceTo : String -> GameState -> Maybe Float
distanceTo name model =
    let
        player =
            Dict.get Spawn.playerId model.universe

        object =
            Dict.get name model.names
                |> flip Maybe.andThen (flip Dict.get model.universe)

        bodyDistance a b =
            Vector.distance a.position b.position
    in
        Maybe.map2 bodyDistance player object


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

        Explosion lifespan ->
            Explosion.update id actor lifespan

        Dumb _ ->
            Dumb.update actor
