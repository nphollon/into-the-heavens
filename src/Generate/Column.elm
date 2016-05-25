module Generate.Column (mesh, hull, box) where

import Generate.Json exposing (Vertex)
import Generate.FlatFace as FlatFace
import WebGL exposing (Drawable)
import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


mesh : Drawable Vertex
mesh =
  FlatFace.triangles cornerPositions cornerIndexes


hull : Drawable Vertex
hull =
  FlatFace.convexHull cornerPositions


box : Int -> Drawable Vertex
box level =
  FlatFace.boundingBoxTree level cornerPositions cornerIndexes


cornerPositions : Array Vector
cornerPositions = 
  Array.fromList
    [ Vector.vector 0 0 0
    , Vector.vector 9.550158 41.781990 0.109024
    , Vector.vector 9.282208 42.781986 0.109024
    , Vector.vector 8.550159 43.514038 0.109024
    , Vector.vector 7.550158 43.781986 0.109024
    , Vector.vector 6.550158 43.514038 0.109024
    , Vector.vector 5.818107 42.781986 0.109024
    , Vector.vector 5.550158 41.781990 0.109024
    , Vector.vector 5.818107 40.781990 0.109024
    , Vector.vector 6.550158 40.049938 0.109024
    , Vector.vector 7.550158 39.781986 0.109024
    , Vector.vector 8.550159 40.049938 0.109024
    , Vector.vector 9.282208 40.781990 0.109024
    , Vector.vector 9.468884 41.781990 -1.130974
    , Vector.vector 9.203228 42.781986 -1.096000
    , Vector.vector 8.477440 43.514038 -1.000448
    , Vector.vector 7.485995 43.781986 -0.869922
    , Vector.vector 6.494549 43.514038 -0.739396
    , Vector.vector 5.768762 42.781986 -0.643844
    , Vector.vector 5.503105 41.781990 -0.608870
    , Vector.vector 5.768762 40.781990 -0.643844
    , Vector.vector 6.494549 40.049938 -0.739396
    , Vector.vector 7.485995 39.781986 -0.869922
    , Vector.vector 8.477440 40.049938 -1.000448
    , Vector.vector 9.203228 40.781990 -1.096000
    , Vector.vector 9.226454 41.781990 -2.349756
    , Vector.vector 8.967634 42.781986 -2.280406
    , Vector.vector 8.260528 43.514038 -2.090937
    , Vector.vector 7.294602 43.781986 -1.832118
    , Vector.vector 6.328676 43.514038 -1.573299
    , Vector.vector 5.621569 42.781986 -1.383831
    , Vector.vector 5.362750 41.781990 -1.314480
    , Vector.vector 5.621569 40.781990 -1.383831
    , Vector.vector 6.328676 40.049938 -1.573299
    , Vector.vector 7.294602 39.781986 -1.832118
    , Vector.vector 8.260528 40.049938 -2.090937
    , Vector.vector 8.967634 40.781990 -2.280406
    , Vector.vector 8.827014 41.781990 -3.526467
    , Vector.vector 8.579461 42.781986 -3.423928
    , Vector.vector 7.903134 43.514038 -3.143784
    , Vector.vector 6.979255 43.781986 -2.761101
    , Vector.vector 6.055375 43.514038 -2.378417
    , Vector.vector 5.379048 42.781986 -2.098274
    , Vector.vector 5.131496 41.781990 -1.995734
    , Vector.vector 5.379048 40.781990 -2.098274
    , Vector.vector 6.055375 40.049938 -2.378417
    , Vector.vector 6.979255 39.781986 -2.761101
    , Vector.vector 7.903134 40.049938 -3.143784
    , Vector.vector 8.579461 40.781990 -3.423928
    , Vector.vector 8.277399 41.781990 -4.640976
    , Vector.vector 8.045348 42.781986 -4.507002
    , Vector.vector 7.411373 43.514038 -4.140976
    , Vector.vector 6.545348 43.781986 -3.640976
    , Vector.vector 5.679322 43.514038 -3.140976
    , Vector.vector 5.045348 42.781986 -2.774951
    , Vector.vector 4.813297 41.781990 -2.640976
    , Vector.vector 5.045348 40.781990 -2.774951
    , Vector.vector 5.679322 40.049938 -3.140976
    , Vector.vector 6.545348 39.781986 -3.640976
    , Vector.vector 7.411373 40.049938 -4.140976
    , Vector.vector 8.045348 40.781990 -4.507002
    , Vector.vector 7.587016 41.781990 -5.674209
    , Vector.vector 7.374437 42.781986 -5.511092
    , Vector.vector 6.793662 43.514038 -5.065447
    , Vector.vector 6.000309 43.781986 -4.456686
    , Vector.vector 5.206955 43.514038 -3.847924
    , Vector.vector 4.626181 42.781986 -3.402281
    , Vector.vector 4.413602 41.781990 -3.239163
    , Vector.vector 4.626181 40.781990 -3.402281
    , Vector.vector 5.206955 40.049938 -3.847924
    , Vector.vector 6.000309 39.781986 -4.456686
    , Vector.vector 6.793662 40.049938 -5.065447
    , Vector.vector 7.374437 40.781990 -5.511092
    , Vector.vector 6.767672 41.781990 -6.608491
    , Vector.vector 6.578203 42.781986 -6.419022
    , Vector.vector 6.060565 43.514038 -5.901383
    , Vector.vector 5.353458 43.781986 -5.194277
    , Vector.vector 4.646352 43.514038 -4.487170
    , Vector.vector 4.128714 42.781986 -3.969532
    , Vector.vector 3.939245 41.781990 -3.780063
    , Vector.vector 4.128714 40.781990 -3.969532
    , Vector.vector 4.646352 40.049938 -4.487170
    , Vector.vector 5.353458 39.781986 -5.194277
    , Vector.vector 6.060565 40.049938 -5.901383
    , Vector.vector 6.578203 40.781990 -6.419022
    , Vector.vector 5.833393 41.781990 -7.427831
    , Vector.vector 5.670276 42.781986 -7.215253
    , Vector.vector 5.224631 43.514038 -6.634479
    , Vector.vector 4.615870 43.781986 -5.841125
    , Vector.vector 4.007108 43.514038 -5.047772
    , Vector.vector 3.561463 42.781986 -4.466997
    , Vector.vector 3.398346 41.781990 -4.254418
    , Vector.vector 3.561463 40.781990 -4.466997
    , Vector.vector 4.007108 40.049938 -5.047772
    , Vector.vector 4.615870 39.781986 -5.841125
    , Vector.vector 5.224631 40.049938 -6.634479
    , Vector.vector 5.670276 40.781990 -7.215253
    , Vector.vector 4.800158 41.781990 -8.118217
    , Vector.vector 4.666183 42.781986 -7.886167
    , Vector.vector 4.300158 43.514038 -7.252192
    , Vector.vector 3.800157 43.781986 -6.386166
    , Vector.vector 3.300158 43.514038 -5.520140
    , Vector.vector 2.934132 42.781986 -4.886166
    , Vector.vector 2.800158 41.781990 -4.654116
    , Vector.vector 2.934132 40.781990 -4.886166
    , Vector.vector 3.300158 40.049938 -5.520140
    , Vector.vector 3.800157 39.781986 -6.386166
    , Vector.vector 4.300158 40.049938 -7.252192
    , Vector.vector 4.666183 40.781990 -7.886167
    , Vector.vector 3.685652 41.781990 -8.667830
    , Vector.vector 3.583112 42.781986 -8.420278
    , Vector.vector 3.302969 43.514038 -7.743951
    , Vector.vector 2.920285 43.781986 -6.820072
    , Vector.vector 2.537601 43.514038 -5.896192
    , Vector.vector 2.257457 42.781986 -5.219865
    , Vector.vector 2.154918 41.781990 -4.972312
    , Vector.vector 2.257457 40.781990 -5.219865
    , Vector.vector 2.537601 40.049938 -5.896192
    , Vector.vector 2.920285 39.781986 -6.820072
    , Vector.vector 3.302969 40.049938 -7.743951
    , Vector.vector 3.583112 40.781990 -8.420278
    , Vector.vector 2.508939 41.781990 -9.067270
    , Vector.vector 2.439588 42.781986 -8.808452
    , Vector.vector 2.250119 43.514038 -8.101345
    , Vector.vector 1.991300 43.781986 -7.135419
    , Vector.vector 1.732482 43.514038 -6.169493
    , Vector.vector 1.543013 42.781986 -5.462387
    , Vector.vector 1.473662 41.781990 -5.203568
    , Vector.vector 1.543013 40.781990 -5.462387
    , Vector.vector 1.732482 40.049938 -6.169493
    , Vector.vector 1.991300 39.781986 -7.135419
    , Vector.vector 2.250119 40.049938 -8.101345
    , Vector.vector 2.439588 40.781990 -8.808452
    , Vector.vector 1.290156 41.781990 -9.309702
    , Vector.vector 1.255181 42.781986 -9.044045
    , Vector.vector 1.159629 43.514038 -8.318257
    , Vector.vector 1.029103 43.781986 -7.326813
    , Vector.vector 0.898577 43.514038 -6.335367
    , Vector.vector 0.803025 42.781986 -5.609579
    , Vector.vector 0.768051 41.781990 -5.343923
    , Vector.vector 0.803025 40.781990 -5.609579
    , Vector.vector 0.898577 40.049938 -6.335367
    , Vector.vector 1.029103 39.781986 -7.326813
    , Vector.vector 1.159629 40.049938 -8.318257
    , Vector.vector 1.255181 40.781990 -9.044045
    , Vector.vector 0.050159 41.781990 -9.390976
    , Vector.vector 0.050159 42.781986 -9.123028
    , Vector.vector 0.050158 43.514038 -8.390976
    , Vector.vector 0.050159 43.781986 -7.390976
    , Vector.vector 0.050159 43.514038 -6.390976
    , Vector.vector 0.050158 42.781986 -5.658926
    , Vector.vector 0.050158 41.781990 -5.390977
    , Vector.vector 0.050158 40.781990 -5.658926
    , Vector.vector 0.050159 40.049938 -6.390976
    , Vector.vector 0.050159 39.781986 -7.390976
    , Vector.vector 0.050158 40.049938 -8.390976
    , Vector.vector 0.050159 40.781990 -9.123028
    , Vector.vector -1.189843 41.781990 -9.309702
    , Vector.vector -1.154868 42.781986 -9.044045
    , Vector.vector -1.059317 43.514038 -8.318257
    , Vector.vector -0.928790 43.781986 -7.326812
    , Vector.vector -0.798264 43.514038 -6.335367
    , Vector.vector -0.702712 42.781986 -5.609579
    , Vector.vector -0.667737 41.781990 -5.343923
    , Vector.vector -0.702712 40.781990 -5.609579
    , Vector.vector -0.798264 40.049938 -6.335367
    , Vector.vector -0.928790 39.781986 -7.326812
    , Vector.vector -1.059317 40.049938 -8.318257
    , Vector.vector -1.154868 40.781990 -9.044045
    , Vector.vector -2.408622 41.781990 -9.067272
    , Vector.vector -2.339272 42.781986 -8.808453
    , Vector.vector -2.149803 43.514038 -8.101347
    , Vector.vector -1.890984 43.781986 -7.135420
    , Vector.vector -1.632166 43.514038 -6.169495
    , Vector.vector -1.442697 42.781986 -5.462388
    , Vector.vector -1.373346 41.781990 -5.203569
    , Vector.vector -1.442697 40.781990 -5.462388
    , Vector.vector -1.632166 40.049938 -6.169495
    , Vector.vector -1.890984 39.781986 -7.135420
    , Vector.vector -2.149803 40.049938 -8.101347
    , Vector.vector -2.339272 40.781990 -8.808453
    , Vector.vector -3.585336 41.781990 -8.667831
    , Vector.vector -3.482796 42.781986 -8.420279
    , Vector.vector -3.202652 43.514038 -7.743951
    , Vector.vector -2.819969 43.781986 -6.820072
    , Vector.vector -2.437285 43.514038 -5.896193
    , Vector.vector -2.157142 42.781986 -5.219866
    , Vector.vector -2.054602 41.781990 -4.972313
    , Vector.vector -2.157142 40.781990 -5.219866
    , Vector.vector -2.437285 40.049938 -5.896193
    , Vector.vector -2.819969 39.781986 -6.820072
    , Vector.vector -3.202652 40.049938 -7.743951
    , Vector.vector -3.482796 40.781990 -8.420279
    , Vector.vector -4.699841 41.781990 -8.118218
    , Vector.vector -4.565866 42.781986 -7.886168
    , Vector.vector -4.199841 43.514038 -7.252192
    , Vector.vector -3.699841 43.781986 -6.386167
    , Vector.vector -3.199841 43.514038 -5.520141
    , Vector.vector -2.833817 42.781986 -4.886167
    , Vector.vector -2.699842 41.781990 -4.654116
    , Vector.vector -2.833817 40.781990 -4.886167
    , Vector.vector -3.199841 40.049938 -5.520141
    , Vector.vector -3.699841 39.781986 -6.386167
    , Vector.vector -4.199841 40.049938 -7.252192
    , Vector.vector -4.565866 40.781990 -7.886168
    , Vector.vector -5.733076 41.781990 -7.427832
    , Vector.vector -5.569959 42.781986 -7.215254
    , Vector.vector -5.124314 43.514038 -6.634480
    , Vector.vector -4.515553 43.781986 -5.841125
    , Vector.vector -3.906792 43.514038 -5.047772
    , Vector.vector -3.461147 42.781986 -4.466997
    , Vector.vector -3.298030 41.781990 -4.254419
    , Vector.vector -3.461147 40.781990 -4.466997
    , Vector.vector -3.906792 40.049938 -5.047772
    , Vector.vector -4.515553 39.781986 -5.841125
    , Vector.vector -5.124314 40.049938 -6.634480
    , Vector.vector -5.569959 40.781990 -7.215254
    , Vector.vector -6.667357 41.781990 -6.608489
    , Vector.vector -6.477890 42.781986 -6.419020
    , Vector.vector -5.960251 43.514038 -5.901382
    , Vector.vector -5.253144 43.781986 -5.194275
    , Vector.vector -4.546037 43.514038 -4.487168
    , Vector.vector -4.028399 42.781986 -3.969531
    , Vector.vector -3.838930 41.781990 -3.780062
    , Vector.vector -4.028399 40.781990 -3.969531
    , Vector.vector -4.546037 40.049938 -4.487168
    , Vector.vector -5.253144 39.781986 -5.194275
    , Vector.vector -5.960251 40.049938 -5.901382
    , Vector.vector -6.477890 40.781990 -6.419020
    , Vector.vector -7.486698 41.781990 -5.674210
    , Vector.vector -7.274120 42.781986 -5.511092
    , Vector.vector -6.693346 43.514038 -5.065448
    , Vector.vector -5.899992 43.781986 -4.456686
    , Vector.vector -5.106638 43.514038 -3.847925
    , Vector.vector -4.525864 42.781986 -3.402281
    , Vector.vector -4.313285 41.781990 -3.239163
    , Vector.vector -4.525864 40.781990 -3.402281
    , Vector.vector -5.106638 40.049938 -3.847925
    , Vector.vector -5.899992 39.781986 -4.456686
    , Vector.vector -6.693346 40.049938 -5.065448
    , Vector.vector -7.274120 40.781990 -5.511092
    , Vector.vector -8.177082 41.781990 -4.640978
    , Vector.vector -7.945032 42.781986 -4.507003
    , Vector.vector -7.311058 43.514038 -4.140978
    , Vector.vector -6.445032 43.781986 -3.640978
    , Vector.vector -5.579007 43.514038 -3.140977
    , Vector.vector -4.945032 42.781986 -2.774952
    , Vector.vector -4.712981 41.781990 -2.640977
    , Vector.vector -4.945032 40.781990 -2.774952
    , Vector.vector -5.579007 40.049938 -3.140977
    , Vector.vector -6.445032 39.781986 -3.640978
    , Vector.vector -7.311058 40.049938 -4.140978
    , Vector.vector -7.945032 40.781990 -4.507003
    , Vector.vector -8.726697 41.781990 -3.526469
    , Vector.vector -8.479144 42.781986 -3.423929
    , Vector.vector -7.802818 43.514038 -3.143785
    , Vector.vector -6.878938 43.781986 -2.761102
    , Vector.vector -5.955059 43.514038 -2.378418
    , Vector.vector -5.278732 42.781986 -2.098274
    , Vector.vector -5.031178 41.781990 -1.995735
    , Vector.vector -5.278732 40.781990 -2.098274
    , Vector.vector -5.955059 40.049938 -2.378418
    , Vector.vector -6.878938 39.781986 -2.761102
    , Vector.vector -7.802818 40.049938 -3.143785
    , Vector.vector -8.479144 40.781990 -3.423929
    , Vector.vector -9.126138 41.781990 -2.349756
    , Vector.vector -8.867319 42.781986 -2.280405
    , Vector.vector -8.160213 43.514038 -2.090937
    , Vector.vector -7.194286 43.781986 -1.832118
    , Vector.vector -6.228361 43.514038 -1.573299
    , Vector.vector -5.521254 42.781986 -1.383830
    , Vector.vector -5.262434 41.781990 -1.314480
    , Vector.vector -5.521254 40.781990 -1.383830
    , Vector.vector -6.228361 40.049938 -1.573299
    , Vector.vector -7.194286 39.781986 -1.832118
    , Vector.vector -8.160213 40.049938 -2.090937
    , Vector.vector -8.867319 40.781990 -2.280405
    , Vector.vector -9.368568 41.781990 -1.130976
    , Vector.vector -9.102912 42.781986 -1.096001
    , Vector.vector -8.377124 43.514038 -1.000449
    , Vector.vector -7.385679 43.781986 -0.869923
    , Vector.vector -6.394233 43.514038 -0.739397
    , Vector.vector -5.668446 42.781986 -0.643845
    , Vector.vector -5.402789 41.781990 -0.608870
    , Vector.vector -5.668446 40.781990 -0.643845
    , Vector.vector -6.394233 40.049938 -0.739397
    , Vector.vector -7.385679 39.781986 -0.869923
    , Vector.vector -8.377124 40.049938 -1.000449
    , Vector.vector -9.102912 40.781990 -1.096001
    , Vector.vector -9.449842 41.781990 0.109024
    , Vector.vector -9.181892 42.781986 0.109024
    , Vector.vector -8.449842 43.514038 0.109024
    , Vector.vector -7.449842 43.781986 0.109024
    , Vector.vector -6.449842 43.514038 0.109024
    , Vector.vector -5.717792 42.781986 0.109024
    , Vector.vector -5.449842 41.781990 0.109024
    , Vector.vector -5.717792 40.781990 0.109024
    , Vector.vector -6.449842 40.049938 0.109024
    , Vector.vector -7.449842 39.781986 0.109024
    , Vector.vector -8.449842 40.049938 0.109024
    , Vector.vector -9.181892 40.781990 0.109024
    , Vector.vector -9.368568 41.781990 1.349025
    , Vector.vector -9.102912 42.781986 1.314050
    , Vector.vector -8.377124 43.514038 1.218498
    , Vector.vector -7.385679 43.781986 1.087972
    , Vector.vector -6.394233 43.514038 0.957445
    , Vector.vector -5.668446 42.781986 0.861894
    , Vector.vector -5.402789 41.781990 0.826919
    , Vector.vector -5.668446 40.781990 0.861894
    , Vector.vector -6.394233 40.049938 0.957445
    , Vector.vector -7.385679 39.781986 1.087972
    , Vector.vector -8.377124 40.049938 1.218498
    , Vector.vector -9.102912 40.781990 1.314050
    , Vector.vector -9.126138 41.781990 2.567804
    , Vector.vector -8.867319 42.781986 2.498454
    , Vector.vector -8.160213 43.514038 2.308985
    , Vector.vector -7.194286 43.781986 2.050166
    , Vector.vector -6.228361 43.514038 1.791347
    , Vector.vector -5.521254 42.781986 1.601879
    , Vector.vector -5.262434 41.781990 1.532528
    , Vector.vector -5.521254 40.781990 1.601879
    , Vector.vector -6.228361 40.049938 1.791347
    , Vector.vector -7.194286 39.781986 2.050166
    , Vector.vector -8.160213 40.049938 2.308985
    , Vector.vector -8.867319 40.781990 2.498454
    , Vector.vector -8.726699 41.781990 3.744514
    , Vector.vector -8.479146 42.781986 3.641974
    , Vector.vector -7.802819 43.514038 3.361830
    , Vector.vector -6.878939 43.781986 2.979147
    , Vector.vector -5.955060 43.514038 2.596464
    , Vector.vector -5.278733 42.781986 2.316321
    , Vector.vector -5.031180 41.781990 2.213781
    , Vector.vector -5.278733 40.781990 2.316321
    , Vector.vector -5.955060 40.049938 2.596464
    , Vector.vector -6.878939 39.781986 2.979147
    , Vector.vector -7.802819 40.049938 3.361830
    , Vector.vector -8.479146 40.781990 3.641974
    , Vector.vector -8.177084 41.781990 4.859023
    , Vector.vector -7.945034 42.781986 4.725048
    , Vector.vector -7.311059 43.514038 4.359023
    , Vector.vector -6.445034 43.781986 3.859023
    , Vector.vector -5.579008 43.514038 3.359023
    , Vector.vector -4.945034 42.781986 2.992998
    , Vector.vector -4.712983 41.781990 2.859024
    , Vector.vector -4.945034 40.781990 2.992998
    , Vector.vector -5.579008 40.049938 3.359023
    , Vector.vector -6.445034 39.781986 3.859023
    , Vector.vector -7.311059 40.049938 4.359023
    , Vector.vector -7.945034 40.781990 4.725048
    , Vector.vector -7.486698 41.781990 5.892258
    , Vector.vector -7.274120 42.781986 5.729141
    , Vector.vector -6.693346 43.514038 5.283496
    , Vector.vector -5.899992 43.781986 4.674735
    , Vector.vector -5.106638 43.514038 4.065973
    , Vector.vector -4.525864 42.781986 3.620329
    , Vector.vector -4.313285 41.781990 3.457212
    , Vector.vector -4.525864 40.781990 3.620329
    , Vector.vector -5.106638 40.049938 4.065973
    , Vector.vector -5.899992 39.781986 4.674735
    , Vector.vector -6.693346 40.049938 5.283496
    , Vector.vector -7.274120 40.781990 5.729141
    , Vector.vector -6.667357 41.781990 6.826537
    , Vector.vector -6.477890 42.781986 6.637068
    , Vector.vector -5.960251 43.514038 6.119430
    , Vector.vector -5.253144 43.781986 5.412323
    , Vector.vector -4.546037 43.514038 4.705217
    , Vector.vector -4.028399 42.781986 4.187580
    , Vector.vector -3.838930 41.781990 3.998111
    , Vector.vector -4.028399 40.781990 4.187580
    , Vector.vector -4.546037 40.049938 4.705217
    , Vector.vector -5.253144 39.781986 5.412323
    , Vector.vector -5.960251 40.049938 6.119430
    , Vector.vector -6.477890 40.781990 6.637068
    , Vector.vector -5.733080 41.781990 7.645878
    , Vector.vector -5.569963 42.781986 7.433300
    , Vector.vector -5.124319 43.514038 6.852526
    , Vector.vector -4.515555 43.781986 6.059172
    , Vector.vector -3.906794 43.514038 5.265819
    , Vector.vector -3.461150 42.781986 4.685045
    , Vector.vector -3.298032 41.781990 4.472466
    , Vector.vector -3.461150 40.781990 4.685045
    , Vector.vector -3.906794 40.049938 5.265819
    , Vector.vector -4.515555 39.781986 6.059172
    , Vector.vector -5.124319 40.049938 6.852526
    , Vector.vector -5.569963 40.781990 7.433300
    , Vector.vector -4.699841 41.781990 8.336267
    , Vector.vector -4.565866 42.781986 8.104216
    , Vector.vector -4.199841 43.514038 7.470241
    , Vector.vector -3.699841 43.781986 6.604215
    , Vector.vector -3.199841 43.514038 5.738189
    , Vector.vector -2.833817 42.781986 5.104215
    , Vector.vector -2.699842 41.781990 4.872165
    , Vector.vector -2.833817 40.781990 5.104215
    , Vector.vector -3.199841 40.049938 5.738189
    , Vector.vector -3.699841 39.781986 6.604215
    , Vector.vector -4.199841 40.049938 7.470241
    , Vector.vector -4.565866 40.781990 8.104216
    , Vector.vector -3.585336 41.781990 8.885880
    , Vector.vector -3.482796 42.781986 8.638327
    , Vector.vector -3.202652 43.514038 7.962000
    , Vector.vector -2.819969 43.781986 7.038121
    , Vector.vector -2.437285 43.514038 6.114241
    , Vector.vector -2.157142 42.781986 5.437914
    , Vector.vector -2.054602 41.781990 5.190362
    , Vector.vector -2.157142 40.781990 5.437914
    , Vector.vector -2.437285 40.049938 6.114241
    , Vector.vector -2.819969 39.781986 7.038121
    , Vector.vector -3.202652 40.049938 7.962000
    , Vector.vector -3.482796 40.781990 8.638327
    , Vector.vector -2.408626 41.781990 9.285318
    , Vector.vector -2.339275 42.781986 9.026500
    , Vector.vector -2.149807 43.514038 8.319393
    , Vector.vector -1.890987 43.781986 7.353467
    , Vector.vector -1.632168 43.514038 6.387541
    , Vector.vector -1.442699 42.781986 5.680435
    , Vector.vector -1.373349 41.781990 5.421616
    , Vector.vector -1.442699 40.781990 5.680435
    , Vector.vector -1.632168 40.049938 6.387541
    , Vector.vector -1.890987 39.781986 7.353467
    , Vector.vector -2.149807 40.049938 8.319393
    , Vector.vector -2.339275 40.781990 9.026500
    , Vector.vector -1.189847 41.781990 9.527750
    , Vector.vector -1.154872 42.781986 9.262093
    , Vector.vector -1.059320 43.514038 8.536305
    , Vector.vector -0.928793 43.781986 7.544860
    , Vector.vector -0.798266 43.514038 6.553415
    , Vector.vector -0.702714 42.781986 5.827627
    , Vector.vector -0.667740 41.781990 5.561971
    , Vector.vector -0.702714 40.781990 5.827627
    , Vector.vector -0.798266 40.049938 6.553415
    , Vector.vector -0.928793 39.781986 7.544860
    , Vector.vector -1.059320 40.049938 8.536305
    , Vector.vector -1.154872 40.781990 9.262093
    , Vector.vector 0.050159 41.781990 9.609024
    , Vector.vector 0.050159 42.781986 9.341076
    , Vector.vector 0.050158 43.514038 8.609026
    , Vector.vector 0.050159 43.781986 7.609024
    , Vector.vector 0.050159 43.514038 6.609024
    , Vector.vector 0.050158 42.781986 5.876974
    , Vector.vector 0.050158 41.781990 5.609025
    , Vector.vector 0.050158 40.781990 5.876974
    , Vector.vector 0.050159 40.049938 6.609024
    , Vector.vector 0.050159 39.781986 7.609024
    , Vector.vector 0.050158 40.049938 8.609026
    , Vector.vector 0.050159 40.781990 9.341076
    , Vector.vector 1.290156 41.781990 9.527750
    , Vector.vector 1.255181 42.781986 9.262094
    , Vector.vector 1.159629 43.514038 8.536305
    , Vector.vector 1.029103 43.781986 7.544861
    , Vector.vector 0.898577 43.514038 6.553416
    , Vector.vector 0.803025 42.781986 5.827628
    , Vector.vector 0.768051 41.781990 5.561972
    , Vector.vector 0.803025 40.781990 5.827628
    , Vector.vector 0.898577 40.049938 6.553416
    , Vector.vector 1.029103 39.781986 7.544861
    , Vector.vector 1.159629 40.049938 8.536305
    , Vector.vector 1.255181 40.781990 9.262094
    , Vector.vector 2.508934 41.781990 9.285321
    , Vector.vector 2.439584 42.781986 9.026501
    , Vector.vector 2.250116 43.514038 8.319395
    , Vector.vector 1.991297 43.781986 7.353469
    , Vector.vector 1.732478 43.514038 6.387543
    , Vector.vector 1.543010 42.781986 5.680436
    , Vector.vector 1.473660 41.781990 5.421617
    , Vector.vector 1.543010 40.781990 5.680436
    , Vector.vector 1.732478 40.049938 6.387543
    , Vector.vector 1.991297 39.781986 7.353469
    , Vector.vector 2.250116 40.049938 8.319395
    , Vector.vector 2.439584 40.781990 9.026501
    , Vector.vector 3.685652 41.781990 8.885879
    , Vector.vector 3.583112 42.781986 8.638326
    , Vector.vector 3.302969 43.514038 7.961999
    , Vector.vector 2.920285 43.781986 7.038120
    , Vector.vector 2.537601 43.514038 6.114241
    , Vector.vector 2.257457 42.781986 5.437914
    , Vector.vector 2.154918 41.781990 5.190361
    , Vector.vector 2.257457 40.781990 5.437914
    , Vector.vector 2.537601 40.049938 6.114241
    , Vector.vector 2.920285 39.781986 7.038120
    , Vector.vector 3.302969 40.049938 7.961999
    , Vector.vector 3.583112 40.781990 8.638326
    , Vector.vector 4.800158 41.781990 8.336266
    , Vector.vector 4.666183 42.781986 8.104215
    , Vector.vector 4.300158 43.514038 7.470241
    , Vector.vector 3.800157 43.781986 6.604215
    , Vector.vector 3.300158 43.514038 5.738189
    , Vector.vector 2.934132 42.781986 5.104215
    , Vector.vector 2.800158 41.781990 4.872164
    , Vector.vector 2.934132 40.781990 5.104215
    , Vector.vector 3.300158 40.049938 5.738189
    , Vector.vector 3.800157 39.781986 6.604215
    , Vector.vector 4.300158 40.049938 7.470241
    , Vector.vector 4.666183 40.781990 8.104215
    , Vector.vector 5.833390 41.781990 7.645883
    , Vector.vector 5.670273 42.781986 7.433305
    , Vector.vector 5.224628 43.514038 6.852529
    , Vector.vector 4.615868 43.781986 6.059175
    , Vector.vector 4.007106 43.514038 5.265822
    , Vector.vector 3.561462 42.781986 4.685047
    , Vector.vector 3.398345 41.781990 4.472469
    , Vector.vector 3.561462 40.781990 4.685047
    , Vector.vector 4.007106 40.049938 5.265822
    , Vector.vector 4.615868 39.781986 6.059175
    , Vector.vector 5.224628 40.049938 6.852529
    , Vector.vector 5.670273 40.781990 7.433305
    , Vector.vector 6.767669 41.781990 6.826543
    , Vector.vector 6.578200 42.781986 6.637074
    , Vector.vector 6.060563 43.514038 6.119436
    , Vector.vector 5.353456 43.781986 5.412328
    , Vector.vector 4.646349 43.514038 4.705221
    , Vector.vector 4.128712 42.781986 4.187582
    , Vector.vector 3.939243 41.781990 3.998114
    , Vector.vector 4.128712 40.781990 4.187582
    , Vector.vector 4.646349 40.049938 4.705221
    , Vector.vector 5.353456 39.781986 5.412328
    , Vector.vector 6.060563 40.049938 6.119436
    , Vector.vector 6.578200 40.781990 6.637074
    , Vector.vector 7.587016 41.781990 5.892258
    , Vector.vector 7.374437 42.781986 5.729140
    , Vector.vector 6.793662 43.514038 5.283496
    , Vector.vector 6.000309 43.781986 4.674735
    , Vector.vector 5.206955 43.514038 4.065973
    , Vector.vector 4.626181 42.781986 3.620329
    , Vector.vector 4.413602 41.781990 3.457212
    , Vector.vector 4.626181 40.781990 3.620329
    , Vector.vector 5.206955 40.049938 4.065973
    , Vector.vector 6.000309 39.781986 4.674735
    , Vector.vector 6.793662 40.049938 5.283496
    , Vector.vector 7.374437 40.781990 5.729140
    , Vector.vector 8.277399 41.781990 4.859025
    , Vector.vector 8.045348 42.781986 4.725050
    , Vector.vector 7.411373 43.514038 4.359025
    , Vector.vector 6.545348 43.781986 3.859025
    , Vector.vector 5.679322 43.514038 3.359025
    , Vector.vector 5.045348 42.781986 2.993000
    , Vector.vector 4.813297 41.781990 2.859025
    , Vector.vector 5.045348 40.781990 2.993000
    , Vector.vector 5.679322 40.049938 3.359025
    , Vector.vector 6.545348 39.781986 3.859025
    , Vector.vector 7.411373 40.049938 4.359025
    , Vector.vector 8.045348 40.781990 4.725050
    , Vector.vector 8.827012 41.781990 3.744521
    , Vector.vector 8.579459 42.781986 3.641981
    , Vector.vector 7.903133 43.514038 3.361837
    , Vector.vector 6.979253 43.781986 2.979153
    , Vector.vector 6.055374 43.514038 2.596469
    , Vector.vector 5.379047 42.781986 2.316325
    , Vector.vector 5.131495 41.781990 2.213785
    , Vector.vector 5.379047 40.781990 2.316325
    , Vector.vector 6.055374 40.049938 2.596469
    , Vector.vector 6.979253 39.781986 2.979153
    , Vector.vector 7.903133 40.049938 3.361837
    , Vector.vector 8.579459 40.781990 3.641981
    , Vector.vector 9.226454 41.781990 2.567803
    , Vector.vector 8.967634 42.781986 2.498452
    , Vector.vector 8.260529 43.514038 2.308984
    , Vector.vector 7.294602 43.781986 2.050165
    , Vector.vector 6.328676 43.514038 1.791346
    , Vector.vector 5.621569 42.781986 1.601878
    , Vector.vector 5.362750 41.781990 1.532528
    , Vector.vector 5.621569 40.781990 1.601878
    , Vector.vector 6.328676 40.049938 1.791346
    , Vector.vector 7.294602 39.781986 2.050165
    , Vector.vector 8.260529 40.049938 2.308984
    , Vector.vector 8.967634 40.781990 2.498452
    , Vector.vector 9.468884 41.781990 1.349023
    , Vector.vector 9.203228 42.781986 1.314049
    , Vector.vector 8.477440 43.514038 1.218497
    , Vector.vector 7.485995 43.781986 1.087971
    , Vector.vector 6.494549 43.514038 0.957444
    , Vector.vector 5.768762 42.781986 0.861893
    , Vector.vector 5.503105 41.781990 0.826918
    , Vector.vector 5.768762 40.781990 0.861893
    , Vector.vector 6.494549 40.049938 0.957444
    , Vector.vector 7.485995 39.781986 1.087971
    , Vector.vector 8.477440 40.049938 1.218497
    , Vector.vector 9.203228 40.781990 1.314049
    , Vector.vector -0.000000 -40.000000 -8.449999
    , Vector.vector 0.000000 40.000000 -6.500000
    , Vector.vector 1.648513 -40.000000 -8.287635
    , Vector.vector 1.268087 40.000000 -6.375104
    , Vector.vector 3.233675 -40.000000 -7.806781
    , Vector.vector 2.487442 40.000000 -6.005217
    , Vector.vector 4.694568 -40.000000 -7.025917
    , Vector.vector 3.611207 40.000000 -5.404552
    , Vector.vector 5.975051 -40.000000 -5.975051
    , Vector.vector 4.596194 40.000000 -4.596194
    , Vector.vector 7.025918 -40.000000 -4.694567
    , Vector.vector 5.404553 40.000000 -3.611206
    , Vector.vector 7.806782 -40.000000 -3.233674
    , Vector.vector 6.005217 40.000000 -2.487442
    , Vector.vector 8.287635 -40.000000 -1.648513
    , Vector.vector 6.375104 40.000000 -1.268087
    , Vector.vector 8.449999 -40.000000 -0.000000
    , Vector.vector 6.500000 40.000000 -0.000000
    , Vector.vector 8.287635 -40.000000 1.648513
    , Vector.vector 6.375104 40.000000 1.268086
    , Vector.vector 7.806782 -40.000000 3.233674
    , Vector.vector 6.005217 40.000000 2.487441
    , Vector.vector 7.025918 -40.000000 4.694569
    , Vector.vector 5.404553 40.000000 3.611206
    , Vector.vector 5.975051 -40.000000 5.975053
    , Vector.vector 4.596194 40.000000 4.596194
    , Vector.vector 4.694568 -40.000000 7.025919
    , Vector.vector 3.611206 40.000000 5.404553
    , Vector.vector 3.233673 -40.000000 7.806783
    , Vector.vector 2.487441 40.000000 6.005218
    , Vector.vector 1.648511 -40.000000 8.287636
    , Vector.vector 1.268085 40.000000 6.375104
    , Vector.vector -0.000003 -40.000000 8.450000
    , Vector.vector -0.000002 40.000000 6.500000
    , Vector.vector -1.648517 -40.000000 8.287635
    , Vector.vector -1.268090 40.000000 6.375103
    , Vector.vector -3.233679 -40.000000 7.806780
    , Vector.vector -2.487445 40.000000 6.005216
    , Vector.vector -4.694572 -40.000000 7.025916
    , Vector.vector -3.611210 40.000000 5.404551
    , Vector.vector -5.975056 -40.000000 5.975049
    , Vector.vector -4.596197 40.000000 4.596191
    , Vector.vector -7.025921 -40.000000 4.694564
    , Vector.vector -5.404554 40.000000 3.611202
    , Vector.vector -7.806784 -40.000000 3.233669
    , Vector.vector -6.005219 40.000000 2.487437
    , Vector.vector -8.287636 -40.000000 1.648506
    , Vector.vector -6.375105 40.000000 1.268081
    , Vector.vector -8.450000 -40.000000 -0.000008
    , Vector.vector -6.500000 40.000000 -0.000006
    , Vector.vector -8.287634 -40.000000 -1.648521
    , Vector.vector -6.375103 40.000000 -1.268094
    , Vector.vector -7.806778 -40.000000 -3.233683
    , Vector.vector -6.005214 40.000000 -2.487449
    , Vector.vector -7.025912 -40.000000 -4.694576
    , Vector.vector -5.404548 40.000000 -3.611213
    , Vector.vector -5.975044 -40.000000 -5.975059
    , Vector.vector -4.596188 40.000000 -4.596200
    , Vector.vector -4.694559 -40.000000 -7.025923
    , Vector.vector -3.611199 40.000000 -5.404557
    , Vector.vector -3.233664 -40.000000 -7.806786
    , Vector.vector -2.487433 40.000000 -6.005220
    , Vector.vector -1.648501 -40.000000 -8.287637
    , Vector.vector -1.268077 40.000000 -6.375106
    , Vector.vector -9.999999 -50.097725 9.999998
    , Vector.vector -9.999999 -50.097725 -10.000002
    , Vector.vector 10.000000 -50.097725 -10.000002
    , Vector.vector 10.000000 -50.097725 9.999998
    , Vector.vector -9.999999 -40.128536 9.999998
    , Vector.vector -9.999999 -40.128536 -10.000002
    , Vector.vector 10.000000 -40.128536 -10.000002
    , Vector.vector 10.000000 -40.128536 9.999998
    , Vector.vector -10.009957 52.537735 -9.890543
    , Vector.vector 9.990043 52.537735 -9.890545
    , Vector.vector -10.009957 50.586834 -9.698395
    , Vector.vector 9.990043 50.586834 -9.698398
    , Vector.vector -10.009956 48.710903 -9.129338
    , Vector.vector 9.990043 48.710903 -9.129341
    , Vector.vector -10.009957 46.982037 -8.205239
    , Vector.vector 9.990044 46.982037 -8.205241
    , Vector.vector -10.009956 45.466671 -6.961612
    , Vector.vector 9.990044 45.466671 -6.961614
    , Vector.vector -10.009955 44.223042 -5.446246
    , Vector.vector 9.990044 44.223042 -5.446248
    , Vector.vector -10.009955 43.298943 -3.717378
    , Vector.vector 9.990044 43.298943 -3.717381
    , Vector.vector -10.009955 42.729881 -1.841448
    , Vector.vector 9.990044 42.729881 -1.841450
    , Vector.vector -10.009955 42.537735 0.109455
    , Vector.vector 9.990045 42.537735 0.109452
    , Vector.vector -10.009955 42.729881 2.060358
    , Vector.vector 9.990045 42.729881 2.060355
    , Vector.vector -10.009955 43.298943 3.936289
    , Vector.vector 9.990045 43.298943 3.936286
    , Vector.vector -10.009955 44.223042 5.665158
    , Vector.vector 9.990045 44.223042 5.665155
    , Vector.vector -10.009955 45.466667 7.180524
    , Vector.vector 9.990045 45.466671 7.180521
    , Vector.vector -10.009954 46.982037 8.424153
    , Vector.vector 9.990045 46.982037 8.424150
    , Vector.vector -10.009954 48.710903 9.348253
    , Vector.vector 9.990045 48.710903 9.348250
    , Vector.vector -10.009955 50.586834 9.917311
    , Vector.vector 9.990045 50.586834 9.917308
    , Vector.vector -10.009955 52.537735 10.109457
    , Vector.vector 9.990045 52.537743 10.109455
    , Vector.vector -0.009956 42.537735 10.109452
    , Vector.vector -0.009956 42.537743 -9.890549
    , Vector.vector 1.940947 42.729889 10.109452
    , Vector.vector 1.940947 42.729889 -9.890549
    , Vector.vector 3.816878 43.298946 10.109452
    , Vector.vector 3.816878 43.298946 -9.890549
    , Vector.vector 5.545746 44.223042 10.109453
    , Vector.vector 5.545746 44.223042 -9.890549
    , Vector.vector 7.061111 45.466671 10.109452
    , Vector.vector 7.061111 45.466671 -9.890548
    , Vector.vector 8.304740 46.982037 10.109453
    , Vector.vector 8.304740 46.982040 -9.890548
    , Vector.vector 9.228839 48.710903 10.109453
    , Vector.vector 9.228839 48.710907 -9.890548
    , Vector.vector 9.797896 50.586834 10.109453
    , Vector.vector 9.797896 50.586838 -9.890548
    , Vector.vector 9.990044 52.537735 10.109453
    , Vector.vector 9.990044 52.537743 -9.890548
    , Vector.vector -10.009956 52.537727 10.109453
    , Vector.vector -10.009956 52.537731 -9.890548
    , Vector.vector -9.817807 50.586823 10.109452
    , Vector.vector -9.817807 50.586823 -9.890548
    , Vector.vector -9.248747 48.710896 10.109453
    , Vector.vector -9.248747 48.710899 -9.890548
    , Vector.vector -8.324646 46.982025 10.109452
    , Vector.vector -8.324646 46.982033 -9.890548
    , Vector.vector -7.081015 45.466660 10.109452
    , Vector.vector -7.081015 45.466660 -9.890548
    , Vector.vector -5.565648 44.223038 10.109452
    , Vector.vector -5.565648 44.223038 -9.890549
    , Vector.vector -3.836777 43.298943 10.109452
    , Vector.vector -3.836777 43.298943 -9.890549
    , Vector.vector -1.960845 42.729881 10.109452
    , Vector.vector -1.960845 42.729881 -9.890549
    , Vector.vector -0.000000 -32.727272 -8.272726
    , Vector.vector -0.000000 -25.454544 -8.095454
    , Vector.vector -0.000000 -18.181818 -7.918181
    , Vector.vector -0.000000 -10.909090 -7.740909
    , Vector.vector -0.000000 -3.636363 -7.563636
    , Vector.vector -0.000000 3.636364 -7.386364
    , Vector.vector -0.000000 10.909091 -7.209091
    , Vector.vector -0.000000 18.181818 -7.031818
    , Vector.vector -0.000000 25.454544 -6.854546
    , Vector.vector -0.000000 32.727272 -6.677272
    , Vector.vector 1.302671 32.727272 -6.548970
    , Vector.vector 1.337255 25.454544 -6.722836
    , Vector.vector 1.371840 18.181818 -6.896703
    , Vector.vector 1.406424 10.909090 -7.070570
    , Vector.vector 1.441008 3.636363 -7.244436
    , Vector.vector 1.475592 -3.636364 -7.418303
    , Vector.vector 1.510176 -10.909091 -7.592169
    , Vector.vector 1.544760 -18.181818 -7.766036
    , Vector.vector 1.579345 -25.454544 -7.939902
    , Vector.vector 1.613929 -32.727272 -8.113768
    , Vector.vector 2.555282 32.727272 -6.168995
    , Vector.vector 2.623121 25.454544 -6.332774
    , Vector.vector 2.690960 18.181818 -6.496553
    , Vector.vector 2.758800 10.909090 -6.660332
    , Vector.vector 2.826639 3.636363 -6.824110
    , Vector.vector 2.894478 -3.636364 -6.987889
    , Vector.vector 2.962317 -10.909091 -7.151668
    , Vector.vector 3.030157 -18.181818 -7.315446
    , Vector.vector 3.097996 -25.454544 -7.479224
    , Vector.vector 3.165835 -32.727272 -7.643003
    , Vector.vector 3.709694 32.727272 -5.551949
    , Vector.vector 3.808181 25.454544 -5.699346
    , Vector.vector 3.906669 18.181818 -5.846743
    , Vector.vector 4.005156 10.909090 -5.994140
    , Vector.vector 4.103643 3.636363 -6.141537
    , Vector.vector 4.202131 -3.636364 -6.288934
    , Vector.vector 4.300619 -10.909091 -6.436331
    , Vector.vector 4.399106 -18.181818 -6.583728
    , Vector.vector 4.497593 -25.454544 -6.731124
    , Vector.vector 4.596081 -32.727272 -6.878520
    , Vector.vector 4.721544 32.727272 -4.721544
    , Vector.vector 4.846895 25.454544 -4.846895
    , Vector.vector 4.972246 18.181818 -4.972246
    , Vector.vector 5.097597 10.909090 -5.097597
    , Vector.vector 5.222948 3.636363 -5.222947
    , Vector.vector 5.348299 -3.636364 -5.348297
    , Vector.vector 5.473649 -10.909091 -5.473648
    , Vector.vector 5.598999 -18.181818 -5.598999
    , Vector.vector 5.724350 -25.454544 -5.724349
    , Vector.vector 5.849701 -32.727272 -5.849700
    , Vector.vector 5.551950 32.727272 -3.709693
    , Vector.vector 5.699347 25.454544 -3.808181
    , Vector.vector 5.846744 18.181818 -3.906668
    , Vector.vector 5.994141 10.909090 -4.005156
    , Vector.vector 6.141538 3.636363 -4.103643
    , Vector.vector 6.288934 -3.636364 -4.202130
    , Vector.vector 6.436331 -10.909091 -4.300618
    , Vector.vector 6.583728 -18.181818 -4.399105
    , Vector.vector 6.731125 -25.454544 -4.497592
    , Vector.vector 6.878521 -32.727272 -4.596080
    , Vector.vector 6.168995 32.727272 -2.555282
    , Vector.vector 6.332774 25.454544 -2.623121
    , Vector.vector 6.496553 18.181818 -2.690960
    , Vector.vector 6.660332 10.909090 -2.758800
    , Vector.vector 6.824110 3.636363 -2.826639
    , Vector.vector 6.987889 -3.636364 -2.894478
    , Vector.vector 7.151668 -10.909091 -2.962317
    , Vector.vector 7.315446 -18.181818 -3.030157
    , Vector.vector 7.479225 -25.454544 -3.097996
    , Vector.vector 7.643003 -32.727272 -3.165835
    , Vector.vector 6.548970 32.727272 -1.302671
    , Vector.vector 6.722836 25.454544 -1.337255
    , Vector.vector 6.896703 18.181818 -1.371840
    , Vector.vector 7.070570 10.909090 -1.406424
    , Vector.vector 7.244436 3.636363 -1.441008
    , Vector.vector 7.418303 -3.636364 -1.475592
    , Vector.vector 7.592169 -10.909091 -1.510176
    , Vector.vector 7.766036 -18.181818 -1.544760
    , Vector.vector 7.939902 -25.454544 -1.579344
    , Vector.vector 8.113768 -32.727272 -1.613928
    , Vector.vector 6.677272 32.727272 -0.000000
    , Vector.vector 6.854545 25.454544 -0.000000
    , Vector.vector 7.031817 18.181818 -0.000000
    , Vector.vector 7.209090 10.909090 -0.000000
    , Vector.vector 7.386363 3.636363 -0.000000
    , Vector.vector 7.563635 -3.636364 -0.000000
    , Vector.vector 7.740908 -10.909091 -0.000000
    , Vector.vector 7.918180 -18.181818 -0.000000
    , Vector.vector 8.095453 -25.454544 -0.000000
    , Vector.vector 8.272726 -32.727272 -0.000000
    , Vector.vector 6.548970 32.727272 1.302670
    , Vector.vector 6.722836 25.454544 1.337255
    , Vector.vector 6.896703 18.181818 1.371839
    , Vector.vector 7.070570 10.909090 1.406423
    , Vector.vector 7.244436 3.636363 1.441008
    , Vector.vector 7.418303 -3.636364 1.475592
    , Vector.vector 7.592169 -10.909091 1.510176
    , Vector.vector 7.766036 -18.181818 1.544760
    , Vector.vector 7.939902 -25.454544 1.579344
    , Vector.vector 8.113768 -32.727272 1.613928
    , Vector.vector 6.168995 32.727272 2.555281
    , Vector.vector 6.332774 25.454544 2.623120
    , Vector.vector 6.496553 18.181818 2.690959
    , Vector.vector 6.660332 10.909090 2.758799
    , Vector.vector 6.824110 3.636363 2.826638
    , Vector.vector 6.987889 -3.636364 2.894477
    , Vector.vector 7.151668 -10.909091 2.962317
    , Vector.vector 7.315446 -18.181818 3.030156
    , Vector.vector 7.479225 -25.454544 3.097995
    , Vector.vector 7.643003 -32.727272 3.165834
    , Vector.vector 5.551950 32.727272 3.709693
    , Vector.vector 5.699347 25.454544 3.808181
    , Vector.vector 5.846744 18.181818 3.906668
    , Vector.vector 5.994141 10.909090 4.005156
    , Vector.vector 6.141538 3.636363 4.103643
    , Vector.vector 6.288934 -3.636364 4.202131
    , Vector.vector 6.436331 -10.909091 4.300618
    , Vector.vector 6.583728 -18.181818 4.399106
    , Vector.vector 6.731125 -25.454544 4.497593
    , Vector.vector 6.878521 -32.727272 4.596081
    , Vector.vector 4.721544 32.727272 4.721545
    , Vector.vector 4.846895 25.454544 4.846895
    , Vector.vector 4.972246 18.181818 4.972246
    , Vector.vector 5.097597 10.909090 5.097597
    , Vector.vector 5.222948 3.636363 5.222948
    , Vector.vector 5.348299 -3.636364 5.348299
    , Vector.vector 5.473649 -10.909091 5.473650
    , Vector.vector 5.598999 -18.181818 5.599000
    , Vector.vector 5.724350 -25.454544 5.724351
    , Vector.vector 5.849701 -32.727272 5.849702
    , Vector.vector 3.709693 32.727272 5.551950
    , Vector.vector 3.808181 25.454544 5.699347
    , Vector.vector 3.906668 18.181818 5.846744
    , Vector.vector 4.005156 10.909090 5.994141
    , Vector.vector 4.103643 3.636363 6.141538
    , Vector.vector 4.202131 -3.636364 6.288934
    , Vector.vector 4.300618 -10.909091 6.436331
    , Vector.vector 4.399106 -18.181818 6.583728
    , Vector.vector 4.497593 -25.454544 6.731125
    , Vector.vector 4.596080 -32.727272 6.878522
    , Vector.vector 2.555280 32.727272 6.168996
    , Vector.vector 2.623120 25.454544 6.332775
    , Vector.vector 2.690959 18.181818 6.496553
    , Vector.vector 2.758798 10.909090 6.660332
    , Vector.vector 2.826638 3.636363 6.824111
    , Vector.vector 2.894477 -3.636364 6.987889
    , Vector.vector 2.962316 -10.909091 7.151668
    , Vector.vector 3.030156 -18.181818 7.315447
    , Vector.vector 3.097995 -25.454544 7.479225
    , Vector.vector 3.165834 -32.727272 7.643004
    , Vector.vector 1.302670 32.727272 6.548971
    , Vector.vector 1.337254 25.454544 6.722837
    , Vector.vector 1.371838 18.181818 6.896704
    , Vector.vector 1.406422 10.909090 7.070570
    , Vector.vector 1.441006 3.636363 7.244437
    , Vector.vector 1.475590 -3.636364 7.418303
    , Vector.vector 1.510174 -10.909091 7.592170
    , Vector.vector 1.544758 -18.181818 7.766036
    , Vector.vector 1.579343 -25.454544 7.939902
    , Vector.vector 1.613927 -32.727272 8.113770
    , Vector.vector -0.000002 32.727272 6.677272
    , Vector.vector -0.000002 25.454544 6.854545
    , Vector.vector -0.000002 18.181818 7.031817
    , Vector.vector -0.000002 10.909090 7.209090
    , Vector.vector -0.000002 3.636363 7.386363
    , Vector.vector -0.000003 -3.636364 7.563635
    , Vector.vector -0.000003 -10.909091 7.740908
    , Vector.vector -0.000003 -18.181818 7.918181
    , Vector.vector -0.000003 -25.454544 8.095454
    , Vector.vector -0.000003 -32.727272 8.272726
    , Vector.vector -1.302674 32.727272 6.548970
    , Vector.vector -1.337258 25.454544 6.722836
    , Vector.vector -1.371843 18.181818 6.896703
    , Vector.vector -1.406427 10.909090 7.070570
    , Vector.vector -1.441011 3.636363 7.244436
    , Vector.vector -1.475595 -3.636364 7.418303
    , Vector.vector -1.510180 -10.909091 7.592169
    , Vector.vector -1.544764 -18.181818 7.766036
    , Vector.vector -1.579348 -25.454544 7.939902
    , Vector.vector -1.613933 -32.727272 8.113768
    , Vector.vector -2.555285 32.727272 6.168994
    , Vector.vector -2.623124 25.454544 6.332773
    , Vector.vector -2.690963 18.181818 6.496552
    , Vector.vector -2.758802 10.909090 6.660330
    , Vector.vector -2.826642 3.636363 6.824109
    , Vector.vector -2.894481 -3.636364 6.987887
    , Vector.vector -2.962321 -10.909091 7.151666
    , Vector.vector -3.030160 -18.181818 7.315445
    , Vector.vector -3.098000 -25.454544 7.479224
    , Vector.vector -3.165839 -32.727272 7.643003
    , Vector.vector -3.709697 32.727272 5.551948
    , Vector.vector -3.808185 25.454544 5.699344
    , Vector.vector -3.906672 18.181818 5.846741
    , Vector.vector -4.005160 10.909090 5.994138
    , Vector.vector -4.103647 3.636363 6.141535
    , Vector.vector -4.202135 -3.636364 6.288932
    , Vector.vector -4.300622 -10.909091 6.436329
    , Vector.vector -4.399110 -18.181818 6.583726
    , Vector.vector -4.497598 -25.454544 6.731123
    , Vector.vector -4.596085 -32.727272 6.878519
    , Vector.vector -4.721548 32.727272 4.721542
    , Vector.vector -4.846899 25.454544 4.846892
    , Vector.vector -4.972250 18.181818 4.972243
    , Vector.vector -5.097601 10.909090 5.097594
    , Vector.vector -5.222952 3.636363 5.222945
    , Vector.vector -5.348303 -3.636364 5.348296
    , Vector.vector -5.473654 -10.909091 5.473647
    , Vector.vector -5.599004 -18.181818 5.598997
    , Vector.vector -5.724355 -25.454544 5.724348
    , Vector.vector -5.849706 -32.727272 5.849699
    , Vector.vector -5.551951 32.727272 3.709690
    , Vector.vector -5.699348 25.454544 3.808177
    , Vector.vector -5.846745 18.181818 3.906665
    , Vector.vector -5.994143 10.909090 4.005152
    , Vector.vector -6.141539 3.636363 4.103640
    , Vector.vector -6.288936 -3.636364 4.202127
    , Vector.vector -6.436333 -10.909091 4.300614
    , Vector.vector -6.583730 -18.181818 4.399102
    , Vector.vector -6.731127 -25.454544 4.497589
    , Vector.vector -6.878524 -32.727272 4.596076
    , Vector.vector -6.168997 32.727272 2.555276
    , Vector.vector -6.332776 25.454544 2.623116
    , Vector.vector -6.496554 18.181818 2.690955
    , Vector.vector -6.660333 10.909090 2.758794
    , Vector.vector -6.824112 3.636363 2.826634
    , Vector.vector -6.987891 -3.636364 2.894473
    , Vector.vector -7.151670 -10.909091 2.962312
    , Vector.vector -7.315448 -18.181818 3.030151
    , Vector.vector -7.479227 -25.454544 3.097991
    , Vector.vector -7.643005 -32.727272 3.165830
    , Vector.vector -6.548972 32.727272 1.302665
    , Vector.vector -6.722837 25.454544 1.337250
    , Vector.vector -6.896705 18.181818 1.371834
    , Vector.vector -7.070571 10.909090 1.406418
    , Vector.vector -7.244437 3.636363 1.441002
    , Vector.vector -7.418303 -3.636364 1.475586
    , Vector.vector -7.592170 -10.909091 1.510170
    , Vector.vector -7.766037 -18.181818 1.544754
    , Vector.vector -7.939903 -25.454544 1.579338
    , Vector.vector -8.113770 -32.727272 1.613922
    , Vector.vector -6.677272 32.727272 -0.000006
    , Vector.vector -6.854545 25.454544 -0.000007
    , Vector.vector -7.031817 18.181818 -0.000007
    , Vector.vector -7.209090 10.909090 -0.000007
    , Vector.vector -7.386363 3.636363 -0.000007
    , Vector.vector -7.563635 -3.636364 -0.000007
    , Vector.vector -7.740908 -10.909091 -0.000007
    , Vector.vector -7.918181 -18.181818 -0.000007
    , Vector.vector -8.095454 -25.454544 -0.000007
    , Vector.vector -8.272726 -32.727272 -0.000007
    , Vector.vector -6.548969 32.727272 -1.302678
    , Vector.vector -6.722836 25.454544 -1.337262
    , Vector.vector -6.896702 18.181818 -1.371847
    , Vector.vector -7.070569 10.909090 -1.406431
    , Vector.vector -7.244435 3.636363 -1.441015
    , Vector.vector -7.418301 -3.636364 -1.475600
    , Vector.vector -7.592168 -10.909091 -1.510184
    , Vector.vector -7.766035 -18.181818 -1.544768
    , Vector.vector -7.939901 -25.454544 -1.579353
    , Vector.vector -8.113767 -32.727272 -1.613937
    , Vector.vector -6.168993 32.727272 -2.555288
    , Vector.vector -6.332771 25.454544 -2.623128
    , Vector.vector -6.496550 18.181818 -2.690967
    , Vector.vector -6.660328 10.909090 -2.758807
    , Vector.vector -6.824107 3.636363 -2.826646
    , Vector.vector -6.987886 -3.636364 -2.894485
    , Vector.vector -7.151665 -10.909091 -2.962325
    , Vector.vector -7.315443 -18.181818 -3.030165
    , Vector.vector -7.479221 -25.454544 -3.098004
    , Vector.vector -7.643000 -32.727272 -3.165843
    , Vector.vector -5.551945 32.727272 -3.709700
    , Vector.vector -5.699342 25.454544 -3.808188
    , Vector.vector -5.846739 18.181818 -3.906675
    , Vector.vector -5.994136 10.909090 -4.005163
    , Vector.vector -6.141533 3.636363 -4.103651
    , Vector.vector -6.288929 -3.636364 -4.202138
    , Vector.vector -6.436326 -10.909091 -4.300626
    , Vector.vector -6.583723 -18.181818 -4.399113
    , Vector.vector -6.731119 -25.454544 -4.497601
    , Vector.vector -6.878515 -32.727272 -4.596088
    , Vector.vector -4.721539 32.727272 -4.721550
    , Vector.vector -4.846889 25.454544 -4.846901
    , Vector.vector -4.972240 18.181818 -4.972252
    , Vector.vector -5.097590 10.909090 -5.097603
    , Vector.vector -5.222941 3.636363 -5.222954
    , Vector.vector -5.348291 -3.636364 -5.348305
    , Vector.vector -5.473642 -10.909091 -5.473656
    , Vector.vector -5.598992 -18.181818 -5.599007
    , Vector.vector -5.724343 -25.454544 -5.724358
    , Vector.vector -5.849694 -32.727272 -5.849709
    , Vector.vector -3.709686 32.727272 -5.551954
    , Vector.vector -3.808173 25.454544 -5.699351
    , Vector.vector -3.906660 18.181818 -5.846748
    , Vector.vector -4.005148 10.909090 -5.994144
    , Vector.vector -4.103635 3.636363 -6.141541
    , Vector.vector -4.202122 -3.636364 -6.288939
    , Vector.vector -4.300610 -10.909091 -6.436336
    , Vector.vector -4.399097 -18.181818 -6.583733
    , Vector.vector -4.497584 -25.454544 -6.731129
    , Vector.vector -4.596071 -32.727272 -6.878526
    , Vector.vector -2.555273 32.727272 -6.168999
    , Vector.vector -2.623112 25.454544 -6.332778
    , Vector.vector -2.690951 18.181818 -6.496556
    , Vector.vector -2.758790 10.909090 -6.660335
    , Vector.vector -2.826629 3.636363 -6.824114
    , Vector.vector -2.894468 -3.636364 -6.987892
    , Vector.vector -2.962307 -10.909091 -7.151671
    , Vector.vector -3.030146 -18.181818 -7.315450
    , Vector.vector -3.097985 -25.454544 -7.479228
    , Vector.vector -3.165824 -32.727272 -7.643007
    , Vector.vector -1.302661 32.727272 -6.548972
    , Vector.vector -1.337245 25.454544 -6.722839
    , Vector.vector -1.371829 18.181818 -6.896705
    , Vector.vector -1.406413 10.909090 -7.070571
    , Vector.vector -1.440997 3.636363 -7.244438
    , Vector.vector -1.475581 -3.636364 -7.418304
    , Vector.vector -1.510165 -10.909091 -7.592171
    , Vector.vector -1.544749 -18.181818 -7.766037
    , Vector.vector -1.579333 -25.454544 -7.939904
    , Vector.vector -1.613917 -32.727272 -8.113770
    ]


