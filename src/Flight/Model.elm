module Flight.Model (update) where

import Char
import Dict
import Effects exposing (Effects)
import Set exposing (Set)
import Types exposing (..)
import Math.Mechanics as Mech
import Math.Vector as Vector exposing (Vector)
import Math.Matrix as Matrix
import Flight.Init as Init
import GameOver.Init
import Math.Collision as Collision


update : Update -> GameState -> ( Mode, Effects a )
update input model =
  let
    noEffects =
      flip (,) Effects.none
  in
    case input of
      FPS dt ->
        steerAi dt model
          |> thrust dt
          |> crashCheck

      Keys keysDown ->
        controlUpdate keysDown model
          |> GameMode
          |> noEffects

      otherwise ->
        noEffects (GameMode model)


thrust : Float -> GameState -> GameState
thrust delta model =
  let
    goOrStop dir vel =
      if dir == 0 then
        -6 * vel
      else
        200 * delta * (toFloat dir)

    applyAction action geometry =
      { linear =
          if action.thrust >= 0 then
            Vector.vector 0 0 (toFloat action.thrust * -10)
              |> Matrix.rotate geometry.orientation
          else
            Vector.scale -10 geometry.velocity
      , angular =
          Vector.vector
            (goOrStop action.pitch (geometry.angVelocity.x))
            (goOrStop action.yaw (geometry.angVelocity.y))
            (goOrStop action.roll (geometry.angVelocity.z))
      }

    rule ship =
      case ship.bodyType of
        Background _ ->
          Mech.defaultAcceleration

        Inert _ ->
          Mech.defaultAcceleration

        Active { action } ->
          applyAction action ship.geometry

        Camera { action } ->
          applyAction action ship.geometry
  in
    { model | bodies = Mech.evolve rule delta model.bodies }


steerAi : Float -> GameState -> GameState
steerAi delta model =
  let
    updateIfActive body =
      case body.bodyType of
        Active data ->
          { body | bodyType = Active (steer data) }

        otherwise ->
          body

    steer data =
      let
        check time thisState nextState nextAction =
          if time < 0 then
            { data
              | ai = nextState
              , action = nextAction
            }
          else
            { data | ai = thisState time }
      in
        case data.ai of
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
  in
    { model | bodies = Dict.map (\key -> updateIfActive) model.bodies }


crashCheck : GameState -> ( Mode, Effects a )
crashCheck model =
  let
    shipPosition =
      Dict.get "player" model.bodies
        |> Maybe.map (.geometry >> .position)
        |> Maybe.withDefault (Vector.vector 0 0 0)

    collidedWith body =
      case body.bodyType of
        Inert { hull } ->
          Collision.isInside shipPosition body.geometry hull

        Active { hull } ->
          Collision.isInside shipPosition body.geometry hull

        otherwise ->
          False

    shipCrashed =
      List.any collidedWith (Dict.values model.bodies)
  in
    if shipCrashed then
      GameOver.Init.gameOver model.library
    else
      ( GameMode model, Effects.none )


controlUpdate : Set Char.KeyCode -> GameState -> GameState
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
  in
    setAction "player" (Set.foldl keyAct Init.inaction keysDown) model


setAction : String -> Action -> GameState -> GameState
setAction label newAction model =
  let
    updateAction body =
      case body.bodyType of
        Camera data ->
          { body
            | bodyType = Camera { action = newAction }
          }

        otherwise ->
          body
  in
    { model
      | bodies =
          Dict.update label (Maybe.map updateAction) model.bodies
    }
