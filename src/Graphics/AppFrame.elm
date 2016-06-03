module Graphics.AppFrame exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


view : List (Html a) -> List (Html a) -> Html a
view tops bottoms =
    div [ class "app" ]
        [ div [ class "top" ] tops
        , div [ class "bottom" ] bottoms
        ]
