module Flight.Background (..) where

import Math.Vector3 as Vec3 exposing (Vec3)
import Math.Vector4 as Vec4 exposing (Vec4)
import Math.Matrix4 as Mat4 exposing (Mat4)
import WebGL
import Mesh exposing (Mesh)


type alias Background =
  { mesh : WebGL.Drawable Mesh.Vertex
  }


type alias Camera =
  { perspective : Mat4
  , cameraOrientation : Mat4
  , cameraPosition : Vec3
  }


type alias Varying =
  { fragColor : Vec4
  }


background : Mesh -> Background
background mesh =
  { mesh = WebGL.Triangle mesh
  }


empty : Background
empty =
  background []


toEntity : Background -> Camera -> WebGL.Renderable
toEntity bkg =
  WebGL.render vertexShader fragmentShader bkg.mesh


vertexShader : WebGL.Shader Mesh.Vertex Camera Varying
vertexShader =
  [glsl|
  attribute vec3 vertPosition;
  attribute vec4 vertColor;

  uniform mat4 perspective;
  uniform mat4 cameraOrientation;

  varying vec4 fragColor;

  void main() {
    vec4 worldPosition = vec4(vertPosition, 1);
    vec4 projectionOffset = vec4(0, 0, length(worldPosition.xyz), 0);
    gl_Position =
      perspective * (cameraOrientation * worldPosition - projectionOffset);

    fragColor = vertColor;
  }
  |]


fragmentShader : WebGL.Shader {} Camera Varying
fragmentShader =
  [glsl|
  precision mediump float;
  varying vec4 fragColor;

  void main () {
    gl_FragColor = fragColor;
  }
  |]
