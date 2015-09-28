module Flight.View where

import Graphics.Element as Layout
import String
import Dict
import Text

import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL

import Palette
import Background
import World
import Update
import Infix exposing (..)


view : Update.Data -> Layout.Element
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
                        |> Layout.color Palette.white
                      , Layout.spacer 1 padding
                      , textBox textBoxWidth textBoxHeight instructions
                      ]
            ]

fade height =
  let
    light x =
      Layout.spacer x height

    dark x =
      Layout.color Palette.black (light x)
  in
    Layout.flow Layout.right
          [ dark 2
          , light 9
          , dark 4
          , light 4
          , dark 9
          , light 2
          ]

scene : Int -> Int -> Update.Data -> Layout.Element
scene width height model =
  let
    aspect =
      width ./. height

    camera =
      { perspective = Mat4.makePerspective 60 aspect 1e5 1e10
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
      |> Layout.color Palette.black
              

textBox : Int -> Int -> String -> Layout.Element
textBox width height message =
  Text.fromString message
    |> Layout.leftAligned
    |> Layout.size width height


