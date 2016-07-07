module Math.Hull exposing (hull)

import Dict exposing (Dict)
import Math.Vector as Vector exposing (Vector)
import Math.Face as Face exposing (Face)


type alias Pair a =
    ( a, a )


type alias PointSet =
    { face : Face
    , points : List Vector
    }


type alias State =
    { pointSets : Dict Int PointSet
    , stack : List Int
    , nextId : Int
    }


hull : List Vector -> List Face
hull points =
    let
        sets =
            allocate (simplex points) points

        start =
            { pointSets = Dict.empty
            , stack = []
            , nextId = 0
            }
    in
        addSets sets start
            |> consumeStack
            |> List.map .face


{-| Iterative part of hull computation
-}
consumeStack : State -> List PointSet
consumeStack state =
    case state.stack of
        [] ->
            Dict.values state.pointSets

        id :: stack ->
            { state | stack = stack }
                |> removeFace id
                |> consumeStack


{-| Pick the point in a pointset farthest from the face
and generate a new set of faces that meet at that point
-}
removeFace : Int -> State -> State
removeFace id state =
    case Dict.get id state.pointSets of
        Nothing ->
            state

        Just { face, points } ->
            let
                apex =
                    farthestFromBase face points

                ( aboveHorizon, belowHorizon ) =
                    Dict.partition (\_ ps -> isInFrontOf ps.face apex)
                        state.pointSets

                ( freePoints, oldVertexes ) =
                    Dict.foldl
                        (\_ pointSet ( points, vertexes ) ->
                            (,) (points ++ pointSet.points)
                                (vertexes ++ Face.vertexList pointSet.face)
                        )
                        ( [], [] )
                        aboveHorizon

                newFaces =
                    hull2d face apex oldVertexes
                        |> triangleFan apex

                newSets =
                    allocate newFaces freePoints
            in
                addSets newSets { state | pointSets = belowHorizon }


{-| Project a list of points onto the perspective plane
defined by a vantage point and a face,
compute the 2D convex hull (counterclockwise direction),
return the unprojected points
-}
hull2d : Face -> Vector -> List Vector -> List Vector
hull2d face vantage points =
    let
        projection =
            project (basis face vantage) vantage
    in
        Vector.unique points
            |> List.map projection
            |> grahamScan
            |> List.map .original


basis : Face -> Vector -> Basis
basis face vantage =
    let
        x =
            Vector.sub face.q face.p

        normal =
            Vector.cross x (Vector.sub face.r face.p)
    in
        { x = x
        , y = Vector.cross normal x
        , z = normal
        }


project : Basis -> Vector -> Vector -> Point2d
project basis vantage point =
    let
        offset =
            Vector.sub point vantage

        ortho =
            { x = Vector.dot basis.x offset
            , y = Vector.dot basis.y offset
            , z = Vector.dot basis.z offset
            }
    in
        { original = point
        , x = ortho.x / ortho.z
        , y = ortho.y / ortho.z
        }


type alias Basis =
    { x : Vector
    , y : Vector
    , z : Vector
    }


type alias Point2d =
    { original : Vector
    , x : Float
    , y : Float
    }


{-| Points must be unique
-}
grahamScan : List Point2d -> List Point2d
grahamScan points =
    case points of
        [] ->
            []

        head :: tail ->
            let
                cotangent p q =
                    (q.x - p.x) / (q.y - p.y)

                cross a b c =
                    (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)

                ( pivotPoint, remainder ) =
                    List.foldl
                        (\challenger ( leader, losers ) ->
                            if challenger.y < leader.y then
                                ( challenger, leader :: losers )
                            else
                                ( leader, challenger :: losers )
                        )
                        ( head, [] )
                        tail

                scan point hull =
                    case hull of
                        hinge :: base :: points ->
                            if cross point hinge base < 0 then
                                scan point (base :: points)
                            else
                                point :: hull

                        _ ->
                            point :: hull
            in
                List.sortBy (cotangent pivotPoint) remainder
                    |> List.foldl scan [ pivotPoint ]


triangleFan : Vector -> List Vector -> List Face
triangleFan apex rim =
    case rim of
        v :: vs ->
            let
                rimShift =
                    vs ++ [ v ]
            in
                List.map2 (Face.face apex) rim rimShift

        [] ->
            []


{-| Add point-sets to the state object. If a point-set is not
empty, push it to the stack.
-}
addSets : List PointSet -> State -> State
addSets sets start =
    let
        addSet set state =
            if List.isEmpty set.points then
                { state
                    | pointSets = Dict.insert state.nextId set state.pointSets
                    , nextId = state.nextId + 1
                }
            else
                { state
                    | pointSets = Dict.insert state.nextId set state.pointSets
                    , stack = state.nextId :: state.stack
                    , nextId = state.nextId + 1
                }
    in
        List.foldl addSet start sets


{-| Build point-sets for a list of faces. A point can be assigned
to a face that it is in front of. If a point is behind all of the
faces, it will be thrown out. Points are not assigned to more than
one face.
-}
allocate : List Face -> List Vector -> List PointSet
allocate faces points =
    let
        getSetFor face ( sets, remaining ) =
            let
                ( accepted, rejected ) =
                    List.partition (isInFrontOf face) remaining
            in
                ( { face = face, points = accepted } :: sets, rejected )
    in
        List.foldl getSetFor ( [], points ) faces
            |> fst


