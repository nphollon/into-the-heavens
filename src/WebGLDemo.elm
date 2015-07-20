module WebGLDemo where

import WebGL
import Math.Vector3 as Vec3
import Math.Vector4 as Vec4
import Math.Matrix4 as Mat4
import Graphics.Element as Layout
import Color
import Signal
import Time
import Keyboard
import List
import Array

import Graphics
import Infix exposing (..)

main : Signal Layout.Element
main =
  let
    startState =
      { orientation = Mat4.identity
      }

    model =
      Signal.foldp update startState signal
  in
    Signal.map view model


type alias Model =
  { orientation : Mat4.Mat4
  }


type alias Action =
  { x : Int
  , y : Int
  }

type alias Attribute =
  { position : Vec3.Vec3
  , vertColor : Vec4.Vec4
  }


type alias Uniform =
  { perspective : Mat4.Mat4
  , placement : Mat4.Mat4
  }


type alias Varying = {
  fragColor : Vec4.Vec4
  }


signal : Signal Action
signal =
  Signal.sampleOn (Time.every (10 * Time.millisecond)) Keyboard.wasd


update : Action -> Model -> Model
update action model =
  let
    delta =
      degrees 1

    newOrientation =
      model.orientation
      |> Mat4.rotate (action.y .* delta) xAxis
      |> Mat4.rotate (negate action.x .* delta) yAxis
  in
    { model | orientation <- newOrientation }


view : Model -> Layout.Element
view model =
  let
    dimensions =
      (600, 600)

    aspect =
      uncurry (./.) dimensions

    uniform =
      { perspective = Mat4.makePerspective 90 aspect 1 70
      , placement = Mat4.transpose model.orientation
      }
  in
    Graphics.render dimensions
      [ compass uniform
      , meridian 30 (degrees 45) uniform
      , meridian 30 (degrees 135) uniform
      ]
      

compass : Uniform -> WebGL.Entity
compass uniform =
  let
    mesh =
      List.concat
      [ star 25 0 0
      , star 25 0 (degrees 180)
      , star 25 0 (degrees 90)
      , star 25 (degrees 90) (degrees 90)
      , star 25 (degrees 180) (degrees 90)
      , star 25 (degrees 270) (degrees 90)
      ]
  in
    Graphics.entity mesh uniform


star : Float -> Float -> Float -> List (WebGL.Triangle Attribute)
star r phi theta =
  let
    move =
      Mat4.makeRotate phi yAxis
      |> Mat4.rotate theta zAxis
      |> Mat4.translate (Vec3.vec3 0 r 0)
      |> Graphics.transform

    down = move <| Graphics.vertex Color.yellow 0 -1 0
    up = move <| Graphics.vertex Color.white 0 1 0
    east = move <| Graphics.vertex Color.yellow -1 0 0
    west = move <| Graphics.vertex Color.white 1 0 0
    south = move <| Graphics.vertex Color.yellow 0 0 -1
    north = move <| Graphics.vertex Color.white 0 0 1

  in
    [ (down, north, up)
    , (down, south, up)
    , (down, east, up)
    , (down, west, up)
    , (east, north, west)
    , (east, south, west)
    ]


meridian : Float -> Float -> Uniform -> WebGL.Entity
meridian radius azimuth uniform = 
  let
    baseRing =
      vertexRing 50 0.005

    rotation =
      Mat4.makeRotate azimuth yAxis
      |> Mat4.rotate (degrees 90) zAxis

    ring =
      List.map (Graphics.transform rotation >> Graphics.scale radius) baseRing

    mesh =
      List.map3 (\a b c -> (a,b,c))
        ring
        (List.drop 1 ring)
        (List.drop 2 ring)
  in
    Graphics.entity mesh uniform


vertexRing : Int -> Float -> List Attribute
vertexRing resolution width =
  let
    grate =
      2 * resolution

    indexedVertex i =
      let
        side =
          if (i % 2 == 0) then 1 else -1

        phi =
          turns (i ./. grate)
      in
        sphVertex Color.red 1 phi (degrees 90 + side .* width)
  in
    Array.initialize (grate + 2) indexedVertex |> Array.toList


sphVertex : Color.Color -> Float -> Float -> Float -> Attribute
sphVertex color r phi theta =
  Graphics.vertex
    color
    (r * sin theta * sin phi)
    (r * cos theta)
    (r * sin theta * cos phi)


-- Geometric constants

xAxis : Vec3.Vec3
xAxis =
  Vec3.vec3 1 0 0


yAxis : Vec3.Vec3
yAxis =
  Vec3.vec3 0 1 0


zAxis : Vec3.Vec3
zAxis =
  Vec3.vec3 0 0 1
