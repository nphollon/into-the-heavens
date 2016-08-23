module Graphics.View exposing (view)

import Dict exposing (Dict)
import List.Extra as ListX
import Html exposing (..)
import Html.Attributes as Attributes exposing (class)
import WebGL exposing (Renderable)
import Types exposing (..)
import Graphics.Camera as Camera
import Flight.Hostile as Hostile
import Flight.Explosion as Explosion
import Flight.Seeking as Seeking
import Flight.Dumb as Dumb
import Flight.Player as Player
import Flight.PlayerBullet as PlayerBullet
import Flight.Mechanics as Mechanics


view : GameState -> Html a
view model =
    case Dict.get Mechanics.playerId model.universe of
        Just player ->
            div [ class "container" ]
                [ scene 900 600 model player
                , log model
                , instructions
                ]

        Nothing ->
            span [] []


scene : Int -> Int -> GameState -> Body -> Html a
scene width height model player =
    let
        functionCalls =
            [ WebGL.Enable WebGL.CullFace, WebGL.Enable WebGL.DepthTest ]

        attributes =
            [ Attributes.width width, Attributes.height height ]

        renderables =
            drawWorld model player
    in
        WebGL.toHtmlWith functionCalls attributes renderables


drawWorld : GameState -> Body -> List Renderable
drawWorld model player =
    let
        camera =
            Camera.at player.frame

        drawFromAi body =
            case body.ai of
                Hostile _ ->
                    Hostile.draw camera model.library body

                Seeking _ ->
                    Seeking.draw camera model.library body

                Explosion lifespan ->
                    Explosion.draw camera model.library body lifespan

                Dumb graphics ->
                    Dumb.draw camera model.library body graphics

                PlayerBullet _ ->
                    PlayerBullet.draw camera model.library body

                PlayerControlled cockpit ->
                    Player.draw model player cockpit
    in
        List.concatMap drawFromAi (Dict.values model.universe)


log : GameState -> Html a
log model =
    let
        lineHtml ( timestamp, message ) =
            p [] [ text message ]

        cutoffTime =
            model.gameTime - 6
    in
        model.log
            |> ListX.takeWhile (\( t, _ ) -> t > cutoffTime)
            |> List.reverse
            |> List.map lineHtml
            |> div [ class "log" ]


instructions : Html a
instructions =
    p [ class "reminder" ] [ text "Press 'P' to Pause" ]
