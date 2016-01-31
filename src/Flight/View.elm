module Flight.View (..) where

import Html exposing (..)
import Html.Attributes exposing (class)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3
import WebGL
import Background
import World
import String
import Update exposing (Update, Data)
import Infix exposing (..)


view : Signal.Address Update -> Data -> Html
view address model =
    div
        [ class "app" ]
        [ div
            [ class "top" ]
            [ scene 900 600 model ]
        , dashboard model
        , instructions
        ]


scene : Int -> Int -> Data -> Html
scene width height model =
    let
        aspect =
            width ./. height

        camera =
            { perspective = Mat4.makePerspective 60 aspect 0.1 1000.0
            , cameraPosition = model.position
            , cameraOrientation = Mat4.transpose model.orientation
            }

        background =
            Background.toEntity model.background camera

        foreground =
            World.toEntity model.world camera
    in
        WebGL.webgl ( width, height ) [ background, foreground ]
            |> Html.fromElement


dashboard : Data -> Html
dashboard model =
    let
        printAU label value =
            [ label, ": ", toString value ]
                |> String.concat
                |> text
    in
        div
            [ class "dashboard" ]
            [ printAU "X" (Vec3.getX model.position) ]


instructions : Html
instructions =
    div
        [ class "dashboard" ]
        [ h4
            []
            [ text "Keyboard Controls"
            ]
        , ul
            []
            [ li [] [ text "Forward / Backward : I / M" ]
            , li [] [ text "Slow / Fast : B / N" ]
            , li [] [ text "Turn Camera : A / D / W / S / Q / E" ]
            ]
        ]
