module Flight.Ai (aiUpdate, steerAi, acceleration, angleSpring) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform
import Flight.Switch as Switch
import Flight.Util as Util


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


steerAi : Float -> Body -> Dict Id Body -> Ai
steerAi delta object universe =
  case object.ai of
    Dumb ->
      Dumb

    Hostile ai ->
      Hostile
        { ai
          | trigger =
              Switch.repeat
                delta
                (Util.faces ai.target object universe)
                ai.trigger
        }

    Seeking lifespan target ->
      if lifespan > 0 then
        Seeking (lifespan - delta) target
      else
        SelfDestruct

    PlayerControlled _ ->
      object.ai

    SelfDestruct ->
      object.ai

    Waiting lifespan ->
      if lifespan > 0 then
        Waiting (lifespan - delta)
      else
        SelfDestruct


acceleration : Dict Id Body -> Body -> Acceleration
acceleration universe object =
  case object.ai of
    Dumb ->
      noAcceleration

    Hostile ai ->
      case Dict.get ai.target universe of
        Nothing ->
          noAcceleration

        Just target ->
          smartAccel object target

    PlayerControlled cockpit ->
      accelFromAction cockpit.action object

    Seeking _ targetName ->
      case Dict.get targetName universe of
        Just target ->
          accelTowards 0.7 target object

        Nothing ->
          noAcceleration

    SelfDestruct ->
      noAcceleration

    Waiting _ ->
      noAcceleration


smartAccel : Body -> Body -> Acceleration
smartAccel object target =
  let
    relativePosition =
      Vector.sub (target.position |> Debug.log "pos") object.position

    relativeVelocity =
      Vector.sub target.velocity object.velocity

    scale =
      1.0

    damping =
      0.3

    max m v =
      let
        mag =
          Vector.length v
      in
        if mag > m then
          Vector.scale (m / mag) v
        else
          v
  in
    { linear =
        Vector.scale (0.25 / damping) relativePosition
          |> Vector.add relativeVelocity
          |> Vector.scale scale
          |> max 10
    , angular =
        angleSpring 0.5 target.position object
          |> Vector.scale 3
    }


angleSpring : Float -> Vector -> Body -> Vector
angleSpring damping targetPosition body =
  let
    rotation =
      Transform.rotationFor
        (Vector.vector 0 0 -1)
        (Transform.toBodyFrame targetPosition body)
  in
    Vector.sub
      (Vector.scale (0.25 / damping) rotation)
      body.angVelocity


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


accelTowards : Float -> Body -> Body -> Acceleration
accelTowards scale target missile =
  let
    range =
      Vector.sub target.position missile.position

    velocity =
      Vector.sub target.velocity missile.velocity

    rSquared =
      Vector.distanceSquared target.position missile.position

    lineOfSightRotation =
      Vector.scale (scale / rSquared) (Vector.cross range velocity)
  in
    { linear = Vector.cross velocity lineOfSightRotation
    , angular = Vector.vector 0 0 0
    }


noAcceleration : Acceleration
noAcceleration =
  { linear = Vector.vector 0 0 0
  , angular = Vector.vector 0 0 0
  }
