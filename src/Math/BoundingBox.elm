module Math.BoundingBox (BoundingBox, boxCollide, collide, boxCreate, create, projectAndSplit, encode, decode) where

import Json.Encode as Encode exposing (Value)
import Json.Decode as Decode exposing (Decoder, (:=))
import Math.Vector as Vector exposing (Vector)
import Math.Matrix as Matrix exposing (Matrix)
import Math.Tree as Tree exposing (Tree(..))
import Math.Transform as Transform
import Math.Hull as Hull
import Math.Face as Face exposing (Face)
import Math.Covariance as Covariance exposing (Covariance)


type alias BoundingBox =
  { a : Float
  , b : Float
  , c : Float
  , position : Vector
  , orientation : Vector
  }


encode : BoundingBox -> Value
encode box =
  let
    encodeVector v =
      Encode.list
        [ Encode.float (Vector.getX v)
        , Encode.float (Vector.getY v)
        , Encode.float (Vector.getZ v)
        ]
  in
    Encode.object
      [ ( "a", Encode.float box.a )
      , ( "b", Encode.float box.b )
      , ( "c", Encode.float box.c )
      , ( "position", encodeVector box.position )
      , ( "orientation", encodeVector box.orientation )
      ]


decode : Decoder BoundingBox
decode =
  let
    construct a b c position orientation =
      { a = a
      , b = b
      , c = c
      , position = position
      , orientation = orientation
      }

    decodeVector =
      Decode.tuple3 Vector.vector Decode.float Decode.float Decode.float
  in
    (Decode.object5 construct)
      ("a" := Decode.float)
      ("b" := Decode.float)
      ("c" := Decode.float)
      ("position" := decodeVector)
      ("orientation" := decodeVector)


type alias Body a =
  { a
    | position : Vector
    , orientation : Vector
  }


collide : Body b -> Tree BoundingBox -> Body b' -> Tree BoundingBox -> Bool
collide bodyA boxTreeA bodyB boxTreeB =
  let
    add { position, orientation } addend =
      { addend
        | position = Vector.add position addend.position
        , orientation = Transform.mulOrient orientation addend.orientation
      }

    condition boxA boxB =
      boxCollide (add bodyA boxA) (add bodyB boxB)
  in
    Tree.satisfies condition boxTreeA boxTreeB


