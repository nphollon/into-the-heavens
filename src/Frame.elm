module Frame (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


view : List Html -> List Html -> Html
view tops bottoms =
  div
    [ class "app" ]
    [ div [ class "top" ] tops
    , div [ class "bottom" ] bottoms
    ]
