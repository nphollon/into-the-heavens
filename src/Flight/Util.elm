module Flight.Util exposing (hasCrashed, hasWon, faces, isMissile, isVisitor, isHealthy, isShielded, visitorCount, isSeekingPlayer, distanceTo, fromId, fromName, getId, remove, explode, delta, getPlayer)

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
            Transform.degreesFromForward viewer t.position < degrees 15
    in
        Dict.get targetId universe
            |> MaybeX.mapDefault False inRange


isVisitor : Body -> Bool
isVisitor body =
    body.collisionClass == Solid


isMissile : Body -> Bool
isMissile body =
    body.collisionClass == Blockable


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
        Seeking cockpit ->
            cockpit.target == Spawn.playerId

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


delta : Float
delta =
    1.0 / 60


getPlayer : Dict Id Body -> Maybe PlayerData
getPlayer universe =
    Dict.get Spawn.playerId universe
        |> flip Maybe.andThen
            (\body ->
                case body.ai of
                    PlayerControlled cockpit ->
                        Just { body = body, cockpit = cockpit }

                    _ ->
                        Nothing
            )