boxCollide : BoundingBox -> BoundingBox -> Bool
boxCollide boxA boxB =
  let
    t =
      Transform.toBodyFrame boxB.position boxA
        |> Vector.toRecord

    rotation =
      Transform.mulOrient (Vector.negate boxA.orientation) boxB.orientation
        |> Matrix.makeRotate

    r1 =
      Matrix.transform rotation (Vector.vector 1 0 0)

    r2 =
      Matrix.transform rotation (Vector.vector 0 1 0)

    r3 =
      Matrix.transform rotation (Vector.vector 0 0 1)

    r =
      { a11 = abs (Vector.getX r1)
      , a12 = abs (Vector.getX r2)
      , a13 = abs (Vector.getX r3)
      , a21 = abs (Vector.getY r1)
      , a22 = abs (Vector.getY r2)
      , a23 = abs (Vector.getY r3)
      , a31 = abs (Vector.getZ r1)
      , a32 = abs (Vector.getZ r2)
      , a33 = abs (Vector.getZ r3)
      , s11 = Vector.getX r1
      , s12 = Vector.getX r2
      , s13 = Vector.getX r3
      , s21 = Vector.getY r1
      , s22 = Vector.getY r2
      , s23 = Vector.getY r3
      , s31 = Vector.getZ r1
      , s32 = Vector.getZ r2
      , s33 = Vector.getZ r3
      }

    aMajor =
      abs t.x
        <= (boxA.a + boxB.a * r.a11 + boxB.b * r.a12 + boxB.c * r.a13)

    aMiddle =
      abs t.y
        <= (boxA.b + boxB.a * r.a21 + boxB.b * r.a22 + boxB.c * r.a23)

    aMinor =
      abs t.z
        <= (boxA.c + boxB.a * r.a31 + boxB.b * r.a32 + boxB.c * r.a33)

    bMajor =
      abs (t.x * r.s11 + t.y * r.s21 + t.z * r.s31)
        <= (boxB.a + boxA.a * r.a11 + boxA.b * r.a21 + boxA.c * r.a31)

    bMiddle =
      abs (t.x * r.s12 + t.y * r.s22 + t.z * r.s32)
        <= (boxB.b + boxA.a * r.a12 + boxA.b * r.a22 + boxA.c * r.a32)

    bMinor =
      abs (t.x * r.s13 + t.y * r.s23 + t.z * r.s33)
        <= (boxB.c + boxA.a * r.a13 + boxA.b * r.a23 + boxA.c * r.a33)

    aMajorBMajor =
      abs (t.z * r.s21 - t.y * r.s31)
        <= (boxA.b * r.a31 + boxA.c * r.a21 + boxB.b * r.a13 + boxB.c * r.a12)

    aMajorBMiddle =
      abs (t.z * r.s22 - t.y * r.s32)
        <= (boxA.b * r.a32 + boxA.c * r.a22 + boxB.a * r.a13 + boxB.c * r.a11)

    aMajorBMinor =
      abs (t.z * r.s23 - t.y * r.s33)
        <= (boxA.b * r.a33 + boxA.c * r.a23 + boxB.a * r.a12 + boxB.b * r.a11)

    aMiddleBMajor =
      abs (t.x * r.s31 - t.z * r.s11)
        <= (boxA.a * r.a31 + boxA.c * r.a11 + boxB.b * r.a23 + boxB.c * r.a22)

    aMiddleBMiddle =
      abs (t.x * r.s32 - t.z * r.s12)
        <= (boxA.a * r.a32 + boxA.c * r.a12 + boxB.a * r.a23 + boxB.c * r.a21)

    aMiddleBMinor =
      abs (t.x * r.s33 - t.z * r.s13)
        <= (boxA.a * r.a33 + boxA.c * r.a13 + boxB.a * r.a22 + boxB.b * r.a21)

    aMinorBMajor =
      abs (t.y * r.s11 - t.x * r.s21)
        <= (boxA.a * r.a21 + boxA.b * r.a11 + boxB.b * r.a33 + boxB.c * r.a32)

    aMinorBMiddle =
      abs (t.y * r.s12 - t.x * r.s22)
        <= (boxA.a * r.a22 + boxA.b * r.a12 + boxB.a * r.a33 + boxB.c * r.a31)

    aMinorBMinor =
      abs (t.y * r.s13 - t.x * r.s23)
        <= (boxA.a * r.a23 + boxA.b * r.a13 + boxB.a * r.a32 + boxB.b * r.a31)
  in
    aMajor
      && aMiddle
      && aMinor
      && bMajor
      && bMiddle
      && bMinor
      && aMajorBMajor
      && aMajorBMiddle
      && aMajorBMinor
      && aMiddleBMajor
      && aMiddleBMiddle
      && aMiddleBMinor
      && aMinorBMajor
      && aMinorBMiddle
      && aMinorBMinor


type alias FaceFacts =
  { face : Face
  , area : Float
  , center : Vector
  }


getFacts : Face -> FaceFacts
getFacts face =
  let
    area =
      0.5 * (Vector.length (Face.cross face))

    center =
      Vector.add face.p face.q
        |> Vector.add face.r
        |> Vector.scale (1 / 3)
  in
    { face = face
    , area = area
    , center = center
    }


create : Int -> List Face -> Tree BoundingBox
create iter faces =
  let
    bb =
      boxCreate faces
  in
    if iter <= 0 then
      Leaf bb
    else
      case partitionFaces bb faces of
        Nothing ->
          Leaf bb

        Just ( left, right ) ->
          (Node bb)
            (create (iter - 1) left)
            (create (iter - 1) right)


