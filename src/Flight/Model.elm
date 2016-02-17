module Flight.Model (update) where

import Char exposing (KeyCode)
import Dict
import Task
import Effects exposing (Effects)
import Set exposing (Set)
import Types exposing (..)
import Math.Mechanics as Mech
import Flight.Init as Init
import GameOver.Init
import Math.Collision as Collision


update : Update -> GameState -> ( Mode, Effects Update )
update input model =
  case input of
    FPS dt ->
      let
        newModel =
          steerAi dt model
            |> thrust dt
      in
        ( GameMode newModel, crashCheck newModel )

    Keys keysDown ->
      controlUpdate keysDown model

    Collide particle hull ->
      if particle == "ship" then
        GameOver.Init.gameOver model.library
      else
        ( model
            |> hit particle
            |> hit hull
            |> GameMode
        , Effects.none
        )

    FireMissile ->
      ( GameMode (fireMissile model), Effects.none )

    Meshes _ ->
      ( GameMode model, Effects.none )


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


steerAi : Float -> GameState -> GameState
steerAi delta model =
  let
    check time thisState nextState nextAction =
      if time < 0 then
        { model | aiState = nextState }
          |> setAction "other" nextAction
      else
        { model | aiState = thisState time }
  in
    case model.aiState of
      Turning t ->
        check
          (t - delta)
          Turning
          (Thrusting 2)
          { thrust = 1, pitch = 0, yaw = 0, roll = 0 }

      Thrusting t ->
        check
          (t - delta)
          Thrusting
          (Resting 2)
          { thrust = 0, pitch = 0, yaw = 0, roll = 0 }

      Resting t ->
        check
          (t - delta)
          Resting
          (Braking 2)
          { thrust = -1, pitch = 0, yaw = 0, roll = 0 }

      Braking t ->
        check
          (t - delta)
          Braking
          (Turning 0.7)
          { thrust = 0, pitch = 0, yaw = 1, roll = 0 }


crashCheck : GameState -> Effects Update
crashCheck model =
  let
    ( points, hulls ) =
      Dict.partition
        (\_ body -> List.isEmpty body.hull)
        model.universe

    collisions =
      Dict.map
        (\label body -> collidedWith label body.position)
        points

    collidedWith pointLabel position =
      Dict.foldl
        (\label hull accumulator ->
          if Collision.isInside position hull then
            Just (Collide pointLabel label)
          else
            accumulator
        )
        Nothing
        hulls
  in
    Dict.values collisions
      |> List.filterMap
          (Maybe.map (Task.succeed >> Effects.task))
      |> Effects.batch


fireMissile : GameState -> GameState
fireMissile model =
  case Dict.get "ship" model.universe of
    Just ship ->
      { model
        | universe =
            Dict.insert
              "missile"
              { ship
                | hull = []
                , health = 1
                , action =
                    { thrust = 2
                    , pitch = 0
                    , yaw = 0
                    , roll = 0
                    }
              }
              model.universe
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


controlUpdate : Set KeyCode -> GameState -> ( Mode, Effects Update )
controlUpdate keysDown model =
  let
    keyAct key action =
      case (Char.fromCode key) of
        'D' ->
          { action | yaw = action.yaw - 1 }

        'A' ->
          { action | yaw = action.yaw + 1 }

        'S' ->
          { action | pitch = action.pitch - 1 }

        'W' ->
          { action | pitch = action.pitch + 1 }

        'Q' ->
          { action | roll = action.roll - 1 }

        'E' ->
          { action | roll = action.roll + 1 }

        'I' ->
          { action | thrust = action.thrust + 1 }

        'M' ->
          { action | thrust = action.thrust - 1 }

        otherwise ->
          action

    newAction =
      Set.foldl keyAct Init.inaction keysDown

    effect =
      if Set.member (Char.toCode 'O') keysDown then
        Effects.task (Task.succeed FireMissile)
      else
        Effects.none
  in
    ( GameMode (setAction "ship" newAction model), effect )


setAction : String -> Action -> GameState -> GameState
setAction label newAction model =
  let
    updateAction b =
      { b | action = newAction }
  in
    { model
      | universe =
          Dict.update label (Maybe.map updateAction) model.universe
    }
