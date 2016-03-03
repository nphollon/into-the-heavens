module Flight.Init (game, inaction, visitorCount, hasCrashed, updatePlayer, getPlayer) where

import Dict
import String
import Random.PCG as Random exposing (Seed)
import Effects exposing (Effects)
import Types exposing (..)
import Generate.Ship as Ship
import Generate.Sphere as Sphere
import Math.Collision as Collision
import Math.Vector as Vector


game : Seed -> Library -> ( Mode, Effects Update )
game seed library =
  (,)
    (GameMode
      { library = library
      , hasFocus = True
      , clockTime = Nothing
      , lag = 0
      , seed = seed
      , nextId = 0
      , score = -1
      , universe =
          Dict.fromList
            [ ( "ship"
              , { position = Vector.vector 0 0 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 0 0
                , hull = Collision.hull .position Ship.triangles
                , health = 1
                , ai =
                    Just
                      (PlayerControlled
                        { action = inaction
                        , target = ""
                        , trigger = Ready
                        }
                      )
                }
              )
            , ( "planet"
              , { position = Vector.vector 0 -20 0
                , velocity = Vector.vector 0 0 0
                , orientation = Vector.vector 0 0 0
                , angVelocity = Vector.vector 0 3.0e-2 0
                , hull = Collision.hull .position Sphere.triangles
                , health = 1.0e10
                , ai = Nothing
                }
              )
            ]
      , graphics =
          [ Background "Background"
          , Object
              { bodyName = "planet"
              , meshName = "Sphere"
              , shader = Planet
              }
          , Reticule "Crosshair"
          , Target
              { meshName = "Crosshair"
              }
          ]
      }
    )
    (Effects.tick Tick)


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


visitorCount : GameState -> Int
visitorCount model =
  Dict.keys model.universe
    |> List.filter (String.startsWith "visitor")
    |> List.length


hasCrashed : GameState -> Bool
hasCrashed model =
  not (Dict.member "ship" model.universe)


updatePlayer : (Cockpit -> Cockpit) -> GameState -> GameState
updatePlayer aiUpdate model =
  let
    bodyUpdate body =
      case body.ai of
        Just (PlayerControlled cockpit) ->
          { body | ai = Just (PlayerControlled (aiUpdate cockpit)) }

        _ ->
          body
  in
    { model
      | universe =
          Dict.update "ship" (Maybe.map bodyUpdate) model.universe
    }


getPlayer : (Body -> GameState) -> GameState -> GameState
getPlayer f model =
  case Dict.get "ship" model.universe of
    Just ship ->
      f ship

    Nothing ->
      model
