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
  if Dict.member "visitor" model.universe then
    model
  else
    spawnAi model


steerAi : Float -> Body -> Dict String Body -> Body
steerAi delta object universe =
  case object.ai of
    Nothing ->
      object

    Just (Aimless seed t) ->
      if t > 0 then
        { object | ai = Just (Aimless seed (t - delta)) }
      else
        let
          generator =
            case object.action.thrust of
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
            | action = nextMove.action
            , ai = Just (Aimless nextSeed nextMove.duration)
          }


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


spawnAi : GameState -> GameState
spawnAi model =
  let
    ( rootSeed, shipSeed ) =
      Random.split model.seed
  in
    { model
      | universe =
          Dict.insert
            "visitor"
            (Init.ship shipSeed)
            model.universe
      , seed = rootSeed
      , score = model.score + 1
    }


crashCheck : GameState -> GameState
crashCheck model =
  let
    ( points, hulls ) =
      Dict.partition
        (\_ body -> List.isEmpty body.hull)
        model.universe

    collision =
      Dict.foldl collidedWith model points

    collidedWith pointLabel point accumulator =
      Dict.foldl
        (\label hull acc ->
          if Collision.isInside point.position hull then
            collide pointLabel label acc
          else
            acc
        )
        accumulator
        hulls
  in
    collision


collide : String -> String -> GameState -> GameState
collide particle hull model =
  if particle == "ship" then
    { model | hasCrashed = True }
  else
    model
      |> hit particle
      |> hit hull


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
  case Dict.get "ship" model.universe of
    Just ship ->
      let
        name =
          ("missile" ++ (toString model.nextId))
      in
        { model
          | universe =
              Dict.insert name (Init.missile ship) model.universe
          , nextId = model.nextId + 1
          , graphics =
              Init.missileGraphics name :: model.graphics
        }

    Nothing ->
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
