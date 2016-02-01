module Flight.View (..) where

import Dict
import Html exposing (..)
import Html.Attributes exposing (class)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL
import Background
import World
import String
import Update exposing (Update, Data)
import Infix exposing (..)
import Frame


view : Signal.Address Update -> Data -> Html
view address model =
    Frame.view
        [ scene 900 600 model ]
        [ dashboard model
        , instructions
        ]


scene : Int -> Int -> Data -> Html
scene width height model =
    let
        aspect =
            width ./. height

        camera =
            { perspective = Mat4.makePerspective 60 aspect 0.1 1000.0
            , cameraPosition = shipPosition model
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
        position =
            shipPosition model

        printNumber label value =
            let
                sign =
                    if value > -5.0e-3 then
                        "+"
                    else
                        "-"

                intPart = floor (abs value)

                centPart = round (100 * abs value) - (100 * intPart)

                decimal =
                    if centPart < 10 then
                        ".0"
                    else
                        "."
            in
                [ label, ": ", sign, toString intPart, decimal, toString centPart ]
                    |> String.concat
                    |> text
    in
        div
            [ class "dashboard" ]
            [ p [] [ printNumber "X" (Vec3.getX position) ]
            , p [] [ printNumber "Y" (Vec3.getY position) ]
            , p [] [ printNumber "Z" (Vec3.getZ position) ]
            ]


instructions : Html
instructions =
    div
        [ class "dashboard" ]
        [ h3
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


shipPosition : Data -> Vec3
shipPosition model =
    Dict.get "ship" model.ship.particles
        |> Maybe.map (.position >> Vec3.fromRecord)
        |> Maybe.withDefault (Vec3.vec3 0 0 0)
