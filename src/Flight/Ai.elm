module Flight.Ai (aiUpdate, steerAi, acceleration) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector
import Math.Transform as Transform


aiUpdate : Float -> GameState -> GameState
aiUpdate delta model =
  { model
    | universe =
        model.universe
          |> Dict.map
              (\_ object ->
                { object
                  | ai =
                      steerAi delta object model.universe
                }
              )
          |> Dict.filter
              (\_ object -> object.ai /= SelfDestruct)
  }


steerAi : Float -> Body -> Dict String Body -> Ai
steerAi delta object universe =
  case object.ai of
    Dumb ->
      Dumb

    Hostile ai ->
      let
        facesTarget =
          Dict.get ai.target universe
            |> Maybe.map
                (\t -> Transform.degreesFromForward t.position object < degrees 15)
            |> Maybe.withDefault False
      in
        if facesTarget then
          Hostile { ai | trigger = FireAndReset }
        else
          object.ai

    Seeking lifespan target ->
      if lifespan > 0 then
        Seeking (lifespan - delta) target
      else
        SelfDestruct

    PlayerControlled _ ->
      object.ai

    SelfDestruct ->
      object.ai


acceleration : Dict String Body -> Body -> Acceleration
acceleration universe object =
  case object.ai of
    Dumb ->
      noAcceleration

    Hostile _ ->
      noAcceleration

    PlayerControlled cockpit ->
      accelFromAction cockpit.action object

    Seeking _ targetName ->
      case Dict.get targetName universe of
        Just target ->
          accelTowards target object

        Nothing ->
          noAcceleration

    SelfDestruct ->
      noAcceleration


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


accelTowards : Body -> Body -> Acceleration
accelTowards target missile =
  let
    range =
      Vector.sub target.position missile.position

    velocity =
      Vector.sub target.velocity missile.velocity

    rSquared =
      Vector.distanceSquared target.position missile.position

    lineOfSightRotation =
      Vector.scale (0.7 / rSquared) (Vector.cross range velocity)
  in
    { linear = Vector.cross velocity lineOfSightRotation
    , angular = Vector.vector 0 0 0
    }


noAcceleration : Acceleration
noAcceleration =
  { linear = Vector.vector 0 0 0
  , angular = Vector.vector 0 0 0
  }
