module Generate.SimpleColumn (model) where

import Array exposing (Array)
import Math.Vector as Vector exposing (Vector)


model =
  { vertexPositions = vertexPositions
  , vertexIndexes = vertexIndexes
  }


vertexPositions : Array Vector
vertexPositions =
  Array.fromList
    [ Vector.vector 0 0 0
    , Vector.vector 9.550158 39.244259 0.109024
    , Vector.vector 9.282208 40.644257 0.109024
    , Vector.vector 6.500000 37.462269 -0.000000
    , Vector.vector 7.550158 37.244259 0.109024
    , Vector.vector 8.550159 37.512211 0.109024
    , Vector.vector 9.282208 38.244259 0.109024
    , Vector.vector 9.468884 39.244259 -1.130974
    , Vector.vector 9.203228 40.644257 -1.096000
    , Vector.vector 6.375104 37.462269 -1.268087
    , Vector.vector 7.485995 37.244259 -0.869922
    , Vector.vector 8.477440 37.512211 -1.000448
    , Vector.vector 9.203228 38.244259 -1.096000
    , Vector.vector 9.226454 39.244259 -2.349756
    , Vector.vector 8.967634 40.644257 -2.280406
    , Vector.vector 7.294602 37.244259 -1.832118
    , Vector.vector 8.260528 37.512211 -2.090937
    , Vector.vector 8.967634 38.244259 -2.280406
    , Vector.vector 8.827014 39.244259 -3.526467
    , Vector.vector 8.579461 40.644257 -3.423928
    , Vector.vector 6.005217 37.462269 -2.487442
    , Vector.vector 6.979255 37.244259 -2.761101
    , Vector.vector 7.903134 37.512211 -3.143784
    , Vector.vector 8.579461 38.244259 -3.423928
    , Vector.vector 8.277399 39.244259 -4.640976
    , Vector.vector 8.045348 40.644257 -4.507002
    , Vector.vector 5.404553 37.462269 -3.611206
    , Vector.vector 6.545348 37.244259 -3.640976
    , Vector.vector 7.411373 37.512211 -4.140976
    , Vector.vector 8.045348 38.244259 -4.507002
    , Vector.vector 7.587016 39.244259 -5.674209
    , Vector.vector 7.374437 40.644257 -5.511092
    , Vector.vector 6.000309 37.244259 -4.456686
    , Vector.vector 6.793662 37.512211 -5.065447
    , Vector.vector 7.374437 38.244259 -5.511092
    , Vector.vector 6.767672 39.244259 -6.608491
    , Vector.vector 6.578203 40.644257 -6.419022
    , Vector.vector 4.596194 37.462269 -4.596194
    , Vector.vector 5.353458 37.244259 -5.194277
    , Vector.vector 6.060565 37.512211 -5.901383
    , Vector.vector 6.578203 38.244259 -6.419022
    , Vector.vector 5.833393 39.244259 -7.427831
    , Vector.vector 5.670276 40.644257 -7.215253
    , Vector.vector 3.611207 37.462269 -5.404552
    , Vector.vector 4.615870 37.244259 -5.841125
    , Vector.vector 5.224631 37.512211 -6.634479
    , Vector.vector 5.670276 38.244259 -7.215253
    , Vector.vector 4.800158 39.244259 -8.118217
    , Vector.vector 4.666183 40.644257 -7.886167
    , Vector.vector 3.800157 37.244259 -6.386166
    , Vector.vector 4.300158 37.512211 -7.252192
    , Vector.vector 4.666183 38.244259 -7.886167
    , Vector.vector 3.685652 39.244259 -8.667830
    , Vector.vector 3.583112 40.644257 -8.420278
    , Vector.vector 2.487442 37.462269 -6.005217
    , Vector.vector 2.920285 37.244259 -6.820072
    , Vector.vector 3.302969 37.512211 -7.743951
    , Vector.vector 3.583112 38.244259 -8.420278
    , Vector.vector 2.508939 39.244259 -9.067270
    , Vector.vector 2.439588 40.644257 -8.808452
    , Vector.vector 1.268087 37.462269 -6.375104
    , Vector.vector 1.991300 37.244259 -7.135419
    , Vector.vector 2.250119 37.512211 -8.101345
    , Vector.vector 2.439588 38.244259 -8.808452
    , Vector.vector 1.290156 39.244259 -9.309702
    , Vector.vector 1.255181 40.644257 -9.044045
    , Vector.vector 1.029103 37.244259 -7.326813
    , Vector.vector 1.159629 37.512211 -8.318257
    , Vector.vector 1.255181 38.244259 -9.044045
    , Vector.vector 0.050159 39.244259 -9.390976
    , Vector.vector 0.050159 40.644257 -9.123028
    , Vector.vector 0.000000 37.462269 -6.500000
    , Vector.vector 0.050159 37.244259 -7.390976
    , Vector.vector 0.050158 37.512211 -8.390976
    , Vector.vector 0.050159 38.244259 -9.123028
    , Vector.vector -1.189843 39.244259 -9.309702
    , Vector.vector -1.154868 40.644257 -9.044045
    , Vector.vector -1.268077 37.462269 -6.375106
    , Vector.vector -0.928790 37.244259 -7.326812
    , Vector.vector -1.059317 37.512211 -8.318257
    , Vector.vector -1.154868 38.244259 -9.044045
    , Vector.vector -2.408622 39.244259 -9.067272
    , Vector.vector -2.339272 40.644257 -8.808453
    , Vector.vector -1.890984 37.244259 -7.135420
    , Vector.vector -2.149803 37.512211 -8.101347
    , Vector.vector -2.339272 38.244259 -8.808453
    , Vector.vector -3.585336 39.244259 -8.667831
    , Vector.vector -3.482796 40.644257 -8.420279
    , Vector.vector -2.487433 37.462269 -6.005220
    , Vector.vector -2.819969 37.244259 -6.820072
    , Vector.vector -3.202652 37.512211 -7.743951
    , Vector.vector -3.482796 38.244259 -8.420279
    , Vector.vector -4.699841 39.244259 -8.118218
    , Vector.vector -4.565866 40.644257 -7.886168
    , Vector.vector -3.611199 37.462269 -5.404557
    , Vector.vector -3.699841 37.244259 -6.386167
    , Vector.vector -4.199841 37.512211 -7.252192
    , Vector.vector -4.565866 38.244259 -7.886168
    , Vector.vector -5.733076 39.244259 -7.427832
    , Vector.vector -5.569959 40.644257 -7.215254
    , Vector.vector -4.515553 37.244259 -5.841125
    , Vector.vector -5.124314 37.512211 -6.634480
    , Vector.vector -5.569959 38.244259 -7.215254
    , Vector.vector -6.667357 39.244259 -6.608489
    , Vector.vector -6.477890 40.644257 -6.419020
    , Vector.vector -4.596188 37.462269 -4.596200
    , Vector.vector -5.253144 37.244259 -5.194275
    , Vector.vector -5.960251 37.512211 -5.901382
    , Vector.vector -6.477890 38.244259 -6.419020
    , Vector.vector -7.486698 39.244259 -5.674210
    , Vector.vector -7.274120 40.644257 -5.511092
    , Vector.vector -5.404548 37.462269 -3.611213
    , Vector.vector -5.899992 37.244259 -4.456686
    , Vector.vector -6.693346 37.512211 -5.065448
    , Vector.vector -7.274120 38.244259 -5.511092
    , Vector.vector -8.177082 39.244259 -4.640978
    , Vector.vector -7.945032 40.644257 -4.507003
    , Vector.vector -6.445032 37.244259 -3.640978
    , Vector.vector -7.311058 37.512211 -4.140978
    , Vector.vector -7.945032 38.244259 -4.507003
    , Vector.vector -8.726697 39.244259 -3.526469
    , Vector.vector -8.479144 40.644257 -3.423929
    , Vector.vector -6.005214 37.462269 -2.487449
    , Vector.vector -6.878938 37.244259 -2.761102
    , Vector.vector -7.802818 37.512211 -3.143785
    , Vector.vector -8.479144 38.244259 -3.423929
    , Vector.vector -9.126138 39.244259 -2.349756
    , Vector.vector -8.867319 40.644257 -2.280405
    , Vector.vector -6.375103 37.462269 -1.268094
    , Vector.vector -7.194286 37.244259 -1.832118
    , Vector.vector -8.160213 37.512211 -2.090937
    , Vector.vector -8.867319 38.244259 -2.280405
    , Vector.vector -9.368568 39.244259 -1.130976
    , Vector.vector -9.102912 40.644257 -1.096001
    , Vector.vector -7.385679 37.244259 -0.869923
    , Vector.vector -8.377124 37.512211 -1.000449
    , Vector.vector -9.102912 38.244259 -1.096001
    , Vector.vector -9.449842 39.244259 0.109024
    , Vector.vector -9.181892 40.644257 0.109024
    , Vector.vector -6.500000 37.462269 -0.000006
    , Vector.vector -7.449842 37.244259 0.109024
    , Vector.vector -8.449842 37.512211 0.109024
    , Vector.vector -9.181892 38.244259 0.109024
    , Vector.vector -9.368568 39.244259 1.349025
    , Vector.vector -9.102912 40.644257 1.314050
    , Vector.vector -6.375105 37.462269 1.268081
    , Vector.vector -7.385679 37.244259 1.087972
    , Vector.vector -8.377124 37.512211 1.218498
    , Vector.vector -9.102912 38.244259 1.314050
    , Vector.vector -9.126138 39.244259 2.567804
    , Vector.vector -8.867319 40.644257 2.498454
    , Vector.vector -7.194286 37.244259 2.050166
    , Vector.vector -8.160213 37.512211 2.308985
    , Vector.vector -8.867319 38.244259 2.498454
    , Vector.vector -8.726699 39.244259 3.744514
    , Vector.vector -8.479146 40.644257 3.641974
    , Vector.vector -6.005219 37.462269 2.487437
    , Vector.vector -6.878939 37.244259 2.979147
    , Vector.vector -7.802819 37.512211 3.361830
    , Vector.vector -8.479146 38.244259 3.641974
    , Vector.vector -8.177084 39.244259 4.859023
    , Vector.vector -7.945034 40.644257 4.725048
    , Vector.vector -5.404554 37.462269 3.611202
    , Vector.vector -6.445034 37.244259 3.859023
    , Vector.vector -7.311059 37.512211 4.359023
    , Vector.vector -7.945034 38.244259 4.725048
    , Vector.vector -7.486698 39.244259 5.892258
    , Vector.vector -7.274120 40.644257 5.729141
    , Vector.vector -5.899992 37.244259 4.674735
    , Vector.vector -6.693346 37.512211 5.283496
    , Vector.vector -7.274120 38.244259 5.729141
    , Vector.vector -6.667357 39.244259 6.826537
    , Vector.vector -6.477890 40.644257 6.637068
    , Vector.vector -4.596197 37.462269 4.596191
    , Vector.vector -5.253144 37.244259 5.412323
    , Vector.vector -5.960251 37.512211 6.119430
    , Vector.vector -6.477890 38.244259 6.637068
    , Vector.vector -5.733080 39.244259 7.645878
    , Vector.vector -5.569963 40.644257 7.433300
    , Vector.vector -3.611210 37.462269 5.404551
    , Vector.vector -4.515555 37.244259 6.059172
    , Vector.vector -5.124319 37.512211 6.852526
    , Vector.vector -5.569963 38.244259 7.433300
    , Vector.vector -4.699841 39.244259 8.336267
    , Vector.vector -4.565866 40.644257 8.104216
    , Vector.vector -3.699841 37.244259 6.604215
    , Vector.vector -4.199841 37.512211 7.470241
    , Vector.vector -4.565866 38.244259 8.104216
    , Vector.vector -3.585336 39.244259 8.885880
    , Vector.vector -3.482796 40.644257 8.638327
    , Vector.vector -2.487445 37.462269 6.005216
    , Vector.vector -2.819969 37.244259 7.038121
    , Vector.vector -3.202652 37.512211 7.962000
    , Vector.vector -3.482796 38.244259 8.638327
    , Vector.vector -2.408626 39.244259 9.285318
    , Vector.vector -2.339275 40.644257 9.026500
    , Vector.vector -1.268090 37.462269 6.375103
    , Vector.vector -1.890987 37.244259 7.353467
    , Vector.vector -2.149807 37.512211 8.319393
    , Vector.vector -2.339275 38.244259 9.026500
    , Vector.vector -1.189847 39.244259 9.527750
    , Vector.vector -1.154872 40.644257 9.262093
    , Vector.vector -0.928793 37.244259 7.544860
    , Vector.vector -1.059320 37.512211 8.536305
    , Vector.vector -1.154872 38.244259 9.262093
    , Vector.vector 0.050159 39.244259 9.609024
    , Vector.vector 0.050159 40.644257 9.341076
    , Vector.vector -0.000002 37.462269 6.500000
    , Vector.vector 0.050159 37.244259 7.609024
    , Vector.vector 0.050158 37.512211 8.609026
    , Vector.vector 0.050159 38.244259 9.341076
    , Vector.vector 1.290156 39.244259 9.527750
    , Vector.vector 1.255181 40.644257 9.262094
    , Vector.vector 1.268085 37.462269 6.375104
    , Vector.vector 1.029103 37.244259 7.544861
    , Vector.vector 1.159629 37.512211 8.536305
    , Vector.vector 1.255181 38.244259 9.262094
    , Vector.vector 2.508934 39.244259 9.285321
    , Vector.vector 2.439584 40.644257 9.026501
    , Vector.vector 1.991297 37.244259 7.353469
    , Vector.vector 2.250116 37.512211 8.319395
    , Vector.vector 2.439584 38.244259 9.026501
    , Vector.vector 3.685652 39.244259 8.885879
    , Vector.vector 3.583112 40.644257 8.638326
    , Vector.vector 2.487441 37.462269 6.005218
    , Vector.vector 2.920285 37.244259 7.038120
    , Vector.vector 3.302969 37.512211 7.961999
    , Vector.vector 3.583112 38.244259 8.638326
    , Vector.vector 4.800158 39.244259 8.336266
    , Vector.vector 4.666183 40.644257 8.104215
    , Vector.vector 3.611206 37.462269 5.404553
    , Vector.vector 3.800157 37.244259 6.604215
    , Vector.vector 4.300158 37.512211 7.470241
    , Vector.vector 4.666183 38.244259 8.104215
    , Vector.vector 5.833390 39.244259 7.645883
    , Vector.vector 5.670273 40.644257 7.433305
    , Vector.vector 4.615868 37.244259 6.059175
    , Vector.vector 5.224628 37.512211 6.852529
    , Vector.vector 5.670273 38.244259 7.433305
    , Vector.vector 6.767669 39.244259 6.826543
    , Vector.vector 6.578200 40.644257 6.637074
    , Vector.vector 4.596194 37.462269 4.596194
    , Vector.vector 5.353456 37.244259 5.412328
    , Vector.vector 6.060563 37.512211 6.119436
    , Vector.vector 6.578200 38.244259 6.637074
    , Vector.vector 7.587016 39.244259 5.892258
    , Vector.vector 7.374437 40.644257 5.729140
    , Vector.vector 5.404553 37.462269 3.611206
    , Vector.vector 6.000309 37.244259 4.674735
    , Vector.vector 6.793662 37.512211 5.283496
    , Vector.vector 7.374437 38.244259 5.729140
    , Vector.vector 8.277399 39.244259 4.859025
    , Vector.vector 8.045348 40.644257 4.725050
    , Vector.vector 6.545348 37.244259 3.859025
    , Vector.vector 7.411373 37.512211 4.359025
    , Vector.vector 8.045348 38.244259 4.725050
    , Vector.vector 8.827012 39.244259 3.744521
    , Vector.vector 8.579459 40.644257 3.641981
    , Vector.vector 6.005217 37.462269 2.487441
    , Vector.vector 6.979253 37.244259 2.979153
    , Vector.vector 7.903133 37.512211 3.361837
    , Vector.vector 8.579459 38.244259 3.641981
    , Vector.vector 9.226454 39.244259 2.567803
    , Vector.vector 8.967634 40.644257 2.498452
    , Vector.vector 6.375104 37.462269 1.268086
    , Vector.vector 7.294602 37.244259 2.050165
    , Vector.vector 8.260529 37.512211 2.308984
    , Vector.vector 8.967634 38.244259 2.498452
    , Vector.vector 9.468884 39.244259 1.349023
    , Vector.vector 9.203228 40.644257 1.314049
    , Vector.vector 7.485995 37.244259 1.087971
    , Vector.vector 8.477440 37.512211 1.218497
    , Vector.vector 9.203228 38.244259 1.314049
    , Vector.vector -0.000000 -42.537731 -8.449999
    , Vector.vector 1.648513 -42.537731 -8.287635
    , Vector.vector 3.233675 -42.537731 -7.806781
    , Vector.vector 4.694568 -42.537731 -7.025917
    , Vector.vector 5.975051 -42.537731 -5.975051
    , Vector.vector 7.025918 -42.537731 -4.694567
    , Vector.vector 7.806782 -42.537731 -3.233674
    , Vector.vector 8.287635 -42.537731 -1.648513
    , Vector.vector 8.449999 -42.537731 -0.000000
    , Vector.vector 8.287635 -42.537731 1.648513
    , Vector.vector 7.806782 -42.537731 3.233674
    , Vector.vector 7.025918 -42.537731 4.694569
    , Vector.vector 5.975051 -42.537731 5.975053
    , Vector.vector 4.694568 -42.537731 7.025919
    , Vector.vector 3.233673 -42.537731 7.806783
    , Vector.vector 1.648511 -42.537731 8.287636
    , Vector.vector -0.000003 -42.537731 8.450000
    , Vector.vector -1.648517 -42.537731 8.287635
    , Vector.vector -3.233679 -42.537731 7.806780
    , Vector.vector -4.694572 -42.537731 7.025916
    , Vector.vector -5.975056 -42.537731 5.975049
    , Vector.vector -7.025921 -42.537731 4.694564
    , Vector.vector -7.806784 -42.537731 3.233669
    , Vector.vector -8.287636 -42.537731 1.648506
    , Vector.vector -8.450000 -42.537731 -0.000008
    , Vector.vector -8.287634 -42.537731 -1.648521
    , Vector.vector -7.806778 -42.537731 -3.233683
    , Vector.vector -7.025912 -42.537731 -4.694576
    , Vector.vector -5.975044 -42.537731 -5.975059
    , Vector.vector -4.694559 -42.537731 -7.025923
    , Vector.vector -3.233664 -42.537731 -7.806786
    , Vector.vector -1.648501 -42.537731 -8.287637
    , Vector.vector -9.999999 -50.000000 9.999998
    , Vector.vector -9.999999 -50.000000 -10.000002
    , Vector.vector 10.000000 -50.000000 -10.000002
    , Vector.vector 10.000000 -50.000000 9.999998
    , Vector.vector -9.999999 -42.666267 9.999998
    , Vector.vector -9.999999 -42.666267 -10.000002
    , Vector.vector 10.000000 -42.666267 -10.000002
    , Vector.vector 10.000000 -42.666267 9.999998
    , Vector.vector -10.009957 50.000004 -10.000743
    , Vector.vector 9.990043 50.000004 -10.000745
    , Vector.vector -10.009957 48.049103 -9.808596
    , Vector.vector 9.990043 48.049103 -9.808598
    , Vector.vector -10.009956 46.173172 -9.239538
    , Vector.vector 9.990043 46.173172 -9.239541
    , Vector.vector -10.009957 44.444305 -8.315439
    , Vector.vector 9.990044 44.444305 -8.315441
    , Vector.vector -10.009956 42.928940 -7.071812
    , Vector.vector 9.990044 42.928940 -7.071814
    , Vector.vector -10.009955 41.685310 -5.556446
    , Vector.vector 9.990044 41.685310 -5.556448
    , Vector.vector -10.009955 40.761208 -3.827578
    , Vector.vector 9.990044 40.761208 -3.827581
    , Vector.vector -10.009955 40.192150 -1.951648
    , Vector.vector 9.990044 40.192150 -1.951650
    , Vector.vector -10.009955 40.000004 -0.000745
    , Vector.vector 9.990045 40.000004 -0.000748
    , Vector.vector -10.009955 40.192150 1.950158
    , Vector.vector 9.990045 40.192150 1.950155
    , Vector.vector -10.009955 40.761208 3.826089
    , Vector.vector 9.990045 40.761208 3.826086
    , Vector.vector -10.009955 41.685310 5.554958
    , Vector.vector 9.990045 41.685310 5.554955
    , Vector.vector -10.009955 42.928932 7.070324
    , Vector.vector 9.990045 42.928940 7.070322
    , Vector.vector -10.009954 44.444305 8.313953
    , Vector.vector 9.990045 44.444305 8.313951
    , Vector.vector -10.009954 46.173172 9.238053
    , Vector.vector 9.990045 46.173172 9.238050
    , Vector.vector -10.009955 48.049103 9.807111
    , Vector.vector 9.990045 48.049103 9.807108
    , Vector.vector -10.009955 50.000004 9.999257
    , Vector.vector 9.990045 50.000008 9.999255
    , Vector.vector -0.009956 40.000004 9.999252
    , Vector.vector -0.009956 40.000008 -10.000749
    , Vector.vector 1.940947 40.192154 9.999252
    , Vector.vector 1.940947 40.192154 -10.000749
    , Vector.vector 3.816878 40.761215 9.999252
    , Vector.vector 3.816878 40.761215 -10.000749
    , Vector.vector 5.545746 41.685310 9.999254
    , Vector.vector 5.545746 41.685310 -10.000749
    , Vector.vector 7.061111 42.928940 9.999252
    , Vector.vector 7.061111 42.928940 -10.000748
    , Vector.vector 8.304740 44.444305 9.999254
    , Vector.vector 8.304740 44.444309 -10.000748
    , Vector.vector 9.228839 46.173172 9.999254
    , Vector.vector 9.228839 46.173176 -10.000748
    , Vector.vector 9.797896 48.049103 9.999254
    , Vector.vector 9.797896 48.049107 -10.000748
    , Vector.vector 9.990044 50.000008 -10.000748
    , Vector.vector -10.009956 49.999996 9.999254
    , Vector.vector -10.009956 50.000000 -10.000748
    , Vector.vector -9.817807 48.049091 9.999252
    , Vector.vector -9.817807 48.049091 -10.000748
    , Vector.vector -9.248747 46.173164 9.999254
    , Vector.vector -9.248747 46.173168 -10.000748
    , Vector.vector -8.324646 44.444294 9.999252
    , Vector.vector -8.324646 44.444298 -10.000748
    , Vector.vector -7.081015 42.928928 9.999252
    , Vector.vector -7.081015 42.928928 -10.000748
    , Vector.vector -5.565648 41.685303 9.999252
    , Vector.vector -5.565648 41.685303 -10.000749
    , Vector.vector -3.836777 40.761208 9.999252
    , Vector.vector -3.836777 40.761208 -10.000749
    , Vector.vector -1.960845 40.192150 9.999252
    , Vector.vector -1.960845 40.192150 -10.000749
    , Vector.vector 5.849701 -35.265003 -5.849700
    ]


