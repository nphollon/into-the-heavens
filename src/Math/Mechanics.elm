module Math.Mechanics (State, evolve, initialize, recenter, body, Body, Hull) where

import Dict exposing (Dict)
import Math.Vector as Vector exposing (Vector)


type alias State =
  { time : Float
  , bodies : Dict String Body
  }


type alias Body =
  { position : Vector
  , velocity : Vector
  , orientation : Vector
  , angVelocity : Vector
  , mass : Float
  , inertia : Vector
  , hull : Hull
  }


type alias Hull =
  List
    { keyPoint : Vector
    , normal : Vector
    }


initialize : Dict String Body -> State
initialize dataDict =
  { time = 0
  , bodies = dataDict
  }


body : String -> State -> Maybe Body
body key state =
  Dict.get key state.bodies


totalMass : State -> Float
totalMass =
  .bodies >> Dict.foldl (\_ p -> (+) p.mass) 0


recenter : Body -> Body -> Body
recenter origin object =
  { object
    | position = Vector.sub object.position origin.position
    , velocity = Vector.sub object.velocity origin.velocity
  }



-- Evolving states


evolve : Rules -> Float -> State -> State
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


nudge : Float -> State -> State -> State
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

    bodies =
      List.map2
        combine
        (Dict.toList derivative.bodies)
        (Dict.toList state.bodies)
        |> Dict.fromList
  in
    { state
      | time = state.time + dt * derivative.time
      , bodies = bodies
    }


stateDerivative : Rules -> State -> State
stateDerivative accels state =
  { state
    | time = 1
    , bodies =
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
          state.bodies
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


type alias Rules =
  Dict String (Body -> State -> Acceleration)
