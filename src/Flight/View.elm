module Flight.View (..) where

import Graphics.Element as Layout
import Html exposing (Html)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL
import Graphics.Palette as Palette
import Background
import World
import Update exposing (Update, Data)
import Infix exposing (..)


view : Signal.Address Update -> Data -> Html
view address model =
    scene 900 600 model |> Html.fromElement


scene : Int -> Int -> Update.Data -> Layout.Element
scene width height model =
    let
        aspect =
            width ./. height

        camera =
            { perspective = Mat4.makePerspective 60 aspect 100000.0 1.0e10
            , cameraPosition = model.position
            , cameraOrientation = Mat4.transpose model.orientation
            }

        background =
            Background.toEntity model.background camera

        foreground =
            World.toEntity model.world camera
    in
        WebGL.webgl ( width, height ) [ background, foreground ]
            |> Layout.container width height Layout.middle
            |> Layout.color Palette.black
