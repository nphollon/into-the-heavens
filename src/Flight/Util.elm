module Flight.Util (hasCrashed, updatePlayerCockpit, setPlayerTarget, mapRandom, isMissile) where

import Dict
import Random.PCG as Random
import List.Extra as ListX
import Maybe.Extra as MaybeX
import Types exposing (..)


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member "ship" model.universe)


updatePlayerCockpit : (Cockpit -> Cockpit) -> GameState -> GameState
updatePlayerCockpit aiUpdate model =
  let
    bodyUpdate body =
      case body.ai of
        PlayerControlled cockpit ->
          { body | ai = PlayerControlled (aiUpdate cockpit) }

        _ ->
          body
  in
    { model
      | universe =
          Dict.update "ship" (Maybe.map bodyUpdate) model.universe
    }


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
