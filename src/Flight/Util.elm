module Flight.Util (hasCrashed, faces, getPlayer, updatePlayerCockpit, setPlayerTarget, mapRandom, isMissile, isVisitor, isHealthy, isShielded, visitorCount, isSeekingPlayer) where

import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import Random.PCG as Random
import Types exposing (..)
import Math.Transform as Transform
import Flight.Spawn as Spawn


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member Spawn.playerName model.universe)


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
      Dict.get Spawn.playerName universe
        |> Maybe.withDefault Spawn.defaultBody

    cockpit =
      extractCockpit body.ai
        |> Maybe.withDefault Spawn.defaultCockpit
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
          Dict.update Spawn.playerName (flip Maybe.andThen bodyUpdate) model.universe
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
    player =
      .body (getPlayer model.universe)

    closestVisitor name body ( winningName, winningDistance ) =
      if isVisitor body then
        let
          distance =
            Transform.degreesFromForward body.position player
        in
          if distance < winningDistance then
            ( name, distance )
          else
            ( winningName, winningDistance )
      else
        ( winningName, winningDistance )

    setTarget cockpit =
      { cockpit
        | target =
            fst <| Dict.foldl closestVisitor ( "", 1 / 0 ) model.universe
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


visitorCount : Dict String Body -> Int
visitorCount universe =
  Dict.values universe
    |> List.filter isVisitor
    |> List.length


isSeekingPlayer : Body -> Bool
isSeekingPlayer body =
  case body.ai of
    Seeking _ x ->
      x == Spawn.playerName

    _ ->
      False
