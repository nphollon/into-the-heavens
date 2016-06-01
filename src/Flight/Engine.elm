module Flight.Engine (update, shouldCrash) where

import Dict exposing (Dict)
import List.Extra as ListX
import Types exposing (..)
import Math.BoundingBox as BoundingBox exposing (BoundingBox)
import Math.Tree as Tree exposing (Tree)
import Flight.Ai as Ai
import Flight.Mechanics as Mech
import Flight.Spawn as Spawn
import Flight.Switch as Switch
import Flight.Util as Util


update : Float -> GameState -> GameState
update dt state =
  processActions dt state
    |> Ai.aiUpdate dt
    |> checkSchedule
    |> check shouldChangeTarget
    |> check (shouldCrash state.library.boxes)
    |> check shouldFire
    |> thrust dt


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


shouldCrash : Dict String (Tree BoundingBox) -> Dict Id Body -> List EngineEffect
shouldCrash boxLibrary universe =
  let
    lookup boxName =
      Maybe.andThen boxName (flip Dict.get boxLibrary)

    collide bodyA bodyB =
      Maybe.map2
        (\boxA boxB -> BoundingBox.collide bodyA boxA bodyB boxB)
        (lookup bodyA.bounds)
        (lookup bodyB.bounds)
        |> Maybe.withDefault False

    checkPair a b effects =
      if collide (snd a) (snd b) then
        addEffects a b effects
      else
        effects

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

    objectType body =
      if Util.isMissile body then
        Missile
      else if Util.isShielded body then
        Shielded
      else
        Unshielded
  in
    Dict.toList universe
      |> ListX.selectSplit
      |> List.foldl
          (\( _, object, others ) effects ->
            List.foldl (checkPair object) effects others
          )
          []


type ObjectType
  = Missile
  | Shielded
  | Unshielded


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
      applyEffect (Explode id) model
