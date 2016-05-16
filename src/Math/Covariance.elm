module Math.Covariance (Covariance, Basis, add, scale, eigenbasis, init) where

import Math.Vector as Vector exposing (Vector)


type Covariance
  = Covariance
      { xx : Float
      , xy : Float
      , xz : Float
      , yy : Float
      , yz : Float
      , zz : Float
      }


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
  Covariance
    { xx = a.xx + b.xx
    , xy = a.xy + b.xy
    , xz = a.xz + b.xz
    , yy = a.yy + b.yy
    , yz = a.yz + b.yz
    , zz = a.zz + b.zz
    }


scale : Float -> Covariance -> Covariance
scale factor (Covariance cov) =
  Covariance
    { xx = factor * cov.xx
    , xy = factor * cov.xy
    , xz = factor * cov.xz
    , yy = factor * cov.yy
    , yz = factor * cov.yz
    , zz = factor * cov.zz
    }


type alias Basis =
  { x : Vector
  , y : Vector
  , z : Vector
  }


eigenbasis : Covariance -> Basis
eigenbasis matrix =
  let
    solve m =
      case convergeToEigenvector 20 m guess of
        Ok v ->
          v

        Err v ->
          v |> Debug.log "did not converge"

    guess =
      Vector.vector (1 / sqrt 3) (1 / sqrt 3) (1 / sqrt 3)

    xSolution =
      solve matrix

    xEigenvalue =
      rayleighQuotient matrix xSolution

    ySolution =
      solve (removeEigenvalue xEigenvalue matrix)
  in
    { x = xSolution
    , y = ySolution
    , z = Vector.cross xSolution ySolution
    }


convergeToEigenvector : Float -> Covariance -> Vector -> Result Vector Vector
convergeToEigenvector iter matrix guess =
  let
    nextGuess =
      Vector.normalize (transform matrix guess)

    solutionFound =
      Vector.equal guess nextGuess
        || Vector.equal guess (Vector.negate nextGuess)
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


removeEigenvalue : Float -> Covariance -> Covariance
removeEigenvalue value =
  add (init -value 0 0 -value 0 -value)


transform : Covariance -> Vector -> Vector
transform (Covariance c) v =
  Vector.vector
    (c.xx * Vector.getX v + c.xy * Vector.getY v + c.xz * Vector.getZ v)
    (c.xy * Vector.getX v + c.yy * Vector.getY v + c.yz * Vector.getZ v)
    (c.xz * Vector.getX v + c.yz * Vector.getY v + c.zz * Vector.getZ v)
