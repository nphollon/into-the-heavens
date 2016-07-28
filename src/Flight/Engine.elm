module Flight.Engine exposing (update)

import Set
import Dict exposing (Dict)
import List.Extra as ListX
import Collision exposing (Bounds)
import Types exposing (..)
import Flight.Mechanics as Mech
import Flight.Spawn as Spawn
import Flight.Switch as Switch
import Flight.Util as Util


update : Float -> GameState -> GameState
update dt state =
    state
        |> thrust dt
        |> checkCollisions
        |> processActions dt
        |> aiUpdate dt
        |> checkSchedule


aiUpdate : Float -> GameState -> GameState
aiUpdate dt model =
    let
        updateAll =
            Dict.map (act dt model.universe) model.universe

        allEffects =
            Dict.foldl (\_ ( _, effects ) -> (::) effects) [] updateAll
                |> List.concat

        newUniverse =
            Dict.map (\_ ( body, _ ) -> body) updateAll
    in
        applyEffects allEffects { model | universe = newUniverse }


act : Float -> Dict Id Body -> Id -> Body -> ( Body, List EngineEffect )
act dt universe id actor =
    case actor.ai of
        PlayerControlled cockpit ->
            if cockpit.trigger.value == 1 then
                ( actor, [ SpawnMissile id cockpit.target ] )
            else if Dict.get cockpit.target universe == Nothing then
                ( actor, [ ChangeTarget ] )
            else
                ( actor, [] )

        Hostile cockpit ->
            let
                newAi =
                    Hostile
                        { cockpit
                            | trigger =
                                Switch.repeat dt
                                    (Util.faces cockpit.target actor universe)
                                    cockpit.trigger
                        }

                effects =
                    if cockpit.trigger.value == 1 then
                        [ SpawnMissile id cockpit.target ]
                    else
                        []
            in
                ( { actor | ai = newAi }, effects )

        Seeking lifespan target ->
            if lifespan > 0 then
                ( { actor | ai = Seeking (lifespan - dt) target }, [] )
            else
                ( actor, [ Destroy id ] )

        Waiting lifespan ->
            if lifespan > 0 then
                ( { actor | ai = Waiting (lifespan - dt) }, [] )
            else
                ( actor, [ Destroy id ] )

        Dumb ->
            ( actor, [] )


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


thrust : Float -> GameState -> GameState
thrust delta model =
    { model | universe = Mech.evolve delta model.universe }


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


processActions : Float -> GameState -> GameState
processActions dt model =
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
            Switch.drain dt
                (toggle ShieldsUp)
                cockpit.shields

        trigger cockpit =
            Switch.repeat dt
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
