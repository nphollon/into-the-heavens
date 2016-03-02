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
  fireCheck
    >> spawnCheck
    >> Ai.aiUpdate dt
    >> thrust dt
    >> crashCheck


spawnCheck : GameState -> GameState
spawnCheck model =
  if Init.visitorCount model == 0 then
    let
      ( rootSeed, shipSeed ) =
        Random.split model.seed

      ( spawnModel, spawnName ) =
        Init.spawn (Ship shipSeed) model
    in
      Init.updatePlayer
        (\cockpit -> { cockpit | target = spawnName })
        { spawnModel
          | seed = rootSeed
          , score = model.score + 1
        }
  else
    model


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


crashCheck : GameState -> GameState
crashCheck model =
  let
    collidedWith pointLabel point hullLabel hull m =
      if Collision.isInside point.position hull && pointLabel /= hullLabel then
        m |> hit pointLabel |> hit hullLabel
      else
        m
  in
    Dict.foldl
      (\label body updatedModel ->
        Dict.foldl (collidedWith label body) updatedModel model.universe
      )
      model
      model.universe


fireCheck : GameState -> GameState
fireCheck model =
  let
    updateCockpit cockpit =
      case cockpit.trigger of
        Fire ->
          Just { cockpit | trigger = Reset }

        FireAndReset ->
          Just { cockpit | trigger = Ready }

        _ ->
          Nothing

    getUpdateFor body =
      case body.ai of
        Just (PlayerControlled cockpit) ->
          case updateCockpit cockpit of
            Just newCockpit ->
              Just ( { body | ai = Just (PlayerControlled newCockpit) }, Missile body cockpit.target )

            Nothing ->
              Nothing

        Just (Aimless ai) ->
          case updateCockpit ai.cockpit of
            Just newCockpit ->
              Just
                ( { body | ai = Just (Aimless { ai | cockpit = newCockpit }) }
                , Missile body newCockpit.target
                )

            Nothing ->
              Nothing

        _ ->
          Nothing

    checkOne label body newModel =
      case getUpdateFor body of
        Just ( newBody, missile ) ->
          { newModel
            | universe =
                Dict.insert label newBody newModel.universe
          }
            |> Init.spawn missile
            |> fst

        Nothing ->
          newModel
  in
    Dict.foldl checkOne model model.universe


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
