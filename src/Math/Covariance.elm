module Math.Covariance (Covariance, Basis, eigenbasis, init, toOrientation, fromMesh) where

import Math.Vector as Vector exposing (Vector)
import Math.Face exposing (Face)


type Covariance
  = Covariance
      { xx : Float
      , xy : Float
      , xz : Float
      , yy : Float
      , yz : Float
      , zz : Float
      }


fromMesh : List ( Face, Float ) -> Covariance
fromMesh faces =
  let
    partialCovariance face =
      init
        (covarianceElement One One face)
        (covarianceElement One Two face)
        (covarianceElement One Three face)
        (covarianceElement Two Two face)
        (covarianceElement Two Three face)
        (covarianceElement Three Three face)

    zeroMatrix =
      init 0 0 0 0 0 0
  in
    List.map partialCovariance faces
      |> List.foldl add zeroMatrix
      |> scale (1 / toFloat (List.length faces))


covarianceElement : Component -> Component -> ( Face, Float ) -> Float
covarianceElement j k ( face, area ) =
  let
    pj =
      component j face.p

    pk =
      component k face.p

    qj =
      component j face.q

    qk =
      component k face.q

    rj =
      component j face.r

    rk =
      component k face.r

    productOfSums =
      (pj + qj + rj) * (pk + qk + rk)

    sumOfProducts =
      (pj * pk) + (qj * qk) + (rj * rk)
  in
    area * (productOfSums + sumOfProducts)


type Component
  = One
  | Two
  | Three


component : Component -> Vector -> Float
component comp =
  case comp of
    One ->
      Vector.getX

    Two ->
      Vector.getY

    Three ->
      Vector.getZ


init : Float -> Float -> Float -> Float -> Float -> Float -> Covariance
init xx xy xz yy yz zz =
  Covariance
    { xx = xx
    , xy = xy
    , xz = xz
    , yy = yy
    , yz = yz
    , zz = zz
    }


add : Covariance -> Covariance -> Covariance
add (Covariance a) (Covariance b) =
  init
    (a.xx + b.xx)
    (a.xy + b.xy)
    (a.xz + b.xz)
    (a.yy + b.yy)
    (a.yz + b.yz)
    (a.zz + b.zz)


scale : Float -> Covariance -> Covariance
scale factor (Covariance cov) =
  init
    (factor * cov.xx)
    (factor * cov.xy)
    (factor * cov.xz)
    (factor * cov.yy)
    (factor * cov.yz)
    (factor * cov.zz)


type alias Basis =
  { x : Vector
  , y : Vector
  , z : Vector
  }


toOrientation : Basis -> Vector
toOrientation basis =
  let
    axis =
      Vector.vector
        (Vector.getZ basis.y - Vector.getY basis.z)
        (Vector.getX basis.z - Vector.getZ basis.x)
        (Vector.getY basis.x - Vector.getX basis.y)

    twoSinAngle =
      Vector.length axis

    angle =
      asin (0.5 * twoSinAngle)
  in
    Vector.scale (angle / twoSinAngle) axis


eigenbasis : Covariance -> Basis
eigenbasis matrix =
  let
    solve m =
      case convergeToEigenvector 50 m guess of
        Ok v ->
          v

        Err v ->
          v

    guess =
      { value = 0
      , vector = Vector.vector (1 / sqrt 3) (1 / sqrt 3) (1 / sqrt 3)
      }

    xEigen =
      solve matrix

    yEigen =
      solve (removeEigenvalue xEigen.value matrix)
  in
    { x = xEigen.vector
    , y = yEigen.vector
    , z = Vector.cross xEigen.vector yEigen.vector
    }


type alias Eigen =
  { value : Float
  , vector : Vector
  }


convergeToEigenvector : Float -> Covariance -> Eigen -> Result Eigen Eigen
convergeToEigenvector iter matrix guess =
  let
    nextVector =
      Vector.normalize (transform matrix guess.vector)

    nextValue =
      rayleighQuotient matrix nextVector

    nextGuess =
      { value = nextValue
      , vector = nextVector
      }

    solutionFound =
      (guess.value - nextGuess.value) ^ 2 < 1.0e-20
  in
    if solutionFound then
      Ok nextGuess
    else if iter <= 0 then
      Err nextGuess
    else
      convergeToEigenvector (iter - 1) matrix nextGuess


rayleighQuotient : Covariance -> Vector -> Float
rayleighQuotient matrix vector =
  (Vector.dot vector (transform matrix vector))
    / (Vector.dot vector vector)


adjugate : Covariance -> Covariance
adjugate (Covariance c) =
  init
    (c.yy * c.zz - c.yz * c.yz)
    (c.xz * c.yz - c.xy * c.zz)
    (c.xy * c.yz - c.xz * c.yy)
    (c.xx * c.zz - c.xz * c.xz)
    (c.xy * c.xz - c.xx * c.yz)
    (c.xx * c.yy - c.xy * c.xy)


removeEigenvalue : Float -> Covariance -> Covariance
removeEigenvalue value =
  add (init -value 0 0 -value 0 -value)


transform : Covariance -> Vector -> Vector
transform (Covariance c) v =
  Vector.vector
    (c.xx * Vector.getX v + c.xy * Vector.getY v + c.xz * Vector.getZ v)
    (c.xy * Vector.getX v + c.yy * Vector.getY v + c.yz * Vector.getZ v)
    (c.xz * Vector.getX v + c.yz * Vector.getY v + c.zz * Vector.getZ v)
