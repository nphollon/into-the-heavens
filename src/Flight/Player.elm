module Flight.Player exposing (init, update)

import Set
import Dict exposing (Dict)
import Char exposing (KeyCode)
import Types exposing (..)
import Library
import Math.Vector as Vector
import Math.Quaternion as Quaternion
import Math.Transform as Transform
import Flight.Mechanics as Mechanics
import Flight.Spawn as Spawn


init : Library -> Body
init library =
    { position = Vector.vector 0 0 0
    , velocity = Vector.vector 0 0 0
    , orientation = Quaternion.identity
    , angVelocity = Vector.vector 0 0 0
    , bounds = Library.getBounds "Player" library
    , health = 1
    , ai =
        PlayerControlled
            { action =
                { thrust = 0
                , pitch = 0
                , yaw = 0
                , roll = 0
                }
            , target = emptyId
            , trigger = { value = 0, decay = 0.3 }
            , shields = { value = 1, decay = 5, recover = 10, on = False }
            }
    , collisionClass = Friendly
    }


update : GameState -> Body -> PlayerCockpit -> ( Body, List EngineEffect )
update model actor cockpit =
    let
        toggle a =
            Set.member (keyMap a) model.playerActions

        twoWayToggle neg pos =
            case ( toggle neg, toggle pos ) of
                ( True, False ) ->
                    -1

                ( False, True ) ->
                    1

                _ ->
                    0

        shouldChangeTarget =
            (Dict.get cockpit.target model.universe == Nothing)
                || toggle TargetFacing

        newCockpit =
            { action =
                { yaw = twoWayToggle RightTurn LeftTurn
                , pitch = twoWayToggle DownTurn UpTurn
                , roll = twoWayToggle CounterclockwiseRoll ClockwiseRoll
                , thrust = twoWayToggle Brake Thrust
                }
            , shields =
                Mechanics.drain Mechanics.delta
                    (toggle ShieldsUp)
                    cockpit.shields
            , trigger =
                Mechanics.repeat Mechanics.delta
                    (toggle Firing && not cockpit.shields.on)
                    cockpit.trigger
            , target =
                if shouldChangeTarget then
                    newTarget model.universe actor
                else
                    cockpit.target
            }

        moved =
            { actor | ai = PlayerControlled newCockpit }
                |> Mechanics.evolveObject (accelFromAction cockpit.action)
    in
        if newCockpit.trigger.value == 1 then
            ( moved, [ SpawnMissile Spawn.playerId cockpit.target ] )
        else
            ( moved, [] )


newTarget : Dict Id Body -> Body -> Id
newTarget universe player =
    let
        closestVisitor id other ( winningId, winningDistance ) =
            let
                distance =
                    Transform.degreesFromForward player other.position
            in
                if other.collisionClass == Solid && distance < winningDistance then
                    ( id, distance )
                else
                    ( winningId, winningDistance )
    in
        Dict.foldl closestVisitor
            ( emptyId, 1 / 0 )
            universe
            |> fst


emptyId : Id
emptyId =
    -1


keyMap : PlayerAction -> KeyCode
keyMap action =
    case action of
        RightTurn ->
            Char.toCode 'D'

        LeftTurn ->
            Char.toCode 'A'

        DownTurn ->
            Char.toCode 'S'

        UpTurn ->
            Char.toCode 'W'

        Thrust ->
            Char.toCode 'I'

        Brake ->
            Char.toCode 'K'

        ShieldsUp ->
            Char.toCode 'H'

        Firing ->
            Char.toCode 'J'

        TargetFacing ->
            Char.toCode 'L'

        _ ->
            -1


accelFromAction : Action -> Body -> Acceleration
accelFromAction action object =
    let
        turningSpeed =
            2.0

        turningAccel =
            5.0

        speed =
            5.0

        accel =
            5.0

        goOrStop dir vel =
            turningAccel * (turningSpeed * toFloat dir - vel)

        targetSpeed =
            speed * (1 + toFloat action.thrust)

        targetVelocity =
            Vector.vector 0 0 -targetSpeed
                |> Quaternion.rotateVector object.orientation
    in
        { linear =
            Vector.scale accel (Vector.sub targetVelocity object.velocity)
        , angular =
            Vector.vector (goOrStop action.pitch (Vector.getX object.angVelocity))
                (goOrStop action.yaw (Vector.getY object.angVelocity))
                (goOrStop action.roll (Vector.getZ object.angVelocity))
        }
