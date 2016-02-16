module Math.Mechanics (evolve, defaultAcceleration) where

import Dict exposing (Dict)
import Types exposing (Body, Geometry)
import Math.Vector as Vector exposing (Vector)


type alias Acceleration =
  { linear : Vector
  , angular : Vector
  }


defaultAcceleration : Acceleration
defaultAcceleration =
  { linear = Vector.vector 0 0 0
  , angular = Vector.vector 0 0 0
  }


type alias Rule =
  Body -> Acceleration



-- Evolving states


evolve : Rule -> Float -> Dict String Body -> Dict String Body
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


stateDerivative : Rule -> Dict String Body -> Dict String Geometry
stateDerivative accel state =
  let
    deriv _ object =
      let
        a =
          accel object
      in
        { position = object.geometry.velocity
        , velocity = a.linear
        , orientation = object.geometry.angVelocity
        , angVelocity = a.angular
        }
  in
    Dict.map deriv state


nudge : Float -> Dict String Geometry -> Dict String Body -> Dict String Body
nudge dt derivatives state =
  let
    add dpdt p =
      { position =
          Vector.add p.position (Vector.scale dt dpdt.position)
      , velocity =
          Vector.add p.velocity (Vector.scale dt dpdt.velocity)
      , orientation =
          Vector.orient p.orientation (Vector.scale dt dpdt.orientation)
      , angVelocity =
          Vector.add p.angVelocity (Vector.scale dt dpdt.angVelocity)
      }

    combine ( _, dpdt ) ( label, state ) =
      (,)
        label
        { state | geometry = add dpdt state.geometry }
  in
    Dict.fromList
      (List.map2
        combine
        (Dict.toList derivatives)
        (Dict.toList state)
      )
