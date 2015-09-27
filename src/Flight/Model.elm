module Flight.Model where

import Keyboard
import Char
import Dict exposing (Dict)
import Set exposing (Set)
import Time exposing (Time)

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)

import Update exposing (Update(..))
import World exposing (World, WorldStyle(..))
import Infix exposing (..)
import Mesh exposing (Mesh)
import Background exposing (Background)
import GameOver


type alias Model =
  { orientation : Mat4
  , position : Vec3
  , speed : Float
  , action : Action
  , message : String
  , worlds : Dict String World
  , background : Background
  , dead : Maybe ()
  }


type alias Action =
  { thrust : Int
  , pitch : Int
  , yaw : Int
  , roll : Int
  }

                  
inaction : Action
inaction =
  { thrust = 0
  , pitch = 0
  , yaw = 0
  , roll = 0
  }


init : Mesh.Library -> Model
init lib =
  let
    sphere =
      lib.sphere

    stars =
      lib.background
  in
    { orientation = Mat4.identity
    , position = Vec3.vec3 0 0 0
    , speed = 1
    , action = inaction
    , message = ""
    , worlds =
      Dict.fromList
            [ ("Jupiter", World.world sphere Planet 10 (0, -100, -50))
            , ("Io", World.world sphere Moon 0.2606 (0, -39.68, -50))
            , ("Europa", World.world sphere Moon 0.2233 (0, -4.04, -50))
            , ("Ganymede", World.world sphere Moon 0.3768 (0, 53.1, -50))
            , ("Callisto", World.world sphere Moon 0.3447 (0, 169.3, -50))
            ]
    , background =
      Background.background stars
    , dead = Nothing
    }


messages : List (String, (Model -> Bool))
messages =
  [ ("You have found Jupiter, King of Planets!", isNear 25 "Jupiter")
  , ("Io has lots of volcanoes. Be careful!", isNear 3 "Io")
  , ("Welcome to Europa. What secrets lurk within her icy ocean depths?", isNear 3 "Europa")
  , ("Ganymede is bigger than Mercury. That's pretty big!", isNear 3 "Ganymede")
  , ("Callisto was getting lonely out here by herself.", isNear 3 "Callisto")
  , ("In the distance is Jupiter and his four Galilean moons. Can you find them all?", always otherwise)
  ]


update : Update -> Model -> Model
update input model =
  case input of
    FPS dt ->
      timeUpdate dt model
                 
    Keys keysDown ->
      controlUpdate keysDown model

    otherwise ->
      model                

      
timeUpdate : Time -> Model -> Model
timeUpdate dt model =
  let
    perSecond =
      Time.inSeconds dt
  in
    model
      |> turn (degrees 135 * perSecond)
      |> thrust (1E7 * perSecond)
      |> updateMessage messages
      |> checkDead
    
              
turn : Float -> Model -> Model
turn delta model =
  { model | orientation <-
            model.orientation
              |> Mat4.rotate (model.action.pitch .* delta) (Vec3.vec3 1 0 0)
              |> Mat4.rotate (model.action.yaw .* delta) (Vec3.vec3 0 1 0)
              |> Mat4.rotate (model.action.roll .* delta) (Vec3.vec3 0 0 1)
  }


thrust : Float -> Model -> Model
thrust delta model =
  { model | position <-
            Vec3.vec3 0 0 (model.action.thrust .* model.speed * delta)
              |> Mat4.transform model.orientation
              |> Vec3.add model.position
  }

                 
updateMessage : List (String, (Model -> Bool)) -> Model -> Model
updateMessage messages model =
  let
    check (newText, isTrueFor) oldText =
      if (isTrueFor model) then newText else oldText
  in
    { model | message <-
              List.foldr check model.message messages
    }
  

checkDead : Model -> Model
checkDead model =
  let
    isDead = isNear 10 "Jupiter" model
  in
    { model | dead <- if | isDead -> Just ()
                         | otherwise -> Nothing
    }
  
  
isNear : Float -> String -> Model -> Bool
isNear altitude worldName model =
  Dict.get worldName model.worlds
    |> Maybe.map .position
    |> Maybe.map (Vec3.distance model.position)
    |> Maybe.map (\x -> x < World.scale * altitude)
    |> Maybe.withDefault False

       
controlUpdate : Set Keyboard.KeyCode -> Model -> Model
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