vertexIndexes : List (List Int)
vertexIndexes =
  [ []
  , [ 1, 7, 8, 2]
  , [ 3, 9, 10, 4]
  , [ 4, 10, 11, 5]
  , [ 5, 11, 12, 6]
  , [ 1, 6, 12, 7]
  , [ 7, 13, 14, 8]
  , [ 10, 15, 16, 11]
  , [ 11, 16, 17, 12]
  , [ 12, 17, 13, 7]
  , [ 13, 18, 19, 14]
  , [ 15, 21, 22, 16]
  , [ 16, 22, 23, 17]
  , [ 17, 23, 18, 13]
  , [ 18, 24, 25, 19]
  , [ 20, 26, 27, 21]
  , [ 21, 27, 28, 22]
  , [ 22, 28, 29, 23]
  , [ 23, 29, 24, 18]
  , [ 24, 30, 31, 25]
  , [ 276, 43, 37, 277]
  , [ 27, 32, 33, 28]
  , [ 28, 33, 34, 29]
  , [ 29, 34, 30, 24]
  , [ 30, 35, 36, 31]
  , [ 60, 71, 72, 66]
  , [ 32, 38, 39, 33]
  , [ 33, 39, 40, 34]
  , [ 34, 40, 35, 30]
  , [ 35, 41, 42, 36]
  , [ 37, 43, 44, 38]
  , [ 38, 44, 45, 39]
  , [ 39, 45, 46, 40]
  , [ 40, 46, 41, 35]
  , [ 41, 47, 48, 42]
  , [ 77, 88, 89, 83]
  , [ 44, 49, 50, 45]
  , [ 45, 50, 51, 46]
  , [ 46, 51, 47, 41]
  , [ 47, 52, 53, 48]
  , [ 274, 60, 54, 275]
  , [ 49, 55, 56, 50]
  , [ 50, 56, 57, 51]
  , [ 51, 57, 52, 47]
  , [ 52, 58, 59, 53]
  , [ 54, 60, 61, 55]
  , [ 55, 61, 62, 56]
  , [ 56, 62, 63, 57]
  , [ 57, 63, 58, 52]
  , [ 58, 64, 65, 59]
  , [ 94, 105, 106, 100]
  , [ 61, 66, 67, 62]
  , [ 62, 67, 68, 63]
  , [ 63, 68, 64, 58]
  , [ 64, 69, 70, 65]
  , [ 304, 77, 71, 273]
  , [ 66, 72, 73, 67]
  , [ 67, 73, 74, 68]
  , [ 68, 74, 69, 64]
  , [ 69, 75, 76, 70]
  , [ 71, 77, 78, 72]
  , [ 72, 78, 79, 73]
  , [ 73, 79, 80, 74]
  , [ 74, 80, 75, 69]
  , [ 75, 81, 82, 76]
  , [ 111, 122, 123, 117]
  , [ 78, 83, 84, 79]
  , [ 79, 84, 85, 80]
  , [ 80, 85, 81, 75]
  , [ 81, 86, 87, 82]
  , [ 302, 94, 88, 303]
  , [ 83, 89, 90, 84]
  , [ 84, 90, 91, 85]
  , [ 85, 91, 86, 81]
  , [ 86, 92, 93, 87]
  , [ 88, 94, 95, 89]
  , [ 89, 95, 96, 90]
  , [ 90, 96, 97, 91]
  , [ 91, 97, 92, 86]
  , [ 92, 98, 99, 93]
  , [ 128, 139, 140, 134]
  , [ 95, 100, 101, 96]
  , [ 96, 101, 102, 97]
  , [ 97, 102, 98, 92]
  , [ 98, 103, 104, 99]
  , [ 300, 111, 105, 301]
  , [ 100, 106, 107, 101]
  , [ 101, 107, 108, 102]
  , [ 102, 108, 103, 98]
  , [ 103, 109, 110, 104]
  , [ 105, 111, 112, 106]
  , [ 106, 112, 113, 107]
  , [ 107, 113, 114, 108]
  , [ 108, 114, 109, 103]
  , [ 109, 115, 116, 110]
  , [ 145, 156, 157, 151]
  , [ 112, 117, 118, 113]
  , [ 113, 118, 119, 114]
  , [ 114, 119, 115, 109]
  , [ 115, 120, 121, 116]
  , [ 298, 128, 122, 299]
  , [ 117, 123, 124, 118]
  , [ 118, 124, 125, 119]
  , [ 119, 125, 120, 115]
  , [ 120, 126, 127, 121]
  , [ 122, 128, 129, 123]
  , [ 123, 129, 130, 124]
  , [ 124, 130, 131, 125]
  , [ 125, 131, 126, 120]
  , [ 126, 132, 133, 127]
  , [ 162, 173, 174, 168]
  , [ 129, 134, 135, 130]
  , [ 130, 135, 136, 131]
  , [ 131, 136, 132, 126]
  , [ 132, 137, 138, 133]
  , [ 296, 145, 139, 297]
  , [ 134, 140, 141, 135]
  , [ 135, 141, 142, 136]
  , [ 136, 142, 137, 132]
  , [ 137, 143, 144, 138]
  , [ 139, 145, 146, 140]
  , [ 140, 146, 147, 141]
  , [ 141, 147, 148, 142]
  , [ 142, 148, 143, 137]
  , [ 143, 149, 150, 144]
  , [ 179, 190, 191, 185]
  , [ 146, 151, 152, 147]
  , [ 147, 152, 153, 148]
  , [ 148, 153, 149, 143]
  , [ 149, 154, 155, 150]
  , [ 294, 162, 156, 295]
  , [ 151, 157, 158, 152]
  , [ 152, 158, 159, 153]
  , [ 153, 159, 154, 149]
  , [ 154, 160, 161, 155]
  , [ 156, 162, 163, 157]
  , [ 157, 163, 164, 158]
  , [ 158, 164, 165, 159]
  , [ 159, 165, 160, 154]
  , [ 160, 166, 167, 161]
  , [ 196, 207, 208, 202]
  , [ 163, 168, 169, 164]
  , [ 164, 169, 170, 165]
  , [ 165, 170, 166, 160]
  , [ 166, 171, 172, 167]
  , [ 292, 179, 173, 293]
  , [ 168, 174, 175, 169]
  , [ 169, 175, 176, 170]
  , [ 170, 176, 171, 166]
  , [ 171, 177, 178, 172]
  , [ 173, 179, 180, 174]
  , [ 174, 180, 181, 175]
  , [ 175, 181, 182, 176]
  , [ 176, 182, 177, 171]
  , [ 177, 183, 184, 178]
  , [ 213, 224, 225, 219]
  , [ 180, 185, 186, 181]
  , [ 181, 186, 187, 182]
  , [ 182, 187, 183, 177]
  , [ 183, 188, 189, 184]
  , [ 290, 196, 190, 291]
  , [ 185, 191, 192, 186]
  , [ 186, 192, 193, 187]
  , [ 187, 193, 188, 183]
  , [ 188, 194, 195, 189]
  , [ 190, 196, 197, 191]
  , [ 191, 197, 198, 192]
  , [ 192, 198, 199, 193]
  , [ 193, 199, 194, 188]
  , [ 194, 200, 201, 195]
  , [ 230, 241, 242, 236]
  , [ 197, 202, 203, 198]
  , [ 198, 203, 204, 199]
  , [ 199, 204, 200, 194]
  , [ 200, 205, 206, 201]
  , [ 288, 213, 207, 289]
  , [ 202, 208, 209, 203]
  , [ 203, 209, 210, 204]
  , [ 204, 210, 205, 200]
  , [ 205, 211, 212, 206]
  , [ 207, 213, 214, 208]
  , [ 208, 214, 215, 209]
  , [ 209, 215, 216, 210]
  , [ 210, 216, 211, 205]
  , [ 211, 217, 218, 212]
  , [ 247, 258, 259, 253]
  , [ 214, 219, 220, 215]
  , [ 215, 220, 221, 216]
  , [ 216, 221, 217, 211]
  , [ 217, 222, 223, 218]
  , [ 286, 230, 224, 287]
  , [ 219, 225, 226, 220]
  , [ 220, 226, 227, 221]
  , [ 221, 227, 222, 217]
  , [ 222, 228, 229, 223]
  , [ 224, 230, 231, 225]
  , [ 225, 231, 232, 226]
  , [ 226, 232, 233, 227]
  , [ 227, 233, 228, 222]
  , [ 228, 234, 235, 229]
  , [ 283, 258, 247, 284]
  , [ 231, 236, 237, 232]
  , [ 232, 237, 238, 233]
  , [ 233, 238, 234, 228]
  , [ 234, 239, 240, 235]
  , [ 284, 247, 241, 285]
  , [ 236, 242, 243, 237]
  , [ 237, 243, 244, 238]
  , [ 238, 244, 239, 234]
  , [ 239, 245, 246, 240]
  , [ 241, 247, 248, 242]
  , [ 242, 248, 249, 243]
  , [ 243, 249, 250, 244]
  , [ 244, 250, 245, 239]
  , [ 245, 251, 252, 246]
  , [ 248, 253, 254, 249]
  , [ 249, 254, 255, 250]
  , [ 250, 255, 251, 245]
  , [ 251, 256, 257, 252]
  , [ 253, 259, 260, 254]
  , [ 254, 260, 261, 255]
  , [ 255, 261, 256, 251]
  , [ 256, 262, 263, 257]
  , [ 258, 264, 265, 259]
  , [ 259, 265, 266, 260]
  , [ 260, 266, 267, 261]
  , [ 261, 267, 262, 256]
  , [ 262, 268, 269, 263]
  , [ 280, 9, 3, 281]
  , [ 265, 270, 271, 266]
  , [ 266, 271, 272, 267]
  , [ 267, 272, 268, 262]
  , [ 268, 1, 2, 269]
  , [ 26, 37, 38, 32]
  , [ 270, 4, 5, 271]
  , [ 271, 5, 6, 272]
  , [ 272, 6, 1, 268]
  , [ 60, 66, 61]
  , [ 43, 54, 55, 49]
  , [ 277, 37, 26, 278]
  , [ 26, 32, 27]
  , [ 9, 20, 21, 15]
  , [ 281, 3, 264, 282]
  , [ 264, 3, 4, 270]
  , [ 264, 270, 265]
  , [ 247, 253, 248]
  , [ 285, 241, 230, 286]
  , [ 230, 236, 231]
  , [ 287, 224, 213, 288]
  , [ 213, 219, 214]
  , [ 289, 207, 196, 290]
  , [ 196, 202, 197]
  , [ 291, 190, 179, 292]
  , [ 179, 185, 180]
  , [ 293, 173, 162, 294]
  , [ 162, 168, 163]
  , [ 295, 156, 145, 296]
  , [ 145, 151, 146]
  , [ 297, 139, 128, 298]
  , [ 128, 134, 129]
  , [ 299, 122, 111, 300]
  , [ 111, 117, 112]
  , [ 301, 105, 94, 302]
  , [ 94, 100, 95]
  , [ 77, 83, 78]
  , [ 303, 88, 77, 304]
  , [ 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304]
  , [ 309, 310, 306, 305]
  , [ 310, 311, 307, 306]
  , [ 311, 312, 308, 307]
  , [ 312, 309, 305, 308]
  , [ 305, 306, 307, 308]
  , [ 312, 311, 310, 309]
  , [ 314, 346, 344, 342, 340, 338, 336, 334, 332, 330, 328, 326, 324, 322, 320, 318, 316]
  , [ 323, 325, 327, 329, 331, 333, 335, 337, 339, 341, 343, 345, 313, 315, 317, 319, 321]
  , [ 348, 379, 377, 375, 373, 371, 369, 367, 365, 363, 362, 360, 358, 356, 354, 352, 350]
  , [ 331, 329, 347, 378]
  , [ 378, 376, 333, 331]
  , [ 376, 374, 335, 333]
  , [ 374, 372, 337, 335]
  , [ 372, 370, 339, 337]
  , [ 370, 368, 341, 339]
  , [ 368, 366, 343, 341]
  , [ 362, 316, 318, 360]
  , [ 361, 359, 342, 344]
  , [ 359, 357, 340, 342]
  , [ 357, 355, 338, 340]
  , [ 355, 353, 336, 338]
  , [ 353, 351, 334, 336]
  , [ 351, 349, 332, 334]
  , [ 349, 347, 330, 332]
  , [ 362, 363, 316]
  , [ 348, 329, 327, 379]
  , [ 379, 327, 325, 377]
  , [ 377, 325, 323, 375]
  , [ 375, 323, 321, 373]
  , [ 373, 321, 319, 371]
  , [ 371, 319, 317, 369]
  , [ 369, 317, 315, 367]
  , [ 345, 343, 366, 364]
  , [ 348, 350, 328, 330]
  , [ 350, 352, 326, 328]
  , [ 352, 354, 324, 326]
  , [ 354, 356, 322, 324]
  , [ 356, 358, 320, 322]
  , [ 358, 360, 318, 320]
  , [ 367, 365, 315]
  , [ 273, 71, 60, 274]
  , [ 9, 15, 10]
  , [ 282, 264, 258, 283]
  , [ 279, 20, 9, 280]
  , [ 275, 54, 43, 276]
  , [ 43, 49, 44]
  , [ 278, 26, 20, 279]
  , [ 329, 348, 330, 347]
  , [ 349, 351, 353, 355, 357, 359, 361, 346, 364, 366, 368, 370, 372, 374, 376, 378, 347]
  , [ 344, 346, 361]
  , [ 363, 313, 364, 346]
  ]
