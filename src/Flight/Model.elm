module Flight.Model (update) where

import Set exposing (Set)
import Char exposing (KeyCode)
import Color
import Dict exposing (Dict)
import Time exposing (Time)
import Effects exposing (Effects)
import Random.PCG as Random
import Types exposing (..)
import Math.Mechanics as Mech
import Math.Vector as Vector
import Math.Transform as Transform
import Math.Collision as Collision
import Flight.Init as Init
import GameOver.Init


update : Update -> GameState -> ( Mode, Effects Update )
update input model =
  case input of
    Tick clockTime ->
      if model.hasFocus then
        timeUpdate clockTime model
      else
        ( GameMode { model | clockTime = Nothing }, Effects.none )

    Keys keysDown ->
      ( GameMode (controlUpdate keysDown model), Effects.none )

    Meshes _ ->
      ( GameMode model, Effects.none )

    Focus True ->
      ( GameMode { model | hasFocus = True }, Effects.tick Tick )

    Focus False ->
      ( GameMode { model | hasFocus = False }, Effects.none )


timeUpdate : Time -> GameState -> ( Mode, Effects Update )
timeUpdate clockTime model =
  case model.clockTime of
    Just prevClockTime ->
      let
        elapsed =
          clockTime - prevClockTime

        newModel =
          loop
            { model
              | clockTime = Just clockTime
              , lag = model.lag + elapsed
            }
      in
        if newModel.hasCrashed then
          GameOver.Init.gameOver newModel.seed newModel.library
        else
          ( GameMode newModel, Effects.tick Tick )

    Nothing ->
      (,)
        (GameMode { model | clockTime = Just clockTime })
        (Effects.tick Tick)


loop : GameState -> GameState
loop model =
  let
    updateDelta =
      Time.second / 60
  in
    if model.lag < updateDelta then
      model
    else
      { model | lag = model.lag - updateDelta }
        |> gameTick (Time.inSeconds updateDelta)
        |> loop


gameTick : Float -> GameState -> GameState
gameTick dt =
  spawnCheck >> fireCheck >> aiUpdate dt >> thrust dt >> crashCheck


thrust : Float -> GameState -> GameState
thrust delta model =
  { model | universe = Mech.evolve delta model.universe }


aiUpdate : Float -> GameState -> GameState
aiUpdate delta model =
  { model
    | universe =
        Dict.map
          (\label object ->
            steerAi delta object model.universe
          )
          model.universe
  }


spawnCheck : GameState -> GameState
spawnCheck model =
  if Dict.member "visitor" model.universe then
    model
  else
    spawnAi model


steerAi : Float -> Body -> Dict String Body -> Body
steerAi delta object universe =
  case object.ai of
    Nothing ->
      object

    Just (Aimless seed t) ->
      if t > 0 then
        { object | ai = Just (Aimless seed (t - delta)) }
      else
        let
          generator =
            case object.action.thrust of
              -1 ->
                aiThrustGenerator

              0 ->
                aiTurnGenerator

              _ ->
                aiCoastGenerator

          ( nextMove, nextSeed ) =
            Random.generate generator seed
        in
          { object
            | action = nextMove.action
            , ai = Just (Aimless nextSeed nextMove.duration)
          }


type alias AiMove =
  { duration : Float, action : Action }


aiMove : Float -> Action -> AiMove
aiMove dur act =
  { duration = dur
  , action = act
  }


aiThrustGenerator : Random.Generator AiMove
aiThrustGenerator =
  Random.map
    (flip aiMove { thrust = 1, pitch = 0, yaw = 0, roll = 0 })
    (Random.float 0.1 2)


aiCoastGenerator : Random.Generator AiMove
aiCoastGenerator =
  Random.map
    (flip aiMove { thrust = 0, pitch = 0, yaw = 0, roll = 0 })
    (Random.float 0 1)


aiTurnGenerator : Random.Generator AiMove
aiTurnGenerator =
  let
    action pitch yaw =
      { thrust = -1, pitch = pitch, yaw = yaw, roll = 0 }
  in
    Random.map2
      aiMove
      (Random.float 0 0.7)
      (Random.map2 action (Random.int -1 1) (Random.int -1 1))


spawnAi : GameState -> GameState
spawnAi model =
  let
    ( rootSeed, shipSeed ) =
      Random.split model.seed
  in
    { model
      | universe =
          Dict.insert
            "visitor"
            (Init.ship shipSeed)
            model.universe
      , seed = rootSeed
      , score = model.score + 1
    }


crashCheck : GameState -> GameState
crashCheck model =
  let
    ( points, hulls ) =
      Dict.partition
        (\_ body -> List.isEmpty body.hull)
        model.universe

    collision =
      Dict.foldl collidedWith model points

    collidedWith pointLabel point accumulator =
      Dict.foldl
        (\label hull acc ->
          if Collision.isInside point.position hull then
            collide pointLabel label acc
          else
            acc
        )
        accumulator
        hulls
  in
    collision


collide : String -> String -> GameState -> GameState
collide particle hull model =
  if particle == "ship" then
    { model | hasCrashed = True }
  else
    model
      |> hit particle
      |> hit hull


fireCheck : GameState -> GameState
fireCheck model =
  case model.missileTrigger of
    Ready ->
      model

    Fire ->
      fireMissile { model | missileTrigger = Reset }

    FireAndReset ->
      fireMissile { model | missileTrigger = Ready }

    Reset ->
      model


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
                (spawnFrom ship)
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


spawnFrom : Body -> Body
spawnFrom ship =
  let
    offset =
      Vector.vector 0 -0.2 0.2
  in
    { ship
      | position = Transform.fromBodyFrame offset ship
      , hull = []
      , health = 1
      , action =
          { thrust = 20
          , pitch = 0
          , yaw = 0
          , roll = 0
          }
    }


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


controlUpdate : Set KeyCode -> GameState -> GameState
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
          { action | roll = action.roll + 1 }

        'E' ->
          { action | roll = action.roll - 1 }

        'I' ->
          { action | thrust = action.thrust + 1 }

        'M' ->
          { action | thrust = action.thrust - 1 }

        _ ->
          action

    newAction =
      Set.foldl keyAct Init.inaction keysDown

    modelWithAction =
      setAction "ship" newAction model

    firing =
      Set.member (Char.toCode 'O') keysDown
  in
    case ( firing, modelWithAction.missileTrigger ) of
      ( True, Ready ) ->
        { modelWithAction | missileTrigger = Fire }

      ( False, Fire ) ->
        { modelWithAction | missileTrigger = FireAndReset }

      ( False, Reset ) ->
        { modelWithAction | missileTrigger = Ready }

      otherwise ->
        modelWithAction


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
