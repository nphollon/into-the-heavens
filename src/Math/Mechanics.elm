module Math.Mechanics (evolve, body) where

import Dict exposing (Dict)
import Types exposing (Body)
import Math.Vector as Vector exposing (Vector)


body : String -> Dict String Body -> Maybe Body
body key state =
  Dict.get key state



-- Evolving states


evolve : Rules -> Float -> Dict String Body -> Dict String Body
evolve accel dt state =
  let
    a =
      stateDerivative accel state

    b =
      nudge (dt / 2) a state |> stateDerivative accel

    c =
      nudge (dt / 2) b state |> stateDerivative accel

    d =
      nudge dt c state |> stateDerivative accel
  in
    state
      |> nudge (dt / 6) a
      |> nudge (dt / 3) b
      |> nudge (dt / 3) c
      |> nudge (dt / 6) d


stateDerivative : Rules -> Dict String Body -> Dict String Body
stateDerivative accels state =
  Dict.map
    (\key particle ->
      let
        a =
          Dict.get key accels
            |> Maybe.map (\accel -> accel particle state)
            |> Maybe.withDefault defaultAcceleration
      in
        { particle
          | position = particle.velocity
          , velocity = a.linear
          , orientation = particle.angVelocity
          , angVelocity = a.angular
        }
    )
    state


nudge : Float -> Dict String Body -> Dict String Body -> Dict String Body
nudge dt derivative state =
  let
    -- stateDerivative guarantees that the labels are the same
    combine ( label, dpdt ) ( _, p ) =
      (,)
        label
        { p
          | position =
              Vector.add p.position (Vector.scale dt dpdt.position)
          , velocity =
              Vector.add p.velocity (Vector.scale dt dpdt.velocity)
          , orientation =
              Vector.orient p.orientation (Vector.scale dt dpdt.orientation)
          , angVelocity =
              Vector.add p.angVelocity (Vector.scale dt dpdt.angVelocity)
        }
  in
    List.map2
      combine
      (Dict.toList derivative)
      (Dict.toList state)
      |> Dict.fromList


type alias Acceleration =
  { linear : Vector
  , angular : Vector
  }


defaultAcceleration : Acceleration
defaultAcceleration =
  { linear = Vector.vector 0 0 0
  , angular = Vector.vector 0 0 0
  }


type alias Rules =
  Dict String (Body -> Dict String Body -> Acceleration)
