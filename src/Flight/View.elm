module Flight.View (..) where

import Html exposing (..)
import Html.Attributes exposing (class)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL
import Background
import World
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
            |> Html.fromElement


dashboard : Data -> Html
dashboard model =
    div
        [ class "dashboard" ]
        [ text ("Time: " ++ toString model.time) ]


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
            [ li [] [ text "Forward : I" ]
            , li [] [ text "Slow / Fast : B / N" ]
            , li [] [ text "Turn Camera : A / D / W / S / Q / E" ]
            ]
        ]
