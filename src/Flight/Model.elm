module Flight.Model (update) where

import Char
import Dict
import Effects exposing (Effects)
import Set exposing (Set)
import Types exposing (Update(..), Action, GameState, Mode(..), AiState(..))
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

    rule ship _ =
      { linear =
          if ship.action.thrust >= 0 then
            Vector.vector 0 0 (toFloat ship.action.thrust * -10)
              |> Matrix.rotate ship.orientation
          else
            Vector.scale -10 ship.velocity
      , angular =
          Vector.vector
            (goOrStop (toFloat ship.action.pitch) (ship.angVelocity.x))
            (goOrStop (toFloat ship.action.yaw) (ship.angVelocity.y))
            (goOrStop (toFloat ship.action.roll) (ship.angVelocity.z))
      }
  in
    { model
      | universe =
          Mech.evolve
            (Dict.fromList
              [ ( "ship", rule )
              , ( "other", rule )
              ]
            )
            delta
            model.universe
    }


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


crashCheck : GameState -> ( Mode, Effects a )
crashCheck model =
  let
    shipPosition =
      Dict.get "ship" model.universe.bodies
        |> Maybe.map .position
        |> Maybe.withDefault (Vector.vector 0 0 0)

    shipCrashed =
      Dict.values model.universe.bodies
        |> List.any (Collision.isInside shipPosition)
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
    setAction "ship" (Set.foldl keyAct Init.inaction keysDown) model


setAction : String -> Action -> GameState -> GameState
setAction label newAction model =
  let
    updateAction b =
      { b | action = newAction }

    updateUniverse u =
      { u
        | bodies =
            Dict.update label (Maybe.map updateAction) u.bodies
      }
  in
    { model | universe = updateUniverse model.universe }
