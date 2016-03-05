module Flight.View (view) where

import String
import Dict exposing (Dict)
import Maybe.Extra as MaybeX
import Html exposing (..)
import Html.Attributes exposing (class)
import WebGL exposing (Drawable)
import Types exposing (..)
import Math.Vector as Vector
import Math.Matrix as Matrix exposing (Matrix)
import Math.Transform as Transform
import Flight.Background as Background
import Flight.Foreground as Foreground
import Flight.Guide as Guide
import Flight.Camera as Camera
import Frame


view : Signal.Address Update -> GameState -> Html
view address model =
  Frame.view
    [ scene 900 600 model ]
    [ dashboard model
    , instructions
    ]


scene : Int -> Int -> GameState -> Html
scene width height { universe, library, graphics } =
  let
    aspect =
      toFloat width / toFloat height

    maybeShip =
      Dict.get "ship" universe

    camera =
      Maybe.map
        (Camera.at aspect)
        maybeShip

    targetName =
      case Maybe.andThen maybeShip .ai of
        Just (PlayerControlled { target }) ->
          target

        _ ->
          ""

    draw object =
      case object of
        Background meshName ->
          MaybeX.map2
            Background.entity
            camera
            (Dict.get meshName library)
            |> MaybeX.maybeToList

        Object { bodyName, meshName, shader } ->
          MaybeX.map3
            (objectPlacement >> Foreground.entity shader)
            (Dict.get bodyName universe)
            camera
            (Dict.get meshName library)
            |> MaybeX.maybeToList

        Reticule meshName ->
          Maybe.map
            (Guide.reticule (Camera.ortho aspect))
            (Dict.get meshName library)
            |> MaybeX.maybeToList

        Target { meshName } ->
          MaybeX.map3
            (\b c -> Foreground.entity Decoration (decorPlacement b c) c)
            (Dict.get targetName universe)
            camera
            (Dict.get meshName library)
            |> MaybeX.maybeToList

        Highlight { filter, meshName } ->
          MaybeX.map2
            (\c m ->
              Dict.values universe
                |> List.filter filter
                |> List.map
                    (\body ->
                      Foreground.entity Decoration (decorPlacement body c) c m
                    )
            )
            camera
            (Dict.get meshName library)
            |> Maybe.withDefault []

    webgl =
      WebGL.webglWithConfig
        [ WebGL.Enable WebGL.CullFace
        , WebGL.Enable WebGL.DepthTest
        ]
        ( width, height )
  in
    List.concatMap draw graphics
      |> webgl
      |> Html.fromElement


objectPlacement : Body -> Matrix
objectPlacement object =
  Transform.placement
    1
    object.position
    object.orientation


decorPlacement : Body -> Camera -> Matrix
decorPlacement object camera =
  let
    direction =
      Vector.direction object.position camera.position

    position =
      Vector.scale 0.1 direction
        |> Vector.add camera.position
  in
    Transform.rotationFor direction
      |> Transform.placement 1.0e-2 position


dashboard : GameState -> Html
dashboard model =
  let
    printNumber label value =
      let
        sign =
          if value > -5.0e-3 then
            "+"
          else
            "-"

        intPart =
          floor (abs value)

        centPart =
          round (100 * abs value) - (100 * intPart)

        decimal =
          if centPart < 10 then
            ".0"
          else
            "."
      in
        [ label, ": ", sign, toString intPart, decimal, toString centPart ]
          |> String.concat
          |> text

    printInt label value =
      [ label, ": ", toString value ]
        |> String.concat
        |> text

    shipPosition =
      Dict.get "ship" model.universe
        |> MaybeX.mapDefault (Vector.vector 0 0 0) .position
  in
    div
      [ class "dashboard" ]
      [ p [] [ printInt "Visitors Destroyed" model.score ]
      , p [] [ printNumber "X" shipPosition.x ]
      , p [] [ printNumber "Y" shipPosition.y ]
      , p [] [ printNumber "Z" shipPosition.z ]
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
        [ li [] [ text "Thrust Forward : I" ]
        , li [] [ text "Brake : M" ]
        , li [] [ text "Turn Camera : A / D / W / S / Q / E" ]
        , li [] [ text "Fire Missile : O" ]
        ]
    ]
