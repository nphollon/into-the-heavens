module Flight.Model (update) where

import Char exposing (KeyCode)
import Color
import Dict
import Task
import Time exposing (Time)
import Effects exposing (Effects)
import Set exposing (Set)
import Types exposing (..)
import Math.Mechanics as Mech
import Flight.Init as Init
import GameOver.Init
import Math.Collision as Collision


update : Update -> GameState -> ( Mode, Effects Update )
update input model =
  case input of
    Tick clockTime ->
      timeUpdate clockTime model

    Keys keysDown ->
      controlUpdate keysDown model

    Collide particle hull ->
      if particle == "ship" then
        GameOver.Init.gameOver model.library
      else
        ( model
            |> hit particle
            |> hit hull
            |> GameMode
        , Effects.tick Tick
        )

    FireMissile ->
      ( GameMode (fireMissile model), Effects.none )

    Meshes _ ->
      ( GameMode model, Effects.none )


timeUpdate : Time -> GameState -> ( Mode, Effects Update )
timeUpdate clockTime model =
  case model.clockTime of
    Just prevClockTime ->
      let
        dt =
          Time.inSeconds (clockTime - prevClockTime)

        newModel =
          { model | clockTime = Just clockTime }
            |> steerAi dt
            |> thrust dt
      in
        ( GameMode newModel, crashCheck newModel )

    Nothing ->
      (,)
        (GameMode { model | clockTime = Just clockTime })
        (Effects.tick Tick)


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


steerAi : Float -> GameState -> GameState
steerAi delta model =
  let
    check time thisState nextState nextAction =
      if time < 0 then
        { model | aiState = nextState }
          |> setAction "other" nextAction
      else
        { model | aiState = thisState time }
  in
    case model.aiState of
      Turning t ->
        check
          (t - delta)
          Turning
          (Thrusting 2)
          { thrust = 1, pitch = 0, yaw = 0, roll = 0 }

      Thrusting t ->
        check
          (t - delta)
          Thrusting
          (Resting 2)
          { thrust = 0, pitch = 0, yaw = 0, roll = 0 }

      Resting t ->
        check
          (t - delta)
          Resting
          (Braking 2)
          { thrust = -1, pitch = 0, yaw = 0, roll = 0 }

      Braking t ->
        check
          (t - delta)
          Braking
          (Turning 0.7)
          { thrust = 0, pitch = 0, yaw = 1, roll = 0 }


crashCheck : GameState -> Effects Update
crashCheck model =
  let
    ( points, hulls ) =
      Dict.partition
        (\_ body -> List.isEmpty body.hull)
        model.universe

    collision =
      Dict.foldl
        (\label point accumulator ->
          if accumulator == Nothing then
            collidedWith label point.position
          else
            accumulator
        )
        Nothing
        points

    collidedWith pointLabel position =
      Dict.foldl
        (\label hull accumulator ->
          if Collision.isInside position hull then
            Just (Collide pointLabel label)
          else
            accumulator
        )
        Nothing
        hulls
  in
    collision
      |> Maybe.map (Task.succeed >> Effects.task)
      |> Maybe.withDefault (Effects.tick Tick)


fireMissile : GameState -> GameState
fireMissile model =
  case Dict.get "ship" model.universe of
    Just ship ->
      let
        name =
          ("missile" ++ (toString model.nextId))
      in
        { model
          | universe =
              Dict.insert
                name
                { ship
                  | hull = []
                  , health = 1
                  , action =
                      { thrust = 2
                      , pitch = 0
                      , yaw = 0
                      , roll = 0
                      }
                }
                model.universe
          , nextId = model.nextId + 1
          , graphics =
              (Object
                { bodyName = name
                , meshName = "Ship"
                , shader = Matte Color.red
                , scale = Just 0.1
                }
              )
                :: model.graphics
        }

    Nothing ->
      model


hit : String -> GameState -> GameState
hit label model =
  let
    deductHealth body =
      if body.health > 1 then
        Just { body | health = body.health - 1 }
      else
        Nothing
  in
    { model
      | universe =
          Dict.update label (flip Maybe.andThen deductHealth) model.universe
    }


controlUpdate : Set KeyCode -> GameState -> ( Mode, Effects Update )
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

    modelWithAction =
      setAction "ship" newAction model

    firing =
      Set.member (Char.toCode 'O') keysDown
  in
    case ( firing, model.hasFired ) of
      ( True, True ) ->
        ( GameMode modelWithAction, Effects.none )

      ( True, False ) ->
        (,)
          (GameMode { modelWithAction | hasFired = True })
          (Effects.task (Task.succeed FireMissile))

      ( False, True ) ->
        (,)
          (GameMode { modelWithAction | hasFired = False })
          Effects.none

      ( False, False ) ->
        ( GameMode modelWithAction, Effects.none )


setAction : String -> Action -> GameState -> GameState
setAction label newAction model =
  let
    updateAction b =
      { b | action = newAction }
  in
    { model
      | universe =
          Dict.update label (Maybe.map updateAction) model.universe
    }
