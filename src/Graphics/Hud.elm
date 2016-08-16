module Graphics.Hud exposing (draw)

import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL exposing (Renderable, Drawable(..), Shader)
import Types exposing (..)
import Graphics.Camera as Camera


draw : Float -> GameState -> Body -> PlayerCockpit -> List Renderable
draw aspect model player cockpit =
    let
        orthoCamera =
            Camera.ortho aspect
    in
        List.concat
            [ reticule orthoCamera
            , shieldSystem cockpit.shields orthoCamera
            , health (0.1 * player.health) orthoCamera
            ]


reticule : Camera -> List Renderable
reticule camera =
    let
        square radius color =
            [ 0, turns 0.25, turns 0.5, turns 0.75 ]
                |> List.map (toFlatVertex color radius)
                |> LineLoop
                |> renderStatic camera
    in
        [ square 1 (Vec4.vec4 0.9 0.9 0.9 1)
        , square 1.1 (Vec4.vec4 0 0 0 1)
        ]


health : Float -> Camera -> List Renderable
health level camera =
    [ renderBar level 28 camera ]


shieldSystem : DrainSwitch -> Camera -> List Renderable
shieldSystem switch camera =
    renderBar switch.value 26 camera
        :: (if switch.on then
                [ renderStatic camera shieldMesh ]
            else
                []
           )


shieldMesh : Drawable FlatVertex
shieldMesh =
    let
        tip =
            ( 20, Vec4.vec4 0.6 0.6 0.3 1 )

        rim =
            ( 35, Vec4.vec4 0 0 0.1 1 )
    in
        skewStroke 25 tip rim
            |> (++) (skewStroke 25 rim tip)
            |> Lines


skewStroke : Int -> ( Float, Vec4 ) -> ( Float, Vec4 ) -> List ( FlatVertex, FlatVertex )
skewStroke strokes ( innerRadius, innerColor ) ( outerRadius, outerColor ) =
    let
        angleOf i =
            turns (toFloat i / toFloat strokes)

        toStroke i =
            ( toFlatVertex innerColor innerRadius (angleOf i)
            , toFlatVertex outerColor outerRadius (angleOf (i + 1))
            )
    in
        List.map toStroke [0..strokes]


type alias FlatVertex =
    { vertPosition : Vec3
    , vertColor : Vec4
    }


toFlatVertex : Vec4 -> Float -> Float -> FlatVertex
toFlatVertex color radius angle =
    { vertPosition = toPosition radius angle
    , vertColor = color
    }


toPosition : Float -> Float -> Vec3
toPosition radius angle =
    let
        ( x, y ) =
            fromPolar ( radius, angle )
    in
        Vec3.vec3 x y 0


renderStatic : Camera -> Drawable FlatVertex -> Renderable
renderStatic camera mesh =
    let
        uniform =
            { perspective = camera.perspective }
    in
        WebGL.render staticVertex staticFragment mesh uniform


staticVertex : VertexShader {}
staticVertex =
    [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;

  varying vec4 fragColor;

  void main() {
    gl_Position = perspective * vec4(vertPosition, 1);

    fragColor = vertColor;
  }
  |]


staticFragment : FragmentShader {}
staticFragment =
    [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]


renderBar : Float -> Float -> Camera -> Renderable
renderBar fraction topLeftX camera =
    let
        uniform =
            { perspective = camera.perspective
            , fraction = fraction
            }
    in
        WebGL.render barVertex barFragment (barMesh topLeftX) uniform


barMesh : Float -> Drawable FlatVertex
barMesh topLeftX =
    let
        full =
            Vec4.vec4 1 1 1 1

        empty =
            Vec4.vec4 0 0 0 1

        topLeftY =
            -5

        width =
            1

        height =
            15

        upperRight =
            { vertPosition = Vec3.vec3 (topLeftX + width) topLeftY 0
            , vertColor = full
            }

        upperLeft =
            { vertPosition = Vec3.vec3 topLeftX topLeftY 0
            , vertColor = full
            }

        lowerRight =
            { vertPosition = Vec3.vec3 (topLeftX + width) (topLeftY - height) 0
            , vertColor = empty
            }

        lowerLeft =
            { vertPosition = Vec3.vec3 topLeftX (topLeftY - height) 0
            , vertColor = empty
            }
    in
        Triangle
            [ ( upperRight, upperLeft, lowerRight )
            , ( lowerRight, upperLeft, lowerLeft )
            ]


barVertex : VertexShader { fraction : Float }
barVertex =
    [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;

  varying vec4 fragColor;

  void main() {
    gl_Position = perspective * vec4(vertPosition, 1);

    fragColor = vertColor;
  }
  |]


barFragment : FragmentShader { fraction : Float }
barFragment =
    [glsl|
  precision mediump float;

  uniform float fraction;

  varying vec4 fragColor;

  void main () {
    gl_FragColor = 1.0 - step(fraction, fragColor);
    gl_FragColor.w = 1.0;
  }
  |]


type alias Varying =
    { fragColor : Vec4 }


type alias Uniform a =
    { a
        | perspective : Mat4
    }


type alias VertexShader a =
    Shader FlatVertex (Uniform a) Varying


type alias FragmentShader a =
    Shader {} (Uniform a) Varying
