module Graphics.Material exposing (matte, bright, color)

import Color exposing (Color)
import Math.Vector3 as Vec3 exposing (Vec3)
import Types exposing (..)


matte : Color -> Material
matte c =
    let
        colorVector =
            color c

        smallVector =
            Vec3.scale 0.1 colorVector
    in
        { ambient = smallVector
        , diffuse = colorVector
        , specular = Vec3.add smallVector (Vec3.vec3 0.9 0.9 0.9)
        , shininess = 4
        }


bright : Color -> Material
bright c =
    { ambient = color c
    , diffuse = Vec3.vec3 0 0 0
    , specular = Vec3.vec3 0 0 0
    , shininess = 0
    }


color : Color -> Vec3
color c =
    let
        rgb =
            Color.toRgb c
    in
        Vec3.vec3 (toFloat rgb.red / 255)
            (toFloat rgb.green / 255)
            (toFloat rgb.blue / 255)
