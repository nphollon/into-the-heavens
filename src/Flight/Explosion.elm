module Flight.Explosion exposing (init, update, draw)

import WebGL exposing (Drawable, Renderable, Shader)
import Math.Matrix4 as Mat4 exposing (Mat4)
import Math.Vector4 exposing (Vec4)
import Math.Vector3 exposing (Vec3)
import Collision
import Types exposing (..)
import Library
import Math.Quaternion as Quaternion
import Math.Vector as Vector
import Math.Transform as Transform
import Flight.Mechanics as Mechanics


init : Body -> Body
init parent =
    { position = parent.position
    , velocity = parent.velocity
    , orientation = Quaternion.identity
    , angVelocity = Quaternion.identity
    , bounds = Collision.empty
    , health = 1
    , ai = Explosion 3
    , collisionClass = Scenery
    }


update : Id -> Body -> Float -> ( Body, List EngineEffect )
update id actor lifespan =
    if lifespan > 0 then
        ( Mechanics.glide { actor | ai = Explosion (lifespan - Mechanics.delta) }, [] )
    else
        ( actor, [ Destroy id ] )


draw : Camera -> Library -> Body -> Float -> List Renderable
draw camera library body lifespan =
    [ entity (lifespan / 3)
        (Transform.toMat4 body)
        camera
        (Library.getMesh "Explosion" library)
    ]


percentCountdown : Body -> Float
percentCountdown object =
    case object.ai of
        Explosion x ->
            x / 3.0

        _ ->
            0.5


type alias Uniform =
    { perspective : Mat4
    , cameraOrientation : Mat4
    , cameraPosition : Vec3
    , placement : Mat4
    , inversePlacement : Mat4
    , lightness : Float
    }


type alias Varying =
    { fragColor : Vec4
    }


type alias VertexShader =
    Shader Vertex Uniform Varying


type alias FragmentShader =
    Shader {} Uniform Varying


entity : Float -> Mat4 -> Camera -> Drawable Vertex -> Renderable
entity percentCountdown placement camera mesh =
    let
        radius =
            8 * (1 - percentCountdown) ^ 0.4

        uniform =
            { perspective = camera.perspective
            , cameraOrientation = Quaternion.toMat4 camera.orientation
            , cameraPosition = Vector.toVec3 camera.position
            , placement = Mat4.scale3 radius radius radius placement
            , inversePlacement = Mat4.inverseOrthonormal placement
            , lightness = percentCountdown
            }
    in
        WebGL.render vertex fragment mesh uniform


vertex : VertexShader
vertex =
    [glsl|
  precision mediump float;

  attribute vec3 vertPosition;
  attribute vec3 normal;

  uniform vec3 cameraPosition;
  uniform mat4 perspective;
  uniform mat4 cameraOrientation;
  uniform mat4 placement;
  uniform mat4 inversePlacement;
  uniform float lightness;

  varying vec4 fragColor;

  void main() {
    vec4 worldFrame = placement * vec4(vertPosition, 1);
    vec4 cameraFrame = worldFrame - vec4(cameraPosition, 0);

    vec4 projectionOffset = vec4(0, 0, length(cameraFrame.xyz), 0);

    gl_Position =
      perspective * (cameraOrientation * cameraFrame - projectionOffset);

    gl_PointSize = 2.0;

    float inflect = 0.9;

    if (lightness > inflect) {
      float scaledLightness = (lightness - inflect) / ( 1.0 - inflect);
      fragColor = vec4(1, scaledLightness, scaledLightness, 1);
    } else {
      float scaledLightness = lightness / inflect;
      fragColor = vec4(scaledLightness, 0, 0, 1);
    }
  }
  |]


fragment : FragmentShader
fragment =
    [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
