module Math.Mechanics (evolve) where

import Dict exposing (Dict)
import Types exposing (Body, Action, Ai(..))
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform


-- Evolving states


evolve : Float -> Dict String Body -> Dict String Body
evolve dt =
  Dict.map (\k v -> evolveObject dt v)


evolveObject : Float -> Body -> Body
evolveObject dt object =
  let
    accel =
      acceleration object

    stateDerivative state =
      { state
        | position = state.velocity
        , velocity = accel.linear
        , orientation = state.angVelocity
        , angVelocity = accel.angular
      }

    a =
      stateDerivative object

    b =
      stateDerivative (nudge (dt / 2) a object)

    c =
      stateDerivative (nudge (dt / 2) b object)

    d =
      stateDerivative (nudge dt c object)
  in
    object
      |> nudge (dt / 6) a
      |> nudge (dt / 3) b
      |> nudge (dt / 3) c
      |> nudge (dt / 6) d


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


nudge : Float -> Body -> Body -> Body
nudge dt dpdt p =
  { p
    | position =
        Vector.add p.position (Vector.scale dt dpdt.position)
    , velocity =
        Vector.add p.velocity (Vector.scale dt dpdt.velocity)
    , orientation =
        Transform.mulOrient p.orientation (Vector.scale dt dpdt.orientation)
    , angVelocity =
        Vector.add p.angVelocity (Vector.scale dt dpdt.angVelocity)
  }


type alias Acceleration =
  { linear : Vector
  , angular : Vector
  }


defaultAcceleration : Acceleration
defaultAcceleration =
  { linear = Vector.vector 0 0 0
  , angular = Vector.vector 0 0 0
  }
