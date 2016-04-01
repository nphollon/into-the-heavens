module Level.Tutorial (data) where

import Dict
import Types exposing (..)
import Math.Vector as Vector
import Flight.Spawn exposing (defaultBody)


data : LevelData
data =
  { level = Tutorial
  , events =
      [ ( Immediately
        , [ Notify "Fly to the checkpoint."
          , SpawnCheckpoint "home" homeBody
          ]
        )
      , ( ReachedCheckpoint "home", [ Victory ] )
      ]
  , universe = Dict.empty
  , graphics = [ Background "Background" ]
  , names = Dict.empty
  }


homeBody : Body
homeBody =
  { defaultBody
    | position = Vector.vector 0 0 -10
    , angVelocity = Vector.vector 0 1 0
  }
