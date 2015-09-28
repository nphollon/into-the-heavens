module Flight.Model where

import Keyboard
import Char
import Dict exposing (Dict)
import Set exposing (Set)
import Time exposing (Time)

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)

import Update exposing (Update(..), Action)
import World exposing (World, WorldStyle(..))
import Infix exposing (..)
import Mesh exposing (Mesh)
import Background exposing (Background)


inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


init : Update.Data -> Update.Data
init model =
  case model.resources of
    Mesh.Success lib ->
      initFromLib lib model
                  
    otherwise ->
      model

      
initFromLib : Mesh.Library -> Update.Data -> Update.Data
initFromLib lib model =
  let
    sphere = lib.sphere

    stars = lib.background
  in
    { model | orientation <- Mat4.identity
            , position <- Vec3.vec3 0 0 0
            , speed <- 1
            , action <- inaction
            , message <- ""
            , worlds <-
              Dict.fromList
                    [ ("Jupiter", World.world sphere Planet 10 (0, -100, -50))
                    , ("Io", World.world sphere Moon 0.2606 (0, -39.68, -50))
                    , ("Europa", World.world sphere Moon 0.2233 (0, -4.04, -50))
                    , ("Ganymede", World.world sphere Moon 0.3768 (0, 53.1, -50))
                    , ("Callisto", World.world sphere Moon 0.3447 (0, 169.3, -50))
                    ]
            , background <- Background.background stars
    }

messages : List (String, (Update.Data -> Bool))
messages =
  [ ("You have found Jupiter, King of Planets!", isNear 25 "Jupiter")
  , ("Io has lots of volcanoes. Be careful!", isNear 3 "Io")
  , ("Welcome to Europa. What secrets lurk within her icy ocean depths?", isNear 3 "Europa")
  , ("Ganymede is bigger than Mercury. That's pretty big!", isNear 3 "Ganymede")
  , ("Callisto was getting lonely out here by herself.", isNear 3 "Callisto")
  , ("In the distance is Jupiter and his four Galilean moons. Can you find them all?", always otherwise)
  ]


update : Update -> Update.Data -> Update.Data
update input model =
  case input of
    FPS dt ->
      timeUpdate dt model
                 
    Keys keysDown ->
      controlUpdate keysDown model

    otherwise ->
      model                

      
timeUpdate : Time -> Update.Data -> Update.Data
timeUpdate dt model =
  let
    perSecond =
      Time.inSeconds dt
  in
    model
      |> turn (degrees 135 * perSecond)
      |> thrust (1E7 * perSecond)
      |> updateMessage messages
    
              
turn : Float -> Update.Data -> Update.Data
turn delta model =
  { model | orientation <-
            model.orientation
              |> Mat4.rotate (model.action.pitch .* delta) (Vec3.vec3 1 0 0)
              |> Mat4.rotate (model.action.yaw .* delta) (Vec3.vec3 0 1 0)
              |> Mat4.rotate (model.action.roll .* delta) (Vec3.vec3 0 0 1)
  }


thrust : Float -> Update.Data -> Update.Data
thrust delta model =
  { model | position <-
            Vec3.vec3 0 0 (model.action.thrust .* model.speed * delta)
              |> Mat4.transform model.orientation
              |> Vec3.add model.position
  }

                 
updateMessage : List (String, (Update.Data -> Bool)) -> Update.Data -> Update.Data
updateMessage messages model =
  let
    check (newText, isTrueFor) oldText =
      if (isTrueFor model) then newText else oldText
  in
    { model | message <-
              List.foldr check model.message messages
    }
  

transition : Update.Data -> Maybe Update.Mode
transition model =
  if | isNear 10 "Jupiter" model -> Just Update.GameOverMode
     | otherwise -> Nothing
    
  
isNear : Float -> String -> Update.Data -> Bool
isNear altitude worldName model =
  Dict.get worldName model.worlds
    |> Maybe.map .position
    |> Maybe.map (Vec3.distance model.position)
    |> Maybe.map (\x -> x < World.scale * altitude)
    |> Maybe.withDefault False

       
controlUpdate : Set Keyboard.KeyCode -> Update.Data -> Update.Data
controlUpdate keysDown model =
  let
    keyAct key action =
      case (Char.fromCode key) of
        'D' ->
          { action | yaw <- action.yaw - 1 }
        'A' ->
          { action | yaw <- action.yaw + 1 }
        'S' ->
          { action | pitch <- action.pitch - 1 }
        'W' ->
          { action | pitch <- action.pitch + 1 }
        'Q' ->
          { action | roll <- action.roll - 1 }
        'E' ->
          { action | roll <- action.roll + 1 }
        'I' ->
          { action | thrust <- action.thrust - 1 }
        'M' ->
          { action | thrust <- action.thrust + 1 }
        otherwise ->
          action

    keySet key m =
      case (Char.fromCode key) of
        'B' ->
          { m | speed <- 1 }
        'N' ->
          { m | speed <- 100 }
        otherwise ->
          m
          
    newAction =
      Set.foldl keyAct inaction keysDown

    newModel =
      Set.foldl keySet model keysDown
  in
    { newModel | action <- newAction }
