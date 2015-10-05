module Flight.View where

import Graphics.Element as Layout
import String
import Dict
import Text

import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL

import Graphics.Palette as Palette
import Background
import World
import Update
import Infix exposing (..)


view : Update.Data -> Layout.Element
view model =
  scene 900 600 model

        
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
        World.toEntity model.world camera
  in
    WebGL.webgl (width, height) [ background, foreground ]
      |> Layout.container width height Layout.middle
      |> Layout.color Palette.black

