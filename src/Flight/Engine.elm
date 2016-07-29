module Flight.Engine exposing (update, angleSpring)

import Set
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


update : GameState -> GameState
update state =
    state
        |> checkCollisions
        |> processActions
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


processActions : GameState -> GameState
processActions model =
    let
        toggle action =
            Set.member (Util.keyMap action) model.playerActions

        twoWayToggle neg pos =
            case ( toggle neg, toggle pos ) of
                ( True, False ) ->
                    -1

                ( False, True ) ->
                    1

                _ ->
                    0

        action =
            { yaw = twoWayToggle RightTurn LeftTurn
            , pitch = twoWayToggle DownTurn UpTurn
            , roll = twoWayToggle CounterclockwiseRoll ClockwiseRoll
            , thrust = twoWayToggle Brake Thrust
            }

        shields cockpit =
            Switch.drain Util.delta
                (toggle ShieldsUp)
                cockpit.shields

        trigger cockpit =
            Switch.repeat Util.delta
                (toggle Firing && not cockpit.shields.on)
                cockpit.trigger

        newCockpit cockpit =
            { cockpit
                | action = action
                , shields = shields cockpit
                , trigger = trigger cockpit
            }
    in
        if toggle TargetFacing then
            Util.updatePlayerCockpit newCockpit model
                |> Util.setPlayerTarget
        else
            Util.updatePlayerCockpit newCockpit model


aiUpdate : GameState -> GameState
aiUpdate model =
    let
        updateAll =
            Dict.map (act model.universe) model.universe

        allEffects =
            Dict.foldl (\_ ( _, effects ) -> (::) effects) [] updateAll
                |> List.concat

        newUniverse =
            Dict.map (\_ ( body, _ ) -> body) updateAll
    in
        applyEffects allEffects { model | universe = newUniverse }


act : Dict Id Body -> Id -> Body -> ( Body, List EngineEffect )
act universe id actor =
    case actor.ai of
        PlayerControlled cockpit ->
            let
                moved =
                    evolveObject (accelFromAction cockpit.action) actor
            in
                if cockpit.trigger.value == 1 then
                    ( moved, [ SpawnMissile id cockpit.target ] )
                else if Dict.get cockpit.target universe == Nothing then
                    ( moved, [ ChangeTarget ] )
                else
                    ( moved, [] )

        Hostile cockpit ->
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
                            evolveObject (smartAccel target) actor

                effects =
                    if cockpit.trigger.value == 1 then
                        [ SpawnMissile id cockpit.target ]
                    else
                        []
            in
                ( { moved | ai = newAi }, effects )

        Seeking lifespan targetName ->
            if lifespan > 0 then
                let
                    moved =
                        case Dict.get targetName universe of
                            Nothing ->
                                glide actor

                            Just target ->
                                evolveObject (accelTowards 0.7 target)
                                    actor
                in
                    ( { moved | ai = Seeking (lifespan - Util.delta) targetName }
                    , []
                    )
            else
                ( actor, [ Destroy id ] )

        Waiting lifespan ->
            if lifespan > 0 then
                ( glide { actor | ai = Waiting (lifespan - Util.delta) }, [] )
            else
                ( actor, [ Destroy id ] )

        Dumb ->
            ( glide actor, [] )


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

        ChangeTarget ->
            Util.setPlayerTarget model

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


accelFromAction : Action -> Body -> Acceleration
accelFromAction action object =
    let
        turningSpeed =
            2.0

        turningAccel =
            5.0

        speed =
            5.0

        accel =
            5.0

        goOrStop dir vel =
            turningAccel * (turningSpeed * toFloat dir - vel)

        targetSpeed =
            speed * (1 + toFloat action.thrust)

        targetVelocity =
            Vector.vector 0 0 -targetSpeed
                |> Quaternion.rotateVector object.orientation
    in
        { linear =
            Vector.scale accel (Vector.sub targetVelocity object.velocity)
        , angular =
            Vector.vector (goOrStop action.pitch (Vector.getX object.angVelocity))
                (goOrStop action.yaw (Vector.getY object.angVelocity))
                (goOrStop action.roll (Vector.getZ object.angVelocity))
        }


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


evolveObject : (Body -> Acceleration) -> Body -> Body
evolveObject acceleration object =
    let
        dt =
            Util.delta

        stateDerivative state =
            let
                accel =
                    acceleration state
            in
                { state
                    | position = state.velocity
                    , velocity = accel.linear
                    , orientation = Quaternion.fromVector state.angVelocity
                    , angVelocity = accel.angular
                }

        a =
            stateDerivative object

        b =
            stateDerivative (nudge (dt / 2) a object)

        c =
            stateDerivative (nudge (dt / 2) b object)

        d =
            stateDerivative (nudge dt c object)
    in
        object
            |> nudge (dt / 6) a
            |> nudge (dt / 3) b
            |> nudge (dt / 3) c
            |> nudge (dt / 6) d


nudge : Float -> Body -> Body -> Body
nudge dt dpdt p =
    { p
        | position =
            Vector.add p.position (Vector.scale dt dpdt.position)
        , velocity =
            Vector.add p.velocity (Vector.scale dt dpdt.velocity)
        , orientation =
            Quaternion.compose (Quaternion.scale dt dpdt.orientation) p.orientation
        , angVelocity =
            Vector.add p.angVelocity (Vector.scale dt dpdt.angVelocity)
    }


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
