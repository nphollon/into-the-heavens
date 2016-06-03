module Flight.Util exposing (hasCrashed, hasWon, faces, getPlayer, updatePlayerCockpit, setPlayerTarget, isMissile, isVisitor, isEthereal, isHealthy, isShielded, visitorCount, isSeekingPlayer, distanceTo, fromId, fromName, getId, remove, explode)

import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import Types exposing (..)
import Math.Transform as Transform
import Math.Vector as Vector
import Flight.Spawn as Spawn


hasCrashed : GameState -> Bool
hasCrashed model =
    not (Dict.member Spawn.playerId model.universe)


hasWon : GameState -> Bool
hasWon model =
    model.victory


faces : Id -> Body -> Dict Id Body -> Bool
faces targetId viewer universe =
    let
        inRange t =
            Transform.degreesFromForward t.position viewer < degrees 15
    in
        Dict.get targetId universe
            |> MaybeX.mapDefault False inRange


getPlayer : Dict Id Body -> { body : Body, cockpit : Cockpit }
getPlayer universe =
    let
        body =
            Dict.get Spawn.playerId universe
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
            Maybe.map (\c -> { body | ai = PlayerControlled (aiUpdate c) })
                (extractCockpit body.ai)
    in
        { model
            | universe =
                Dict.update Spawn.playerId (flip Maybe.andThen bodyUpdate) model.universe
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

        closestVisitor id body ( winningId, winningDistance ) =
            if isVisitor body then
                let
                    distance =
                        Transform.degreesFromForward body.position player
                in
                    if distance < winningDistance then
                        ( id, distance )
                    else
                        ( winningId, winningDistance )
            else
                ( winningId, winningDistance )

        newTarget =
            Dict.foldl closestVisitor ( Spawn.emptyId, 1 / 0 ) model.universe
                |> fst
    in
        updatePlayerCockpit (\c -> { c | target = newTarget })
            model


isVisitor : Body -> Bool
isVisitor body =
    case body.ai of
        Hostile _ ->
            True

        _ ->
            False


isMissile : Body -> Bool
isMissile body =
    body.bounds == Just "Missile"


isEthereal : Body -> Bool
isEthereal body =
    Nothing == body.bounds


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


visitorCount : Dict Id Body -> Int
visitorCount universe =
    Dict.values universe
        |> List.filter isVisitor
        |> List.length


isSeekingPlayer : Body -> Bool
isSeekingPlayer body =
    case body.ai of
        Seeking _ x ->
            x == Spawn.playerId

        _ ->
            False


distanceTo : String -> GameState -> Maybe Float
distanceTo name model =
    let
        player =
            fromId Spawn.playerId model

        object =
            fromName name model

        bodyDistance a b =
            Vector.distance a.position b.position
    in
        Maybe.map2 bodyDistance player object


fromId : Id -> GameState -> Maybe Body
fromId id model =
    Dict.get id model.universe


fromName : String -> GameState -> Maybe Body
fromName name model =
    let
        id =
            Dict.get name model.names
    in
        Maybe.andThen id (flip fromId model)


getId : String -> GameState -> Maybe Id
getId name model =
    Dict.get name model.names


explode : Id -> GameState -> GameState
explode id model =
    case Dict.get id model.universe of
        Just object ->
            Spawn.spawnExplosion object
                { model
                    | universe = Dict.remove id model.universe
                    , score = model.score + 1
                }

        Nothing ->
            model


remove : Id -> GameState -> GameState
remove id model =
    { model | universe = Dict.remove id model.universe }
