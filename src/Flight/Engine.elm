module Flight.Engine (update) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Collision as Collision
import Flight.Ai as Ai
import Flight.Mechanics as Mech
import Flight.Spawn as Spawn
import Flight.Switch as Switch
import Flight.Util as Util
import Maybe.Extra as MaybeX


update : Float -> GameState -> GameState
update dt =
  processActions dt
    >> Ai.aiUpdate dt
    >> check shouldSpawn
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
    Util.updatePlayerCockpit newCockpit model


type EngineEffect
  = IncreaseScore
  | SpawnShip
  | SpawnMissile String String
  | Collide String String
  | MissileHit String String
  | ChangeTarget


check : (GameState -> List EngineEffect) -> GameState -> GameState
check up model =
  List.foldl applyEffect model (up model)


applyEffect : EngineEffect -> GameState -> GameState
applyEffect effect model =
  case effect of
    IncreaseScore ->
      { model | score = model.score + 1 }

    SpawnShip ->
      Util.mapRandom (Spawn.spawnShip) model

    ChangeTarget ->
      Util.setPlayerTarget model

    SpawnMissile sourceName targetName ->
      case Dict.get sourceName model.universe of
        Just source ->
          Spawn.spawnMissile source targetName model

        Nothing ->
          model

    Collide a b ->
      hit a (hit b model)

    MissileHit a b ->
      if MaybeX.mapDefault False shieldsUp (Dict.get b model.universe) then
        hit a model
      else
        hit a (hit b model)


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


shouldCrash : GameState -> List EngineEffect
shouldCrash model =
  let
    collidedWith pointLabel point hullLabel hull effects =
      if Collision.isOutside point.position hull || pointLabel == hullLabel then
        effects
      else if Util.isMissile point then
        MissileHit pointLabel hullLabel :: ChangeTarget :: effects
      else
        Collide pointLabel hullLabel :: ChangeTarget :: effects
  in
    Dict.foldl
      (\label body effects ->
        Dict.foldl (collidedWith label body) effects model.universe
      )
      []
      model.universe


shieldsUp : Body -> Bool
shieldsUp body =
  case body.ai of
    PlayerControlled cockpit ->
      cockpit.shields.on

    _ ->
      False


shouldSpawn : GameState -> List EngineEffect
shouldSpawn model =
  if Spawn.visitorCount model == 0 then
    [ IncreaseScore, SpawnShip, SpawnShip, SpawnShip, ChangeTarget ]
  else
    []


shouldFire : GameState -> List EngineEffect
shouldFire model =
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
    Dict.foldl checkCockpit [] model.universe


hit : String -> GameState -> GameState
hit label model =
  let
    deductHealth body =
      if body.health > 1 then
        Just { body | health = body.health - 1 }
      else
        Nothing
  in
    { model
      | universe =
          Dict.update label (flip Maybe.andThen deductHealth) model.universe
    }