cornerIndexes : List (List Int)
cornerIndexes =
  [ []
  , [ 1, 13, 14, 2]
  , [ 2, 14, 15, 3]
  , [ 3, 15, 16, 4]
  , [ 4, 16, 17, 5]
  , [ 5, 17, 18, 6]
  , [ 6, 18, 19, 7]
  , [ 7, 19, 20, 8]
  , [ 8, 20, 21, 9]
  , [ 9, 21, 22, 10]
  , [ 10, 22, 23, 11]
  , [ 11, 23, 24, 12]
  , [ 1, 12, 24, 13]
  , [ 13, 25, 26, 14]
  , [ 14, 26, 27, 15]
  , [ 15, 27, 28, 16]
  , [ 16, 28, 29, 17]
  , [ 17, 29, 30, 18]
  , [ 18, 30, 31, 19]
  , [ 19, 31, 32, 20]
  , [ 20, 32, 33, 21]
  , [ 21, 33, 34, 22]
  , [ 22, 34, 35, 23]
  , [ 23, 35, 36, 24]
  , [ 24, 36, 25, 13]
  , [ 25, 37, 38, 26]
  , [ 26, 38, 39, 27]
  , [ 27, 39, 40, 28]
  , [ 28, 40, 41, 29]
  , [ 29, 41, 42, 30]
  , [ 30, 42, 43, 31]
  , [ 31, 43, 44, 32]
  , [ 32, 44, 45, 33]
  , [ 33, 45, 46, 34]
  , [ 34, 46, 47, 35]
  , [ 35, 47, 48, 36]
  , [ 36, 48, 37, 25]
  , [ 37, 49, 50, 38]
  , [ 38, 50, 51, 39]
  , [ 39, 51, 52, 40]
  , [ 40, 52, 53, 41]
  , [ 41, 53, 54, 42]
  , [ 42, 54, 55, 43]
  , [ 43, 55, 56, 44]
  , [ 44, 56, 57, 45]
  , [ 45, 57, 58, 46]
  , [ 46, 58, 59, 47]
  , [ 47, 59, 60, 48]
  , [ 48, 60, 49, 37]
  , [ 49, 61, 62, 50]
  , [ 50, 62, 63, 51]
  , [ 51, 63, 64, 52]
  , [ 52, 64, 65, 53]
  , [ 53, 65, 66, 54]
  , [ 54, 66, 67, 55]
  , [ 55, 67, 68, 56]
  , [ 56, 68, 69, 57]
  , [ 57, 69, 70, 58]
  , [ 58, 70, 71, 59]
  , [ 59, 71, 72, 60]
  , [ 60, 72, 61, 49]
  , [ 61, 73, 74, 62]
  , [ 62, 74, 75, 63]
  , [ 63, 75, 76, 64]
  , [ 64, 76, 77, 65]
  , [ 65, 77, 78, 66]
  , [ 66, 78, 79, 67]
  , [ 67, 79, 80, 68]
  , [ 68, 80, 81, 69]
  , [ 69, 81, 82, 70]
  , [ 70, 82, 83, 71]
  , [ 71, 83, 84, 72]
  , [ 72, 84, 73, 61]
  , [ 73, 85, 86, 74]
  , [ 74, 86, 87, 75]
  , [ 75, 87, 88, 76]
  , [ 76, 88, 89, 77]
  , [ 77, 89, 90, 78]
  , [ 78, 90, 91, 79]
  , [ 79, 91, 92, 80]
  , [ 80, 92, 93, 81]
  , [ 81, 93, 94, 82]
  , [ 82, 94, 95, 83]
  , [ 83, 95, 96, 84]
  , [ 84, 96, 85, 73]
  , [ 85, 97, 98, 86]
  , [ 86, 98, 99, 87]
  , [ 87, 99, 100, 88]
  , [ 88, 100, 101, 89]
  , [ 89, 101, 102, 90]
  , [ 90, 102, 103, 91]
  , [ 91, 103, 104, 92]
  , [ 92, 104, 105, 93]
  , [ 93, 105, 106, 94]
  , [ 94, 106, 107, 95]
  , [ 95, 107, 108, 96]
  , [ 96, 108, 97, 85]
  , [ 97, 109, 110, 98]
  , [ 98, 110, 111, 99]
  , [ 99, 111, 112, 100]
  , [ 100, 112, 113, 101]
  , [ 101, 113, 114, 102]
  , [ 102, 114, 115, 103]
  , [ 103, 115, 116, 104]
  , [ 104, 116, 117, 105]
  , [ 105, 117, 118, 106]
  , [ 106, 118, 119, 107]
  , [ 107, 119, 120, 108]
  , [ 108, 120, 109, 97]
  , [ 109, 121, 122, 110]
  , [ 110, 122, 123, 111]
  , [ 111, 123, 124, 112]
  , [ 112, 124, 125, 113]
  , [ 113, 125, 126, 114]
  , [ 114, 126, 127, 115]
  , [ 115, 127, 128, 116]
  , [ 116, 128, 129, 117]
  , [ 117, 129, 130, 118]
  , [ 118, 130, 131, 119]
  , [ 119, 131, 132, 120]
  , [ 120, 132, 121, 109]
  , [ 121, 133, 134, 122]
  , [ 122, 134, 135, 123]
  , [ 123, 135, 136, 124]
  , [ 124, 136, 137, 125]
  , [ 125, 137, 138, 126]
  , [ 126, 138, 139, 127]
  , [ 127, 139, 140, 128]
  , [ 128, 140, 141, 129]
  , [ 129, 141, 142, 130]
  , [ 130, 142, 143, 131]
  , [ 131, 143, 144, 132]
  , [ 132, 144, 133, 121]
  , [ 133, 145, 146, 134]
  , [ 134, 146, 147, 135]
  , [ 135, 147, 148, 136]
  , [ 136, 148, 149, 137]
  , [ 137, 149, 150, 138]
  , [ 138, 150, 151, 139]
  , [ 139, 151, 152, 140]
  , [ 140, 152, 153, 141]
  , [ 141, 153, 154, 142]
  , [ 142, 154, 155, 143]
  , [ 143, 155, 156, 144]
  , [ 144, 156, 145, 133]
  , [ 145, 157, 158, 146]
  , [ 146, 158, 159, 147]
  , [ 147, 159, 160, 148]
  , [ 148, 160, 161, 149]
  , [ 149, 161, 162, 150]
  , [ 150, 162, 163, 151]
  , [ 151, 163, 164, 152]
  , [ 152, 164, 165, 153]
  , [ 153, 165, 166, 154]
  , [ 154, 166, 167, 155]
  , [ 155, 167, 168, 156]
  , [ 156, 168, 157, 145]
  , [ 157, 169, 170, 158]
  , [ 158, 170, 171, 159]
  , [ 159, 171, 172, 160]
  , [ 160, 172, 173, 161]
  , [ 161, 173, 174, 162]
  , [ 162, 174, 175, 163]
  , [ 163, 175, 176, 164]
  , [ 164, 176, 177, 165]
  , [ 165, 177, 178, 166]
  , [ 166, 178, 179, 167]
  , [ 167, 179, 180, 168]
  , [ 168, 180, 169, 157]
  , [ 169, 181, 182, 170]
  , [ 170, 182, 183, 171]
  , [ 171, 183, 184, 172]
  , [ 172, 184, 185, 173]
  , [ 173, 185, 186, 174]
  , [ 174, 186, 187, 175]
  , [ 175, 187, 188, 176]
  , [ 176, 188, 189, 177]
  , [ 177, 189, 190, 178]
  , [ 178, 190, 191, 179]
  , [ 179, 191, 192, 180]
  , [ 180, 192, 181, 169]
  , [ 181, 193, 194, 182]
  , [ 182, 194, 195, 183]
  , [ 183, 195, 196, 184]
  , [ 184, 196, 197, 185]
  , [ 185, 197, 198, 186]
  , [ 186, 198, 199, 187]
  , [ 187, 199, 200, 188]
  , [ 188, 200, 201, 189]
  , [ 189, 201, 202, 190]
  , [ 190, 202, 203, 191]
  , [ 191, 203, 204, 192]
  , [ 192, 204, 193, 181]
  , [ 193, 205, 206, 194]
  , [ 194, 206, 207, 195]
  , [ 195, 207, 208, 196]
  , [ 196, 208, 209, 197]
  , [ 197, 209, 210, 198]
  , [ 198, 210, 211, 199]
  , [ 199, 211, 212, 200]
  , [ 200, 212, 213, 201]
  , [ 201, 213, 214, 202]
  , [ 202, 214, 215, 203]
  , [ 203, 215, 216, 204]
  , [ 204, 216, 205, 193]
  , [ 205, 217, 218, 206]
  , [ 206, 218, 219, 207]
  , [ 207, 219, 220, 208]
  , [ 208, 220, 221, 209]
  , [ 209, 221, 222, 210]
  , [ 210, 222, 223, 211]
  , [ 211, 223, 224, 212]
  , [ 212, 224, 225, 213]
  , [ 213, 225, 226, 214]
  , [ 214, 226, 227, 215]
  , [ 215, 227, 228, 216]
  , [ 216, 228, 217, 205]
  , [ 217, 229, 230, 218]
  , [ 218, 230, 231, 219]
  , [ 219, 231, 232, 220]
  , [ 220, 232, 233, 221]
  , [ 221, 233, 234, 222]
  , [ 222, 234, 235, 223]
  , [ 223, 235, 236, 224]
  , [ 224, 236, 237, 225]
  , [ 225, 237, 238, 226]
  , [ 226, 238, 239, 227]
  , [ 227, 239, 240, 228]
  , [ 228, 240, 229, 217]
  , [ 229, 241, 242, 230]
  , [ 230, 242, 243, 231]
  , [ 231, 243, 244, 232]
  , [ 232, 244, 245, 233]
  , [ 233, 245, 246, 234]
  , [ 234, 246, 247, 235]
  , [ 235, 247, 248, 236]
  , [ 236, 248, 249, 237]
  , [ 237, 249, 250, 238]
  , [ 238, 250, 251, 239]
  , [ 239, 251, 252, 240]
  , [ 240, 252, 241, 229]
  , [ 241, 253, 254, 242]
  , [ 242, 254, 255, 243]
  , [ 243, 255, 256, 244]
  , [ 244, 256, 257, 245]
  , [ 245, 257, 258, 246]
  , [ 246, 258, 259, 247]
  , [ 247, 259, 260, 248]
  , [ 248, 260, 261, 249]
  , [ 249, 261, 262, 250]
  , [ 250, 262, 263, 251]
  , [ 251, 263, 264, 252]
  , [ 252, 264, 253, 241]
  , [ 253, 265, 266, 254]
  , [ 254, 266, 267, 255]
  , [ 255, 267, 268, 256]
  , [ 256, 268, 269, 257]
  , [ 257, 269, 270, 258]
  , [ 258, 270, 271, 259]
  , [ 259, 271, 272, 260]
  , [ 260, 272, 273, 261]
  , [ 261, 273, 274, 262]
  , [ 262, 274, 275, 263]
  , [ 263, 275, 276, 264]
  , [ 264, 276, 265, 253]
  , [ 265, 277, 278, 266]
  , [ 266, 278, 279, 267]
  , [ 267, 279, 280, 268]
  , [ 268, 280, 281, 269]
  , [ 269, 281, 282, 270]
  , [ 270, 282, 283, 271]
  , [ 271, 283, 284, 272]
  , [ 272, 284, 285, 273]
  , [ 273, 285, 286, 274]
  , [ 274, 286, 287, 275]
  , [ 275, 287, 288, 276]
  , [ 276, 288, 277, 265]
  , [ 277, 289, 290, 278]
  , [ 278, 290, 291, 279]
  , [ 279, 291, 292, 280]
  , [ 280, 292, 293, 281]
  , [ 281, 293, 294, 282]
  , [ 282, 294, 295, 283]
  , [ 283, 295, 296, 284]
  , [ 284, 296, 297, 285]
  , [ 285, 297, 298, 286]
  , [ 286, 298, 299, 287]
  , [ 287, 299, 300, 288]
  , [ 288, 300, 289, 277]
  , [ 289, 301, 302, 290]
  , [ 290, 302, 303, 291]
  , [ 291, 303, 304, 292]
  , [ 292, 304, 305, 293]
  , [ 293, 305, 306, 294]
  , [ 294, 306, 307, 295]
  , [ 295, 307, 308, 296]
  , [ 296, 308, 309, 297]
  , [ 297, 309, 310, 298]
  , [ 298, 310, 311, 299]
  , [ 299, 311, 312, 300]
  , [ 300, 312, 301, 289]
  , [ 301, 313, 314, 302]
  , [ 302, 314, 315, 303]
  , [ 303, 315, 316, 304]
  , [ 304, 316, 317, 305]
  , [ 305, 317, 318, 306]
  , [ 306, 318, 319, 307]
  , [ 307, 319, 320, 308]
  , [ 308, 320, 321, 309]
  , [ 309, 321, 322, 310]
  , [ 310, 322, 323, 311]
  , [ 311, 323, 324, 312]
  , [ 312, 324, 313, 301]
  , [ 313, 325, 326, 314]
  , [ 314, 326, 327, 315]
  , [ 315, 327, 328, 316]
  , [ 316, 328, 329, 317]
  , [ 317, 329, 330, 318]
  , [ 318, 330, 331, 319]
  , [ 319, 331, 332, 320]
  , [ 320, 332, 333, 321]
  , [ 321, 333, 334, 322]
  , [ 322, 334, 335, 323]
  , [ 323, 335, 336, 324]
  , [ 324, 336, 325, 313]
  , [ 325, 337, 338, 326]
  , [ 326, 338, 339, 327]
  , [ 327, 339, 340, 328]
  , [ 328, 340, 341, 329]
  , [ 329, 341, 342, 330]
  , [ 330, 342, 343, 331]
  , [ 331, 343, 344, 332]
  , [ 332, 344, 345, 333]
  , [ 333, 345, 346, 334]
  , [ 334, 346, 347, 335]
  , [ 335, 347, 348, 336]
  , [ 336, 348, 337, 325]
  , [ 337, 349, 350, 338]
  , [ 338, 350, 351, 339]
  , [ 339, 351, 352, 340]
  , [ 340, 352, 353, 341]
  , [ 341, 353, 354, 342]
  , [ 342, 354, 355, 343]
  , [ 343, 355, 356, 344]
  , [ 344, 356, 357, 345]
  , [ 345, 357, 358, 346]
  , [ 346, 358, 359, 347]
  , [ 347, 359, 360, 348]
  , [ 348, 360, 349, 337]
  , [ 349, 361, 362, 350]
  , [ 350, 362, 363, 351]
  , [ 351, 363, 364, 352]
  , [ 352, 364, 365, 353]
  , [ 353, 365, 366, 354]
  , [ 354, 366, 367, 355]
  , [ 355, 367, 368, 356]
  , [ 356, 368, 369, 357]
  , [ 357, 369, 370, 358]
  , [ 358, 370, 371, 359]
  , [ 359, 371, 372, 360]
  , [ 360, 372, 361, 349]
  , [ 361, 373, 374, 362]
  , [ 362, 374, 375, 363]
  , [ 363, 375, 376, 364]
  , [ 364, 376, 377, 365]
  , [ 365, 377, 378, 366]
  , [ 366, 378, 379, 367]
  , [ 367, 379, 380, 368]
  , [ 368, 380, 381, 369]
  , [ 369, 381, 382, 370]
  , [ 370, 382, 383, 371]
  , [ 371, 383, 384, 372]
  , [ 372, 384, 373, 361]
  , [ 373, 385, 386, 374]
  , [ 374, 386, 387, 375]
  , [ 375, 387, 388, 376]
  , [ 376, 388, 389, 377]
  , [ 377, 389, 390, 378]
  , [ 378, 390, 391, 379]
  , [ 379, 391, 392, 380]
  , [ 380, 392, 393, 381]
  , [ 381, 393, 394, 382]
  , [ 382, 394, 395, 383]
  , [ 383, 395, 396, 384]
  , [ 384, 396, 385, 373]
  , [ 385, 397, 398, 386]
  , [ 386, 398, 399, 387]
  , [ 387, 399, 400, 388]
  , [ 388, 400, 401, 389]
  , [ 389, 401, 402, 390]
  , [ 390, 402, 403, 391]
  , [ 391, 403, 404, 392]
  , [ 392, 404, 405, 393]
  , [ 393, 405, 406, 394]
  , [ 394, 406, 407, 395]
  , [ 395, 407, 408, 396]
  , [ 396, 408, 397, 385]
  , [ 397, 409, 410, 398]
  , [ 398, 410, 411, 399]
  , [ 399, 411, 412, 400]
  , [ 400, 412, 413, 401]
  , [ 401, 413, 414, 402]
  , [ 402, 414, 415, 403]
  , [ 403, 415, 416, 404]
  , [ 404, 416, 417, 405]
  , [ 405, 417, 418, 406]
  , [ 406, 418, 419, 407]
  , [ 407, 419, 420, 408]
  , [ 408, 420, 409, 397]
  , [ 409, 421, 422, 410]
  , [ 410, 422, 423, 411]
  , [ 411, 423, 424, 412]
  , [ 412, 424, 425, 413]
  , [ 413, 425, 426, 414]
  , [ 414, 426, 427, 415]
  , [ 415, 427, 428, 416]
  , [ 416, 428, 429, 417]
  , [ 417, 429, 430, 418]
  , [ 418, 430, 431, 419]
  , [ 419, 431, 432, 420]
  , [ 420, 432, 421, 409]
  , [ 421, 433, 434, 422]
  , [ 422, 434, 435, 423]
  , [ 423, 435, 436, 424]
  , [ 424, 436, 437, 425]
  , [ 425, 437, 438, 426]
  , [ 426, 438, 439, 427]
  , [ 427, 439, 440, 428]
  , [ 428, 440, 441, 429]
  , [ 429, 441, 442, 430]
  , [ 430, 442, 443, 431]
  , [ 431, 443, 444, 432]
  , [ 432, 444, 433, 421]
  , [ 433, 445, 446, 434]
  , [ 434, 446, 447, 435]
  , [ 435, 447, 448, 436]
  , [ 436, 448, 449, 437]
  , [ 437, 449, 450, 438]
  , [ 438, 450, 451, 439]
  , [ 439, 451, 452, 440]
  , [ 440, 452, 453, 441]
  , [ 441, 453, 454, 442]
  , [ 442, 454, 455, 443]
  , [ 443, 455, 456, 444]
  , [ 444, 456, 445, 433]
  , [ 445, 457, 458, 446]
  , [ 446, 458, 459, 447]
  , [ 447, 459, 460, 448]
  , [ 448, 460, 461, 449]
  , [ 449, 461, 462, 450]
  , [ 450, 462, 463, 451]
  , [ 451, 463, 464, 452]
  , [ 452, 464, 465, 453]
  , [ 453, 465, 466, 454]
  , [ 454, 466, 467, 455]
  , [ 455, 467, 468, 456]
  , [ 456, 468, 457, 445]
  , [ 457, 469, 470, 458]
  , [ 458, 470, 471, 459]
  , [ 459, 471, 472, 460]
  , [ 460, 472, 473, 461]
  , [ 461, 473, 474, 462]
  , [ 462, 474, 475, 463]
  , [ 463, 475, 476, 464]
  , [ 464, 476, 477, 465]
  , [ 465, 477, 478, 466]
  , [ 466, 478, 479, 467]
  , [ 467, 479, 480, 468]
  , [ 468, 480, 469, 457]
  , [ 469, 481, 482, 470]
  , [ 470, 482, 483, 471]
  , [ 471, 483, 484, 472]
  , [ 472, 484, 485, 473]
  , [ 473, 485, 486, 474]
  , [ 474, 486, 487, 475]
  , [ 475, 487, 488, 476]
  , [ 476, 488, 489, 477]
  , [ 477, 489, 490, 478]
  , [ 478, 490, 491, 479]
  , [ 479, 491, 492, 480]
  , [ 480, 492, 481, 469]
  , [ 481, 493, 494, 482]
  , [ 482, 494, 495, 483]
  , [ 483, 495, 496, 484]
  , [ 484, 496, 497, 485]
  , [ 485, 497, 498, 486]
  , [ 486, 498, 499, 487]
  , [ 487, 499, 500, 488]
  , [ 488, 500, 501, 489]
  , [ 489, 501, 502, 490]
  , [ 490, 502, 503, 491]
  , [ 491, 503, 504, 492]
  , [ 492, 504, 493, 481]
  , [ 493, 505, 506, 494]
  , [ 494, 506, 507, 495]
  , [ 495, 507, 508, 496]
  , [ 496, 508, 509, 497]
  , [ 497, 509, 510, 498]
  , [ 498, 510, 511, 499]
  , [ 499, 511, 512, 500]
  , [ 500, 512, 513, 501]
  , [ 501, 513, 514, 502]
  , [ 502, 514, 515, 503]
  , [ 503, 515, 516, 504]
  , [ 504, 516, 505, 493]
  , [ 505, 517, 518, 506]
  , [ 506, 518, 519, 507]
  , [ 507, 519, 520, 508]
  , [ 508, 520, 521, 509]
  , [ 509, 521, 522, 510]
  , [ 510, 522, 523, 511]
  , [ 511, 523, 524, 512]
  , [ 512, 524, 525, 513]
  , [ 513, 525, 526, 514]
  , [ 514, 526, 527, 515]
  , [ 515, 527, 528, 516]
  , [ 516, 528, 517, 505]
  , [ 517, 529, 530, 518]
  , [ 518, 530, 531, 519]
  , [ 519, 531, 532, 520]
  , [ 520, 532, 533, 521]
  , [ 521, 533, 534, 522]
  , [ 522, 534, 535, 523]
  , [ 523, 535, 536, 524]
  , [ 524, 536, 537, 525]
  , [ 525, 537, 538, 526]
  , [ 526, 538, 539, 527]
  , [ 527, 539, 540, 528]
  , [ 528, 540, 529, 517]
  , [ 529, 541, 542, 530]
  , [ 530, 542, 543, 531]
  , [ 531, 543, 544, 532]
  , [ 532, 544, 545, 533]
  , [ 533, 545, 546, 534]
  , [ 534, 546, 547, 535]
  , [ 535, 547, 548, 536]
  , [ 536, 548, 549, 537]
  , [ 537, 549, 550, 538]
  , [ 538, 550, 551, 539]
  , [ 539, 551, 552, 540]
  , [ 540, 552, 541, 529]
  , [ 541, 553, 554, 542]
  , [ 542, 554, 555, 543]
  , [ 543, 555, 556, 544]
  , [ 544, 556, 557, 545]
  , [ 545, 557, 558, 546]
  , [ 546, 558, 559, 547]
  , [ 547, 559, 560, 548]
  , [ 548, 560, 561, 549]
  , [ 549, 561, 562, 550]
  , [ 550, 562, 563, 551]
  , [ 551, 563, 564, 552]
  , [ 552, 564, 553, 541]
  , [ 553, 565, 566, 554]
  , [ 554, 566, 567, 555]
  , [ 555, 567, 568, 556]
  , [ 556, 568, 569, 557]
  , [ 557, 569, 570, 558]
  , [ 558, 570, 571, 559]
  , [ 559, 571, 572, 560]
  , [ 560, 572, 573, 561]
  , [ 561, 573, 574, 562]
  , [ 562, 574, 575, 563]
  , [ 563, 575, 576, 564]
  , [ 564, 576, 565, 553]
  , [ 565, 1, 2, 566]
  , [ 566, 2, 3, 567]
  , [ 567, 3, 4, 568]
  , [ 568, 4, 5, 569]
  , [ 569, 5, 6, 570]
  , [ 570, 6, 7, 571]
  , [ 571, 7, 8, 572]
  , [ 572, 8, 9, 573]
  , [ 573, 9, 10, 574]
  , [ 574, 10, 11, 575]
  , [ 575, 11, 12, 576]
  , [ 576, 12, 1, 565]
  , [ 726, 578, 580, 727]
  , [ 727, 580, 582, 737]
  , [ 737, 582, 584, 747]
  , [ 747, 584, 586, 757]
  , [ 757, 586, 588, 767]
  , [ 767, 588, 590, 777]
  , [ 777, 590, 592, 787]
  , [ 787, 592, 594, 797]
  , [ 797, 594, 596, 807]
  , [ 807, 596, 598, 817]
  , [ 817, 598, 600, 827]
  , [ 827, 600, 602, 837]
  , [ 837, 602, 604, 847]
  , [ 847, 604, 606, 857]
  , [ 857, 606, 608, 867]
  , [ 867, 608, 610, 877]
  , [ 877, 610, 612, 887]
  , [ 887, 612, 614, 897]
  , [ 897, 614, 616, 907]
  , [ 907, 616, 618, 917]
  , [ 917, 618, 620, 927]
  , [ 927, 620, 622, 937]
  , [ 937, 622, 624, 947]
  , [ 947, 624, 626, 957]
  , [ 957, 626, 628, 967]
  , [ 967, 628, 630, 977]
  , [ 977, 630, 632, 987]
  , [ 987, 632, 634, 997]
  , [ 997, 634, 636, 1007]
  , [ 1007, 636, 638, 1017]
  , [ 580, 578, 640, 638, 636, 634, 632, 630, 628, 626, 624, 622, 620, 618, 616, 614, 612, 610, 608, 606, 604, 602, 600, 598, 596, 594, 592, 590, 588, 586, 584, 582]
  , [ 1027, 640, 578, 726]
  , [ 1017, 638, 640, 1027]
  , [ 577, 579, 581, 583, 585, 587, 589, 591, 593, 595, 597, 599, 601, 603, 605, 607, 609, 611, 613, 615, 617, 619, 621, 623, 625, 627, 629, 631, 633, 635, 637, 639]
  , [ 645, 646, 642, 641]
  , [ 646, 647, 643, 642]
  , [ 647, 648, 644, 643]
  , [ 648, 645, 641, 644]
  , [ 641, 642, 643, 644]
  , [ 648, 647, 646, 645]
  , [ 650, 682, 680, 678, 676, 674, 672, 670, 668, 666, 664, 662, 660, 658, 656, 654, 652]
  , [ 700, 702, 701, 699]
  , [ 685, 687, 689, 691, 693, 695, 697, 699, 701, 703, 705, 707, 709, 711, 713, 715, 683]
  , [ 659, 661, 663, 665, 667, 669, 671, 673, 675, 677, 679, 681, 649, 651, 653, 655, 657]
  , [ 684, 716, 714, 712, 710, 708, 706, 704, 702, 700, 698, 696, 694, 692, 690, 688, 686]
  , [ 667, 665, 683, 715]
  , [ 715, 713, 669, 667]
  , [ 713, 711, 671, 669]
  , [ 711, 709, 673, 671]
  , [ 709, 707, 675, 673]
  , [ 707, 705, 677, 675]
  , [ 705, 703, 679, 677]
  , [ 698, 652, 654, 696]
  , [ 697, 695, 678, 680]
  , [ 680, 682, 699, 697]
  , [ 695, 693, 676, 678]
  , [ 693, 691, 674, 676]
  , [ 691, 689, 672, 674]
  , [ 689, 687, 670, 672]
  , [ 687, 685, 668, 670]
  , [ 685, 683, 666, 668]
  , [ 698, 700, 652]
  , [ 684, 665, 663, 716]
  , [ 716, 663, 661, 714]
  , [ 714, 661, 659, 712]
  , [ 712, 659, 657, 710]
  , [ 710, 657, 655, 708]
  , [ 708, 655, 653, 706]
  , [ 706, 653, 651, 704]
  , [ 681, 679, 703, 701]
  , [ 684, 686, 664, 666]
  , [ 686, 688, 662, 664]
  , [ 688, 690, 660, 662]
  , [ 690, 692, 658, 660]
  , [ 692, 694, 656, 658]
  , [ 694, 696, 654, 656]
  , [ 704, 702, 651]
  , [ 577, 717, 736, 579]
  , [ 717, 718, 735, 736]
  , [ 718, 719, 734, 735]
  , [ 719, 720, 733, 734]
  , [ 720, 721, 732, 733]
  , [ 721, 722, 731, 732]
  , [ 722, 723, 730, 731]
  , [ 723, 724, 729, 730]
  , [ 724, 725, 728, 729]
  , [ 725, 726, 727, 728]
  , [ 579, 736, 746, 581]
  , [ 736, 735, 745, 746]
  , [ 735, 734, 744, 745]
  , [ 734, 733, 743, 744]
  , [ 733, 732, 742, 743]
  , [ 732, 731, 741, 742]
  , [ 731, 730, 740, 741]
  , [ 730, 729, 739, 740]
  , [ 729, 728, 738, 739]
  , [ 728, 727, 737, 738]
  , [ 581, 746, 756, 583]
  , [ 746, 745, 755, 756]
  , [ 745, 744, 754, 755]
  , [ 744, 743, 753, 754]
  , [ 743, 742, 752, 753]
  , [ 742, 741, 751, 752]
  , [ 741, 740, 750, 751]
  , [ 740, 739, 749, 750]
  , [ 739, 738, 748, 749]
  , [ 738, 737, 747, 748]
  , [ 583, 756, 766, 585]
  , [ 756, 755, 765, 766]
  , [ 755, 754, 764, 765]
  , [ 754, 753, 763, 764]
  , [ 753, 752, 762, 763]
  , [ 752, 751, 761, 762]
  , [ 751, 750, 760, 761]
  , [ 750, 749, 759, 760]
  , [ 749, 748, 758, 759]
  , [ 748, 747, 757, 758]
  , [ 585, 766, 776, 587]
  , [ 766, 765, 775, 776]
  , [ 765, 764, 774, 775]
  , [ 764, 763, 773, 774]
  , [ 763, 762, 772, 773]
  , [ 762, 761, 771, 772]
  , [ 761, 760, 770, 771]
  , [ 760, 759, 769, 770]
  , [ 759, 758, 768, 769]
  , [ 758, 757, 767, 768]
  , [ 587, 776, 786, 589]
  , [ 776, 775, 785, 786]
  , [ 775, 774, 784, 785]
  , [ 774, 773, 783, 784]
  , [ 773, 772, 782, 783]
  , [ 772, 771, 781, 782]
  , [ 771, 770, 780, 781]
  , [ 770, 769, 779, 780]
  , [ 769, 768, 778, 779]
  , [ 768, 767, 777, 778]
  , [ 589, 786, 796, 591]
  , [ 786, 785, 795, 796]
  , [ 785, 784, 794, 795]
  , [ 784, 783, 793, 794]
  , [ 783, 782, 792, 793]
  , [ 782, 781, 791, 792]
  , [ 781, 780, 790, 791]
  , [ 780, 779, 789, 790]
  , [ 779, 778, 788, 789]
  , [ 778, 777, 787, 788]
  , [ 591, 796, 806, 593]
  , [ 796, 795, 805, 806]
  , [ 795, 794, 804, 805]
  , [ 794, 793, 803, 804]
  , [ 793, 792, 802, 803]
  , [ 792, 791, 801, 802]
  , [ 791, 790, 800, 801]
  , [ 790, 789, 799, 800]
  , [ 789, 788, 798, 799]
  , [ 788, 787, 797, 798]
  , [ 593, 806, 816, 595]
  , [ 806, 805, 815, 816]
  , [ 805, 804, 814, 815]
  , [ 804, 803, 813, 814]
  , [ 803, 802, 812, 813]
  , [ 802, 801, 811, 812]
  , [ 801, 800, 810, 811]
  , [ 800, 799, 809, 810]
  , [ 799, 798, 808, 809]
  , [ 798, 797, 807, 808]
  , [ 595, 816, 826, 597]
  , [ 816, 815, 825, 826]
  , [ 815, 814, 824, 825]
  , [ 814, 813, 823, 824]
  , [ 813, 812, 822, 823]
  , [ 812, 811, 821, 822]
  , [ 811, 810, 820, 821]
  , [ 810, 809, 819, 820]
  , [ 809, 808, 818, 819]
  , [ 808, 807, 817, 818]
  , [ 597, 826, 836, 599]
  , [ 826, 825, 835, 836]
  , [ 825, 824, 834, 835]
  , [ 824, 823, 833, 834]
  , [ 823, 822, 832, 833]
  , [ 822, 821, 831, 832]
  , [ 821, 820, 830, 831]
  , [ 820, 819, 829, 830]
  , [ 819, 818, 828, 829]
  , [ 818, 817, 827, 828]
  , [ 599, 836, 846, 601]
  , [ 836, 835, 845, 846]
  , [ 835, 834, 844, 845]
  , [ 834, 833, 843, 844]
  , [ 833, 832, 842, 843]
  , [ 832, 831, 841, 842]
  , [ 831, 830, 840, 841]
  , [ 830, 829, 839, 840]
  , [ 829, 828, 838, 839]
  , [ 828, 827, 837, 838]
  , [ 601, 846, 856, 603]
  , [ 846, 845, 855, 856]
  , [ 845, 844, 854, 855]
  , [ 844, 843, 853, 854]
  , [ 843, 842, 852, 853]
  , [ 842, 841, 851, 852]
  , [ 841, 840, 850, 851]
  , [ 840, 839, 849, 850]
  , [ 839, 838, 848, 849]
  , [ 838, 837, 847, 848]
  , [ 603, 856, 866, 605]
  , [ 856, 855, 865, 866]
  , [ 855, 854, 864, 865]
  , [ 854, 853, 863, 864]
  , [ 853, 852, 862, 863]
  , [ 852, 851, 861, 862]
  , [ 851, 850, 860, 861]
  , [ 850, 849, 859, 860]
  , [ 849, 848, 858, 859]
  , [ 848, 847, 857, 858]
  , [ 605, 866, 876, 607]
  , [ 866, 865, 875, 876]
  , [ 865, 864, 874, 875]
  , [ 864, 863, 873, 874]
  , [ 863, 862, 872, 873]
  , [ 862, 861, 871, 872]
  , [ 861, 860, 870, 871]
  , [ 860, 859, 869, 870]
  , [ 859, 858, 868, 869]
  , [ 858, 857, 867, 868]
  , [ 607, 876, 886, 609]
  , [ 876, 875, 885, 886]
  , [ 875, 874, 884, 885]
  , [ 874, 873, 883, 884]
  , [ 873, 872, 882, 883]
  , [ 872, 871, 881, 882]
  , [ 871, 870, 880, 881]
  , [ 870, 869, 879, 880]
  , [ 869, 868, 878, 879]
  , [ 868, 867, 877, 878]
  , [ 609, 886, 896, 611]
  , [ 886, 885, 895, 896]
  , [ 885, 884, 894, 895]
  , [ 884, 883, 893, 894]
  , [ 883, 882, 892, 893]
  , [ 882, 881, 891, 892]
  , [ 881, 880, 890, 891]
  , [ 880, 879, 889, 890]
  , [ 879, 878, 888, 889]
  , [ 878, 877, 887, 888]
  , [ 611, 896, 906, 613]
  , [ 896, 895, 905, 906]
  , [ 895, 894, 904, 905]
  , [ 894, 893, 903, 904]
  , [ 893, 892, 902, 903]
  , [ 892, 891, 901, 902]
  , [ 891, 890, 900, 901]
  , [ 890, 889, 899, 900]
  , [ 889, 888, 898, 899]
  , [ 888, 887, 897, 898]
  , [ 613, 906, 916, 615]
  , [ 906, 905, 915, 916]
  , [ 905, 904, 914, 915]
  , [ 904, 903, 913, 914]
  , [ 903, 902, 912, 913]
  , [ 902, 901, 911, 912]
  , [ 901, 900, 910, 911]
  , [ 900, 899, 909, 910]
  , [ 899, 898, 908, 909]
  , [ 898, 897, 907, 908]
  , [ 615, 916, 926, 617]
  , [ 916, 915, 925, 926]
  , [ 915, 914, 924, 925]
  , [ 914, 913, 923, 924]
  , [ 913, 912, 922, 923]
  , [ 912, 911, 921, 922]
  , [ 911, 910, 920, 921]
  , [ 910, 909, 919, 920]
  , [ 909, 908, 918, 919]
  , [ 908, 907, 917, 918]
  , [ 617, 926, 936, 619]
  , [ 926, 925, 935, 936]
  , [ 925, 924, 934, 935]
  , [ 924, 923, 933, 934]
  , [ 923, 922, 932, 933]
  , [ 922, 921, 931, 932]
  , [ 921, 920, 930, 931]
  , [ 920, 919, 929, 930]
  , [ 919, 918, 928, 929]
  , [ 918, 917, 927, 928]
  , [ 619, 936, 946, 621]
  , [ 936, 935, 945, 946]
  , [ 935, 934, 944, 945]
  , [ 934, 933, 943, 944]
  , [ 933, 932, 942, 943]
  , [ 932, 931, 941, 942]
  , [ 931, 930, 940, 941]
  , [ 930, 929, 939, 940]
  , [ 929, 928, 938, 939]
  , [ 928, 927, 937, 938]
  , [ 621, 946, 956, 623]
  , [ 946, 945, 955, 956]
  , [ 945, 944, 954, 955]
  , [ 944, 943, 953, 954]
  , [ 943, 942, 952, 953]
  , [ 942, 941, 951, 952]
  , [ 941, 940, 950, 951]
  , [ 940, 939, 949, 950]
  , [ 939, 938, 948, 949]
  , [ 938, 937, 947, 948]
  , [ 623, 956, 966, 625]
  , [ 956, 955, 965, 966]
  , [ 955, 954, 964, 965]
  , [ 954, 953, 963, 964]
  , [ 953, 952, 962, 963]
  , [ 952, 951, 961, 962]
  , [ 951, 950, 960, 961]
  , [ 950, 949, 959, 960]
  , [ 949, 948, 958, 959]
  , [ 948, 947, 957, 958]
  , [ 625, 966, 976, 627]
  , [ 966, 965, 975, 976]
  , [ 965, 964, 974, 975]
  , [ 964, 963, 973, 974]
  , [ 963, 962, 972, 973]
  , [ 962, 961, 971, 972]
  , [ 961, 960, 970, 971]
  , [ 960, 959, 969, 970]
  , [ 959, 958, 968, 969]
  , [ 958, 957, 967, 968]
  , [ 627, 976, 986, 629]
  , [ 976, 975, 985, 986]
  , [ 975, 974, 984, 985]
  , [ 974, 973, 983, 984]
  , [ 973, 972, 982, 983]
  , [ 972, 971, 981, 982]
  , [ 971, 970, 980, 981]
  , [ 970, 969, 979, 980]
  , [ 969, 968, 978, 979]
  , [ 968, 967, 977, 978]
  , [ 629, 986, 996, 631]
  , [ 986, 985, 995, 996]
  , [ 985, 984, 994, 995]
  , [ 984, 983, 993, 994]
  , [ 983, 982, 992, 993]
  , [ 982, 981, 991, 992]
  , [ 981, 980, 990, 991]
  , [ 980, 979, 989, 990]
  , [ 979, 978, 988, 989]
  , [ 978, 977, 987, 988]
  , [ 631, 996, 1006, 633]
  , [ 996, 995, 1005, 1006]
  , [ 995, 994, 1004, 1005]
  , [ 994, 993, 1003, 1004]
  , [ 993, 992, 1002, 1003]
  , [ 992, 991, 1001, 1002]
  , [ 991, 990, 1000, 1001]
  , [ 990, 989, 999, 1000]
  , [ 989, 988, 998, 999]
  , [ 988, 987, 997, 998]
  , [ 633, 1006, 1016, 635]
  , [ 1006, 1005, 1015, 1016]
  , [ 1005, 1004, 1014, 1015]
  , [ 1004, 1003, 1013, 1014]
  , [ 1003, 1002, 1012, 1013]
  , [ 1002, 1001, 1011, 1012]
  , [ 1001, 1000, 1010, 1011]
  , [ 1000, 999, 1009, 1010]
  , [ 999, 998, 1008, 1009]
  , [ 998, 997, 1007, 1008]
  , [ 635, 1016, 1026, 637]
  , [ 1016, 1015, 1025, 1026]
  , [ 1015, 1014, 1024, 1025]
  , [ 1014, 1013, 1023, 1024]
  , [ 1013, 1012, 1022, 1023]
  , [ 1012, 1011, 1021, 1022]
  , [ 1011, 1010, 1020, 1021]
  , [ 1010, 1009, 1019, 1020]
  , [ 1009, 1008, 1018, 1019]
  , [ 1008, 1007, 1017, 1018]
  , [ 639, 1036, 717, 577]
  , [ 1036, 1035, 718, 717]
  , [ 1035, 1034, 719, 718]
  , [ 1034, 1033, 720, 719]
  , [ 1033, 1032, 721, 720]
  , [ 1032, 1031, 722, 721]
  , [ 1031, 1030, 723, 722]
  , [ 1030, 1029, 724, 723]
  , [ 1029, 1028, 725, 724]
  , [ 1028, 1027, 726, 725]
  , [ 637, 1026, 1036, 639]
  , [ 1026, 1025, 1035, 1036]
  , [ 1025, 1024, 1034, 1035]
  , [ 1024, 1023, 1033, 1034]
  , [ 1023, 1022, 1032, 1033]
  , [ 1022, 1021, 1031, 1032]
  , [ 1021, 1020, 1030, 1031]
  , [ 1020, 1019, 1029, 1030]
  , [ 1019, 1018, 1028, 1029]
  , [ 1018, 1017, 1027, 1028]
  ]
