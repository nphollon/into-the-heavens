module Flight.Engine (update) where

import Dict exposing (Dict)
import Random.PCG as Random
import Types exposing (..)
import Math.Mechanics as Mech
import Math.Collision as Collision
import Flight.Init as Init


update : Float -> GameState -> GameState
update dt =
  spawnCheck >> fireCheck >> aiUpdate dt >> thrust dt >> crashCheck


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


aiUpdate : Float -> GameState -> GameState
aiUpdate delta model =
  { model
    | universe =
        Dict.map
          (\label object ->
            steerAi delta object model.universe
          )
          model.universe
  }


spawnCheck : GameState -> GameState
spawnCheck model =
  if Init.visitorCount model == 0 then
    let
      ( rootSeed, shipSeed ) =
        Random.split model.seed
    in
      Init.spawn
        (Ship shipSeed)
        { model
          | seed = rootSeed
          , score = model.score + 1
        }
  else
    model


steerAi : Float -> Body -> Dict String Body -> Body
steerAi delta object universe =
  case object.ai of
    Nothing ->
      object

    Just (Aimless seed t action) ->
      if t > 0 then
        { object | ai = Just (Aimless seed (t - delta) action) }
      else
        let
          generator =
            case action.thrust of
              -1 ->
                aiThrustGenerator

              0 ->
                aiTurnGenerator

              _ ->
                aiCoastGenerator

          ( nextMove, nextSeed ) =
            Random.generate generator seed
        in
          { object
            | ai =
                Just (Aimless nextSeed nextMove.duration nextMove.action)
          }

    Just (PlayerControlled _) ->
      object


type alias AiMove =
  { duration : Float, action : Action }


aiMove : Float -> Action -> AiMove
aiMove dur act =
  { duration = dur
  , action = act
  }


aiThrustGenerator : Random.Generator AiMove
aiThrustGenerator =
  Random.map
    (flip aiMove { thrust = 1, pitch = 0, yaw = 0, roll = 0 })
    (Random.float 0.1 2)


aiCoastGenerator : Random.Generator AiMove
aiCoastGenerator =
  Random.map
    (flip aiMove { thrust = 0, pitch = 0, yaw = 0, roll = 0 })
    (Random.float 0 1)


aiTurnGenerator : Random.Generator AiMove
aiTurnGenerator =
  let
    action pitch yaw =
      { thrust = -1, pitch = pitch, yaw = yaw, roll = 0 }
  in
    Random.map2
      aiMove
      (Random.float 0 0.7)
      (Random.map2 action (Random.int -1 1) (Random.int -1 1))


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
  Init.getPlayer (Missile >> flip Init.spawn model) model


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