{-| Returns true if point is "in front" of a face.
From the POV of the point, the face vertexes go counterclockwise.
-}
isInFrontOf : Face -> Vector -> Bool
isInFrontOf face point =
    let
        edge a =
            Vector.sub a face.p

        tripleProduct =
            Vector.cross (edge face.q) (edge face.r)
                |> Vector.dot (edge point)
    in
        tripleProduct > 1.0e-10


{-| Return "distance" of a point to a surface. The surface
is defined by a point and a normal. The number returned may not
be the geometric distance, but is related to it. Used for sorting.
-}
distanceFromBase : Vector -> Vector -> Vector -> Float
distanceFromBase vertex normal point =
    Vector.sub point vertex
        |> Vector.dot normal
        |> abs


farthestFromBase : Face -> List Vector -> Vector
farthestFromBase face points =
    let
        normal =
            Vector.cross (Vector.sub face.q face.p)
                (Vector.sub face.r face.p)
    in
        points
            |> List.map (\point -> ( point, distanceFromBase face.p normal point ))
            |> List.foldl
                (\a b ->
                    if (snd b) < (snd a) then
                        a
                    else
                        b
                )
                ( bigPositive, 0 )
            |> fst


{-| Given a list of points, build a tetrahedron out of 4 extreme points.

WARNING: Does not handle coplanar/colinear point sets
-}
simplex : List Vector -> List Face
simplex points =
    if List.length points < 4 then
        degenerateSimplex points
    else
        let
            extremes =
                List.foldl extremePtFold initExtremes points

            extremeList =
                [ extremes.xMax
                , extremes.xMin
                , extremes.yMax
                , extremes.yMin
                , extremes.zMax
                , extremes.zMin
                ]

            baseLine =
                List.foldl farther ( extremes.xMax, extremes.xMin ) extremeList

            base =
                { p = fst baseLine
                , q = snd baseLine
                , r = farthestFromLine baseLine points
                }

            apex =
                farthestFromBase base points
        in
            if isInFrontOf base apex then
                [ Face.face base.p base.r base.q
                , Face.face base.q base.r apex
                , Face.face base.r base.p apex
                , Face.face apex base.p base.q
                ]
            else
                [ Face.face base.p base.q base.r
                , Face.face base.q apex base.r
                , Face.face base.r apex base.p
                , Face.face apex base.q base.p
                ]


degenerateSimplex : List Vector -> List Face
degenerateSimplex points =
    case points of
        p :: q :: r :: _ ->
            [ Face.face p q r ]

        _ ->
            []


{-| check if a given point should replace an
existing extreme point.
-}
extremePtFold : Vector -> Extremes -> Extremes
extremePtFold pt extremes =
    let
        isLess f b =
            if f pt < f b then
                pt
            else
                b

        isMore f b =
            if f b < f pt then
                pt
            else
                b
    in
        { xMax = isMore Vector.getX extremes.xMax
        , xMin = isLess Vector.getX extremes.xMin
        , yMax = isMore Vector.getY extremes.yMax
        , yMin = isLess Vector.getY extremes.yMin
        , zMax = isMore Vector.getZ extremes.zMax
        , zMin = isLess Vector.getZ extremes.zMin
        }


type alias Extremes =
    { xMax : Vector
    , xMin : Vector
    , yMax : Vector
    , yMin : Vector
    , zMax : Vector
    , zMin : Vector
    }


initExtremes : Extremes
initExtremes =
    { xMax = bigNegative
    , yMax = bigNegative
    , zMax = bigNegative
    , xMin = bigPositive
    , yMin = bigPositive
    , zMin = bigPositive
    }


{-| return the longest segment defined by 3 points
-}
farther : Vector -> Pair Vector -> Pair Vector
farther c ( a, b ) =
    let
        ab =
            Vector.distanceSquared a b

        ac =
            Vector.distanceSquared a c

        bc =
            Vector.distanceSquared b c

        hypoteneuse =
            List.maximum [ ab, ac, bc ]
    in
        if hypoteneuse == Just ab then
            ( a, b )
        else if hypoteneuse == Just ac then
            ( a, c )
        else
            ( b, c )


{-| Return distance-squared of a point to a line.
The line is defined by a vertex (on the line)
 and a unit vector (same direction as the line)
-}
distanceFromLine : Vector -> Vector -> Vector -> Float
distanceFromLine vertex baseUnit point =
    let
        hypoteneuse =
            Vector.sub point vertex

        baseLeg =
            Vector.dot hypoteneuse baseUnit
    in
        Vector.lengthSquared hypoteneuse - baseLeg ^ 2


{-| Given a line and a list of points, return the
point furthest from the line. The line is defined by two
points.
-}
farthestFromLine : Pair Vector -> List Vector -> Vector
farthestFromLine ( a, b ) cs =
    let
        baseUnit =
            Vector.direction b a
    in
        cs
            |> List.map (\c -> ( c, distanceFromLine a baseUnit c ))
            |> List.foldl
                (\c d ->
                    if (snd d) < (snd c) then
                        c
                    else
                        d
                )
                ( bigPositive, 0 )
            |> fst


bigPositive : Vector
bigPositive =
    Vector.vector (1 / 0) (1 / 0) (1 / 0)


bigNegative : Vector
bigNegative =
    Vector.vector (-1 / 0) (-1 / 0) (-1 / 0)
