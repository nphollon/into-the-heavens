module Flight where

import Keyboard
import Char
import Set exposing (Set)
import Dict exposing (Dict)

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4)

import World exposing (World, WorldStyle(..))
import Infix exposing (..)
import Mesh exposing (Mesh)


type alias Model =
  { orientation : Mat4
  , position : Vec3
  , action : Action
  , message : String
  , worlds : Dict String World
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


init : Mesh -> Model
init m =
  { orientation = Mat4.identity
  , position = Vec3.vec3 0 0 0
  , action = inaction
  , message = ""
  , worlds =
    Dict.fromList
          [ ("Jupiter", World.world m Planet 10 (0, -100, -50))
          , ("Io", World.world m Moon 0.2606 (0, -39.68, -50))
          , ("Europa", World.world m Moon 0.2233 (0, -4.04, -50))
          , ("Ganymede", World.world m Moon 0.3768 (0, 53.1, -50))
          , ("Callisto", World.world m Moon 0.3447 (0, 169.3, -50))
          ]
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


timeUpdate : Float -> Model -> Model
timeUpdate _ =
  turn (degrees 3) >> thrust 0.3 >> updateMessage messages
    
              
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
            Vec3.vec3 0 0 (model.action.thrust .* delta)
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
  

isNear : Float -> String -> Model -> Bool
isNear altitude worldName model =
  Dict.get worldName model.worlds
    |> Maybe.map .position
    |> Maybe.map (Vec3.distance model.position)
    |> Maybe.map (\x -> x < altitude)
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
          
    newAction =
      Set.foldl keyAct inaction keysDown
  in
    { model | action <- newAction }
