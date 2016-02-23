module Flight.Ai (aiUpdate, acceleration) where

import Dict exposing (Dict)
import Random.PCG as Random
import Types exposing (..)
import Math.Vector as Vector
import Math.Transform as Transform


aiUpdate : Float -> GameState -> GameState
aiUpdate delta model =
  { model
    | universe =
        Dict.map
          (\_ object ->
            steerAi delta object model.universe
          )
          model.universe
  }


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


acceleration : Body -> Acceleration
acceleration object =
  case object.ai of
    Nothing ->
      defaultAcceleration

    Just (Aimless _ _ action) ->
      accelFromAction action object

    Just (PlayerControlled action) ->
      accelFromAction action object


accelFromAction : Action -> Body -> Acceleration
accelFromAction action object =
  let
    goOrStop dir vel =
      if dir == 0 then
        -6 * vel
      else
        5 * toFloat dir
  in
    { linear =
        if action.thrust >= 0 then
          Vector.vector 0 0 (toFloat action.thrust * -10)
            |> Transform.rotate object.orientation
        else
          Vector.scale -10 object.velocity
    , angular =
        Vector.vector
          (goOrStop (toFloat action.pitch) (object.angVelocity.x))
          (goOrStop (toFloat action.yaw) (object.angVelocity.y))
          (goOrStop (toFloat action.roll) (object.angVelocity.z))
    }


defaultAcceleration : Acceleration
defaultAcceleration =
  { linear = Vector.vector 0 0 0
  , angular = Vector.vector 0 0 0
  }
