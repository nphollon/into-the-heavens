module Flight.Util (hasCrashed, faces, getPlayer, updatePlayerCockpit, setPlayerTarget, mapRandom, isMissile, isVisitor, isHealthy, isShielded) where

import List.Extra as ListX
import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import Random.PCG as Random
import Types exposing (..)
import Math.Transform as Transform
import Flight.Init as Init


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member Init.playerName model.universe)


faces : String -> Body -> Dict String Body -> Bool
faces targetName viewer universe =
  let
    inRange t =
      Transform.degreesFromForward t.position viewer < degrees 15
  in
    Dict.get targetName universe
      |> MaybeX.mapDefault False inRange


getPlayer : Dict String Body -> { body : Body, cockpit : Cockpit }
getPlayer universe =
  let
    body =
      Dict.get Init.playerName universe
        |> Maybe.withDefault Init.defaultBody

    cockpit =
      extractCockpit body.ai
        |> Maybe.withDefault Init.defaultCockpit
  in
    { body = body
    , cockpit = cockpit
    }


updatePlayerCockpit : (Cockpit -> Cockpit) -> GameState -> GameState
updatePlayerCockpit aiUpdate model =
  let
    bodyUpdate body =
      Maybe.map
        (\c -> { body | ai = PlayerControlled (aiUpdate c) })
        (extractCockpit body.ai)
  in
    { model
      | universe =
          Dict.update Init.playerName (flip Maybe.andThen bodyUpdate) model.universe
    }


extractCockpit : Ai -> Maybe Cockpit
extractCockpit ai =
  case ai of
    PlayerControlled cockpit ->
      Just cockpit

    _ ->
      Nothing


setPlayerTarget : GameState -> GameState
setPlayerTarget model =
  let
    setTarget cockpit =
      { cockpit
        | target =
            Dict.toList model.universe
              |> ListX.find (snd >> isVisitor)
              |> MaybeX.mapDefault "" fst
      }
  in
    updatePlayerCockpit setTarget model


mapRandom : (Random.Seed -> GameState -> GameState) -> GameState -> GameState
mapRandom f model =
  let
    ( rootSeed, subSeed ) =
      Random.split model.seed
  in
    f subSeed { model | seed = rootSeed }


isVisitor : Body -> Bool
isVisitor body =
  case body.ai of
    Hostile _ ->
      True

    _ ->
      False


isMissile : Body -> Bool
isMissile body =
  List.isEmpty body.hull


isHealthy : Body -> Bool
isHealthy body =
  body.health > 1


isShielded : Body -> Bool
isShielded body =
  case body.ai of
    PlayerControlled cockpit ->
      cockpit.shields.on

    _ ->
      False
