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

{-
  questions:
    triangle fans & strips
    rendering faces in one direction only
    referencing vertices by index
    geometry shaders
  -}

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
    [ compass uniform
    , meridian 30 (degrees 45) uniform
    , meridian 30 (degrees 135) uniform
    ]
    |> WebGL.webgl dimensions
    |> uncurry Layout.container dimensions Layout.middle
    |> Layout.color Color.black


compass : Uniform -> WebGL.Entity
compass uniform =
  let
    mesh =
      List.concat
      [ compassPoint 0 0 25
      , compassPoint 0 0 -25
      , compassPoint 25 0 0
      , compassPoint -25 0 0
      , compassPoint 0 25 0
      , compassPoint 0 -25 0
      ]
  in
    WebGL.entity vertexShader fragmentShader mesh uniform


compassPoint : Float -> Float -> Float -> List (WebGL.Triangle Attribute)
compassPoint x y z =
  let
    down = vertex Color.yellow x (y - 1) z
    up = vertex Color.white x (y + 1) z
    east = vertex Color.yellow (x - 1) y z
    west = vertex Color.white (x + 1) y z
    south = vertex Color.yellow x y (z - 1)
    north = vertex Color.white x y (z + 1)
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
      List.map (transform rotation >> scale radius) baseRing

    mesh =
      List.map3 (\a b c -> (a,b,c))
        ring
        (List.drop 1 ring)
        (List.drop 2 ring)
  in
    WebGL.entity vertexShader fragmentShader mesh uniform


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


transform : Mat4.Mat4 -> Attribute -> Attribute
transform rotation vertex =
  { vertex | position <- Mat4.transform rotation vertex.position }


scale : Float -> Attribute -> Attribute
scale factor vertex =
  { vertex | position <- Vec3.scale factor vertex.position }

sphVertex : Color.Color -> Float -> Float -> Float -> Attribute
sphVertex color r phi theta =
  vertex
    color
    (r * sin theta * sin phi)
    (r * cos theta)
    (r * sin theta * cos phi)


vertex : Color.Color -> Float -> Float -> Float -> Attribute
vertex color x y z =
  let
    rgba =
      Color.toRgb color

    colorVector =
      Vec4.vec4
        (rgba.red ./. 255)
        (rgba.green ./. 255)
        (rgba.blue ./. 255)
        rgba.alpha
  in
    { position = Vec3.vec3 x y z
    , vertColor = colorVector }


vertexShader : WebGL.Shader Attribute Uniform Varying
vertexShader =
  [glsl|
  attribute vec3 position;
  attribute vec4 vertColor;
  uniform mat4 perspective;
  uniform mat4 placement;
  varying vec4 fragColor;

  void main() {
    vec4 offset = vec4 (0, 0, length(position), 0);
    gl_Position =
      perspective * (placement * vec4(position, 1.0) - offset);

    fragColor = vertColor;
  }
  |]

fragmentShader : WebGL.Shader { } Uniform Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]


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


-- Type-converting arithmetic operators

(./.) : Int -> Int -> Float
(./.) a b =
  toFloat a / toFloat b

(.*) : Int -> Float -> Float
(.*) a b =
  toFloat a * b
