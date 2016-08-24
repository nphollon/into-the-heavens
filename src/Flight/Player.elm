module Flight.Player exposing (init, update, collideWith, draw)

import Set
import Char exposing (KeyCode)
import WebGL exposing (Drawable, Renderable)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Types exposing (..)
import Library
import Math.Vector as Vector exposing (Vector)
import Math.Quaternion as Quaternion exposing (Quaternion)
import Math.Frame as Frame exposing (Frame)
import Flight.Mechanics as Mechanics
import Graphics.Camera as Camera
import Graphics.Hud as Hud
import Graphics.Dustbox as Dustbox
import Graphics.Background as Background


type PlayerAction
    = LeftTurn
    | RightTurn
    | UpTurn
    | DownTurn
    | Thrust
    | Brake
    | Firing
    | ShieldsUp


init : Library -> Body
init library =
    { frame =
        { position = Vector.vector 0 0 0
        , orientation =
            Quaternion.compose
                (Quaternion.rotateZ (turns 0.5))
                (Quaternion.rotateX (turns 0.25))
        }
    , delta = Frame.identity
    , bounds = Library.getBounds "Player" library
    , health = 10
    , ai =
        PlayerControlled
            { action =
                { thrust = 0
                , pitch = 0
                , yaw = 0
                }
            , trigger = { value = 0, decay = 0.3 }
            , shields = { value = 1, decay = 5, recover = 10, on = False }
            }
    , collisionClass = Solid
    }


update : GameState -> Body -> PlayerCockpit -> ( Body, List EngineEffect )
update model actor cockpit =
    let
        toggle a =
            Set.member (keyMap a) model.keysDown

        twoWayToggle neg pos =
            case ( toggle neg, toggle pos ) of
                ( True, False ) ->
                    -1

                ( False, True ) ->
                    1

                _ ->
                    0

        newCockpit =
            { action =
                { yaw = twoWayToggle RightTurn LeftTurn
                , pitch = twoWayToggle DownTurn UpTurn
                , thrust = twoWayToggle Brake Thrust
                }
            , shields =
                Mechanics.drain Mechanics.timeDelta
                    (toggle ShieldsUp)
                    cockpit.shields
            , trigger =
                Mechanics.repeat Mechanics.timeDelta
                    (toggle Firing && not cockpit.shields.on)
                    cockpit.trigger
            }

        moved =
            { actor | ai = PlayerControlled newCockpit }
                |> Mechanics.evolveObject (accelFromAction cockpit.action)
    in
        if newCockpit.trigger.value == 1 then
            ( moved, [ SpawnFriendly Mechanics.playerId ] )
        else
            ( moved, [] )


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


accelFromAction : Action -> Body -> Frame
accelFromAction action object =
    let
        turningSpeed =
            degrees 70.0

        speed =
            5.0

        accel =
            5.0

        axis =
            Vector.vector (toFloat action.pitch) (toFloat action.yaw) 0

        rotationThrust =
            Quaternion.fromAxisAngle axis turningSpeed
                |> Maybe.withDefault Quaternion.identity

        rotationFriction =
            Quaternion.conjugate (Frame.angVelocity object)

        targetSpeed =
            speed * (1 + toFloat action.thrust)

        targetVelocity =
            Vector.vector 0 0 -targetSpeed
                |> Quaternion.rotateVector (Frame.orientation object)
    in
        { position =
            Frame.velocity object
                |> Vector.sub targetVelocity
                |> Vector.scale accel
        , orientation =
            Quaternion.compose rotationFriction rotationThrust
        }


collideWith : Body -> Id -> PlayerCockpit -> List EngineEffect
collideWith other playerId cockpit =
    case other.collisionClass of
        Blockable ->
            if cockpit.shields.on then
                []
            else
                [ DeductHealth other.health playerId ]

        Ethereal ->
            []

        Scenery ->
            [ DeductHealth other.health playerId ]

        Solid ->
            [ DeductHealth other.health playerId ]


draw : GameState -> Body -> PlayerCockpit -> List Renderable
draw model player cockpit =
    let
        camera =
            Camera.at player.frame

        placement =
            Mat4.makeTranslate camera.position

        background =
            Background.draw camera

        dustbox =
            Dustbox.draw camera

        hud =
            Hud.draw model player cockpit
    in
        dustbox :: background :: hud