partitionFaces : BoundingBox -> List Face -> Maybe ( List Face, List Face )
partitionFaces box faces =
  let
    transform =
      Transform.rotate box.orientation

    basis =
      [ ( box.a, Vector.vector 1 0 0 )
      , ( box.b, Vector.vector 0 1 0 )
      , ( box.c, Vector.vector 0 0 1 )
      ]

    orderedBasis =
      List.sortWith
        (\a b -> compare (fst b) (fst a))
        basis

    projections =
      List.map
        (snd >> transform >> projectAndSplit)
        orderedBasis
  in
    List.map getFacts faces
      |> tryApply projections


projectAndSplit : Vector -> List FaceFacts -> Maybe ( List Face, List Face )
projectAndSplit axis factsList =
  let
    equal a b =
      (a - b) ^ 2 < 1.0e-10

    project facts =
      ( Vector.dot facts.center axis, facts )

    init =
      { firstHalf = []
      , lastHalf = []
      , splitValue = 0 / 0
      , index = 0
      , done = False
      }

    addFace projectedFacts accumulator =
      if accumulator.done then
        updateFirstHalf projectedFacts accumulator
      else
        updateBothHalves projectedFacts accumulator
          |> checkIfDone

    updateFirstHalf ( _, facts ) acc =
      { acc | firstHalf = facts.face :: acc.firstHalf }

    updateBothHalves ( value, facts ) acc =
      if equal value acc.splitValue then
        { acc | firstHalf = facts.face :: acc.firstHalf }
      else
        { acc
          | lastHalf = acc.firstHalf ++ acc.lastHalf
          , firstHalf = [ facts.face ]
          , splitValue = value
        }

    checkIfDone acc =
      if (acc.index >= limit) && not (List.isEmpty acc.lastHalf) then
        { acc | done = True }
      else
        { acc | index = acc.index + 1 }

    limit =
      List.length factsList // 2

    returnValue accumulated =
      if List.isEmpty accumulated.lastHalf then
        Nothing
      else
        Just ( accumulated.firstHalf, accumulated.lastHalf )
  in
    List.map project factsList
      |> List.sortBy fst
      |> List.foldr addFace init
      |> returnValue


tryApply : List (a -> Maybe b) -> a -> Maybe b
tryApply maybes arg =
  let
    tryAgain newFunction lastValue =
      if lastValue == Nothing then
        newFunction arg
      else
        lastValue
  in
    List.foldl tryAgain Nothing maybes


boxCreate : List Face -> BoundingBox
boxCreate faces =
  let
    hull =
      faces
        |> List.concatMap Face.vertexList
        |> Hull.hull

    hullPoints =
      List.concatMap Face.vertexList hull
        |> Vector.unique

    facts =
      List.map getFacts hull

    center =
      facts
        |> List.foldl
            (\fact -> Vector.scale (fact.area) fact.center |> Vector.add)
            (Vector.vector 0 0 0)
        |> Vector.scale (1 / 2 / toFloat (List.length hull))

    recenter face =
      { p = Vector.sub face.p center
      , q = Vector.sub face.q center
      , r = Vector.sub face.r center
      }

    basis =
      facts
        |> List.map (\fact -> ( recenter fact.face, fact.area ))
        |> Covariance.fromMesh
        |> Covariance.eigenbasis

    orientation =
      Transform.basisToOrientation basis
        |> Vector.negate

    xProj =
      projectOnto basis.x hullPoints

    yProj =
      projectOnto basis.y hullPoints

    zProj =
      projectOnto basis.z hullPoints
  in
    { a = xProj.radius
    , b = yProj.radius
    , c = zProj.radius
    , position =
        Vector.vector xProj.center yProj.center zProj.center
          |> Transform.rotate orientation
    , orientation = orientation
    }


projectOnto : Vector -> List Vector -> { center : Float, radius : Float }
projectOnto axis cloud =
  let
    project point =
      Vector.dot point axis

    checkForExtreme x ( smallestSoFar, largestSoFar ) =
      ( min smallestSoFar x, max largestSoFar x )

    ( smallest, largest ) =
      List.foldl (project >> checkForExtreme) ( 1 / 0, -1 / 0 ) cloud
  in
    { radius = 0.5 * (largest - smallest)
    , center = 0.5 * (largest + smallest)
    }
