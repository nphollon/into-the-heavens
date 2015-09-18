module View where

import Graphics.Element as Layout
import Color
import String
import Dict
import Text

import Http
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL

import Background
import World
import Flight
import Infix exposing (..)


--loading : Layout.Element
loading _ =
  fullscreenText "Loading..."


resourceFailure : Http.Error -> Layout.Element
resourceFailure e =
  let
    message =
      case e of
        Http.Timeout ->
          "Nobody is listening to me."
        Http.NetworkError ->
          "I can't find what I am looking for."
        Http.UnexpectedPayload _ ->
          "I am hearing things I just don't understand."
        Http.BadResponse code _ ->
          "HTTP Error Code: " ++ toString code
  in
    fullscreenText ("I couldn't load the game for you.\n" ++ message)
          
        
view : Flight.Model -> Layout.Element
view model =
  let
    sceneWidth = 600
    sceneHeight = 600
    textBoxWidth = 300
    textBoxHeight = 300
    padding = 20
    instructions =
      String.join "\n"
              [ "Turn the camera - w,a,s,d"
              , "Roll the camera - q,e"
              , "Fly forwards - i"
              , "Fly backwards - m"
              ]
  in
    Layout.flow Layout.right
            [ fade sceneHeight
            , scene sceneWidth sceneHeight model
            , Layout.spacer padding 1
            , Layout.flow Layout.down
                      [ textBox textBoxWidth textBoxHeight model.message
                      , Layout.spacer textBoxWidth 1
                        |> Layout.color (Color.rgba 204 255 238 0.5)
                      , Layout.spacer 1 padding
                      , textBox textBoxWidth textBoxHeight instructions
                      ]
            ]

fade height =
  let
    light x =
      Layout.spacer x height

    dark x =
      Layout.color Color.black (light x)
  in
    Layout.flow Layout.right
          [ dark 2
          , light 9
          , dark 4
          , light 4
          , dark 9
          , light 2
          ]

scene : Int -> Int -> Flight.Model -> Layout.Element
scene width height model =
  let
    aspect =
      width ./. height

    camera =
      { perspective = Mat4.makePerspective 100 aspect 0.1 1000
      , cameraPosition = model.position
      , cameraOrientation = Mat4.transpose model.orientation
      }

    background =
      Background.toEntity model.background camera

    foreground =
      Dict.values model.worlds
        |> List.map (\e -> World.toEntity e camera)
  in
    WebGL.webgl (width, height) (background :: foreground)
      |> Layout.container width height Layout.middle
      |> Layout.color Color.black
              

fullscreenText : String -> Layout.Element
fullscreenText =
  textBox 900 100

          
textBox : Int -> Int -> String -> Layout.Element
textBox width height message =
  Text.fromString message
    |> Layout.leftAligned
    |> Layout.size width height
