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
          |> applyEffect event
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

    PlayerIsNear bodyName distance ->
      Util.distanceTo bodyName model.universe
        |> Maybe.map (\r -> r < distance)
        |> Maybe.withDefault False


check : (Dict String Body -> List EngineEffect) -> GameState -> GameState
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

    SpawnMissile sourceName targetName ->
      case Dict.get sourceName model.universe of
        Just source ->
          Spawn.spawnMissile source targetName model

        Nothing ->
          model

    ChangeTarget ->
      Util.setPlayerTarget model

    Destroy name ->
      case Dict.get name model.universe of
        Just visitor ->
          if Util.isVisitor visitor then
            Spawn.spawnExplosion
              visitor
              { model
                | universe = Dict.remove name model.universe
                , score = model.score + 1
              }
          else
            { model | universe = Dict.remove name model.universe }

        Nothing ->
          model

    DeductHealth n name ->
      hit n name model

    Notify message ->
      { model
        | log = ( model.gameTime, message ) :: model.log
      }

    Victory ->
      { model | victory = True }


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


shouldCrash : Dict String Body -> List EngineEffect
shouldCrash universe =
  let
    collidedWith pointLabel point hullLabel hull effects =
      if Collision.isOutside point.position hull || pointLabel == hullLabel then
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
      (\label body effects ->
        Dict.foldl (collidedWith label body) effects universe
      )
      []
      universe


shouldFire : Dict String Body -> List EngineEffect
shouldFire universe =
  let
    checkTrigger name cockpit effects =
      if cockpit.trigger.value == 1 then
        SpawnMissile name cockpit.target :: effects
      else
        effects

    checkCockpit name body effects =
      case body.ai of
        PlayerControlled cockpit ->
          checkTrigger name cockpit effects

        Hostile cockpit ->
          checkTrigger name cockpit effects

        _ ->
          effects
  in
    Dict.foldl checkCockpit [] universe


shouldChangeTarget : Dict String Body -> List EngineEffect
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


hit : Float -> String -> GameState -> GameState
hit damage label model =
  let
    object =
      Dict.get label model.universe
        |> Maybe.withDefault Spawn.defaultBody
  in
    if object.health > damage then
      { model
        | universe =
            Dict.insert
              label
              { object | health = object.health - damage }
              model.universe
      }
    else
      applyEffect (Destroy label) model
