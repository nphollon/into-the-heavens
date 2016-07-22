module Graphics.Hud exposing (draw)

import Dict
import Color
import Maybe.Extra as MaybeX
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Vector3 as Vec3 exposing (Vec3)
import WebGL exposing (Renderable, Drawable(..), Shader)
import Types exposing (..)
import Math.Vector as Vector exposing (Vector)
import Math.Transform as Transform
import Math.Quaternion as Quaternion exposing (Quaternion)
import Flight.Util as Util
import Graphics.Camera as Camera
import Graphics.Foreground as Foreground


draw : Int -> Int -> GameState -> List Renderable
draw width height model =
    let
        aspect =
            toFloat width / toFloat height

        player =
            Util.getPlayer model.universe

        perspectiveCamera =
            Camera.at aspect player.body

        orthoCamera =
            Camera.ortho aspect

        highlight mesh color body =
            Foreground.entity (Bright color)
                (decorPlacement body perspectiveCamera)
                perspectiveCamera
                mesh

        target =
            Util.fromId player.cockpit.target model
                |> MaybeX.maybeToList
                |> List.map (highlight targetMesh Color.blue)

        decorateGroup mesh color filter =
            Dict.values model.universe
                |> List.filter filter
                |> List.map (highlight mesh color)
    in
        List.concat
            [ reticule orthoCamera
            , shieldSystem player.cockpit.shields orthoCamera
            , target
            , decorateGroup incomingMesh Color.red Util.isSeekingPlayer
            , decorateGroup targetableMesh Color.blue Util.isVisitor
            ]


decorPlacement : Body -> Camera -> Mat4
decorPlacement object camera =
    let
        direction =
            Vector.direction object.position camera.position
                |> Maybe.withDefault (Vector.vector 0 0 0)

        position =
            Vector.scale 0.1 direction
                |> Vector.add camera.position
    in
        Transform.rotationFor (Vector.vector 0 0 1) direction
            |> placement position
            |> Mat4.scale3 1.0e-2 1.0e-2 1.0e-2


placement : Vector -> Quaternion -> Mat4
placement position orientation =
    Mat4.mul (Mat4.makeTranslate (Vector.toVec3 position))
        (Quaternion.toMat4 orientation)


reticule : Camera -> List Renderable
reticule camera =
    [ renderStatic camera (LineLoop (ngon 4 1 (Vec4.vec4 0.9 0.9 0.9 1)))
    , renderStatic camera (LineLoop (ngon 4 1.1 (Vec4.vec4 0 0 0 1)))
    ]


targetMesh : Drawable Vertex
targetMesh =
    LineLoop (ngon 30 1 (Vec4.vec4 0.2 0.2 1 1))


targetableMesh : Drawable Vertex
targetableMesh =
    Lines (dashedNgon 15 1 (Vec4.vec4 0.2 0.2 1 1))


incomingMesh : Drawable Vertex
incomingMesh =
    LineLoop (ngon 30 0.4 (Vec4.vec4 1 0 0 1))


ngon : Int -> Float -> Vec4 -> List Vertex
ngon sides radius color =
    [0..sides]
        |> List.map (\i -> turns (toFloat i / toFloat sides))
        |> List.map (toVertex color radius)


dashedNgon : Int -> Float -> Vec4 -> List ( Vertex, Vertex )
dashedNgon sides radius color =
    let
        vertex i =
            toVertex color radius (turns (i / toFloat sides))
    in
        [0..sides]
            |> List.map toFloat
            |> List.map (\i -> ( vertex i, vertex (i + 0.4) ))


shieldSystem : DrainSwitch -> Camera -> List Renderable
shieldSystem switch camera =
    renderBar switch.value camera
        :: (if switch.on then
                [ renderStatic camera shieldMesh ]
            else
                []
           )


shieldMesh : Drawable Vertex
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


skewStroke : Int -> ( Float, Vec4 ) -> ( Float, Vec4 ) -> List ( Vertex, Vertex )
skewStroke strokes ( innerRadius, innerColor ) ( outerRadius, outerColor ) =
    let
        angleOf i =
            turns (toFloat i / toFloat strokes)

        toStroke i =
            ( toVertex innerColor innerRadius (angleOf i)
            , toVertex outerColor outerRadius (angleOf (i + 1))
            )
    in
        List.map toStroke [0..strokes]


toVertex : Vec4 -> Float -> Float -> Vertex
toVertex color radius angle =
    { vertPosition = toPosition radius angle
    , vertColor = color
    , normal = Vec3.vec3 0 0 0
    }


toPosition : Float -> Float -> Vec3
toPosition radius angle =
    let
        ( x, y ) =
            fromPolar ( radius, angle )
    in
        Vec3.vec3 x y 0


renderStatic : Camera -> Drawable Vertex -> Renderable
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


renderBar : Float -> Camera -> Renderable
renderBar fraction camera =
    let
        uniform =
            { perspective = camera.perspective
            , fraction = fraction
            }
    in
        WebGL.render barVertex barFragment barMesh uniform


barMesh : Drawable Vertex
barMesh =
    let
        full =
            Vec4.vec4 1 1 1 1

        empty =
            Vec4.vec4 0 0 0 1

        topLeftX =
            28

        topLeftY =
            -5

        width =
            1

        height =
            15

        upperRight =
            { vertPosition = Vec3.vec3 (topLeftX + width) topLeftY 0
            , vertColor = full
            , normal = Vec3.vec3 0 0 0
            }

        upperLeft =
            { vertPosition = Vec3.vec3 topLeftX topLeftY 0
            , vertColor = full
            , normal = Vec3.vec3 0 0 0
            }

        lowerRight =
            { vertPosition = Vec3.vec3 (topLeftX + width) (topLeftY - height) 0
            , vertColor = empty
            , normal = Vec3.vec3 0 0 0
            }

        lowerLeft =
            { vertPosition = Vec3.vec3 topLeftX (topLeftY - height) 0
            , vertColor = empty
            , normal = Vec3.vec3 0 0 0
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
    Shader Vertex (Uniform a) Varying


type alias FragmentShader a =
    Shader {} (Uniform a) Varying
