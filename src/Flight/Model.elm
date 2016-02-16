module Flight.Model (update) where

import Char exposing (KeyCode)
import Dict
import Task
import Effects exposing (Effects)
import Set exposing (Set)
import Types exposing (..)
import Math.Mechanics as Mech
import Math.Vector as Vector exposing (Vector)
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

    Collide _ _ ->
      GameOver.Init.gameOver model.library

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
    shipPosition =
      Dict.get "ship" model.universe
        |> Maybe.map .position
        |> Maybe.withDefault (Vector.vector 0 0 0)

    collidedWith =
      Dict.foldl
        (\label hull accumulator ->
          if Collision.isInside shipPosition hull then
            Just label
          else
            accumulator
        )
        Nothing
        model.universe
  in
    case collidedWith of
      Just label ->
        Collide "ship" label
          |> Task.succeed
          |> Effects.task

      Nothing ->
        Effects.none


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
                , action = Init.inaction
              }
              model.universe
        , graphics =
            (Object { bodyName = "missile", meshName = "Ship", shader = Ship })
              :: model.graphics
      }

    Nothing ->
      model


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
