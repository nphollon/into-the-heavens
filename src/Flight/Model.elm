module Flight.Model (..) where

import Char
import Dict
import Set exposing (Set)
import Time exposing (Time)
import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Update exposing (Update(..), Action)
import World exposing (World)
import Infix exposing (..)
import Mesh exposing (Mesh)
import Background exposing (Background)
import Math.Mechanics as Mech
import Math.Vector as Vector


init : Update.Data -> Update.Data
init model =
    case model.resources of
        Mesh.Success lib ->
            initFromLib lib model

        otherwise ->
            model


initFromLib : Mesh.Library -> Update.Data -> Update.Data
initFromLib lib model =
    let
        sphere =
            lib.sphere

        stars =
            lib.background
    in
        { model
            | orientation = Mat4.identity
            , ship = Update.defaultShip
            , action = Update.inaction
            , world = World.world sphere 1 ( 1, -2, -5 )
            , background = Background.background stars
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
        model
            |> turn (degrees 135 * perSecond)
            |> thrust (1.0 * perSecond)


turn : Float -> Update.Data -> Update.Data
turn delta model =
    { model
        | orientation =
            model.orientation
                |> Mat4.rotate (model.action.pitch .* delta) (Vec3.vec3 1 0 0)
                |> Mat4.rotate (model.action.yaw .* delta) (Vec3.vec3 0 1 0)
                |> Mat4.rotate (model.action.roll .* delta) (Vec3.vec3 0 0 1)
    }


thrust : Float -> Update.Data -> Update.Data
thrust delta model =
    let
        rule ship _ =
            if model.action.thrust >= 0 then
                Vec3.vec3 0 0 (toFloat model.action.thrust * -10)
                    |> Mat4.transform model.orientation
                    |> Vec3.toRecord
            else
                Vector.scale -3 ship.velocity
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

        distance =
            Vec3.distance shipPosition model.world.position

        altitude =
            model.world.radius
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
