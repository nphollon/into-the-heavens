module Flight.Model (update) where

import Char
import Dict
import Effects exposing (Effects)
import Set exposing (Set)
import Time exposing (Time)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Update exposing (Update(..), Action, GameState, Mode(..))
import Math.Mechanics as Mech
import Math.Vector as Vector exposing (Vector)


update : Update -> GameState -> ( Mode, Effects a )
update input model =
  let
    noEffects =
      flip (,) Effects.none
  in
    case input of
      FPS dt ->
        thrust (1 * Time.inSeconds dt) model
          |> transition

      Keys keysDown ->
        controlUpdate keysDown model
          |> GameMode
          |> noEffects

      otherwise ->
        noEffects (GameMode model)


thrust : Float -> GameState -> GameState
thrust delta model =
  let
    forwardThrust ship =
      Vec3.vec3 0 0 (toFloat model.action.thrust * -10)
        |> Mat4.transform (rotMatrix ship.orientation)
        |> Vec3.toRecord

    brake ship =
      Vector.scale -10 ship.velocity

    linear ship =
      if model.action.thrust >= 0 then
        forwardThrust ship
      else
        brake ship

    comp a b =
      if a /= 0 then
        200 * delta * a
      else
        -6 * b

    angular ship =
      Vector.vector
        (comp (toFloat model.action.pitch) (ship.angVelocity.x))
        (comp (toFloat model.action.yaw) (ship.angVelocity.y))
        (comp (toFloat model.action.roll) (ship.angVelocity.z))

    rule ship _ =
      { linear = linear ship
      , angular = angular ship
      }
  in
    { model
      | universe = Mech.evolve (Dict.singleton "ship" rule) delta model.universe
    }


rotMatrix : Vector -> Mat4
rotMatrix v =
  if Vector.length v == 0 then
    Mat4.identity
  else
    Mat4.makeRotate
      (Vector.length v)
      (Vec3.fromRecord v)


transition : GameState -> ( Mode, Effects a )
transition model =
  let
    shipPosition =
      Dict.get "ship" model.universe.bodies
        |> Maybe.map (.position >> Vec3.fromRecord)
        |> Maybe.withDefault (Vec3.vec3 0 0 0)

    worldPosition =
      Dict.get "planet" model.universe.bodies
        |> Maybe.map (.position >> Vec3.fromRecord)
        |> Maybe.withDefault (Vec3.vec3 0 0 0)

    distance =
      Vec3.distance shipPosition worldPosition

    altitude =
      1
  in
    if distance < altitude then
      Update.gameOver model.library
    else
      ( GameMode model, Effects.none )


controlUpdate : Set Char.KeyCode -> GameState -> GameState
controlUpdate keysDown model =
  let
    keyAct key action =
      case (Char.fromCode key) of
        'D' ->
          { action | yaw = action.yaw - 1 }

        'A' ->
          { action | yaw = action.yaw + 1 }

        'S' ->
          { action | pitch = action.pitch - 1 }

        'W' ->
          { action | pitch = action.pitch + 1 }

        'Q' ->
          { action | roll = action.roll - 1 }

        'E' ->
          { action | roll = action.roll + 1 }

        'I' ->
          { action | thrust = action.thrust + 1 }

        'M' ->
          { action | thrust = action.thrust - 1 }

        otherwise ->
          action

    newAction =
      Set.foldl keyAct Update.inaction keysDown
  in
    { model | action = newAction }
