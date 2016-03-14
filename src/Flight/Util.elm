module Flight.Util (hasCrashed, getPlayer, updatePlayerCockpit, setPlayerTarget, mapRandom, isMissile) where

import Dict
import List.Extra as ListX
import Maybe.Extra as MaybeX
import Random.PCG as Random
import Types exposing (..)
import Flight.Init as Init


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member Init.playerName model.universe)


getPlayer : GameState -> { body : Body, cockpit : Cockpit }
getPlayer model =
  let
    body =
      Dict.get Init.playerName model.universe
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
