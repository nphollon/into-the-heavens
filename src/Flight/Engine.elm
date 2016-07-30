module Flight.Engine exposing (update, angleSpring)

import Dict exposing (Dict)
import List.Extra as ListX
import Collision exposing (Bounds)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion
import Math.Transform as Transform
import Flight.Spawn as Spawn
import Flight.Switch as Switch
import Flight.Util as Util
import Flight.Player as Player
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
            Spawn.spawnShip n model

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
            playerUpdate model id actor cockpit

        Hostile cockpit ->
            hostileUpdate model.universe id actor cockpit

        Seeking cockpit ->
            seekingUpdate model.universe id actor cockpit

        Waiting lifespan ->
            waitingUpdate id actor lifespan

        Dumb ->
            ( glide actor, [] )


playerUpdate : GameState -> Id -> Body -> PlayerCockpit -> ( Body, List EngineEffect )
playerUpdate =
    Player.update


hostileUpdate : Dict Id Body -> Id -> Body -> HostileCockpit -> ( Body, List EngineEffect )
hostileUpdate universe id actor cockpit =
    let
        newAi =
            Hostile
                { cockpit
                    | trigger =
                        Switch.repeat Util.delta
                            (Util.faces cockpit.target actor universe)
                            cockpit.trigger
                }

        moved =
            case Dict.get cockpit.target universe of
                Nothing ->
                    glide actor

                Just target ->
                    Mechanics.evolveObject (smartAccel target) actor

        effects =
            if cockpit.trigger.value == 1 then
                [ SpawnMissile id cockpit.target ]
            else
                []
    in
        ( { moved | ai = newAi }, effects )


smartAccel : Body -> Body -> Acceleration
smartAccel target object =
    let
        relativePosition =
            Vector.sub target.position object.position

        relativeVelocity =
            Vector.sub target.velocity object.velocity

        scale =
            1.0

        damping =
            0.3

        max m v =
            let
                mag =
                    Vector.length v
            in
                if mag > m then
                    Vector.scale (m / mag) v
                else
                    v
    in
        { linear =
            Vector.scale (0.25 / damping) relativePosition
                |> Vector.add relativeVelocity
                |> Vector.scale scale
                |> max 10
        , angular =
            angleSpring 0.5 target.position object
                |> Vector.scale 3
        }


angleSpring : Float -> Vector -> Body -> Vector
angleSpring damping targetPosition body =
    let
        rotation =
            Transform.rotationFor (Vector.vector 0 0 -1)
                (Transform.toBodyFrame body targetPosition)
    in
        Vector.sub (Vector.scale (0.25 / damping) (Quaternion.toVector rotation))
            body.angVelocity


seekingUpdate : Dict Id Body -> Id -> Body -> MissileCockpit -> ( Body, List EngineEffect )
seekingUpdate universe id actor cockpit =
    if cockpit.lifespan > 0 then
        let
            moved =
                case Dict.get cockpit.target universe of
                    Nothing ->
                        glide actor

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
        ( glide { actor | ai = Waiting (lifespan - Util.delta) }, [] )
    else
        ( actor, [ Destroy id ] )


glide : Body -> Body
glide body =
    let
        positionChange =
            Vector.scale Util.delta body.velocity

        orientationChange =
            Quaternion.fromVector body.angVelocity
                |> Quaternion.scale Util.delta
    in
        { body
            | position = Vector.add positionChange body.position
            , orientation = Quaternion.compose orientationChange body.orientation
        }
