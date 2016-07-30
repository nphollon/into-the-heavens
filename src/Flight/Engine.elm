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
import Flight.Util as Util
import Flight.Player as Player
import Flight.Hostile as Hostile
import Flight.Mechanics as Mechanics


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
    if Util.isMissile body then
        Missile
    else if Util.isShielded body then
        Shielded
    else
        Unshielded


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
    let
        object =
            Dict.get id model.universe
                |> Maybe.withDefault Spawn.defaultBody
    in
        if object.health > damage then
            { model
                | universe =
                    Dict.insert id
                        { object | health = object.health - damage }
                        model.universe
            }
        else
            applyEffect (Explode id) model


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
            Util.visitorCount model.universe == 0

        SecondsLater wait ->
            model.lastEventTime + wait < model.gameTime

        ReachedCheckpoint bodyName ->
            Util.distanceTo bodyName model
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
            Util.remove id model

        DestroyByName name ->
            Util.getId name model
                |> Maybe.map (flip Util.remove model)
                |> Maybe.withDefault model

        Explode id ->
            Util.explode id model

        DeductHealth n id ->
            hit n id model

        Notify message ->
            { model
                | log = ( model.gameTime, message ) :: model.log
            }

        Victory ->
            { model | victory = True }


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
            seekingUpdate model.universe id actor cockpit

        Waiting lifespan ->
            waitingUpdate id actor lifespan

        Dumb ->
            ( Mechanics.glide actor, [] )


seekingUpdate : Dict Id Body -> Id -> Body -> MissileCockpit -> ( Body, List EngineEffect )
seekingUpdate universe id actor cockpit =
    if cockpit.lifespan > 0 then
        let
            moved =
                case Dict.get cockpit.target universe of
                    Nothing ->
                        Mechanics.glide actor

                    Just target ->
                        Mechanics.evolveObject (accelTowards 0.7 target)
                            actor

            agedCockpit =
                { cockpit | lifespan = cockpit.lifespan - Util.delta }
        in
            ( { moved | ai = Seeking agedCockpit }, [] )
    else
        ( actor, [ Destroy id ] )


accelTowards : Float -> Body -> Body -> Acceleration
accelTowards scale target missile =
    let
        range =
            Vector.sub target.position missile.position

        velocity =
            Vector.sub target.velocity missile.velocity

        rSquared =
            Vector.distanceSquared target.position missile.position

        lineOfSightRotation =
            Vector.scale (scale / rSquared) (Vector.cross range velocity)
    in
        { linear = Vector.cross velocity lineOfSightRotation
        , angular = Vector.vector 0 0 0
        }


waitingUpdate : Id -> Body -> Float -> ( Body, List EngineEffect )
waitingUpdate id actor lifespan =
    if lifespan > 0 then
        ( Mechanics.glide { actor | ai = Waiting (lifespan - Util.delta) }, [] )
    else
        ( actor, [ Destroy id ] )
