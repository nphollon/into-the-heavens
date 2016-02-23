module Flight.Engine (update) where

import Dict exposing (Dict)
import Random.PCG as Random
import Types exposing (..)
import Math.Collision as Collision
import Flight.Init as Init
import Flight.Ai as Ai
import Flight.Mechanics as Mech


update : Float -> GameState -> GameState
update dt =
  spawnCheck >> fireCheck >> Ai.aiUpdate dt >> thrust dt >> crashCheck


spawnCheck : GameState -> GameState
spawnCheck model =
  if Init.visitorCount model == 0 then
    let
      ( rootSeed, shipSeed ) =
        Random.split model.seed

      ( spawnModel, spawnName ) =
        Init.spawn (Ship shipSeed) model
    in
      { spawnModel
        | seed = rootSeed
        , score = model.score + 1
        , target = spawnName
      }
  else
    model


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


crashCheck : GameState -> GameState
crashCheck model =
  let
    ( points, hulls ) =
      Dict.partition
        (\_ body -> List.isEmpty body.hull)
        model.universe

    collidedWith pointLabel point accumulator =
      Dict.foldl
        (\hullLabel hull m ->
          if Collision.isInside point.position hull then
            m |> hit pointLabel |> hit hullLabel
          else
            m
        )
        accumulator
        hulls
  in
    Dict.foldl collidedWith model points


fireCheck : GameState -> GameState
fireCheck model =
  case model.missileTrigger of
    Ready ->
      model

    Fire ->
      fireMissile { model | missileTrigger = Reset }

    FireAndReset ->
      fireMissile { model | missileTrigger = Ready }

    Reset ->
      model


fireMissile : GameState -> GameState
fireMissile model =
  Init.getPlayer
    (\p ->
      fst (Init.spawn (Missile p model.target) model)
    )
    model


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
