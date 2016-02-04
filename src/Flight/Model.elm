module Flight.Model (..) where

import Char
import Dict
import Set exposing (Set)
import Time exposing (Time)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Update exposing (Update(..), Action)
import Flight.World as World exposing (World)
import Mesh exposing (Mesh)
import Flight.Background as Background exposing (Background)
import Math.Mechanics as Mech
import Math.Vector as Vector exposing (Vector)


init : Update.Data -> Update.Data
init model =
  case model.resources of
    Mesh.Success lib ->
      { model
        | ship = levelData
        , action = Update.inaction
        , world = World.world lib.sphere 1
        , background = Background.background lib.background
      }

    otherwise ->
      model


levelData : Mech.State
levelData =
  { time = 0
  , bodies =
      Dict.fromList
        [ ( "ship"
          , { position = Vector.vector 0 0 0
            , velocity = Vector.vector 0 0 0
            , orientation = Vector.vector 0 0 0
            , angVelocity = Vector.vector 0 0 0
            , inertia = Vector.vector 1 1 1
            , mass = 1
            }
          )
        , ( "planet"
          , { position = Vector.vector 1 -2 -5
            , velocity = Vector.vector 0 0 0
            , orientation = Vector.vector 0 0 0
            , angVelocity = Vector.vector 0 0.3 0
            , inertia = Vector.vector 1 1 1
            , mass = 1
            }
          )
        ]
  }


update : Update -> Update.Data -> Update.Data
update input model =
  case input of
    FPS dt ->
      timeUpdate dt model

    Keys keysDown ->
      controlUpdate keysDown model

    otherwise ->
      model


timeUpdate : Time -> Update.Data -> Update.Data
timeUpdate dt model =
  let
    perSecond =
      Time.inSeconds dt
  in
    thrust (1.0 * perSecond) model


rotMatrix : Vector -> Mat4
rotMatrix v =
  if Vector.length v == 0 then
    Mat4.identity
  else
    Mat4.makeRotate
      (Vector.length v)
      (Vec3.fromRecord v)


thrust : Float -> Update.Data -> Update.Data
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
      | ship = Mech.evolve (Dict.singleton "ship" rule) delta model.ship
    }


transition : Update.Data -> Maybe Update.Mode
transition model =
  let
    shipPosition =
      Dict.get "ship" model.ship.bodies
        |> Maybe.map (.position >> Vec3.fromRecord)
        |> Maybe.withDefault (Vec3.vec3 0 0 0)

    worldPosition =
      Dict.get "planet" model.ship.bodies
        |> Maybe.map (.position >> Vec3.fromRecord)
        |> Maybe.withDefault (Vec3.vec3 0 0 0)

    distance =
      Vec3.distance shipPosition worldPosition

    altitude =
      1
  in
    if distance < altitude then
      Just Update.GameOverMode
    else
      Nothing


controlUpdate : Set Char.KeyCode -> Update.Data -> Update.Data
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
