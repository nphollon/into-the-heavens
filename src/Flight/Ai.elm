module Flight.Ai (aiUpdate, steerAi, acceleration, angleSpring) where

import Dict exposing (Dict)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
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
        if ai.timeUntilReady > 0 then
          Hostile
            { ai | timeUntilReady = ai.timeUntilReady - delta }
        else if facesTarget then
          Hostile
            { ai
              | trigger = FireAndReset
              , timeUntilReady = ai.cooldown
            }
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
        Vector.vector 0 0 0
        {-
        Vector.scale (0.25 / damping) relativePosition
          |> Vector.add relativeVelocity
          |> Vector.scale scale
          |> max 10
        -}
    , angular = Vector.scale (80 / turns 1) (angleSpring 0.1 target.position object)
    }


angleSpring : Float -> Vector -> Body -> Vector
angleSpring damping targetPosition body =
  let
    rotation =
      Transform.rotationFor
        (Transform.rotate body.orientation (Vector.vector 0 0 -1))
        (Vector.sub targetPosition body.position)
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
