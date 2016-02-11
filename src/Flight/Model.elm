module Flight.Model (update) where

import Char
import Dict
import Effects exposing (Effects)
import Set exposing (Set)
import Time exposing (Time)
import Update exposing (Update(..), Action, GameState, Mode(..))
import Math.Mechanics as Mech
import Math.Vector as Vector exposing (Vector)
import Math.Matrix as Matrix
import Flight.Init as Init
import Math.Collision as Collision


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
      Vector.vector 0 0 (toFloat model.action.thrust * -10)
        |> Matrix.transform (Matrix.makeRotate ship.orientation)

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


transition : GameState -> ( Mode, Effects a )
transition model =
  let
    hasCrashed body =
      List.any (Collision.isInside body.position) model.hulls

    shipCrashed =
      Dict.get "ship" model.universe.bodies
        |> Maybe.map hasCrashed
        |> Maybe.withDefault False
  in
    if shipCrashed then
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
      Set.foldl keyAct Init.inaction keysDown
  in
    { model | action = newAction }
