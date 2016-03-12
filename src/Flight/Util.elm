module Flight.Util (hasCrashed, updatePlayer) where

import Dict
import Types exposing (..)


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member "ship" model.universe)


updatePlayer : (Cockpit -> Cockpit) -> GameState -> GameState
updatePlayer aiUpdate model =
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
