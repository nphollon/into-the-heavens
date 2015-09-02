module View where

import Graphics.Element as Layout
import Color
import String
import Dict
import Text

import Math.Matrix4 as Mat4 exposing (Mat4)

import Graphics
import Grid
import Constellation
import Scatter
import World
import Flight
import Infix exposing (..)


loading : Layout.Element
loading =
  textBox 900 100 "Loading..."

        
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
      [ Constellation.crux 
      , Constellation.ursaMajor 
      , Constellation.aquarius 
      , Scatter.scatter 100 
      , Grid.grid 0 2 
      ]

    foreground =
      Dict.values model.worlds |> List.map World.toEntity
  in
    Graphics.render (width, height) camera (background ++ foreground)
              


textBox : Int -> Int -> String -> Layout.Element
textBox width height message =
  Text.fromString message
    |> Layout.leftAligned
    |> Layout.size width height
