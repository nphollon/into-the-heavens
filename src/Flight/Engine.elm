module Flight.Engine (update) where

import Dict exposing (Dict)
import Random.PCG as Random
import Types exposing (..)
import Math.Collision as Collision
import Flight.Init as Init
import Flight.Ai as Ai
import Flight.Mechanics as Mech
import Flight.Spawn as Spawn


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


check : (GameState -> List EngineEffect) -> GameState -> GameState
check up model =
  List.foldl applyEffect model (up model)


applyEffect : EngineEffect -> GameState -> GameState
applyEffect effect model =
  case effect of
    IncreaseScore ->
      { model | score = model.score + 1 }

    SpawnShip ->
      let
        ( rootSeed, shipSeed ) =
          Random.split model.seed

        ( spawnModel, spawnName ) =
          Spawn.spawn (Ship shipSeed) model
      in
        Init.updatePlayer
          (\cockpit -> { cockpit | target = spawnName })
          { spawnModel
            | seed = rootSeed
          }

    SpawnMissile sourceName targetName ->
      case Dict.get sourceName model.universe of
        Just source ->
          Spawn.spawn (Missile source targetName) model |> fst

        Nothing ->
          model

    SetTrigger bodyName newTrigger ->
      let
        setTrigger cockpit =
          { cockpit | trigger = newTrigger }

        updateCockpit body =
          case body.ai of
            Just (PlayerControlled cockpit) ->
              { body | ai = Just (PlayerControlled (setTrigger cockpit)) }

            Just (Aimless ai) ->
              { body
                | ai =
                    Just (Aimless { ai | cockpit = setTrigger ai.cockpit })
              }

            _ ->
              body
      in
        { model
          | universe =
              Dict.update bodyName (Maybe.map updateCockpit) model.universe
        }

    Collide a b ->
      hit a (hit b model)


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


shouldCrash : GameState -> List EngineEffect
shouldCrash model =
  let
    collidedWith pointLabel point hullLabel hull effects =
      if Collision.isInside point.position hull && pointLabel /= hullLabel then
        Collide pointLabel hullLabel :: effects
      else
        effects
  in
    Dict.foldl
      (\label body effects ->
        Dict.foldl (collidedWith label body) effects model.universe
      )
      []
      model.universe


shouldSpawn : GameState -> List EngineEffect
shouldSpawn model =
  if Init.visitorCount model == 0 then
    [ IncreaseScore, SpawnShip ]
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
        Just (PlayerControlled cockpit) ->
          next name cockpit effects

        Just (Aimless { cockpit }) ->
          next name cockpit effects

        Just (Hostile cockpit) ->
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
