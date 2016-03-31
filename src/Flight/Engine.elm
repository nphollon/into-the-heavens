module Flight.Engine (update, shouldCrash) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Collision as Collision
import Flight.Ai as Ai
import Flight.Mechanics as Mech
import Flight.Spawn as Spawn
import Flight.Switch as Switch
import Flight.Util as Util


update : Float -> GameState -> GameState
update dt =
  processActions dt
    >> Ai.aiUpdate dt
    >> checkSchedule
    >> check shouldChangeTarget
    >> check shouldCrash
    >> check shouldFire
    >> thrust dt


processActions : Float -> GameState -> GameState
processActions dt model =
  let
    toggle playerAction =
      List.member playerAction model.playerActions

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
      Switch.drain
        dt
        (toggle ShieldsUp)
        cockpit.shields

    trigger cockpit =
      Switch.repeat
        dt
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


check : (Dict Id Body -> List EngineEffect) -> GameState -> GameState
check up model =
  applyEffects (up model.universe) model


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

    SpawnCheckpoint id body ->
      Spawn.spawnCheckpoint id body model

    ChangeTarget ->
      Util.setPlayerTarget model

    Destroy id ->
      Util.blowUp id model

    DestroyByName name ->
      Util.getId name model
        |> Maybe.map (flip Util.blowUp model)
        |> Maybe.withDefault model

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


shouldCrash : Dict Id Body -> List EngineEffect
shouldCrash universe =
  let
    isExempt pointLabel point hullLabel hull =
      Collision.isOutside point.position hull
        || (pointLabel == hullLabel)
        || (Util.isEthereal point)

    collidedWith pointLabel point hullLabel hull effects =
      if isExempt pointLabel point hullLabel hull then
        effects
      else if not (Util.isMissile point) then
        DeductHealth hull.health pointLabel
          :: DeductHealth point.health hullLabel
          :: effects
      else if Util.isShielded hull then
        Destroy pointLabel
          :: effects
      else
        Destroy pointLabel
          :: DeductHealth point.health hullLabel
          :: effects
  in
    Dict.foldl
      (\id body effects ->
        Dict.foldl (collidedWith id body) effects universe
      )
      []
      universe


shouldFire : Dict Id Body -> List EngineEffect
shouldFire universe =
  let
    checkTrigger id cockpit effects =
      if cockpit.trigger.value == 1 then
        SpawnMissile id cockpit.target :: effects
      else
        effects

    checkCockpit id body effects =
      case body.ai of
        PlayerControlled cockpit ->
          checkTrigger id cockpit effects

        Hostile cockpit ->
          checkTrigger id cockpit effects

        _ ->
          effects
  in
    Dict.foldl checkCockpit [] universe


shouldChangeTarget : Dict Id Body -> List EngineEffect
shouldChangeTarget universe =
  let
    currentTarget =
      Util.getPlayer universe |> .cockpit |> .target
  in
    case Dict.get currentTarget universe of
      Nothing ->
        [ ChangeTarget ]

      _ ->
        []


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
            Dict.insert
              id
              { object | health = object.health - damage }
              model.universe
      }
    else
      applyEffect (Destroy id) model
