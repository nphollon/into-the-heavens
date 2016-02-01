module Flight.Mechanics (State, evolve, vector, initialize, recenter, particle, scale, Particle) where

import Dict exposing (Dict)


type alias State =
    { time : Float
    , particles : Dict String Particle
    }


type alias Particle =
    { position : Vector
    , velocity : Vector
    , mass : Float
    }


type alias Vector =
    { x : Float
    , y : Float
    , z : Float
    }


vector : Float -> Float -> Float -> Vector
vector x y z =
    { x = x, y = y, z = z }


initialize : Dict String Particle -> State
initialize dataDict =
    { time = 0
    , particles = dataDict
    }


particle : String -> State -> Maybe Particle
particle key state =
    Dict.get key state.particles


totalMass : State -> Float
totalMass =
    .particles >> Dict.foldl (\_ p -> (+) p.mass) 0


add : Vector -> Vector -> Vector
add a b =
    { x = a.x + b.x
    , y = a.y + b.y
    , z = a.z + b.z
    }


subtract : Vector -> Vector -> Vector
subtract a b =
    { x = a.x - b.x
    , y = a.y - b.y
    , z = a.z - b.z
    }


scale : Float -> Vector -> Vector
scale c v =
    { x = v.x * c
    , y = v.y * c
    , z = v.z * c
    }


recenter : Particle -> Particle -> Particle
recenter origin object =
    { object
        | position = subtract object.position origin.position
        , velocity = subtract object.velocity origin.velocity
    }



-- Evolving states


evolve : Rules -> Float -> State -> State
evolve accel dt state =
    let
        a = stateDerivative accel state

        b = nudge (dt / 2) a state |> stateDerivative accel

        c = nudge (dt / 2) b state |> stateDerivative accel

        d = nudge dt c state |> stateDerivative accel
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
                    | position = add p.position (scale dt dpdt.position)
                    , velocity = add p.velocity (scale dt dpdt.velocity)
                }

        particles =
            List.map2
                combine
                (Dict.toList derivative.particles)
                (Dict.toList state.particles)
                |> Dict.fromList
    in
        { state
            | time = state.time + dt * derivative.time
            , particles = particles
        }


stateDerivative : Rules -> State -> State
stateDerivative accels state =
    { state
        | time = 1
        , particles =
            Dict.map
                (\key particle ->
                    case Dict.get key accels of
                        Just accel ->
                            { particle
                                | position = particle.velocity
                                , velocity = accel particle state
                            }

                        Nothing ->
                            particle
                )
                state.particles
    }


type alias Rules =
    Dict String (Particle -> State -> Vector)
