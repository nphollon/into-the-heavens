module Flight.Engine (update) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Collision as Collision
import Flight.Ai as Ai
import Flight.Mechanics as Mech
import Flight.Spawn as Spawn
import Flight.Util as Util
import Maybe.Extra as MaybeX


update : Float -> GameState -> GameState
update dt =
  Ai.aiUpdate dt
    >> check shouldSpawn
    >> check shouldCrash
    >> check shouldFire
    >> thrust dt


type EngineEffect
  = IncreaseScore
  | SpawnShip
  | SpawnMissile String String
  | SetTrigger String Trigger
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
      Util.mapRandom (Ship >> Spawn.spawn) model

    ChangeTarget ->
      Util.setPlayerTarget model

    SpawnMissile sourceName targetName ->
      case Dict.get sourceName model.universe of
        Just source ->
          Spawn.spawn (Missile source targetName) model

        Nothing ->
          model

    SetTrigger bodyName newTrigger ->
      let
        setTrigger cockpit =
          { cockpit | trigger = newTrigger }

        updateCockpit body =
          case body.ai of
            PlayerControlled cockpit ->
              { body | ai = PlayerControlled (setTrigger cockpit) }

            Hostile ai ->
              { body | ai = Hostile (setTrigger ai) }

            _ ->
              body
      in
        { model
          | universe =
              Dict.update bodyName (Maybe.map updateCockpit) model.universe
        }

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
        MissileHit pointLabel hullLabel :: effects
      else
        Collide pointLabel hullLabel :: effects
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
      cockpit.shieldsUp

    _ ->
      False


shouldSpawn : GameState -> List EngineEffect
shouldSpawn model =
  if Spawn.visitorCount model == 0 then
    [ IncreaseScore, SpawnShip, ChangeTarget ]
  else
    []


shouldFire : GameState -> List EngineEffect
shouldFire model =
  let
    next name cockpit effects =
      case cockpit.trigger of
        Fire ->
          SpawnMissile name cockpit.target
            :: SetTrigger name Reset
            :: effects

        FireAndReset ->
          SpawnMissile name cockpit.target
            :: SetTrigger name Ready
            :: effects

        _ ->
          effects

    checkOne name body effects =
      case body.ai of
        PlayerControlled cockpit ->
          next name cockpit effects

        Hostile cockpit ->
          next name cockpit effects

        _ ->
          effects
  in
    Dict.foldl checkOne [] model.universe


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
