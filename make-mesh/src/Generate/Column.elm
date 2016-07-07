module Generate.Column exposing (model)

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
        , Vector.vector 6.5 37.462269 -0.0
        , Vector.vector 7.550158 37.244259 0.109024
        , Vector.vector 8.550159 37.512211 0.109024
        , Vector.vector 9.282208 38.244259 0.109024
        , Vector.vector 9.468884 39.244259 -1.130974
        , Vector.vector 9.203228 40.644257 -1.096
        , Vector.vector 6.375104 37.462269 -1.268087
        , Vector.vector 7.485995 37.244259 -0.869922
        , Vector.vector 8.47744 37.512211 -1.000448
        , Vector.vector 9.203228 38.244259 -1.096
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
        , Vector.vector 4.61587 37.244259 -5.841125
        , Vector.vector 5.224631 37.512211 -6.634479
        , Vector.vector 5.670276 38.244259 -7.215253
        , Vector.vector 4.800158 39.244259 -8.118217
        , Vector.vector 4.666183 40.644257 -7.886167
        , Vector.vector 3.800157 37.244259 -6.386166
        , Vector.vector 4.300158 37.512211 -7.252192
        , Vector.vector 4.666183 38.244259 -7.886167
        , Vector.vector 3.685652 39.244259 -8.66783
        , Vector.vector 3.583112 40.644257 -8.420278
        , Vector.vector 2.487442 37.462269 -6.005217
        , Vector.vector 2.920285 37.244259 -6.820072
        , Vector.vector 3.302969 37.512211 -7.743951
        , Vector.vector 3.583112 38.244259 -8.420278
        , Vector.vector 2.508939 39.244259 -9.06727
        , Vector.vector 2.439588 40.644257 -8.808452
        , Vector.vector 1.268087 37.462269 -6.375104
        , Vector.vector 1.9913 37.244259 -7.135419
        , Vector.vector 2.250119 37.512211 -8.101345
        , Vector.vector 2.439588 38.244259 -8.808452
        , Vector.vector 1.290156 39.244259 -9.309702
        , Vector.vector 1.255181 40.644257 -9.044045
        , Vector.vector 1.029103 37.244259 -7.326813
        , Vector.vector 1.159629 37.512211 -8.318257
        , Vector.vector 1.255181 38.244259 -9.044045
        , Vector.vector 0.050159 39.244259 -9.390976
        , Vector.vector 0.050159 40.644257 -9.123028
        , Vector.vector 0.0 37.462269 -6.5
        , Vector.vector 0.050159 37.244259 -7.390976
        , Vector.vector 0.050158 37.512211 -8.390976
        , Vector.vector 0.050159 38.244259 -9.123028
        , Vector.vector -1.189843 39.244259 -9.309702
        , Vector.vector -1.154868 40.644257 -9.044045
        , Vector.vector -1.268077 37.462269 -6.375106
        , Vector.vector -0.92879 37.244259 -7.326812
        , Vector.vector -1.059317 37.512211 -8.318257
        , Vector.vector -1.154868 38.244259 -9.044045
        , Vector.vector -2.408622 39.244259 -9.067272
        , Vector.vector -2.339272 40.644257 -8.808453
        , Vector.vector -1.890984 37.244259 -7.13542
        , Vector.vector -2.149803 37.512211 -8.101347
        , Vector.vector -2.339272 38.244259 -8.808453
        , Vector.vector -3.585336 39.244259 -8.667831
        , Vector.vector -3.482796 40.644257 -8.420279
        , Vector.vector -2.487433 37.462269 -6.00522
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
        , Vector.vector -5.124314 37.512211 -6.63448
        , Vector.vector -5.569959 38.244259 -7.215254
        , Vector.vector -6.667357 39.244259 -6.608489
        , Vector.vector -6.47789 40.644257 -6.41902
        , Vector.vector -4.596188 37.462269 -4.5962
        , Vector.vector -5.253144 37.244259 -5.194275
        , Vector.vector -5.960251 37.512211 -5.901382
        , Vector.vector -6.47789 38.244259 -6.41902
        , Vector.vector -7.486698 39.244259 -5.67421
        , Vector.vector -7.27412 40.644257 -5.511092
        , Vector.vector -5.404548 37.462269 -3.611213
        , Vector.vector -5.899992 37.244259 -4.456686
        , Vector.vector -6.693346 37.512211 -5.065448
        , Vector.vector -7.27412 38.244259 -5.511092
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
        , Vector.vector -6.5 37.462269 -0.000006
        , Vector.vector -7.449842 37.244259 0.109024
        , Vector.vector -8.449842 37.512211 0.109024
        , Vector.vector -9.181892 38.244259 0.109024
        , Vector.vector -9.368568 39.244259 1.349025
        , Vector.vector -9.102912 40.644257 1.31405
        , Vector.vector -6.375105 37.462269 1.268081
        , Vector.vector -7.385679 37.244259 1.087972
        , Vector.vector -8.377124 37.512211 1.218498
        , Vector.vector -9.102912 38.244259 1.31405
        , Vector.vector -9.126138 39.244259 2.567804
        , Vector.vector -8.867319 40.644257 2.498454
        , Vector.vector -7.194286 37.244259 2.050166
        , Vector.vector -8.160213 37.512211 2.308985
        , Vector.vector -8.867319 38.244259 2.498454
        , Vector.vector -8.726699 39.244259 3.744514
        , Vector.vector -8.479146 40.644257 3.641974
        , Vector.vector -6.005219 37.462269 2.487437
        , Vector.vector -6.878939 37.244259 2.979147
        , Vector.vector -7.802819 37.512211 3.36183
        , Vector.vector -8.479146 38.244259 3.641974
        , Vector.vector -8.177084 39.244259 4.859023
        , Vector.vector -7.945034 40.644257 4.725048
        , Vector.vector -5.404554 37.462269 3.611202
        , Vector.vector -6.445034 37.244259 3.859023
        , Vector.vector -7.311059 37.512211 4.359023
        , Vector.vector -7.945034 38.244259 4.725048
        , Vector.vector -7.486698 39.244259 5.892258
        , Vector.vector -7.27412 40.644257 5.729141
        , Vector.vector -5.899992 37.244259 4.674735
        , Vector.vector -6.693346 37.512211 5.283496
        , Vector.vector -7.27412 38.244259 5.729141
        , Vector.vector -6.667357 39.244259 6.826537
        , Vector.vector -6.47789 40.644257 6.637068
        , Vector.vector -4.596197 37.462269 4.596191
        , Vector.vector -5.253144 37.244259 5.412323
        , Vector.vector -5.960251 37.512211 6.11943
        , Vector.vector -6.47789 38.244259 6.637068
        , Vector.vector -5.73308 39.244259 7.645878
        , Vector.vector -5.569963 40.644257 7.4333
        , Vector.vector -3.61121 37.462269 5.404551
        , Vector.vector -4.515555 37.244259 6.059172
        , Vector.vector -5.124319 37.512211 6.852526
        , Vector.vector -5.569963 38.244259 7.4333
        , Vector.vector -4.699841 39.244259 8.336267
        , Vector.vector -4.565866 40.644257 8.104216
        , Vector.vector -3.699841 37.244259 6.604215
        , Vector.vector -4.199841 37.512211 7.470241
        , Vector.vector -4.565866 38.244259 8.104216
        , Vector.vector -3.585336 39.244259 8.88588
        , Vector.vector -3.482796 40.644257 8.638327
        , Vector.vector -2.487445 37.462269 6.005216
        , Vector.vector -2.819969 37.244259 7.038121
        , Vector.vector -3.202652 37.512211 7.962
        , Vector.vector -3.482796 38.244259 8.638327
        , Vector.vector -2.408626 39.244259 9.285318
        , Vector.vector -2.339275 40.644257 9.0265
        , Vector.vector -1.26809 37.462269 6.375103
        , Vector.vector -1.890987 37.244259 7.353467
        , Vector.vector -2.149807 37.512211 8.319393
        , Vector.vector -2.339275 38.244259 9.0265
        , Vector.vector -1.189847 39.244259 9.52775
        , Vector.vector -1.154872 40.644257 9.262093
        , Vector.vector -0.928793 37.244259 7.54486
        , Vector.vector -1.05932 37.512211 8.536305
        , Vector.vector -1.154872 38.244259 9.262093
        , Vector.vector 0.050159 39.244259 9.609024
        , Vector.vector 0.050159 40.644257 9.341076
        , Vector.vector -0.000002 37.462269 6.5
        , Vector.vector 0.050159 37.244259 7.609024
        , Vector.vector 0.050158 37.512211 8.609026
        , Vector.vector 0.050159 38.244259 9.341076
        , Vector.vector 1.290156 39.244259 9.52775
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
        , Vector.vector 2.920285 37.244259 7.03812
        , Vector.vector 3.302969 37.512211 7.961999
        , Vector.vector 3.583112 38.244259 8.638326
        , Vector.vector 4.800158 39.244259 8.336266
        , Vector.vector 4.666183 40.644257 8.104215
        , Vector.vector 3.611206 37.462269 5.404553
        , Vector.vector 3.800157 37.244259 6.604215
        , Vector.vector 4.300158 37.512211 7.470241
        , Vector.vector 4.666183 38.244259 8.104215
        , Vector.vector 5.83339 39.244259 7.645883
        , Vector.vector 5.670273 40.644257 7.433305
        , Vector.vector 4.615868 37.244259 6.059175
        , Vector.vector 5.224628 37.512211 6.852529
        , Vector.vector 5.670273 38.244259 7.433305
        , Vector.vector 6.767669 39.244259 6.826543
        , Vector.vector 6.5782 40.644257 6.637074
        , Vector.vector 4.596194 37.462269 4.596194
        , Vector.vector 5.353456 37.244259 5.412328
        , Vector.vector 6.060563 37.512211 6.119436
        , Vector.vector 6.5782 38.244259 6.637074
        , Vector.vector 7.587016 39.244259 5.892258
        , Vector.vector 7.374437 40.644257 5.72914
        , Vector.vector 5.404553 37.462269 3.611206
        , Vector.vector 6.000309 37.244259 4.674735
        , Vector.vector 6.793662 37.512211 5.283496
        , Vector.vector 7.374437 38.244259 5.72914
        , Vector.vector 8.277399 39.244259 4.859025
        , Vector.vector 8.045348 40.644257 4.72505
        , Vector.vector 6.545348 37.244259 3.859025
        , Vector.vector 7.411373 37.512211 4.359025
        , Vector.vector 8.045348 38.244259 4.72505
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
        , Vector.vector 8.47744 37.512211 1.218497
        , Vector.vector 9.203228 38.244259 1.314049
        , Vector.vector -0.0 -42.537731 -8.449999
        , Vector.vector 1.648513 -42.537731 -8.287635
        , Vector.vector 3.233675 -42.537731 -7.806781
        , Vector.vector 4.694568 -42.537731 -7.025917
        , Vector.vector 5.975051 -42.537731 -5.975051
        , Vector.vector 7.025918 -42.537731 -4.694567
        , Vector.vector 7.806782 -42.537731 -3.233674
        , Vector.vector 8.287635 -42.537731 -1.648513
        , Vector.vector 8.449999 -42.537731 -0.0
        , Vector.vector 8.287635 -42.537731 1.648513
        , Vector.vector 7.806782 -42.537731 3.233674
        , Vector.vector 7.025918 -42.537731 4.694569
        , Vector.vector 5.975051 -42.537731 5.975053
        , Vector.vector 4.694568 -42.537731 7.025919
        , Vector.vector 3.233673 -42.537731 7.806783
        , Vector.vector 1.648511 -42.537731 8.287636
        , Vector.vector -0.000003 -42.537731 8.45
        , Vector.vector -1.648517 -42.537731 8.287635
        , Vector.vector -3.233679 -42.537731 7.80678
        , Vector.vector -4.694572 -42.537731 7.025916
        , Vector.vector -5.975056 -42.537731 5.975049
        , Vector.vector -7.025921 -42.537731 4.694564
        , Vector.vector -7.806784 -42.537731 3.233669
        , Vector.vector -8.287636 -42.537731 1.648506
        , Vector.vector -8.45 -42.537731 -0.000008
        , Vector.vector -8.287634 -42.537731 -1.648521
        , Vector.vector -7.806778 -42.537731 -3.233683
        , Vector.vector -7.025912 -42.537731 -4.694576
        , Vector.vector -5.975044 -42.537731 -5.975059
        , Vector.vector -4.694559 -42.537731 -7.025923
        , Vector.vector -3.233664 -42.537731 -7.806786
        , Vector.vector -1.648501 -42.537731 -8.287637
        , Vector.vector -9.999999 -49.999996 9.999998
        , Vector.vector -9.999999 -49.999996 -10.000002
        , Vector.vector 10.0 -49.999996 -10.000002
        , Vector.vector 10.0 -49.999996 9.999998
        , Vector.vector -9.999999 -42.666267 9.999998
        , Vector.vector -9.999999 -42.666267 -10.000002
        , Vector.vector 10.0 -42.666267 -10.000002
        , Vector.vector 10.0 -42.666267 9.999998
        , Vector.vector -10.009957 50.000004 -10.001064
        , Vector.vector 9.990043 50.000004 -10.001067
        , Vector.vector -10.009957 48.049103 -9.808916
        , Vector.vector 9.990043 48.049103 -9.808919
        , Vector.vector -10.009956 46.173172 -9.23986
        , Vector.vector 9.990043 46.173172 -9.239862
        , Vector.vector -10.009957 44.444305 -8.315761
        , Vector.vector 9.990044 44.444305 -8.315763
        , Vector.vector -10.009956 42.92894 -7.072133
        , Vector.vector 9.990044 42.92894 -7.072135
        , Vector.vector -10.009955 41.68531 -5.556767
        , Vector.vector 9.990044 41.68531 -5.556769
        , Vector.vector -10.009955 40.761208 -3.827899
        , Vector.vector 9.990044 40.761208 -3.827902
        , Vector.vector -10.009955 40.19215 -1.951969
        , Vector.vector 9.990044 40.19215 -1.951972
        , Vector.vector -10.009955 40.000004 -0.001066
        , Vector.vector 9.990045 40.000004 -0.001069
        , Vector.vector -10.009955 40.19215 1.949837
        , Vector.vector 9.990045 40.19215 1.949834
        , Vector.vector -10.009955 40.761208 3.825768
        , Vector.vector 9.990045 40.761208 3.825765
        , Vector.vector -10.009955 41.68531 5.554637
        , Vector.vector 9.990045 41.68531 5.554634
        , Vector.vector -10.009955 42.928932 7.070003
        , Vector.vector 9.990045 42.92894 7.07
        , Vector.vector -10.009954 44.444305 8.313632
        , Vector.vector 9.990045 44.444305 8.313629
        , Vector.vector -10.009954 46.173172 9.237732
        , Vector.vector 9.990045 46.173172 9.237729
        , Vector.vector -10.009955 48.049103 9.806789
        , Vector.vector 9.990045 48.049103 9.806787
        , Vector.vector -10.009955 50.000004 9.998936
        , Vector.vector 9.990045 50.000008 9.998934
        , Vector.vector -0.009956 40.000004 9.998931
        , Vector.vector -0.009956 40.000008 -10.00107
        , Vector.vector 1.940947 40.192154 9.998931
        , Vector.vector 1.940947 40.192154 -10.00107
        , Vector.vector 3.816878 40.761215 9.998931
        , Vector.vector 3.816878 40.761215 -10.00107
        , Vector.vector 5.545746 41.68531 9.998932
        , Vector.vector 5.545746 41.68531 -10.00107
        , Vector.vector 7.061111 42.92894 9.998931
        , Vector.vector 7.061111 42.92894 -10.001069
        , Vector.vector 8.30474 44.444305 9.998932
        , Vector.vector 8.30474 44.444309 -10.001069
        , Vector.vector 9.228839 46.173172 9.998932
        , Vector.vector 9.228839 46.173176 -10.001069
        , Vector.vector 9.797896 48.049103 9.998932
        , Vector.vector 9.797896 48.049107 -10.001069
        , Vector.vector 9.990044 50.000004 9.998932
        , Vector.vector 9.990044 50.000008 -10.001069
        , Vector.vector -10.009956 49.999996 9.998932
        , Vector.vector -10.009956 50.0 -10.001069
        , Vector.vector -9.817807 48.049091 9.998931
        , Vector.vector -9.817807 48.049091 -10.001069
        , Vector.vector -9.248747 46.173164 9.998932
        , Vector.vector -9.248747 46.173168 -10.001069
        , Vector.vector -8.324646 44.444294 9.998931
        , Vector.vector -8.324646 44.444298 -10.001069
        , Vector.vector -7.081015 42.928928 9.998931
        , Vector.vector -7.081015 42.928928 -10.001069
        , Vector.vector -5.565648 41.685303 9.998931
        , Vector.vector -5.565648 41.685303 -10.00107
        , Vector.vector -3.836777 40.761208 9.998931
        , Vector.vector -3.836777 40.761208 -10.00107
        , Vector.vector -1.960845 40.19215 9.998931
        , Vector.vector -1.960845 40.19215 -10.00107
        , Vector.vector -1.634092 -39.507626 -8.215197
        , Vector.vector -1.618875 -36.307625 -8.138696
        , Vector.vector -1.603658 -33.107628 -8.062194
        , Vector.vector -1.588441 -29.907627 -7.985693
        , Vector.vector -1.573224 -26.707628 -7.909191
        , Vector.vector -1.558007 -23.507629 -7.83269
        , Vector.vector -1.54279 -20.307627 -7.756188
        , Vector.vector -1.527573 -17.107626 -7.679687
        , Vector.vector -1.512356 -13.907625 -7.603186
        , Vector.vector -1.497139 -10.707626 -7.526684
        , Vector.vector -1.481923 -7.507626 -7.450183
        , Vector.vector -1.466706 -4.307625 -7.373682
        , Vector.vector -1.451489 -1.107625 -7.29718
        , Vector.vector -1.436272 2.092375 -7.220679
        , Vector.vector -1.421055 5.292375 -7.144178
        , Vector.vector -1.405838 8.492376 -7.067677
        , Vector.vector -1.390621 11.692377 -6.991176
        , Vector.vector -1.375404 14.892377 -6.914675
        , Vector.vector -1.360187 18.092375 -6.838174
        , Vector.vector -1.34497 21.292374 -6.761672
        , Vector.vector -1.329753 24.492374 -6.685172
        , Vector.vector -1.314536 27.692375 -6.608671
        , Vector.vector -1.299319 30.892374 -6.532169
        , Vector.vector -1.284102 34.092373 -6.455668
        , Vector.vector 6.964507 -39.507626 4.653535
        , Vector.vector 6.899652 -36.307625 4.6102
        , Vector.vector 6.834798 -33.107628 4.566866
        , Vector.vector 6.769943 -29.907627 4.523532
        , Vector.vector 6.705089 -26.707628 4.480197
        , Vector.vector 6.640234 -23.507629 4.436862
        , Vector.vector 6.575379 -20.307627 4.393528
        , Vector.vector 6.510525 -17.107626 4.350194
        , Vector.vector 6.44567 -13.907625 4.306859
        , Vector.vector 6.380816 -10.707626 4.263525
        , Vector.vector 6.315961 -7.507626 4.22019
        , Vector.vector 6.251106 -4.307625 4.176856
        , Vector.vector 6.186252 -1.107625 4.133521
        , Vector.vector 6.121397 2.092375 4.090186
        , Vector.vector 6.056542 5.292375 4.046852
        , Vector.vector 5.991688 8.492376 4.003518
        , Vector.vector 5.926833 11.692377 3.960183
        , Vector.vector 5.861979 14.892377 3.916848
        , Vector.vector 5.797124 18.092375 3.873514
        , Vector.vector 5.732269 21.292374 3.83018
        , Vector.vector 5.667415 24.492374 3.786845
        , Vector.vector 5.60256 27.692375 3.74351
        , Vector.vector 5.537705 30.892374 3.700176
        , Vector.vector 5.472851 34.092373 3.656842
        , Vector.vector 1.634104 -39.507626 -8.215195
        , Vector.vector 1.618887 -36.307625 -8.138694
        , Vector.vector 1.60367 -33.107628 -8.062192
        , Vector.vector 1.588453 -29.907627 -7.985691
        , Vector.vector 1.573236 -26.707628 -7.909189
        , Vector.vector 1.558018 -23.507629 -7.832688
        , Vector.vector 1.542801 -20.307627 -7.756186
        , Vector.vector 1.527584 -17.107626 -7.679686
        , Vector.vector 1.512367 -13.907625 -7.603184
        , Vector.vector 1.49715 -10.707626 -7.526683
        , Vector.vector 1.481933 -7.507626 -7.450181
        , Vector.vector 1.466716 -4.307625 -7.37368
        , Vector.vector 1.451499 -1.107625 -7.297178
        , Vector.vector 1.436282 2.092375 -7.220677
        , Vector.vector 1.421065 5.292375 -7.144176
        , Vector.vector 1.405848 8.492376 -7.067676
        , Vector.vector 1.390631 11.692377 -6.991174
        , Vector.vector 1.375414 14.892377 -6.914673
        , Vector.vector 1.360197 18.092375 -6.838172
        , Vector.vector 1.34498 21.292374 -6.761671
        , Vector.vector 1.329763 24.492374 -6.68517
        , Vector.vector 1.314546 27.692375 -6.608668
        , Vector.vector 1.299329 30.892374 -6.532168
        , Vector.vector 1.284112 34.092373 -6.455667
        , Vector.vector 4.653534 -39.507626 -6.964506
        , Vector.vector 4.6102 -36.307625 -6.899652
        , Vector.vector 4.566865 -33.107628 -6.834797
        , Vector.vector 4.523531 -29.907627 -6.769942
        , Vector.vector 4.480197 -26.707628 -6.705088
        , Vector.vector 4.436862 -23.507629 -6.640233
        , Vector.vector 4.393528 -20.307627 -6.575378
        , Vector.vector 4.350194 -17.107626 -6.510524
        , Vector.vector 4.306859 -13.907625 -6.445669
        , Vector.vector 4.263525 -10.707626 -6.380815
        , Vector.vector 4.220191 -7.507626 -6.31596
        , Vector.vector 4.176856 -4.307625 -6.251105
        , Vector.vector 4.133521 -1.107625 -6.186251
        , Vector.vector 4.090187 2.092375 -6.121396
        , Vector.vector 4.046852 5.292375 -6.056541
        , Vector.vector 4.003518 8.492376 -5.991687
        , Vector.vector 3.960183 11.692377 -5.926832
        , Vector.vector 3.916849 14.892377 -5.861978
        , Vector.vector 3.873514 18.092375 -5.797123
        , Vector.vector 3.83018 21.292374 -5.732268
        , Vector.vector 3.786845 24.492374 -5.667414
        , Vector.vector 3.743511 27.692375 -5.602559
        , Vector.vector 3.700176 30.892374 -5.537704
        , Vector.vector 3.656842 34.092373 -5.47285
        , Vector.vector 8.215195 -39.507626 -1.634104
        , Vector.vector 8.138694 -36.307625 -1.618886
        , Vector.vector 8.062192 -33.107628 -1.603669
        , Vector.vector 7.985691 -29.907627 -1.588452
        , Vector.vector 7.909189 -26.707628 -1.573235
        , Vector.vector 7.832688 -23.507629 -1.558018
        , Vector.vector 7.756186 -20.307627 -1.542801
        , Vector.vector 7.679686 -17.107626 -1.527584
        , Vector.vector 7.603184 -13.907625 -1.512367
        , Vector.vector 7.526683 -10.707626 -1.49715
        , Vector.vector 7.450181 -7.507626 -1.481933
        , Vector.vector 7.37368 -4.307625 -1.466716
        , Vector.vector 7.297178 -1.107625 -1.451499
        , Vector.vector 7.220677 2.092375 -1.436282
        , Vector.vector 7.144176 5.292375 -1.421065
        , Vector.vector 7.067676 8.492376 -1.405848
        , Vector.vector 6.991174 11.692377 -1.390631
        , Vector.vector 6.914673 14.892377 -1.375414
        , Vector.vector 6.838172 18.092375 -1.360197
        , Vector.vector 6.761671 21.292374 -1.34498
        , Vector.vector 6.68517 24.492374 -1.329763
        , Vector.vector 6.608668 27.692375 -1.314546
        , Vector.vector 6.532168 30.892374 -1.299329
        , Vector.vector 6.455667 34.092373 -1.284112
        , Vector.vector 4.653534 -39.507626 6.964508
        , Vector.vector 4.610199 -36.307625 6.899653
        , Vector.vector 4.566865 -33.107628 6.834798
        , Vector.vector 4.523531 -29.907627 6.769944
        , Vector.vector 4.480196 -26.707628 6.705089
        , Vector.vector 4.436862 -23.507629 6.640234
        , Vector.vector 4.393528 -20.307627 6.57538
        , Vector.vector 4.350194 -17.107626 6.510525
        , Vector.vector 4.306859 -13.907625 6.445671
        , Vector.vector 4.263525 -10.707626 6.380816
        , Vector.vector 4.22019 -7.507626 6.315961
        , Vector.vector 4.176856 -4.307625 6.251107
        , Vector.vector 4.133521 -1.107625 6.186252
        , Vector.vector 4.090186 2.092375 6.121397
        , Vector.vector 4.046852 5.292375 6.056543
        , Vector.vector 4.003518 8.492376 5.991688
        , Vector.vector 3.960183 11.692377 5.926834
        , Vector.vector 3.916848 14.892377 5.861979
        , Vector.vector 3.873514 18.092375 5.797124
        , Vector.vector 3.83018 21.292374 5.73227
        , Vector.vector 3.786845 24.492374 5.667415
        , Vector.vector 3.74351 27.692375 5.602561
        , Vector.vector 3.700176 30.892374 5.537706
        , Vector.vector 3.656842 34.092373 5.472851
        , Vector.vector 1.634102 -39.507626 8.215196
        , Vector.vector 1.618885 -36.307625 8.138694
        , Vector.vector 1.603668 -33.107628 8.062193
        , Vector.vector 1.588451 -29.907627 7.985692
        , Vector.vector 1.573234 -26.707628 7.90919
        , Vector.vector 1.558017 -23.507629 7.832689
        , Vector.vector 1.542799 -20.307627 7.756187
        , Vector.vector 1.527582 -17.107626 7.679686
        , Vector.vector 1.512365 -13.907625 7.603185
        , Vector.vector 1.497148 -10.707626 7.526683
        , Vector.vector 1.481931 -7.507626 7.450182
        , Vector.vector 1.466714 -4.307625 7.373681
        , Vector.vector 1.451497 -1.107625 7.297179
        , Vector.vector 1.43628 2.092375 7.220678
        , Vector.vector 1.421063 5.292375 7.144176
        , Vector.vector 1.405846 8.492376 7.067676
        , Vector.vector 1.390629 11.692377 6.991174
        , Vector.vector 1.375412 14.892377 6.914673
        , Vector.vector 1.360195 18.092375 6.838172
        , Vector.vector 1.344979 21.292374 6.761671
        , Vector.vector 1.329762 24.492374 6.68517
        , Vector.vector 1.314544 27.692375 6.608668
        , Vector.vector 1.299327 30.892374 6.532168
        , Vector.vector 1.284111 34.092373 6.455667
        , Vector.vector -1.634108 -39.507626 8.215195
        , Vector.vector -1.618891 -36.307625 8.138694
        , Vector.vector -1.603674 -33.107628 8.062192
        , Vector.vector -1.588457 -29.907627 7.985691
        , Vector.vector -1.573239 -26.707628 7.909189
        , Vector.vector -1.558022 -23.507629 7.832688
        , Vector.vector -1.542805 -20.307627 7.756186
        , Vector.vector -1.527588 -17.107626 7.679686
        , Vector.vector -1.512371 -13.907625 7.603184
        , Vector.vector -1.497154 -10.707626 7.526683
        , Vector.vector -1.481937 -7.507626 7.450181
        , Vector.vector -1.46672 -4.307625 7.37368
        , Vector.vector -1.451503 -1.107625 7.297178
        , Vector.vector -1.436286 2.092375 7.220677
        , Vector.vector -1.421069 5.292375 7.144176
        , Vector.vector -1.405852 8.492376 7.067675
        , Vector.vector -1.390635 11.692377 6.991174
        , Vector.vector -1.375418 14.892377 6.914673
        , Vector.vector -1.360201 18.092375 6.838171
        , Vector.vector -1.344983 21.292374 6.76167
        , Vector.vector -1.329766 24.492374 6.685169
        , Vector.vector -1.314549 27.692375 6.608668
        , Vector.vector -1.299332 30.892374 6.532167
        , Vector.vector -1.284115 34.092373 6.455666
        , Vector.vector -4.653539 -39.507626 6.964505
        , Vector.vector -4.610204 -36.307625 6.89965
        , Vector.vector -4.56687 -33.107628 6.834795
        , Vector.vector -4.523535 -29.907627 6.769941
        , Vector.vector -4.480201 -26.707628 6.705086
        , Vector.vector -4.436866 -23.507629 6.640232
        , Vector.vector -4.393532 -20.307627 6.575377
        , Vector.vector -4.350197 -17.107626 6.510522
        , Vector.vector -4.306863 -13.907625 6.445668
        , Vector.vector -4.263528 -10.707626 6.380813
        , Vector.vector -4.220194 -7.507626 6.315958
        , Vector.vector -4.176859 -4.307625 6.251104
        , Vector.vector -4.133524 -1.107625 6.186249
        , Vector.vector -4.09019 2.092375 6.121395
        , Vector.vector -4.046855 5.292375 6.05654
        , Vector.vector -4.003521 8.492376 5.991685
        , Vector.vector -3.960186 11.692377 5.926831
        , Vector.vector -3.916852 14.892377 5.861976
        , Vector.vector -3.873518 18.092375 5.797122
        , Vector.vector -3.830183 21.292374 5.732267
        , Vector.vector -3.786849 24.492374 5.667412
        , Vector.vector -3.743514 27.692375 5.602558
        , Vector.vector -3.70018 30.892374 5.537703
        , Vector.vector -3.656845 34.092373 5.472848
        , Vector.vector -6.964509 -39.507626 4.65353
        , Vector.vector -6.899655 -36.307625 4.610196
        , Vector.vector -6.8348 -33.107628 4.566861
        , Vector.vector -6.769946 -29.907627 4.523527
        , Vector.vector -6.705091 -26.707628 4.480193
        , Vector.vector -6.640236 -23.507629 4.436858
        , Vector.vector -6.575382 -20.307627 4.393524
        , Vector.vector -6.510527 -17.107626 4.35019
        , Vector.vector -6.445673 -13.907625 4.306855
        , Vector.vector -6.380818 -10.707626 4.263521
        , Vector.vector -6.315963 -7.507626 4.220186
        , Vector.vector -6.251109 -4.307625 4.176852
        , Vector.vector -6.186254 -1.107625 4.133517
        , Vector.vector -6.121399 2.092375 4.090183
        , Vector.vector -6.056545 5.292375 4.046848
        , Vector.vector -5.99169 8.492376 4.003514
        , Vector.vector -5.926836 11.692377 3.960179
        , Vector.vector -5.861981 14.892377 3.916845
        , Vector.vector -5.797126 18.092375 3.87351
        , Vector.vector -5.732272 21.292374 3.830176
        , Vector.vector -5.667417 24.492374 3.786841
        , Vector.vector -5.602562 27.692375 3.743507
        , Vector.vector -5.537708 30.892374 3.700172
        , Vector.vector -5.472853 34.092373 3.656838
        , Vector.vector -8.215197 -39.507626 1.634097
        , Vector.vector -8.138695 -36.307625 1.61888
        , Vector.vector -8.062193 -33.107628 1.603663
        , Vector.vector -7.985692 -29.907627 1.588446
        , Vector.vector -7.909191 -26.707628 1.573229
        , Vector.vector -7.832689 -23.507629 1.558012
        , Vector.vector -7.756188 -20.307627 1.542795
        , Vector.vector -7.679687 -17.107626 1.527578
        , Vector.vector -7.603185 -13.907625 1.512361
        , Vector.vector -7.526684 -10.707626 1.497144
        , Vector.vector -7.450182 -7.507626 1.481927
        , Vector.vector -7.373681 -4.307625 1.46671
        , Vector.vector -7.29718 -1.107625 1.451493
        , Vector.vector -7.220678 2.092375 1.436276
        , Vector.vector -7.144177 5.292375 1.421059
        , Vector.vector -7.067676 8.492376 1.405842
        , Vector.vector -6.991175 11.692377 1.390625
        , Vector.vector -6.914674 14.892377 1.375408
        , Vector.vector -6.838173 18.092375 1.360191
        , Vector.vector -6.761671 21.292374 1.344974
        , Vector.vector -6.685171 24.492374 1.329757
        , Vector.vector -6.60867 27.692375 1.31454
        , Vector.vector -6.532168 30.892374 1.299323
        , Vector.vector -6.455667 34.092373 1.284106
        , Vector.vector -8.215194 -39.507626 -1.634112
        , Vector.vector -8.138693 -36.307625 -1.618895
        , Vector.vector -8.062191 -33.107628 -1.603678
        , Vector.vector -7.98569 -29.907627 -1.588461
        , Vector.vector -7.909188 -26.707628 -1.573244
        , Vector.vector -7.832687 -23.507629 -1.558027
        , Vector.vector -7.756186 -20.307627 -1.54281
        , Vector.vector -7.679684 -17.107626 -1.527593
        , Vector.vector -7.603183 -13.907625 -1.512376
        , Vector.vector -7.526681 -10.707626 -1.497159
        , Vector.vector -7.45018 -7.507626 -1.481941
        , Vector.vector -7.373679 -4.307625 -1.466724
        , Vector.vector -7.297177 -1.107625 -1.451507
        , Vector.vector -7.220676 2.092375 -1.43629
        , Vector.vector -7.144175 5.292375 -1.421073
        , Vector.vector -7.067675 8.492376 -1.405856
        , Vector.vector -6.991173 11.692377 -1.390639
        , Vector.vector -6.914672 14.892377 -1.375422
        , Vector.vector -6.838171 18.092375 -1.360204
        , Vector.vector -6.76167 21.292374 -1.344987
        , Vector.vector -6.685169 24.492374 -1.32977
        , Vector.vector -6.608667 27.692375 -1.314553
        , Vector.vector -6.532166 30.892374 -1.299336
        , Vector.vector -6.455666 34.092373 -1.284119
        , Vector.vector -6.964501 -39.507626 -4.653542
        , Vector.vector -6.899647 -36.307625 -4.610208
        , Vector.vector -6.834792 -33.107628 -4.566873
        , Vector.vector -6.769938 -29.907627 -4.523539
        , Vector.vector -6.705083 -26.707628 -4.480204
        , Vector.vector -6.640228 -23.507629 -4.43687
        , Vector.vector -6.575374 -20.307627 -4.393535
        , Vector.vector -6.510519 -17.107626 -4.3502
        , Vector.vector -6.445664 -13.907625 -4.306866
        , Vector.vector -6.38081 -10.707626 -4.263532
        , Vector.vector -6.315955 -7.507626 -4.220197
        , Vector.vector -6.251101 -4.307625 -4.176862
        , Vector.vector -6.186246 -1.107625 -4.133528
        , Vector.vector -6.121391 2.092375 -4.090194
        , Vector.vector -6.056537 5.292375 -4.046859
        , Vector.vector -5.991682 8.492376 -4.003524
        , Vector.vector -5.926827 11.692377 -3.96019
        , Vector.vector -5.861973 14.892377 -3.916855
        , Vector.vector -5.797118 18.092375 -3.873521
        , Vector.vector -5.732264 21.292374 -3.830186
        , Vector.vector -5.667409 24.492374 -3.786852
        , Vector.vector -5.602555 27.692375 -3.743517
        , Vector.vector -5.5377 30.892374 -3.700183
        , Vector.vector -5.472846 34.092373 -3.656848
        , Vector.vector -4.653525 -39.507626 -6.964512
        , Vector.vector -4.610191 -36.307625 -6.899657
        , Vector.vector -4.566856 -33.107628 -6.834803
        , Vector.vector -4.523522 -29.907627 -6.769948
        , Vector.vector -4.480187 -26.707628 -6.705093
        , Vector.vector -4.436853 -23.507629 -6.640239
        , Vector.vector -4.393519 -20.307627 -6.575384
        , Vector.vector -4.350184 -17.107626 -6.51053
        , Vector.vector -4.30685 -13.907625 -6.445675
        , Vector.vector -4.263516 -10.707626 -6.38082
        , Vector.vector -4.220181 -7.507626 -6.315966
        , Vector.vector -4.176847 -4.307625 -6.251111
        , Vector.vector -4.133512 -1.107625 -6.186256
        , Vector.vector -4.090178 2.092375 -6.121402
        , Vector.vector -4.046844 5.292375 -6.056547
        , Vector.vector -4.00351 8.492376 -5.991693
        , Vector.vector -3.960175 11.692377 -5.926838
        , Vector.vector -3.916841 14.892377 -5.861983
        , Vector.vector -3.873507 18.092375 -5.797129
        , Vector.vector -3.830172 21.292374 -5.732274
        , Vector.vector -3.786838 24.492374 -5.667419
        , Vector.vector -3.743503 27.692375 -5.602565
        , Vector.vector -3.700169 30.892374 -5.53771
        , Vector.vector -3.656834 34.092373 -5.472855
        , Vector.vector -0.0 -39.507626 -8.376141
        , Vector.vector -0.0 -36.307625 -8.298141
        , Vector.vector -0.0 -33.107628 -8.22014
        , Vector.vector -0.0 -29.907627 -8.142141
        , Vector.vector -0.0 -26.707628 -8.064141
        , Vector.vector -0.0 -23.507629 -7.986141
        , Vector.vector -0.0 -20.307627 -7.908142
        , Vector.vector -0.0 -17.107626 -7.830142
        , Vector.vector -0.0 -13.907625 -7.752142
        , Vector.vector -0.0 -10.707626 -7.674142
        , Vector.vector -0.0 -7.507626 -7.596142
        , Vector.vector -0.0 -4.307625 -7.518143
        , Vector.vector -0.0 -1.107625 -7.440143
        , Vector.vector -0.0 2.092375 -7.362143
        , Vector.vector -0.0 5.292375 -7.284142
        , Vector.vector -0.0 8.492376 -7.206142
        , Vector.vector -0.0 11.692377 -7.128142
        , Vector.vector -0.0 14.892377 -7.050142
        , Vector.vector -0.0 18.092375 -6.972142
        , Vector.vector -0.0 21.292374 -6.894141
        , Vector.vector -0.0 24.492374 -6.816142
        , Vector.vector -0.0 27.692375 -6.738142
        , Vector.vector -0.0 30.892374 -6.660141
        , Vector.vector -0.0 34.092373 -6.582141
        , Vector.vector 5.922825 -39.507626 -5.922825
        , Vector.vector 5.867671 -36.307625 -5.86767
        , Vector.vector 5.812516 -33.107628 -5.812516
        , Vector.vector 5.757361 -29.907627 -5.757361
        , Vector.vector 5.702208 -26.707628 -5.702208
        , Vector.vector 5.647053 -23.507629 -5.647053
        , Vector.vector 5.591898 -20.307627 -5.591898
        , Vector.vector 5.536745 -17.107626 -5.536745
        , Vector.vector 5.481591 -13.907625 -5.481591
        , Vector.vector 5.426436 -10.707626 -5.426436
        , Vector.vector 5.371282 -7.507626 -5.371282
        , Vector.vector 5.316128 -4.307625 -5.316128
        , Vector.vector 5.260973 -1.107625 -5.260973
        , Vector.vector 5.205819 2.092375 -5.205819
        , Vector.vector 5.150664 5.292375 -5.150664
        , Vector.vector 5.09551 8.492376 -5.09551
        , Vector.vector 5.040357 11.692377 -5.040357
        , Vector.vector 4.985202 14.892377 -4.985202
        , Vector.vector 4.930048 18.092375 -4.930048
        , Vector.vector 4.874894 21.292374 -4.874894
        , Vector.vector 4.819739 24.492374 -4.819739
        , Vector.vector 4.764585 27.692375 -4.764585
        , Vector.vector 4.709431 30.892374 -4.709431
        , Vector.vector 4.654276 34.092373 -4.654276
        , Vector.vector 8.376141 -39.507626 -0.0
        , Vector.vector 8.298141 -36.307625 -0.0
        , Vector.vector 8.22014 -33.107628 -0.0
        , Vector.vector 8.142141 -29.907627 -0.0
        , Vector.vector 8.064141 -26.707628 -0.0
        , Vector.vector 7.986141 -23.507629 -0.0
        , Vector.vector 7.908142 -20.307627 -0.0
        , Vector.vector 7.830142 -17.107626 -0.0
        , Vector.vector 7.752142 -13.907625 -0.0
        , Vector.vector 7.674142 -10.707626 -0.0
        , Vector.vector 7.596142 -7.507626 -0.0
        , Vector.vector 7.518143 -4.307625 -0.0
        , Vector.vector 7.440143 -1.107625 -0.0
        , Vector.vector 7.362143 2.092375 -0.0
        , Vector.vector 7.284142 5.292375 -0.0
        , Vector.vector 7.206142 8.492376 -0.0
        , Vector.vector 7.128142 11.692377 -0.0
        , Vector.vector 7.050142 14.892377 -0.0
        , Vector.vector 6.972142 18.092375 -0.0
        , Vector.vector 6.894141 21.292374 -0.0
        , Vector.vector 6.816142 24.492374 -0.0
        , Vector.vector 6.738142 27.692375 -0.0
        , Vector.vector 6.660141 30.892374 -0.0
        , Vector.vector 6.582141 34.092373 -0.0
        , Vector.vector 5.922825 -39.507626 5.922827
        , Vector.vector 5.867671 -36.307625 5.867672
        , Vector.vector 5.812516 -33.107628 5.812517
        , Vector.vector 5.757361 -29.907627 5.757363
        , Vector.vector 5.702208 -26.707628 5.702209
        , Vector.vector 5.647053 -23.507629 5.647054
        , Vector.vector 5.591898 -20.307627 5.591899
        , Vector.vector 5.536745 -17.107626 5.536745
        , Vector.vector 5.481591 -13.907625 5.481591
        , Vector.vector 5.426436 -10.707626 5.426436
        , Vector.vector 5.371282 -7.507626 5.371282
        , Vector.vector 5.316128 -4.307625 5.316128
        , Vector.vector 5.260973 -1.107625 5.260973
        , Vector.vector 5.205819 2.092375 5.205819
        , Vector.vector 5.150664 5.292375 5.150664
        , Vector.vector 5.09551 8.492376 5.09551
        , Vector.vector 5.040357 11.692377 5.040357
        , Vector.vector 4.985202 14.892377 4.985202
        , Vector.vector 4.930048 18.092375 4.930048
        , Vector.vector 4.874894 21.292374 4.874894
        , Vector.vector 4.819739 24.492374 4.819739
        , Vector.vector 4.764585 27.692375 4.764585
        , Vector.vector 4.709431 30.892374 4.709431
        , Vector.vector 4.654276 34.092373 4.654276
        , Vector.vector 3.205409 -39.507626 7.738546
        , Vector.vector 3.175559 -36.307625 7.666483
        , Vector.vector 3.14571 -33.107628 7.594421
        , Vector.vector 3.11586 -29.907627 7.522358
        , Vector.vector 3.086011 -26.707628 7.450295
        , Vector.vector 3.056162 -23.507629 7.378233
        , Vector.vector 3.026313 -20.307627 7.30617
        , Vector.vector 2.996464 -17.107626 7.234108
        , Vector.vector 2.966614 -13.907625 7.162045
        , Vector.vector 2.936765 -10.707626 7.089983
        , Vector.vector 2.906916 -7.507626 7.01792
        , Vector.vector 2.877066 -4.307625 6.945858
        , Vector.vector 2.847217 -1.107625 6.873795
        , Vector.vector 2.817368 2.092375 6.801732
        , Vector.vector 2.787519 5.292375 6.72967
        , Vector.vector 2.757669 8.492376 6.657607
        , Vector.vector 2.72782 11.692377 6.585545
        , Vector.vector 2.697971 14.892377 6.513482
        , Vector.vector 2.668121 18.092375 6.441419
        , Vector.vector 2.638272 21.292374 6.369357
        , Vector.vector 2.608423 24.492374 6.297294
        , Vector.vector 2.578574 27.692375 6.225231
        , Vector.vector 2.548724 30.892374 6.153169
        , Vector.vector 2.518875 34.092373 6.081106
        , Vector.vector -0.000003 -39.507626 8.376142
        , Vector.vector -0.000003 -36.307625 8.298141
        , Vector.vector -0.000003 -33.107628 8.220141
        , Vector.vector -0.000003 -29.907627 8.142141
        , Vector.vector -0.000003 -26.707628 8.064142
        , Vector.vector -0.000003 -23.507629 7.986142
        , Vector.vector -0.000003 -20.307627 7.908142
        , Vector.vector -0.000003 -17.107626 7.830142
        , Vector.vector -0.000003 -13.907625 7.752142
        , Vector.vector -0.000003 -10.707626 7.674143
        , Vector.vector -0.000003 -7.507626 7.596143
        , Vector.vector -0.000003 -4.307625 7.518143
        , Vector.vector -0.000003 -1.107625 7.440143
        , Vector.vector -0.000002 2.092375 7.362143
        , Vector.vector -0.000002 5.292375 7.284142
        , Vector.vector -0.000002 8.492376 7.206142
        , Vector.vector -0.000002 11.692377 7.128142
        , Vector.vector -0.000002 14.892377 7.050142
        , Vector.vector -0.000002 18.092375 6.972142
        , Vector.vector -0.000002 21.292374 6.894141
        , Vector.vector -0.000002 24.492374 6.816142
        , Vector.vector -0.000002 27.692375 6.738142
        , Vector.vector -0.000002 30.892374 6.660141
        , Vector.vector -0.000002 34.092373 6.582141
        , Vector.vector -3.205414 -39.507626 7.738544
        , Vector.vector -3.175565 -36.307625 7.666481
        , Vector.vector -3.145715 -33.107628 7.594419
        , Vector.vector -3.115866 -29.907627 7.522356
        , Vector.vector -3.086016 -26.707628 7.450294
        , Vector.vector -3.056167 -23.507629 7.378231
        , Vector.vector -3.026318 -20.307627 7.306168
        , Vector.vector -2.996468 -17.107626 7.234106
        , Vector.vector -2.966619 -13.907625 7.162043
        , Vector.vector -2.936769 -10.707626 7.08998
        , Vector.vector -2.90692 -7.507626 7.017918
        , Vector.vector -2.877071 -4.307625 6.945855
        , Vector.vector -2.847221 -1.107625 6.873793
        , Vector.vector -2.817372 2.092375 6.80173
        , Vector.vector -2.787523 5.292375 6.729667
        , Vector.vector -2.757673 8.492376 6.657605
        , Vector.vector -2.727824 11.692377 6.585542
        , Vector.vector -2.697975 14.892377 6.513479
        , Vector.vector -2.668125 18.092375 6.441417
        , Vector.vector -2.638276 21.292374 6.369354
        , Vector.vector -2.608427 24.492374 6.297292
        , Vector.vector -2.578578 27.692375 6.225229
        , Vector.vector -2.548728 30.892374 6.153166
        , Vector.vector -2.518879 34.092373 6.081104
        , Vector.vector -5.92283 -39.507626 5.922823
        , Vector.vector -5.867676 -36.307625 5.867668
        , Vector.vector -5.812521 -33.107628 5.812514
        , Vector.vector -5.757366 -29.907627 5.75736
        , Vector.vector -5.702212 -26.707628 5.702205
        , Vector.vector -5.647058 -23.507629 5.647051
        , Vector.vector -5.591903 -20.307627 5.591896
        , Vector.vector -5.536748 -17.107626 5.536742
        , Vector.vector -5.481594 -13.907625 5.481587
        , Vector.vector -5.42644 -10.707626 5.426434
        , Vector.vector -5.371285 -7.507626 5.371279
        , Vector.vector -5.316131 -4.307625 5.316124
        , Vector.vector -5.260977 -1.107625 5.260971
        , Vector.vector -5.205822 2.092375 5.205817
        , Vector.vector -5.150668 5.292375 5.150662
        , Vector.vector -5.095513 8.492376 5.095508
        , Vector.vector -5.040359 11.692377 5.040354
        , Vector.vector -4.985205 14.892377 4.985199
        , Vector.vector -4.930051 18.092375 4.930045
        , Vector.vector -4.874897 21.292374 4.874891
        , Vector.vector -4.819742 24.492374 4.819736
        , Vector.vector -4.764588 27.692375 4.764582
        , Vector.vector -4.709434 30.892374 4.709428
        , Vector.vector -4.65428 34.092373 4.654274
        , Vector.vector -7.738547 -39.507626 3.205404
        , Vector.vector -7.666485 -36.307625 3.175555
        , Vector.vector -7.594422 -33.107628 3.145706
        , Vector.vector -7.522359 -29.907627 3.115857
        , Vector.vector -7.450297 -26.707628 3.086007
        , Vector.vector -7.378234 -23.507629 3.056158
        , Vector.vector -7.306171 -20.307627 3.026309
        , Vector.vector -7.234109 -17.107626 2.996459
        , Vector.vector -7.162046 -13.907625 2.96661
        , Vector.vector -7.089984 -10.707626 2.936761
        , Vector.vector -7.017921 -7.507626 2.906912
        , Vector.vector -6.945858 -4.307625 2.877063
        , Vector.vector -6.873796 -1.107625 2.847213
        , Vector.vector -6.801733 2.092375 2.817364
        , Vector.vector -6.729671 5.292375 2.787515
        , Vector.vector -6.657608 8.492376 2.757666
        , Vector.vector -6.585546 11.692377 2.727816
        , Vector.vector -6.513483 14.892377 2.697967
        , Vector.vector -6.441421 18.092375 2.668118
        , Vector.vector -6.369358 21.292374 2.638268
        , Vector.vector -6.297295 24.492374 2.608419
        , Vector.vector -6.225233 27.692375 2.57857
        , Vector.vector -6.15317 30.892374 2.548721
        , Vector.vector -6.081107 34.092373 2.518871
        , Vector.vector -8.376142 -39.507626 -0.000008
        , Vector.vector -8.298141 -36.307625 -0.000007
        , Vector.vector -8.220141 -33.107628 -0.000007
        , Vector.vector -8.142141 -29.907627 -0.000007
        , Vector.vector -8.064142 -26.707628 -0.000007
        , Vector.vector -7.986142 -23.507629 -0.000007
        , Vector.vector -7.908142 -20.307627 -0.000007
        , Vector.vector -7.830142 -17.107626 -0.000007
        , Vector.vector -7.752142 -13.907625 -0.000007
        , Vector.vector -7.674143 -10.707626 -0.000007
        , Vector.vector -7.596143 -7.507626 -0.000007
        , Vector.vector -7.518143 -4.307625 -0.000007
        , Vector.vector -7.440143 -1.107625 -0.000007
        , Vector.vector -7.362143 2.092375 -0.000007
        , Vector.vector -7.284142 5.292375 -0.000007
        , Vector.vector -7.206142 8.492376 -0.000007
        , Vector.vector -7.128142 11.692377 -0.000007
        , Vector.vector -7.050142 14.892377 -0.000007
        , Vector.vector -6.972142 18.092375 -0.000007
        , Vector.vector -6.894141 21.292374 -0.000007
        , Vector.vector -6.816142 24.492374 -0.000006
        , Vector.vector -6.738142 27.692375 -0.000006
        , Vector.vector -6.660141 30.892374 -0.000006
        , Vector.vector -6.582141 34.092373 -0.000006
        , Vector.vector -7.738542 -39.507626 -3.205419
        , Vector.vector -7.666479 -36.307625 -3.175569
        , Vector.vector -7.594416 -33.107628 -3.14572
        , Vector.vector -7.522354 -29.907627 -3.11587
        , Vector.vector -7.450291 -26.707628 -3.086021
        , Vector.vector -7.378228 -23.507629 -3.056171
        , Vector.vector -7.306166 -20.307627 -3.026322
        , Vector.vector -7.234103 -17.107626 -2.996473
        , Vector.vector -7.162041 -13.907625 -2.966623
        , Vector.vector -7.089978 -10.707626 -2.936774
        , Vector.vector -7.017915 -7.507626 -2.906924
        , Vector.vector -6.945853 -4.307625 -2.877075
        , Vector.vector -6.87379 -1.107625 -2.847226
        , Vector.vector -6.801727 2.092375 -2.817376
        , Vector.vector -6.729665 5.292375 -2.787527
        , Vector.vector -6.657602 8.492376 -2.757678
        , Vector.vector -6.58554 11.692377 -2.727828
        , Vector.vector -6.513477 14.892377 -2.697978
        , Vector.vector -6.441414 18.092375 -2.668129
        , Vector.vector -6.369352 21.292374 -2.63828
        , Vector.vector -6.297289 24.492374 -2.608431
        , Vector.vector -6.225226 27.692375 -2.578582
        , Vector.vector -6.153164 30.892374 -2.548732
        , Vector.vector -6.081102 34.092373 -2.518883
        , Vector.vector -5.922819 -39.507626 -5.922832
        , Vector.vector -5.867664 -36.307625 -5.867678
        , Vector.vector -5.81251 -33.107628 -5.812523
        , Vector.vector -5.757356 -29.907627 -5.757369
        , Vector.vector -5.702202 -26.707628 -5.702214
        , Vector.vector -5.647047 -23.507629 -5.647059
        , Vector.vector -5.591893 -20.307627 -5.591905
        , Vector.vector -5.536739 -17.107626 -5.536751
        , Vector.vector -5.481585 -13.907625 -5.481596
        , Vector.vector -5.42643 -10.707626 -5.426442
        , Vector.vector -5.371276 -7.507626 -5.371287
        , Vector.vector -5.316122 -4.307625 -5.316133
        , Vector.vector -5.260968 -1.107625 -5.26098
        , Vector.vector -5.205813 2.092375 -5.205825
        , Vector.vector -5.150659 5.292375 -5.150671
        , Vector.vector -5.095505 8.492376 -5.095516
        , Vector.vector -5.04035 11.692377 -5.040362
        , Vector.vector -4.985196 14.892377 -4.985208
        , Vector.vector -4.930042 18.092375 -4.930054
        , Vector.vector -4.874888 21.292374 -4.8749
        , Vector.vector -4.819734 24.492374 -4.819746
        , Vector.vector -4.764579 27.692375 -4.764591
        , Vector.vector -4.709425 30.892374 -4.709437
        , Vector.vector -4.654271 34.092373 -4.654283
        , Vector.vector -3.205399 -39.507626 -7.738549
        , Vector.vector -3.17555 -36.307625 -7.666487
        , Vector.vector -3.145701 -33.107628 -7.594424
        , Vector.vector -3.115852 -29.907627 -7.522361
        , Vector.vector -3.086003 -26.707628 -7.450299
        , Vector.vector -3.056154 -23.507629 -7.378236
        , Vector.vector -3.026304 -20.307627 -7.306173
        , Vector.vector -2.996455 -17.107626 -7.234111
        , Vector.vector -2.966606 -13.907625 -7.162048
        , Vector.vector -2.936757 -10.707626 -7.089986
        , Vector.vector -2.906908 -7.507626 -7.017923
        , Vector.vector -2.877059 -4.307625 -6.94586
        , Vector.vector -2.847209 -1.107625 -6.873798
        , Vector.vector -2.81736 2.092375 -6.801735
        , Vector.vector -2.787511 5.292375 -6.729672
        , Vector.vector -2.757662 8.492376 -6.65761
        , Vector.vector -2.727813 11.692377 -6.585547
        , Vector.vector -2.697963 14.892377 -6.513485
        , Vector.vector -2.668114 18.092375 -6.441422
        , Vector.vector -2.638265 21.292374 -6.369359
        , Vector.vector -2.608416 24.492374 -6.297297
        , Vector.vector -2.578566 27.692375 -6.225234
        , Vector.vector -2.548717 30.892374 -6.153172
        , Vector.vector -2.518867 34.092373 -6.081109
        , Vector.vector 3.20541 -39.507626 -7.738544
        , Vector.vector 3.175561 -36.307625 -7.666482
        , Vector.vector 3.145711 -33.107628 -7.594419
        , Vector.vector 3.115862 -29.907627 -7.522357
        , Vector.vector 3.086013 -26.707628 -7.450294
        , Vector.vector 3.056163 -23.507629 -7.378231
        , Vector.vector 3.026314 -20.307627 -7.306169
        , Vector.vector 2.996465 -17.107626 -7.234106
        , Vector.vector 2.966616 -13.907625 -7.162044
        , Vector.vector 2.936766 -10.707626 -7.089981
        , Vector.vector 2.906917 -7.507626 -7.017918
        , Vector.vector 2.877068 -4.307625 -6.945856
        , Vector.vector 2.847219 -1.107625 -6.873793
        , Vector.vector 2.817369 2.092375 -6.80173
        , Vector.vector 2.78752 5.292375 -6.729668
        , Vector.vector 2.757671 8.492376 -6.657605
        , Vector.vector 2.727821 11.692377 -6.585543
        , Vector.vector 2.697972 14.892377 -6.51348
        , Vector.vector 2.668123 18.092375 -6.441417
        , Vector.vector 2.638273 21.292374 -6.369355
        , Vector.vector 2.608424 24.492374 -6.297292
        , Vector.vector 2.578575 27.692375 -6.22523
        , Vector.vector 2.548726 30.892374 -6.153168
        , Vector.vector 2.518877 34.092373 -6.081105
        , Vector.vector 7.738545 -39.507626 3.205409
        , Vector.vector 7.666482 -36.307625 3.17556
        , Vector.vector 7.594419 -33.107628 3.14571
        , Vector.vector 7.522357 -29.907627 3.115861
        , Vector.vector 7.450294 -26.707628 3.086012
        , Vector.vector 7.378232 -23.507629 3.056162
        , Vector.vector 7.30617 -20.307627 3.026313
        , Vector.vector 7.234107 -17.107626 2.996464
        , Vector.vector 7.162044 -13.907625 2.966614
        , Vector.vector 7.089982 -10.707626 2.936765
        , Vector.vector 7.017919 -7.507626 2.906916
        , Vector.vector 6.945856 -4.307625 2.877066
        , Vector.vector 6.873794 -1.107625 2.847217
        , Vector.vector 6.801731 2.092375 2.817368
        , Vector.vector 6.729669 5.292375 2.787519
        , Vector.vector 6.657606 8.492376 2.757669
        , Vector.vector 6.585543 11.692377 2.72782
        , Vector.vector 6.513481 14.892377 2.697971
        , Vector.vector 6.441418 18.092375 2.668121
        , Vector.vector 6.369355 21.292374 2.638272
        , Vector.vector 6.297293 24.492374 2.608423
        , Vector.vector 6.22523 27.692375 2.578574
        , Vector.vector 6.153168 30.892374 2.548724
        , Vector.vector 6.081105 34.092373 2.518875
        , Vector.vector 8.215195 -39.507626 1.634104
        , Vector.vector 8.138694 -36.307625 1.618886
        , Vector.vector 8.062192 -33.107628 1.603669
        , Vector.vector 7.985691 -29.907627 1.588452
        , Vector.vector 7.909189 -26.707628 1.573235
        , Vector.vector 7.832688 -23.507629 1.558018
        , Vector.vector 7.756186 -20.307627 1.542801
        , Vector.vector 7.679686 -17.107626 1.527584
        , Vector.vector 7.603184 -13.907625 1.512367
        , Vector.vector 7.526683 -10.707626 1.49715
        , Vector.vector 7.450181 -7.507626 1.481933
        , Vector.vector 7.37368 -4.307625 1.466716
        , Vector.vector 7.297178 -1.107625 1.451499
        , Vector.vector 7.220677 2.092375 1.436282
        , Vector.vector 7.144176 5.292375 1.421065
        , Vector.vector 7.067676 8.492376 1.405848
        , Vector.vector 6.991174 11.692377 1.39063
        , Vector.vector 6.914673 14.892377 1.375413
        , Vector.vector 6.838172 18.092375 1.360196
        , Vector.vector 6.761671 21.292374 1.344979
        , Vector.vector 6.68517 24.492374 1.329762
        , Vector.vector 6.608668 27.692375 1.314545
        , Vector.vector 6.532168 30.892374 1.299328
        , Vector.vector 6.455667 34.092373 1.284111
        , Vector.vector 7.738545 -39.507626 -3.20541
        , Vector.vector 7.666482 -36.307625 -3.17556
        , Vector.vector 7.594419 -33.107628 -3.145711
        , Vector.vector 7.522357 -29.907627 -3.115861
        , Vector.vector 7.450294 -26.707628 -3.086012
        , Vector.vector 7.378232 -23.507629 -3.056163
        , Vector.vector 7.30617 -20.307627 -3.026314
        , Vector.vector 7.234107 -17.107626 -2.996464
        , Vector.vector 7.162044 -13.907625 -2.966615
        , Vector.vector 7.089982 -10.707626 -2.936766
        , Vector.vector 7.017919 -7.507626 -2.906917
        , Vector.vector 6.945856 -4.307625 -2.877067
        , Vector.vector 6.873794 -1.107625 -2.847218
        , Vector.vector 6.801731 2.092375 -2.817369
        , Vector.vector 6.729669 5.292375 -2.78752
        , Vector.vector 6.657606 8.492376 -2.75767
        , Vector.vector 6.585543 11.692377 -2.727821
        , Vector.vector 6.513481 14.892377 -2.697972
        , Vector.vector 6.441418 18.092375 -2.668123
        , Vector.vector 6.369355 21.292374 -2.638273
        , Vector.vector 6.297293 24.492374 -2.608424
        , Vector.vector 6.22523 27.692375 -2.578575
        , Vector.vector 6.153168 30.892374 -2.548726
        , Vector.vector 6.081105 34.092373 -2.518876
        , Vector.vector 6.964507 -39.507626 -4.653533
        , Vector.vector 6.899652 -36.307625 -4.610199
        , Vector.vector 6.834798 -33.107628 -4.566864
        , Vector.vector 6.769943 -29.907627 -4.52353
        , Vector.vector 6.705089 -26.707628 -4.480196
        , Vector.vector 6.640234 -23.507629 -4.436862
        , Vector.vector 6.575379 -20.307627 -4.393527
        , Vector.vector 6.510525 -17.107626 -4.350193
        , Vector.vector 6.44567 -13.907625 -4.306859
        , Vector.vector 6.380816 -10.707626 -4.263524
        , Vector.vector 6.315961 -7.507626 -4.22019
        , Vector.vector 6.251106 -4.307625 -4.176856
        , Vector.vector 6.186252 -1.107625 -4.133521
        , Vector.vector 6.121397 2.092375 -4.090186
        , Vector.vector 6.056542 5.292375 -4.046852
        , Vector.vector 5.991688 8.492376 -4.003518
        , Vector.vector 5.926833 11.692377 -3.960183
        , Vector.vector 5.861979 14.892377 -3.916848
        , Vector.vector 5.797124 18.092375 -3.873514
        , Vector.vector 5.732269 21.292374 -3.83018
        , Vector.vector 5.667415 24.492374 -3.786845
        , Vector.vector 5.60256 27.692375 -3.74351
        , Vector.vector 5.537705 30.892374 -3.700176
        , Vector.vector 5.472851 34.092373 -3.656842
        , Vector.vector -9.999999 -48.771099 9.999998
        , Vector.vector -9.999999 -47.10957 9.999998
        , Vector.vector -9.999999 -45.680305 9.999998
        , Vector.vector -9.999999 -44.080578 9.999998
        , Vector.vector -9.999999 -42.666267 6.666665
        , Vector.vector -9.999999 -42.666267 3.333332
        , Vector.vector -9.999999 -42.666267 -0.000002
        , Vector.vector -9.999999 -42.666267 -3.333335
        , Vector.vector -9.999999 -42.666267 -6.666669
        , Vector.vector -9.999999 -44.080578 -10.000002
        , Vector.vector -9.999999 -45.680298 -10.000002
        , Vector.vector -9.999999 -47.109566 -10.000002
        , Vector.vector -9.999999 -48.771099 -10.000002
        , Vector.vector -9.999999 -49.999996 -6.666669
        , Vector.vector -9.999999 -49.999996 -3.333335
        , Vector.vector -9.999999 -49.999996 -0.000002
        , Vector.vector -9.999999 -49.999996 3.333332
        , Vector.vector -9.999999 -49.999996 6.666665
        , Vector.vector -6.666666 -42.666267 -10.000002
        , Vector.vector -3.333333 -42.666267 -10.000002
        , Vector.vector 0.0 -42.666267 -10.000002
        , Vector.vector 3.333334 -42.666267 -10.000002
        , Vector.vector 6.666667 -42.666267 -10.000002
        , Vector.vector 10.0 -44.080578 -10.000002
        , Vector.vector 10.0 -45.680298 -10.000002
        , Vector.vector 10.0 -47.109566 -10.000002
        , Vector.vector 10.0 -48.771099 -10.000002
        , Vector.vector 6.666666 -49.999996 -10.000002
        , Vector.vector 3.333333 -49.999996 -10.000002
        , Vector.vector 0.0 -49.999996 -10.000002
        , Vector.vector -3.333333 -49.999996 -10.000002
        , Vector.vector -6.666666 -49.999996 -10.000002
        , Vector.vector 10.0 -42.666267 -6.666669
        , Vector.vector 10.0 -42.666267 -3.333335
        , Vector.vector 10.0 -42.666267 -0.000002
        , Vector.vector 10.0 -42.666267 3.333332
        , Vector.vector 10.0 -42.666267 6.666665
        , Vector.vector 10.0 -44.080578 9.999998
        , Vector.vector 10.0 -45.680298 9.999998
        , Vector.vector 10.0 -47.109566 9.999998
        , Vector.vector 10.0 -48.771099 9.999998
        , Vector.vector 10.0 -49.999996 6.666665
        , Vector.vector 10.0 -49.999996 3.333332
        , Vector.vector 10.0 -49.999996 -0.000002
        , Vector.vector 10.0 -49.999996 -3.333335
        , Vector.vector 10.0 -49.999996 -6.666669
        , Vector.vector 6.666666 -42.666267 9.999998
        , Vector.vector 3.333333 -42.666267 9.999998
        , Vector.vector 0.0 -42.666267 9.999998
        , Vector.vector -3.333333 -42.666267 9.999998
        , Vector.vector -6.666666 -42.666267 9.999998
        , Vector.vector -6.666666 -49.999996 9.999998
        , Vector.vector -3.333333 -49.999996 9.999998
        , Vector.vector 0.0 -49.999996 9.999998
        , Vector.vector 3.333334 -49.999996 9.999998
        , Vector.vector 6.666667 -49.999996 9.999998
        , Vector.vector -9.999999 -44.080578 6.666665
        , Vector.vector -9.999999 -45.680298 6.666665
        , Vector.vector -9.999999 -47.109566 6.666665
        , Vector.vector -9.999999 -48.771099 6.666665
        , Vector.vector -9.999999 -44.080578 3.333332
        , Vector.vector -9.999999 -45.680298 3.333332
        , Vector.vector -9.999999 -47.109566 3.333332
        , Vector.vector -9.999999 -48.771099 3.333332
        , Vector.vector -9.999999 -44.080578 -0.000002
        , Vector.vector -9.999999 -45.680298 -0.000002
        , Vector.vector -9.999999 -47.109566 -0.000002
        , Vector.vector -9.999999 -48.771099 -0.000002
        , Vector.vector -9.999999 -44.080578 -3.333335
        , Vector.vector -9.999999 -45.680298 -3.333335
        , Vector.vector -9.999999 -47.109566 -3.333335
        , Vector.vector -9.999999 -48.771099 -3.333335
        , Vector.vector -9.999999 -44.080578 -6.666669
        , Vector.vector -9.999999 -45.680298 -6.666669
        , Vector.vector -9.999999 -47.109566 -6.666669
        , Vector.vector -9.999999 -48.771099 -6.666669
        , Vector.vector -6.666666 -44.080578 -10.000002
        , Vector.vector -6.666666 -45.680298 -10.000002
        , Vector.vector -6.666666 -47.109566 -10.000002
        , Vector.vector -6.666666 -48.771099 -10.000002
        , Vector.vector -3.333333 -44.080578 -10.000002
        , Vector.vector -3.333333 -45.680298 -10.000002
        , Vector.vector -3.333333 -47.109566 -10.000002
        , Vector.vector -3.333333 -48.771099 -10.000002
        , Vector.vector 0.0 -44.080578 -10.000002
        , Vector.vector 0.0 -45.680298 -10.000002
        , Vector.vector 0.0 -47.109566 -10.000002
        , Vector.vector 0.0 -48.771099 -10.000002
        , Vector.vector 3.333334 -44.080578 -10.000002
        , Vector.vector 3.333334 -45.680298 -10.000002
        , Vector.vector 3.333333 -47.109566 -10.000002
        , Vector.vector 3.333333 -48.771099 -10.000002
        , Vector.vector 6.666667 -44.080578 -10.000002
        , Vector.vector 6.666667 -45.680298 -10.000002
        , Vector.vector 6.666667 -47.109566 -10.000002
        , Vector.vector 6.666666 -48.771099 -10.000002
        , Vector.vector 10.0 -44.080578 -6.666669
        , Vector.vector 10.0 -45.680298 -6.666669
        , Vector.vector 10.0 -47.109566 -6.666669
        , Vector.vector 10.0 -48.771099 -6.666669
        , Vector.vector 10.0 -44.080578 -3.333335
        , Vector.vector 10.0 -45.680298 -3.333335
        , Vector.vector 10.0 -47.109566 -3.333335
        , Vector.vector 10.0 -48.771099 -3.333335
        , Vector.vector 10.0 -44.080578 -0.000002
        , Vector.vector 10.0 -45.680298 -0.000002
        , Vector.vector 10.0 -47.109566 -0.000002
        , Vector.vector 10.0 -48.771099 -0.000002
        , Vector.vector 10.0 -44.080578 3.333332
        , Vector.vector 10.0 -45.680298 3.333332
        , Vector.vector 10.0 -47.109566 3.333332
        , Vector.vector 10.0 -48.771099 3.333332
        , Vector.vector 10.0 -44.080578 6.666665
        , Vector.vector 10.0 -45.680298 6.666665
        , Vector.vector 10.0 -47.109566 6.666665
        , Vector.vector 10.0 -48.771099 6.666665
        , Vector.vector 6.666666 -44.080578 9.999998
        , Vector.vector 6.666666 -45.680298 9.999998
        , Vector.vector 6.666666 -47.109566 9.999998
        , Vector.vector 6.666666 -48.771099 9.999998
        , Vector.vector 3.333333 -44.080578 9.999998
        , Vector.vector 3.333333 -45.680298 9.999998
        , Vector.vector 3.333333 -47.109566 9.999998
        , Vector.vector 3.333334 -48.771099 9.999998
        , Vector.vector 0.0 -44.080578 9.999998
        , Vector.vector 0.0 -45.680298 9.999998
        , Vector.vector 0.0 -47.109566 9.999998
        , Vector.vector 0.0 -48.771099 9.999998
        , Vector.vector -3.333333 -44.080578 9.999998
        , Vector.vector -3.333333 -45.680298 9.999998
        , Vector.vector -3.333333 -47.109566 9.999998
        , Vector.vector -3.333333 -48.771099 9.999998
        , Vector.vector -6.666666 -44.080578 9.999998
        , Vector.vector -6.666666 -45.680298 9.999998
        , Vector.vector -6.666666 -47.109566 9.999998
        , Vector.vector -6.666666 -48.771099 9.999998
        , Vector.vector -6.666666 -49.999996 6.666665
        , Vector.vector -3.333333 -49.999996 6.666665
        , Vector.vector 0.0 -49.999996 6.666665
        , Vector.vector 3.333334 -49.999996 6.666665
        , Vector.vector 6.666667 -49.999996 6.666665
        , Vector.vector -6.666666 -49.999996 3.333332
        , Vector.vector -3.333333 -49.999996 3.333332
        , Vector.vector 0.0 -49.999996 3.333332
        , Vector.vector 3.333334 -49.999996 3.333332
        , Vector.vector 6.666667 -49.999996 3.333332
        , Vector.vector -6.666666 -49.999996 -0.000002
        , Vector.vector -3.333333 -49.999996 -0.000002
        , Vector.vector 0.0 -49.999996 -0.000002
        , Vector.vector 3.333334 -49.999996 -0.000002
        , Vector.vector 6.666667 -49.999996 -0.000002
        , Vector.vector -6.666666 -49.999996 -3.333335
        , Vector.vector -3.333333 -49.999996 -3.333335
        , Vector.vector 0.0 -49.999996 -3.333335
        , Vector.vector 3.333334 -49.999996 -3.333335
        , Vector.vector 6.666667 -49.999996 -3.333335
        , Vector.vector -6.666666 -49.999996 -6.666669
        , Vector.vector -3.333333 -49.999996 -6.666669
        , Vector.vector 0.0 -49.999996 -6.666669
        , Vector.vector 3.333334 -49.999996 -6.666669
        , Vector.vector 6.666667 -49.999996 -6.666669
        , Vector.vector 6.666666 -42.666267 6.666665
        , Vector.vector 3.333333 -42.666267 6.666665
        , Vector.vector 0.0 -42.666267 6.666665
        , Vector.vector -3.333333 -42.666267 6.666665
        , Vector.vector -6.666666 -42.666267 6.666665
        , Vector.vector 6.666666 -42.666267 3.333332
        , Vector.vector 3.333333 -42.666267 3.333332
        , Vector.vector 0.0 -42.666267 3.333332
        , Vector.vector -3.333333 -42.666267 3.333332
        , Vector.vector -6.666666 -42.666267 3.333332
        , Vector.vector 6.666666 -42.666267 -0.000002
        , Vector.vector 3.333333 -42.666267 -0.000002
        , Vector.vector 0.0 -42.666267 -0.000002
        , Vector.vector -3.333333 -42.666267 -0.000002
        , Vector.vector -6.666666 -42.666267 -0.000002
        , Vector.vector 6.666666 -42.666267 -3.333335
        , Vector.vector 3.333333 -42.666267 -3.333335
        , Vector.vector 0.0 -42.666267 -3.333335
        , Vector.vector -3.333333 -42.666267 -3.333335
        , Vector.vector -6.666666 -42.666267 -3.333335
        , Vector.vector 6.666666 -42.666267 -6.666669
        , Vector.vector 3.333333 -42.666267 -6.666669
        , Vector.vector 0.0 -42.666267 -6.666669
        , Vector.vector -3.333333 -42.666267 -6.666669
        , Vector.vector -6.666666 -42.666267 -6.666669
        , Vector.vector -6.676624 50.000004 -10.001064
        , Vector.vector -3.34329 50.000004 -10.001066
        , Vector.vector -0.009957 50.000004 -10.001066
        , Vector.vector 3.323376 50.000004 -10.001067
        , Vector.vector 6.65671 50.000004 -10.001068
        , Vector.vector 9.990044 50.000004 6.665598
        , Vector.vector 9.990044 50.000004 3.332265
        , Vector.vector 9.990044 50.000004 -0.001069
        , Vector.vector 9.990044 50.000004 -3.334402
        , Vector.vector 6.768284 48.049095 -10.001068
        , Vector.vector -6.676622 49.999996 9.998932
        , Vector.vector -3.343289 49.999996 9.998932
        , Vector.vector -0.009956 49.999996 9.998932
        , Vector.vector 3.323377 50.0 9.998932
        , Vector.vector 6.656711 50.000004 9.998932
        , Vector.vector -10.009957 50.000004 -6.667731
        , Vector.vector -10.009957 50.000004 -3.334399
        , Vector.vector -10.009957 50.000004 -0.001066
        , Vector.vector -10.009957 50.0 3.332267
        , Vector.vector -10.009956 49.999996 6.665599
        , Vector.vector 6.65671 50.000004 -6.667734
        , Vector.vector 6.65671 50.000004 -3.334401
        , Vector.vector 6.65671 50.000004 -0.001068
        , Vector.vector 6.65671 50.000004 3.332266
        , Vector.vector 6.65671 50.000004 6.665599
        , Vector.vector 3.323377 50.000004 -6.667734
        , Vector.vector 3.323377 50.000004 -3.334401
        , Vector.vector 3.323377 50.000004 -0.001068
        , Vector.vector 3.323377 50.000004 3.332266
        , Vector.vector 3.323377 50.000004 6.665599
        , Vector.vector -0.009957 50.000004 -6.667733
        , Vector.vector -0.009957 50.000004 -3.334399
        , Vector.vector -0.009957 50.000004 -0.001067
        , Vector.vector -0.009956 50.0 3.332267
        , Vector.vector -0.009956 49.999996 6.665599
        , Vector.vector -3.34329 50.000004 -6.667732
        , Vector.vector -3.34329 50.000004 -3.334399
        , Vector.vector -3.343289 50.000004 -0.001066
        , Vector.vector -3.343289 50.0 3.332267
        , Vector.vector -3.343289 49.999996 6.665599
        , Vector.vector -6.676624 50.000004 -6.667732
        , Vector.vector -6.676624 50.000004 -3.334399
        , Vector.vector -6.676624 50.000004 -0.001066
        , Vector.vector -6.676623 50.0 3.332267
        , Vector.vector -6.676622 49.999996 6.665599
        , Vector.vector 9.990045 48.049095 0.0
        , Vector.vector 9.990045 46.173176 -0.0
        , Vector.vector 9.990045 44.444309 0.0
        , Vector.vector 9.990045 42.92894 0.0
        , Vector.vector 9.990045 41.68531 0.0
        , Vector.vector 9.990044 42.92894 -3.716965
        , Vector.vector 9.990044 46.173176 -3.550938
        , Vector.vector 3.427587 48.049095 -10.001068
        , Vector.vector 9.990045 40.761208 0.00457
        , Vector.vector 9.990044 41.68531 -3.78061
        , Vector.vector 9.990045 44.444309 -3.639415
        , Vector.vector 9.990044 48.049095 -3.454936
        , Vector.vector 9.990045 41.68531 3.780194
        , Vector.vector 9.990045 48.049095 3.466367
        , Vector.vector 9.990045 46.173176 3.558877
        , Vector.vector 9.990045 44.444309 3.644135
        , Vector.vector 9.990045 42.92894 3.718865
        , Vector.vector 9.990044 44.444305 -6.985473
        , Vector.vector 9.990043 46.173172 -6.886599
        , Vector.vector 9.990043 48.049103 -6.779316
        , Vector.vector 9.990044 50.000008 -6.667547
        , Vector.vector 9.990045 48.049103 6.777179
        , Vector.vector 9.990045 44.444305 6.98333
        , Vector.vector 9.990045 46.173172 6.884455
        , Vector.vector -0.009956 48.049103 9.998932
        , Vector.vector -3.447496 48.049095 9.998932
        , Vector.vector 6.768284 48.049103 9.998932
        , Vector.vector 3.427587 48.049103 9.998932
        , Vector.vector -6.788194 48.049095 9.998932
        , Vector.vector 6.875571 46.173168 9.998932
        , Vector.vector -0.009956 46.173168 9.998932
        , Vector.vector -3.547698 46.173168 9.998932
        , Vector.vector -6.895478 46.173168 9.998932
        , Vector.vector 3.527792 46.173172 9.998932
        , Vector.vector -0.009956 44.444309 9.998932
        , Vector.vector 6.974446 44.444309 9.998931
        , Vector.vector -3.640046 44.444298 9.998932
        , Vector.vector -6.994351 44.444298 9.998931
        , Vector.vector 3.620141 44.444309 9.998932
        , Vector.vector -0.009956 42.928932 9.998932
        , Vector.vector -3.720988 42.92894 9.998932
        , Vector.vector 3.701086 42.92894 9.998932
        , Vector.vector -0.009956 41.68531 9.998932
        , Vector.vector -3.787416 41.68531 9.998931
        , Vector.vector 3.767516 41.68531 9.998931
        , Vector.vector -0.009956 40.761215 9.998931
        , Vector.vector -9.316501 39.940945 0.109024
        , Vector.vector -10.009957 48.049095 -3.438609
        , Vector.vector -10.009956 48.049091 6.777174
        , Vector.vector -10.009957 48.049095 -6.779306
        , Vector.vector -10.009957 48.049095 -0.001066
        , Vector.vector -10.009957 48.049095 3.436476
        , Vector.vector -10.009956 46.173168 -3.538814
        , Vector.vector -10.009956 46.173172 6.88446
        , Vector.vector -10.009956 46.173168 3.536681
        , Vector.vector -10.009957 46.173168 -0.001066
        , Vector.vector -10.009957 46.173172 -6.886592
        , Vector.vector -10.009956 44.444298 -3.631163
        , Vector.vector -10.009955 44.444305 6.983337
        , Vector.vector -10.009956 44.444305 3.629031
        , Vector.vector -10.009956 44.444309 -0.001066
        , Vector.vector -10.009956 44.444305 -6.985468
        , Vector.vector -10.009956 42.92894 -3.712108
        , Vector.vector -10.009956 42.92894 3.709976
        , Vector.vector -10.009956 42.92894 -0.001066
        , Vector.vector -10.009955 41.685303 -3.778538
        , Vector.vector -10.009955 41.685303 3.776406
        , Vector.vector -10.009956 41.685303 -0.001066
        , Vector.vector -10.009955 40.761208 -0.001066
        , Vector.vector -0.009957 48.049095 -10.001067
        , Vector.vector -6.788196 48.049088 -10.001066
        , Vector.vector -3.447497 48.049091 -10.001067
        , Vector.vector -0.009957 46.173168 -10.001067
        , Vector.vector 3.527792 46.173172 -10.001068
        , Vector.vector 6.87557 46.173172 -10.001068
        , Vector.vector -3.547699 46.173168 -10.001068
        , Vector.vector -6.895479 46.173168 -10.001067
        , Vector.vector -0.009957 44.444298 -10.001068
        , Vector.vector 3.620142 44.444298 -10.001069
        , Vector.vector 6.974446 44.444305 -10.001069
        , Vector.vector -3.640047 44.444294 -10.001068
        , Vector.vector -6.994352 44.444298 -10.001068
        , Vector.vector -0.009957 42.928928 -10.001068
        , Vector.vector 3.701087 42.928932 -10.001069
        , Vector.vector -3.720989 42.928928 -10.001069
        , Vector.vector -0.009957 41.685303 -10.001069
        , Vector.vector 3.767517 41.685303 -10.00107
        , Vector.vector -3.787417 41.685299 -10.001069
        , Vector.vector -0.009957 40.761208 -10.001069
        ]


vertexIndexes : List (List Int)
vertexIndexes =
    [ []
    , [ 1, 7, 8, 2 ]
    , [ 3, 9, 10, 4 ]
    , [ 4, 10, 11, 5 ]
    , [ 5, 11, 12, 6 ]
    , [ 1, 6, 12, 7 ]
    , [ 7, 13, 14, 8 ]
    , [ 10, 15, 16, 11 ]
    , [ 11, 16, 17, 12 ]
    , [ 12, 17, 13, 7 ]
    , [ 13, 18, 19, 14 ]
    , [ 15, 21, 22, 16 ]
    , [ 16, 22, 23, 17 ]
    , [ 17, 23, 18, 13 ]
    , [ 18, 24, 25, 19 ]
    , [ 20, 26, 27, 21 ]
    , [ 21, 27, 28, 22 ]
    , [ 22, 28, 29, 23 ]
    , [ 23, 29, 24, 18 ]
    , [ 24, 30, 31, 25 ]
    , [ 476, 43, 37, 764 ]
    , [ 27, 32, 33, 28 ]
    , [ 28, 33, 34, 29 ]
    , [ 29, 34, 30, 24 ]
    , [ 30, 35, 36, 31 ]
    , [ 60, 71, 72, 66 ]
    , [ 32, 38, 39, 33 ]
    , [ 33, 39, 40, 34 ]
    , [ 34, 40, 35, 30 ]
    , [ 35, 41, 42, 36 ]
    , [ 37, 43, 44, 38 ]
    , [ 38, 44, 45, 39 ]
    , [ 39, 45, 46, 40 ]
    , [ 40, 46, 41, 35 ]
    , [ 41, 47, 48, 42 ]
    , [ 77, 88, 89, 83 ]
    , [ 44, 49, 50, 45 ]
    , [ 45, 50, 51, 46 ]
    , [ 46, 51, 47, 41 ]
    , [ 47, 52, 53, 48 ]
    , [ 452, 60, 54, 1052 ]
    , [ 49, 55, 56, 50 ]
    , [ 50, 56, 57, 51 ]
    , [ 51, 57, 52, 47 ]
    , [ 52, 58, 59, 53 ]
    , [ 54, 60, 61, 55 ]
    , [ 55, 61, 62, 56 ]
    , [ 56, 62, 63, 57 ]
    , [ 57, 63, 58, 52 ]
    , [ 58, 64, 65, 59 ]
    , [ 94, 105, 106, 100 ]
    , [ 61, 66, 67, 62 ]
    , [ 62, 67, 68, 63 ]
    , [ 63, 68, 64, 58 ]
    , [ 64, 69, 70, 65 ]
    , [ 404, 77, 71, 740 ]
    , [ 66, 72, 73, 67 ]
    , [ 67, 73, 74, 68 ]
    , [ 68, 74, 69, 64 ]
    , [ 69, 75, 76, 70 ]
    , [ 71, 77, 78, 72 ]
    , [ 72, 78, 79, 73 ]
    , [ 73, 79, 80, 74 ]
    , [ 74, 80, 75, 69 ]
    , [ 75, 81, 82, 76 ]
    , [ 111, 122, 123, 117 ]
    , [ 78, 83, 84, 79 ]
    , [ 79, 84, 85, 80 ]
    , [ 80, 85, 81, 75 ]
    , [ 81, 86, 87, 82 ]
    , [ 716, 94, 88, 1028 ]
    , [ 83, 89, 90, 84 ]
    , [ 84, 90, 91, 85 ]
    , [ 85, 91, 86, 81 ]
    , [ 86, 92, 93, 87 ]
    , [ 88, 94, 95, 89 ]
    , [ 89, 95, 96, 90 ]
    , [ 90, 96, 97, 91 ]
    , [ 91, 97, 92, 86 ]
    , [ 92, 98, 99, 93 ]
    , [ 128, 139, 140, 134 ]
    , [ 95, 100, 101, 96 ]
    , [ 96, 101, 102, 97 ]
    , [ 97, 102, 98, 92 ]
    , [ 98, 103, 104, 99 ]
    , [ 692, 111, 105, 1004 ]
    , [ 100, 106, 107, 101 ]
    , [ 101, 107, 108, 102 ]
    , [ 102, 108, 103, 98 ]
    , [ 103, 109, 110, 104 ]
    , [ 105, 111, 112, 106 ]
    , [ 106, 112, 113, 107 ]
    , [ 107, 113, 114, 108 ]
    , [ 108, 114, 109, 103 ]
    , [ 109, 115, 116, 110 ]
    , [ 145, 156, 157, 151 ]
    , [ 112, 117, 118, 113 ]
    , [ 113, 118, 119, 114 ]
    , [ 114, 119, 115, 109 ]
    , [ 115, 120, 121, 116 ]
    , [ 668, 128, 122, 980 ]
    , [ 117, 123, 124, 118 ]
    , [ 118, 124, 125, 119 ]
    , [ 119, 125, 120, 115 ]
    , [ 120, 126, 127, 121 ]
    , [ 122, 128, 129, 123 ]
    , [ 123, 129, 130, 124 ]
    , [ 124, 130, 131, 125 ]
    , [ 125, 131, 126, 120 ]
    , [ 126, 132, 133, 127 ]
    , [ 162, 173, 174, 168 ]
    , [ 129, 134, 135, 130 ]
    , [ 130, 135, 136, 131 ]
    , [ 131, 136, 132, 126 ]
    , [ 132, 137, 1426, 138, 133 ]
    , [ 644, 145, 139, 956 ]
    , [ 134, 140, 141, 135 ]
    , [ 135, 141, 142, 136 ]
    , [ 136, 142, 137, 132 ]
    , [ 137, 143, 144, 138, 1426 ]
    , [ 139, 145, 146, 140 ]
    , [ 140, 146, 147, 141 ]
    , [ 141, 147, 148, 142 ]
    , [ 142, 148, 143, 137 ]
    , [ 143, 149, 150, 144 ]
    , [ 179, 190, 191, 185 ]
    , [ 146, 151, 152, 147 ]
    , [ 147, 152, 153, 148 ]
    , [ 148, 153, 149, 143 ]
    , [ 149, 154, 155, 150 ]
    , [ 620, 162, 156, 932 ]
    , [ 151, 157, 158, 152 ]
    , [ 152, 158, 159, 153 ]
    , [ 153, 159, 154, 149 ]
    , [ 154, 160, 161, 155 ]
    , [ 156, 162, 163, 157 ]
    , [ 157, 163, 164, 158 ]
    , [ 158, 164, 165, 159 ]
    , [ 159, 165, 160, 154 ]
    , [ 160, 166, 167, 161 ]
    , [ 196, 207, 208, 202 ]
    , [ 163, 168, 169, 164 ]
    , [ 164, 169, 170, 165 ]
    , [ 165, 170, 166, 160 ]
    , [ 166, 171, 172, 167 ]
    , [ 596, 179, 173, 908 ]
    , [ 168, 174, 175, 169 ]
    , [ 169, 175, 176, 170 ]
    , [ 170, 176, 171, 166 ]
    , [ 171, 177, 178, 172 ]
    , [ 173, 179, 180, 174 ]
    , [ 174, 180, 181, 175 ]
    , [ 175, 181, 182, 176 ]
    , [ 176, 182, 177, 171 ]
    , [ 177, 183, 184, 178 ]
    , [ 213, 224, 225, 219 ]
    , [ 180, 185, 186, 181 ]
    , [ 181, 186, 187, 182 ]
    , [ 182, 187, 183, 177 ]
    , [ 183, 188, 189, 184 ]
    , [ 572, 196, 190, 884 ]
    , [ 185, 191, 192, 186 ]
    , [ 186, 192, 193, 187 ]
    , [ 187, 193, 188, 183 ]
    , [ 188, 194, 195, 189 ]
    , [ 190, 196, 197, 191 ]
    , [ 191, 197, 198, 192 ]
    , [ 192, 198, 199, 193 ]
    , [ 193, 199, 194, 188 ]
    , [ 194, 200, 201, 195 ]
    , [ 230, 241, 242, 236 ]
    , [ 197, 202, 203, 198 ]
    , [ 198, 203, 204, 199 ]
    , [ 199, 204, 200, 194 ]
    , [ 200, 205, 206, 201 ]
    , [ 548, 213, 207, 860 ]
    , [ 202, 208, 209, 203 ]
    , [ 203, 209, 210, 204 ]
    , [ 204, 210, 205, 200 ]
    , [ 205, 211, 212, 206 ]
    , [ 207, 213, 214, 208 ]
    , [ 208, 214, 215, 209 ]
    , [ 209, 215, 216, 210 ]
    , [ 210, 216, 211, 205 ]
    , [ 211, 217, 218, 212 ]
    , [ 247, 258, 259, 253 ]
    , [ 214, 219, 220, 215 ]
    , [ 215, 220, 221, 216 ]
    , [ 216, 221, 217, 211 ]
    , [ 217, 222, 223, 218 ]
    , [ 524, 230, 224, 836 ]
    , [ 219, 225, 226, 220 ]
    , [ 220, 226, 227, 221 ]
    , [ 221, 227, 222, 217 ]
    , [ 222, 228, 229, 223 ]
    , [ 224, 230, 231, 225 ]
    , [ 225, 231, 232, 226 ]
    , [ 226, 232, 233, 227 ]
    , [ 227, 233, 228, 222 ]
    , [ 228, 234, 235, 229 ]
    , [ 1076, 258, 247, 428 ]
    , [ 231, 236, 237, 232 ]
    , [ 232, 237, 238, 233 ]
    , [ 233, 238, 234, 228 ]
    , [ 234, 239, 240, 235 ]
    , [ 428, 247, 241, 812 ]
    , [ 236, 242, 243, 237 ]
    , [ 237, 243, 244, 238 ]
    , [ 238, 244, 239, 234 ]
    , [ 239, 245, 246, 240 ]
    , [ 241, 247, 248, 242 ]
    , [ 242, 248, 249, 243 ]
    , [ 243, 249, 250, 244 ]
    , [ 244, 250, 245, 239 ]
    , [ 245, 251, 252, 246 ]
    , [ 248, 253, 254, 249 ]
    , [ 249, 254, 255, 250 ]
    , [ 250, 255, 251, 245 ]
    , [ 251, 256, 257, 252 ]
    , [ 253, 259, 260, 254 ]
    , [ 254, 260, 261, 255 ]
    , [ 255, 261, 256, 251 ]
    , [ 256, 262, 263, 257 ]
    , [ 258, 264, 265, 259 ]
    , [ 259, 265, 266, 260 ]
    , [ 260, 266, 267, 261 ]
    , [ 261, 267, 262, 256 ]
    , [ 262, 268, 269, 263 ]
    , [ 500, 9, 3, 788 ]
    , [ 265, 270, 271, 266 ]
    , [ 266, 271, 272, 267 ]
    , [ 267, 272, 268, 262 ]
    , [ 268, 1, 2, 269 ]
    , [ 26, 37, 38, 32 ]
    , [ 270, 4, 5, 271 ]
    , [ 271, 5, 6, 272 ]
    , [ 272, 6, 1, 268 ]
    , [ 60, 66, 61 ]
    , [ 43, 54, 55, 49 ]
    , [ 764, 37, 26, 1148 ]
    , [ 26, 32, 27 ]
    , [ 9, 20, 21, 15 ]
    , [ 788, 3, 264, 1100 ]
    , [ 264, 3, 4, 270 ]
    , [ 264, 270, 265 ]
    , [ 247, 253, 248 ]
    , [ 812, 241, 230, 524 ]
    , [ 230, 236, 231 ]
    , [ 836, 224, 213, 548 ]
    , [ 213, 219, 214 ]
    , [ 860, 207, 196, 572 ]
    , [ 196, 202, 197 ]
    , [ 884, 190, 179, 596 ]
    , [ 179, 185, 180 ]
    , [ 908, 173, 162, 620 ]
    , [ 162, 168, 163 ]
    , [ 932, 156, 145, 644 ]
    , [ 145, 151, 146 ]
    , [ 956, 139, 128, 668 ]
    , [ 128, 134, 129 ]
    , [ 980, 122, 111, 692 ]
    , [ 111, 117, 112 ]
    , [ 1004, 105, 94, 716 ]
    , [ 94, 100, 95 ]
    , [ 77, 83, 78 ]
    , [ 1028, 88, 77, 404 ]
    , [ 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304 ]
    , [ 1224, 1161, 306, 1162 ]
    , [ 1244, 1175, 307, 1176 ]
    , [ 1264, 1189, 308, 1190 ]
    , [ 1284, 1149, 305, 1200 ]
    , [ 1309, 1176, 307, 1194 ]
    , [ 1334, 1167, 310, 1157 ]
    , [ 1380, 1393, 1394, 1381 ]
    , [ 1410, 1404, 1405, 1411 ]
    , [ 1431, 1434, 1433, 1428 ]
    , [ 331, 329, 347, 379 ]
    , [ 379, 377, 333, 331 ]
    , [ 377, 375, 335, 333 ]
    , [ 375, 373, 337, 335 ]
    , [ 373, 371, 339, 337 ]
    , [ 371, 369, 341, 339 ]
    , [ 369, 367, 343, 341 ]
    , [ 362, 316, 318, 360 ]
    , [ 361, 359, 342, 344 ]
    , [ 344, 346, 363, 361 ]
    , [ 359, 357, 340, 342 ]
    , [ 357, 355, 338, 340 ]
    , [ 355, 353, 336, 338 ]
    , [ 353, 351, 334, 336 ]
    , [ 351, 349, 332, 334 ]
    , [ 349, 347, 330, 332 ]
    , [ 362, 364, 316 ]
    , [ 348, 329, 327, 380 ]
    , [ 380, 327, 325, 378 ]
    , [ 378, 325, 323, 376 ]
    , [ 376, 323, 321, 374 ]
    , [ 374, 321, 319, 372 ]
    , [ 372, 319, 317, 370 ]
    , [ 370, 317, 315, 368 ]
    , [ 345, 343, 367, 365 ]
    , [ 348, 350, 328, 330 ]
    , [ 350, 352, 326, 328 ]
    , [ 352, 354, 324, 326 ]
    , [ 354, 356, 322, 324 ]
    , [ 356, 358, 320, 322 ]
    , [ 358, 360, 318, 320 ]
    , [ 368, 366, 315 ]
    , [ 740, 71, 60, 452 ]
    , [ 9, 15, 10 ]
    , [ 1100, 264, 258, 1076 ]
    , [ 1124, 20, 9, 500 ]
    , [ 1052, 54, 43, 476 ]
    , [ 43, 49, 44 ]
    , [ 1148, 26, 20, 1124 ]
    , [ 329, 348, 330, 347 ]
    , [ 1379, 1354, 365, 1345 ]
    , [ 276, 453, 741, 277 ]
    , [ 453, 454, 742, 741 ]
    , [ 454, 455, 743, 742 ]
    , [ 455, 456, 744, 743 ]
    , [ 456, 457, 745, 744 ]
    , [ 457, 458, 746, 745 ]
    , [ 458, 459, 747, 746 ]
    , [ 459, 460, 748, 747 ]
    , [ 460, 461, 749, 748 ]
    , [ 461, 462, 750, 749 ]
    , [ 462, 463, 751, 750 ]
    , [ 463, 464, 752, 751 ]
    , [ 464, 465, 753, 752 ]
    , [ 465, 466, 754, 753 ]
    , [ 466, 467, 755, 754 ]
    , [ 467, 468, 756, 755 ]
    , [ 468, 469, 757, 756 ]
    , [ 469, 470, 758, 757 ]
    , [ 470, 471, 759, 758 ]
    , [ 471, 472, 760, 759 ]
    , [ 472, 473, 761, 760 ]
    , [ 473, 474, 762, 761 ]
    , [ 474, 475, 763, 762 ]
    , [ 475, 476, 764, 763 ]
    , [ 274, 429, 1029, 275 ]
    , [ 429, 430, 1030, 1029 ]
    , [ 430, 431, 1031, 1030 ]
    , [ 431, 432, 1032, 1031 ]
    , [ 432, 433, 1033, 1032 ]
    , [ 433, 434, 1034, 1033 ]
    , [ 434, 435, 1035, 1034 ]
    , [ 435, 436, 1036, 1035 ]
    , [ 436, 437, 1037, 1036 ]
    , [ 437, 438, 1038, 1037 ]
    , [ 438, 439, 1039, 1038 ]
    , [ 439, 440, 1040, 1039 ]
    , [ 440, 441, 1041, 1040 ]
    , [ 441, 442, 1042, 1041 ]
    , [ 442, 443, 1043, 1042 ]
    , [ 443, 444, 1044, 1043 ]
    , [ 444, 445, 1045, 1044 ]
    , [ 445, 446, 1046, 1045 ]
    , [ 446, 447, 1047, 1046 ]
    , [ 447, 448, 1048, 1047 ]
    , [ 448, 449, 1049, 1048 ]
    , [ 449, 450, 1050, 1049 ]
    , [ 450, 451, 1051, 1050 ]
    , [ 451, 452, 1052, 1051 ]
    , [ 304, 381, 717, 273 ]
    , [ 381, 382, 718, 717 ]
    , [ 382, 383, 719, 718 ]
    , [ 383, 384, 720, 719 ]
    , [ 384, 385, 721, 720 ]
    , [ 385, 386, 722, 721 ]
    , [ 386, 387, 723, 722 ]
    , [ 387, 388, 724, 723 ]
    , [ 388, 389, 725, 724 ]
    , [ 389, 390, 726, 725 ]
    , [ 390, 391, 727, 726 ]
    , [ 391, 392, 728, 727 ]
    , [ 392, 393, 729, 728 ]
    , [ 393, 394, 730, 729 ]
    , [ 394, 395, 731, 730 ]
    , [ 395, 396, 732, 731 ]
    , [ 396, 397, 733, 732 ]
    , [ 397, 398, 734, 733 ]
    , [ 398, 399, 735, 734 ]
    , [ 399, 400, 736, 735 ]
    , [ 400, 401, 737, 736 ]
    , [ 401, 402, 738, 737 ]
    , [ 402, 403, 739, 738 ]
    , [ 403, 404, 740, 739 ]
    , [ 302, 693, 1005, 303 ]
    , [ 693, 694, 1006, 1005 ]
    , [ 694, 695, 1007, 1006 ]
    , [ 695, 696, 1008, 1007 ]
    , [ 696, 697, 1009, 1008 ]
    , [ 697, 698, 1010, 1009 ]
    , [ 698, 699, 1011, 1010 ]
    , [ 699, 700, 1012, 1011 ]
    , [ 700, 701, 1013, 1012 ]
    , [ 701, 702, 1014, 1013 ]
    , [ 702, 703, 1015, 1014 ]
    , [ 703, 704, 1016, 1015 ]
    , [ 704, 705, 1017, 1016 ]
    , [ 705, 706, 1018, 1017 ]
    , [ 706, 707, 1019, 1018 ]
    , [ 707, 708, 1020, 1019 ]
    , [ 708, 709, 1021, 1020 ]
    , [ 709, 710, 1022, 1021 ]
    , [ 710, 711, 1023, 1022 ]
    , [ 711, 712, 1024, 1023 ]
    , [ 712, 713, 1025, 1024 ]
    , [ 713, 714, 1026, 1025 ]
    , [ 714, 715, 1027, 1026 ]
    , [ 715, 716, 1028, 1027 ]
    , [ 300, 669, 981, 301 ]
    , [ 669, 670, 982, 981 ]
    , [ 670, 671, 983, 982 ]
    , [ 671, 672, 984, 983 ]
    , [ 672, 673, 985, 984 ]
    , [ 673, 674, 986, 985 ]
    , [ 674, 675, 987, 986 ]
    , [ 675, 676, 988, 987 ]
    , [ 676, 677, 989, 988 ]
    , [ 677, 678, 990, 989 ]
    , [ 678, 679, 991, 990 ]
    , [ 679, 680, 992, 991 ]
    , [ 680, 681, 993, 992 ]
    , [ 681, 682, 994, 993 ]
    , [ 682, 683, 995, 994 ]
    , [ 683, 684, 996, 995 ]
    , [ 684, 685, 997, 996 ]
    , [ 685, 686, 998, 997 ]
    , [ 686, 687, 999, 998 ]
    , [ 687, 688, 1000, 999 ]
    , [ 688, 689, 1001, 1000 ]
    , [ 689, 690, 1002, 1001 ]
    , [ 690, 691, 1003, 1002 ]
    , [ 691, 692, 1004, 1003 ]
    , [ 298, 645, 957, 299 ]
    , [ 645, 646, 958, 957 ]
    , [ 646, 647, 959, 958 ]
    , [ 647, 648, 960, 959 ]
    , [ 648, 649, 961, 960 ]
    , [ 649, 650, 962, 961 ]
    , [ 650, 651, 963, 962 ]
    , [ 651, 652, 964, 963 ]
    , [ 652, 653, 965, 964 ]
    , [ 653, 654, 966, 965 ]
    , [ 654, 655, 967, 966 ]
    , [ 655, 656, 968, 967 ]
    , [ 656, 657, 969, 968 ]
    , [ 657, 658, 970, 969 ]
    , [ 658, 659, 971, 970 ]
    , [ 659, 660, 972, 971 ]
    , [ 660, 661, 973, 972 ]
    , [ 661, 662, 974, 973 ]
    , [ 662, 663, 975, 974 ]
    , [ 663, 664, 976, 975 ]
    , [ 664, 665, 977, 976 ]
    , [ 665, 666, 978, 977 ]
    , [ 666, 667, 979, 978 ]
    , [ 667, 668, 980, 979 ]
    , [ 296, 621, 933, 297 ]
    , [ 621, 622, 934, 933 ]
    , [ 622, 623, 935, 934 ]
    , [ 623, 624, 936, 935 ]
    , [ 624, 625, 937, 936 ]
    , [ 625, 626, 938, 937 ]
    , [ 626, 627, 939, 938 ]
    , [ 627, 628, 940, 939 ]
    , [ 628, 629, 941, 940 ]
    , [ 629, 630, 942, 941 ]
    , [ 630, 631, 943, 942 ]
    , [ 631, 632, 944, 943 ]
    , [ 632, 633, 945, 944 ]
    , [ 633, 634, 946, 945 ]
    , [ 634, 635, 947, 946 ]
    , [ 635, 636, 948, 947 ]
    , [ 636, 637, 949, 948 ]
    , [ 637, 638, 950, 949 ]
    , [ 638, 639, 951, 950 ]
    , [ 639, 640, 952, 951 ]
    , [ 640, 641, 953, 952 ]
    , [ 641, 642, 954, 953 ]
    , [ 642, 643, 955, 954 ]
    , [ 643, 644, 956, 955 ]
    , [ 294, 597, 909, 295 ]
    , [ 597, 598, 910, 909 ]
    , [ 598, 599, 911, 910 ]
    , [ 599, 600, 912, 911 ]
    , [ 600, 601, 913, 912 ]
    , [ 601, 602, 914, 913 ]
    , [ 602, 603, 915, 914 ]
    , [ 603, 604, 916, 915 ]
    , [ 604, 605, 917, 916 ]
    , [ 605, 606, 918, 917 ]
    , [ 606, 607, 919, 918 ]
    , [ 607, 608, 920, 919 ]
    , [ 608, 609, 921, 920 ]
    , [ 609, 610, 922, 921 ]
    , [ 610, 611, 923, 922 ]
    , [ 611, 612, 924, 923 ]
    , [ 612, 613, 925, 924 ]
    , [ 613, 614, 926, 925 ]
    , [ 614, 615, 927, 926 ]
    , [ 615, 616, 928, 927 ]
    , [ 616, 617, 929, 928 ]
    , [ 617, 618, 930, 929 ]
    , [ 618, 619, 931, 930 ]
    , [ 619, 620, 932, 931 ]
    , [ 292, 573, 885, 293 ]
    , [ 573, 574, 886, 885 ]
    , [ 574, 575, 887, 886 ]
    , [ 575, 576, 888, 887 ]
    , [ 576, 577, 889, 888 ]
    , [ 577, 578, 890, 889 ]
    , [ 578, 579, 891, 890 ]
    , [ 579, 580, 892, 891 ]
    , [ 580, 581, 893, 892 ]
    , [ 581, 582, 894, 893 ]
    , [ 582, 583, 895, 894 ]
    , [ 583, 584, 896, 895 ]
    , [ 584, 585, 897, 896 ]
    , [ 585, 586, 898, 897 ]
    , [ 586, 587, 899, 898 ]
    , [ 587, 588, 900, 899 ]
    , [ 588, 589, 901, 900 ]
    , [ 589, 590, 902, 901 ]
    , [ 590, 591, 903, 902 ]
    , [ 591, 592, 904, 903 ]
    , [ 592, 593, 905, 904 ]
    , [ 593, 594, 906, 905 ]
    , [ 594, 595, 907, 906 ]
    , [ 595, 596, 908, 907 ]
    , [ 290, 549, 861, 291 ]
    , [ 549, 550, 862, 861 ]
    , [ 550, 551, 863, 862 ]
    , [ 551, 552, 864, 863 ]
    , [ 552, 553, 865, 864 ]
    , [ 553, 554, 866, 865 ]
    , [ 554, 555, 867, 866 ]
    , [ 555, 556, 868, 867 ]
    , [ 556, 557, 869, 868 ]
    , [ 557, 558, 870, 869 ]
    , [ 558, 559, 871, 870 ]
    , [ 559, 560, 872, 871 ]
    , [ 560, 561, 873, 872 ]
    , [ 561, 562, 874, 873 ]
    , [ 562, 563, 875, 874 ]
    , [ 563, 564, 876, 875 ]
    , [ 564, 565, 877, 876 ]
    , [ 565, 566, 878, 877 ]
    , [ 566, 567, 879, 878 ]
    , [ 567, 568, 880, 879 ]
    , [ 568, 569, 881, 880 ]
    , [ 569, 570, 882, 881 ]
    , [ 570, 571, 883, 882 ]
    , [ 571, 572, 884, 883 ]
    , [ 288, 525, 837, 289 ]
    , [ 525, 526, 838, 837 ]
    , [ 526, 527, 839, 838 ]
    , [ 527, 528, 840, 839 ]
    , [ 528, 529, 841, 840 ]
    , [ 529, 530, 842, 841 ]
    , [ 530, 531, 843, 842 ]
    , [ 531, 532, 844, 843 ]
    , [ 532, 533, 845, 844 ]
    , [ 533, 534, 846, 845 ]
    , [ 534, 535, 847, 846 ]
    , [ 535, 536, 848, 847 ]
    , [ 536, 537, 849, 848 ]
    , [ 537, 538, 850, 849 ]
    , [ 538, 539, 851, 850 ]
    , [ 539, 540, 852, 851 ]
    , [ 540, 541, 853, 852 ]
    , [ 541, 542, 854, 853 ]
    , [ 542, 543, 855, 854 ]
    , [ 543, 544, 856, 855 ]
    , [ 544, 545, 857, 856 ]
    , [ 545, 546, 858, 857 ]
    , [ 546, 547, 859, 858 ]
    , [ 547, 548, 860, 859 ]
    , [ 286, 501, 813, 287 ]
    , [ 501, 502, 814, 813 ]
    , [ 502, 503, 815, 814 ]
    , [ 503, 504, 816, 815 ]
    , [ 504, 505, 817, 816 ]
    , [ 505, 506, 818, 817 ]
    , [ 506, 507, 819, 818 ]
    , [ 507, 508, 820, 819 ]
    , [ 508, 509, 821, 820 ]
    , [ 509, 510, 822, 821 ]
    , [ 510, 511, 823, 822 ]
    , [ 511, 512, 824, 823 ]
    , [ 512, 513, 825, 824 ]
    , [ 513, 514, 826, 825 ]
    , [ 514, 515, 827, 826 ]
    , [ 515, 516, 828, 827 ]
    , [ 516, 517, 829, 828 ]
    , [ 517, 518, 830, 829 ]
    , [ 518, 519, 831, 830 ]
    , [ 519, 520, 832, 831 ]
    , [ 520, 521, 833, 832 ]
    , [ 521, 522, 834, 833 ]
    , [ 522, 523, 835, 834 ]
    , [ 523, 524, 836, 835 ]
    , [ 283, 1053, 405, 284 ]
    , [ 1053, 1054, 406, 405 ]
    , [ 1054, 1055, 407, 406 ]
    , [ 1055, 1056, 408, 407 ]
    , [ 1056, 1057, 409, 408 ]
    , [ 1057, 1058, 410, 409 ]
    , [ 1058, 1059, 411, 410 ]
    , [ 1059, 1060, 412, 411 ]
    , [ 1060, 1061, 413, 412 ]
    , [ 1061, 1062, 414, 413 ]
    , [ 1062, 1063, 415, 414 ]
    , [ 1063, 1064, 416, 415 ]
    , [ 1064, 1065, 417, 416 ]
    , [ 1065, 1066, 418, 417 ]
    , [ 1066, 1067, 419, 418 ]
    , [ 1067, 1068, 420, 419 ]
    , [ 1068, 1069, 421, 420 ]
    , [ 1069, 1070, 422, 421 ]
    , [ 1070, 1071, 423, 422 ]
    , [ 1071, 1072, 424, 423 ]
    , [ 1072, 1073, 425, 424 ]
    , [ 1073, 1074, 426, 425 ]
    , [ 1074, 1075, 427, 426 ]
    , [ 1075, 1076, 428, 427 ]
    , [ 284, 405, 789, 285 ]
    , [ 405, 406, 790, 789 ]
    , [ 406, 407, 791, 790 ]
    , [ 407, 408, 792, 791 ]
    , [ 408, 409, 793, 792 ]
    , [ 409, 410, 794, 793 ]
    , [ 410, 411, 795, 794 ]
    , [ 411, 412, 796, 795 ]
    , [ 412, 413, 797, 796 ]
    , [ 413, 414, 798, 797 ]
    , [ 414, 415, 799, 798 ]
    , [ 415, 416, 800, 799 ]
    , [ 416, 417, 801, 800 ]
    , [ 417, 418, 802, 801 ]
    , [ 418, 419, 803, 802 ]
    , [ 419, 420, 804, 803 ]
    , [ 420, 421, 805, 804 ]
    , [ 421, 422, 806, 805 ]
    , [ 422, 423, 807, 806 ]
    , [ 423, 424, 808, 807 ]
    , [ 424, 425, 809, 808 ]
    , [ 425, 426, 810, 809 ]
    , [ 426, 427, 811, 810 ]
    , [ 427, 428, 812, 811 ]
    , [ 280, 477, 765, 281 ]
    , [ 477, 478, 766, 765 ]
    , [ 478, 479, 767, 766 ]
    , [ 479, 480, 768, 767 ]
    , [ 480, 481, 769, 768 ]
    , [ 481, 482, 770, 769 ]
    , [ 482, 483, 771, 770 ]
    , [ 483, 484, 772, 771 ]
    , [ 484, 485, 773, 772 ]
    , [ 485, 486, 774, 773 ]
    , [ 486, 487, 775, 774 ]
    , [ 487, 488, 776, 775 ]
    , [ 488, 489, 777, 776 ]
    , [ 489, 490, 778, 777 ]
    , [ 490, 491, 779, 778 ]
    , [ 491, 492, 780, 779 ]
    , [ 492, 493, 781, 780 ]
    , [ 493, 494, 782, 781 ]
    , [ 494, 495, 783, 782 ]
    , [ 495, 496, 784, 783 ]
    , [ 496, 497, 785, 784 ]
    , [ 497, 498, 786, 785 ]
    , [ 498, 499, 787, 786 ]
    , [ 499, 500, 788, 787 ]
    , [ 277, 741, 1125, 278 ]
    , [ 741, 742, 1126, 1125 ]
    , [ 742, 743, 1127, 1126 ]
    , [ 743, 744, 1128, 1127 ]
    , [ 744, 745, 1129, 1128 ]
    , [ 745, 746, 1130, 1129 ]
    , [ 746, 747, 1131, 1130 ]
    , [ 747, 748, 1132, 1131 ]
    , [ 748, 749, 1133, 1132 ]
    , [ 749, 750, 1134, 1133 ]
    , [ 750, 751, 1135, 1134 ]
    , [ 751, 752, 1136, 1135 ]
    , [ 752, 753, 1137, 1136 ]
    , [ 753, 754, 1138, 1137 ]
    , [ 754, 755, 1139, 1138 ]
    , [ 755, 756, 1140, 1139 ]
    , [ 756, 757, 1141, 1140 ]
    , [ 757, 758, 1142, 1141 ]
    , [ 758, 759, 1143, 1142 ]
    , [ 759, 760, 1144, 1143 ]
    , [ 760, 761, 1145, 1144 ]
    , [ 761, 762, 1146, 1145 ]
    , [ 762, 763, 1147, 1146 ]
    , [ 763, 764, 1148, 1147 ]
    , [ 281, 765, 1077, 282 ]
    , [ 765, 766, 1078, 1077 ]
    , [ 766, 767, 1079, 1078 ]
    , [ 767, 768, 1080, 1079 ]
    , [ 768, 769, 1081, 1080 ]
    , [ 769, 770, 1082, 1081 ]
    , [ 770, 771, 1083, 1082 ]
    , [ 771, 772, 1084, 1083 ]
    , [ 772, 773, 1085, 1084 ]
    , [ 773, 774, 1086, 1085 ]
    , [ 774, 775, 1087, 1086 ]
    , [ 775, 776, 1088, 1087 ]
    , [ 776, 777, 1089, 1088 ]
    , [ 777, 778, 1090, 1089 ]
    , [ 778, 779, 1091, 1090 ]
    , [ 779, 780, 1092, 1091 ]
    , [ 780, 781, 1093, 1092 ]
    , [ 781, 782, 1094, 1093 ]
    , [ 782, 783, 1095, 1094 ]
    , [ 783, 784, 1096, 1095 ]
    , [ 784, 785, 1097, 1096 ]
    , [ 785, 786, 1098, 1097 ]
    , [ 786, 787, 1099, 1098 ]
    , [ 787, 788, 1100, 1099 ]
    , [ 285, 789, 501, 286 ]
    , [ 789, 790, 502, 501 ]
    , [ 790, 791, 503, 502 ]
    , [ 791, 792, 504, 503 ]
    , [ 792, 793, 505, 504 ]
    , [ 793, 794, 506, 505 ]
    , [ 794, 795, 507, 506 ]
    , [ 795, 796, 508, 507 ]
    , [ 796, 797, 509, 508 ]
    , [ 797, 798, 510, 509 ]
    , [ 798, 799, 511, 510 ]
    , [ 799, 800, 512, 511 ]
    , [ 800, 801, 513, 512 ]
    , [ 801, 802, 514, 513 ]
    , [ 802, 803, 515, 514 ]
    , [ 803, 804, 516, 515 ]
    , [ 804, 805, 517, 516 ]
    , [ 805, 806, 518, 517 ]
    , [ 806, 807, 519, 518 ]
    , [ 807, 808, 520, 519 ]
    , [ 808, 809, 521, 520 ]
    , [ 809, 810, 522, 521 ]
    , [ 810, 811, 523, 522 ]
    , [ 811, 812, 524, 523 ]
    , [ 287, 813, 525, 288 ]
    , [ 813, 814, 526, 525 ]
    , [ 814, 815, 527, 526 ]
    , [ 815, 816, 528, 527 ]
    , [ 816, 817, 529, 528 ]
    , [ 817, 818, 530, 529 ]
    , [ 818, 819, 531, 530 ]
    , [ 819, 820, 532, 531 ]
    , [ 820, 821, 533, 532 ]
    , [ 821, 822, 534, 533 ]
    , [ 822, 823, 535, 534 ]
    , [ 823, 824, 536, 535 ]
    , [ 824, 825, 537, 536 ]
    , [ 825, 826, 538, 537 ]
    , [ 826, 827, 539, 538 ]
    , [ 827, 828, 540, 539 ]
    , [ 828, 829, 541, 540 ]
    , [ 829, 830, 542, 541 ]
    , [ 830, 831, 543, 542 ]
    , [ 831, 832, 544, 543 ]
    , [ 832, 833, 545, 544 ]
    , [ 833, 834, 546, 545 ]
    , [ 834, 835, 547, 546 ]
    , [ 835, 836, 548, 547 ]
    , [ 289, 837, 549, 290 ]
    , [ 837, 838, 550, 549 ]
    , [ 838, 839, 551, 550 ]
    , [ 839, 840, 552, 551 ]
    , [ 840, 841, 553, 552 ]
    , [ 841, 842, 554, 553 ]
    , [ 842, 843, 555, 554 ]
    , [ 843, 844, 556, 555 ]
    , [ 844, 845, 557, 556 ]
    , [ 845, 846, 558, 557 ]
    , [ 846, 847, 559, 558 ]
    , [ 847, 848, 560, 559 ]
    , [ 848, 849, 561, 560 ]
    , [ 849, 850, 562, 561 ]
    , [ 850, 851, 563, 562 ]
    , [ 851, 852, 564, 563 ]
    , [ 852, 853, 565, 564 ]
    , [ 853, 854, 566, 565 ]
    , [ 854, 855, 567, 566 ]
    , [ 855, 856, 568, 567 ]
    , [ 856, 857, 569, 568 ]
    , [ 857, 858, 570, 569 ]
    , [ 858, 859, 571, 570 ]
    , [ 859, 860, 572, 571 ]
    , [ 291, 861, 573, 292 ]
    , [ 861, 862, 574, 573 ]
    , [ 862, 863, 575, 574 ]
    , [ 863, 864, 576, 575 ]
    , [ 864, 865, 577, 576 ]
    , [ 865, 866, 578, 577 ]
    , [ 866, 867, 579, 578 ]
    , [ 867, 868, 580, 579 ]
    , [ 868, 869, 581, 580 ]
    , [ 869, 870, 582, 581 ]
    , [ 870, 871, 583, 582 ]
    , [ 871, 872, 584, 583 ]
    , [ 872, 873, 585, 584 ]
    , [ 873, 874, 586, 585 ]
    , [ 874, 875, 587, 586 ]
    , [ 875, 876, 588, 587 ]
    , [ 876, 877, 589, 588 ]
    , [ 877, 878, 590, 589 ]
    , [ 878, 879, 591, 590 ]
    , [ 879, 880, 592, 591 ]
    , [ 880, 881, 593, 592 ]
    , [ 881, 882, 594, 593 ]
    , [ 882, 883, 595, 594 ]
    , [ 883, 884, 596, 595 ]
    , [ 293, 885, 597, 294 ]
    , [ 885, 886, 598, 597 ]
    , [ 886, 887, 599, 598 ]
    , [ 887, 888, 600, 599 ]
    , [ 888, 889, 601, 600 ]
    , [ 889, 890, 602, 601 ]
    , [ 890, 891, 603, 602 ]
    , [ 891, 892, 604, 603 ]
    , [ 892, 893, 605, 604 ]
    , [ 893, 894, 606, 605 ]
    , [ 894, 895, 607, 606 ]
    , [ 895, 896, 608, 607 ]
    , [ 896, 897, 609, 608 ]
    , [ 897, 898, 610, 609 ]
    , [ 898, 899, 611, 610 ]
    , [ 899, 900, 612, 611 ]
    , [ 900, 901, 613, 612 ]
    , [ 901, 902, 614, 613 ]
    , [ 902, 903, 615, 614 ]
    , [ 903, 904, 616, 615 ]
    , [ 904, 905, 617, 616 ]
    , [ 905, 906, 618, 617 ]
    , [ 906, 907, 619, 618 ]
    , [ 907, 908, 620, 619 ]
    , [ 295, 909, 621, 296 ]
    , [ 909, 910, 622, 621 ]
    , [ 910, 911, 623, 622 ]
    , [ 911, 912, 624, 623 ]
    , [ 912, 913, 625, 624 ]
    , [ 913, 914, 626, 625 ]
    , [ 914, 915, 627, 626 ]
    , [ 915, 916, 628, 627 ]
    , [ 916, 917, 629, 628 ]
    , [ 917, 918, 630, 629 ]
    , [ 918, 919, 631, 630 ]
    , [ 919, 920, 632, 631 ]
    , [ 920, 921, 633, 632 ]
    , [ 921, 922, 634, 633 ]
    , [ 922, 923, 635, 634 ]
    , [ 923, 924, 636, 635 ]
    , [ 924, 925, 637, 636 ]
    , [ 925, 926, 638, 637 ]
    , [ 926, 927, 639, 638 ]
    , [ 927, 928, 640, 639 ]
    , [ 928, 929, 641, 640 ]
    , [ 929, 930, 642, 641 ]
    , [ 930, 931, 643, 642 ]
    , [ 931, 932, 644, 643 ]
    , [ 297, 933, 645, 298 ]
    , [ 933, 934, 646, 645 ]
    , [ 934, 935, 647, 646 ]
    , [ 935, 936, 648, 647 ]
    , [ 936, 937, 649, 648 ]
    , [ 937, 938, 650, 649 ]
    , [ 938, 939, 651, 650 ]
    , [ 939, 940, 652, 651 ]
    , [ 940, 941, 653, 652 ]
    , [ 941, 942, 654, 653 ]
    , [ 942, 943, 655, 654 ]
    , [ 943, 944, 656, 655 ]
    , [ 944, 945, 657, 656 ]
    , [ 945, 946, 658, 657 ]
    , [ 946, 947, 659, 658 ]
    , [ 947, 948, 660, 659 ]
    , [ 948, 949, 661, 660 ]
    , [ 949, 950, 662, 661 ]
    , [ 950, 951, 663, 662 ]
    , [ 951, 952, 664, 663 ]
    , [ 952, 953, 665, 664 ]
    , [ 953, 954, 666, 665 ]
    , [ 954, 955, 667, 666 ]
    , [ 955, 956, 668, 667 ]
    , [ 299, 957, 669, 300 ]
    , [ 957, 958, 670, 669 ]
    , [ 958, 959, 671, 670 ]
    , [ 959, 960, 672, 671 ]
    , [ 960, 961, 673, 672 ]
    , [ 961, 962, 674, 673 ]
    , [ 962, 963, 675, 674 ]
    , [ 963, 964, 676, 675 ]
    , [ 964, 965, 677, 676 ]
    , [ 965, 966, 678, 677 ]
    , [ 966, 967, 679, 678 ]
    , [ 967, 968, 680, 679 ]
    , [ 968, 969, 681, 680 ]
    , [ 969, 970, 682, 681 ]
    , [ 970, 971, 683, 682 ]
    , [ 971, 972, 684, 683 ]
    , [ 972, 973, 685, 684 ]
    , [ 973, 974, 686, 685 ]
    , [ 974, 975, 687, 686 ]
    , [ 975, 976, 688, 687 ]
    , [ 976, 977, 689, 688 ]
    , [ 977, 978, 690, 689 ]
    , [ 978, 979, 691, 690 ]
    , [ 979, 980, 692, 691 ]
    , [ 301, 981, 693, 302 ]
    , [ 981, 982, 694, 693 ]
    , [ 982, 983, 695, 694 ]
    , [ 983, 984, 696, 695 ]
    , [ 984, 985, 697, 696 ]
    , [ 985, 986, 698, 697 ]
    , [ 986, 987, 699, 698 ]
    , [ 987, 988, 700, 699 ]
    , [ 988, 989, 701, 700 ]
    , [ 989, 990, 702, 701 ]
    , [ 990, 991, 703, 702 ]
    , [ 991, 992, 704, 703 ]
    , [ 992, 993, 705, 704 ]
    , [ 993, 994, 706, 705 ]
    , [ 994, 995, 707, 706 ]
    , [ 995, 996, 708, 707 ]
    , [ 996, 997, 709, 708 ]
    , [ 997, 998, 710, 709 ]
    , [ 998, 999, 711, 710 ]
    , [ 999, 1000, 712, 711 ]
    , [ 1000, 1001, 713, 712 ]
    , [ 1001, 1002, 714, 713 ]
    , [ 1002, 1003, 715, 714 ]
    , [ 1003, 1004, 716, 715 ]
    , [ 303, 1005, 381, 304 ]
    , [ 1005, 1006, 382, 381 ]
    , [ 1006, 1007, 383, 382 ]
    , [ 1007, 1008, 384, 383 ]
    , [ 1008, 1009, 385, 384 ]
    , [ 1009, 1010, 386, 385 ]
    , [ 1010, 1011, 387, 386 ]
    , [ 1011, 1012, 388, 387 ]
    , [ 1012, 1013, 389, 388 ]
    , [ 1013, 1014, 390, 389 ]
    , [ 1014, 1015, 391, 390 ]
    , [ 1015, 1016, 392, 391 ]
    , [ 1016, 1017, 393, 392 ]
    , [ 1017, 1018, 394, 393 ]
    , [ 1018, 1019, 395, 394 ]
    , [ 1019, 1020, 396, 395 ]
    , [ 1020, 1021, 397, 396 ]
    , [ 1021, 1022, 398, 397 ]
    , [ 1022, 1023, 399, 398 ]
    , [ 1023, 1024, 400, 399 ]
    , [ 1024, 1025, 401, 400 ]
    , [ 1025, 1026, 402, 401 ]
    , [ 1026, 1027, 403, 402 ]
    , [ 1027, 1028, 404, 403 ]
    , [ 273, 717, 429, 274 ]
    , [ 717, 718, 430, 429 ]
    , [ 718, 719, 431, 430 ]
    , [ 719, 720, 432, 431 ]
    , [ 720, 721, 433, 432 ]
    , [ 721, 722, 434, 433 ]
    , [ 722, 723, 435, 434 ]
    , [ 723, 724, 436, 435 ]
    , [ 724, 725, 437, 436 ]
    , [ 725, 726, 438, 437 ]
    , [ 726, 727, 439, 438 ]
    , [ 727, 728, 440, 439 ]
    , [ 728, 729, 441, 440 ]
    , [ 729, 730, 442, 441 ]
    , [ 730, 731, 443, 442 ]
    , [ 731, 732, 444, 443 ]
    , [ 732, 733, 445, 444 ]
    , [ 733, 734, 446, 445 ]
    , [ 734, 735, 447, 446 ]
    , [ 735, 736, 448, 447 ]
    , [ 736, 737, 449, 448 ]
    , [ 737, 738, 450, 449 ]
    , [ 738, 739, 451, 450 ]
    , [ 739, 740, 452, 451 ]
    , [ 282, 1077, 1053, 283 ]
    , [ 1077, 1078, 1054, 1053 ]
    , [ 1078, 1079, 1055, 1054 ]
    , [ 1079, 1080, 1056, 1055 ]
    , [ 1080, 1081, 1057, 1056 ]
    , [ 1081, 1082, 1058, 1057 ]
    , [ 1082, 1083, 1059, 1058 ]
    , [ 1083, 1084, 1060, 1059 ]
    , [ 1084, 1085, 1061, 1060 ]
    , [ 1085, 1086, 1062, 1061 ]
    , [ 1086, 1087, 1063, 1062 ]
    , [ 1087, 1088, 1064, 1063 ]
    , [ 1088, 1089, 1065, 1064 ]
    , [ 1089, 1090, 1066, 1065 ]
    , [ 1090, 1091, 1067, 1066 ]
    , [ 1091, 1092, 1068, 1067 ]
    , [ 1092, 1093, 1069, 1068 ]
    , [ 1093, 1094, 1070, 1069 ]
    , [ 1094, 1095, 1071, 1070 ]
    , [ 1095, 1096, 1072, 1071 ]
    , [ 1096, 1097, 1073, 1072 ]
    , [ 1097, 1098, 1074, 1073 ]
    , [ 1098, 1099, 1075, 1074 ]
    , [ 1099, 1100, 1076, 1075 ]
    , [ 279, 1101, 477, 280 ]
    , [ 1101, 1102, 478, 477 ]
    , [ 1102, 1103, 479, 478 ]
    , [ 1103, 1104, 480, 479 ]
    , [ 1104, 1105, 481, 480 ]
    , [ 1105, 1106, 482, 481 ]
    , [ 1106, 1107, 483, 482 ]
    , [ 1107, 1108, 484, 483 ]
    , [ 1108, 1109, 485, 484 ]
    , [ 1109, 1110, 486, 485 ]
    , [ 1110, 1111, 487, 486 ]
    , [ 1111, 1112, 488, 487 ]
    , [ 1112, 1113, 489, 488 ]
    , [ 1113, 1114, 490, 489 ]
    , [ 1114, 1115, 491, 490 ]
    , [ 1115, 1116, 492, 491 ]
    , [ 1116, 1117, 493, 492 ]
    , [ 1117, 1118, 494, 493 ]
    , [ 1118, 1119, 495, 494 ]
    , [ 1119, 1120, 496, 495 ]
    , [ 1120, 1121, 497, 496 ]
    , [ 1121, 1122, 498, 497 ]
    , [ 1122, 1123, 499, 498 ]
    , [ 1123, 1124, 500, 499 ]
    , [ 275, 1029, 453, 276 ]
    , [ 1029, 1030, 454, 453 ]
    , [ 1030, 1031, 455, 454 ]
    , [ 1031, 1032, 456, 455 ]
    , [ 1032, 1033, 457, 456 ]
    , [ 1033, 1034, 458, 457 ]
    , [ 1034, 1035, 459, 458 ]
    , [ 1035, 1036, 460, 459 ]
    , [ 1036, 1037, 461, 460 ]
    , [ 1037, 1038, 462, 461 ]
    , [ 1038, 1039, 463, 462 ]
    , [ 1039, 1040, 464, 463 ]
    , [ 1040, 1041, 465, 464 ]
    , [ 1041, 1042, 466, 465 ]
    , [ 1042, 1043, 467, 466 ]
    , [ 1043, 1044, 468, 467 ]
    , [ 1044, 1045, 469, 468 ]
    , [ 1045, 1046, 470, 469 ]
    , [ 1046, 1047, 471, 470 ]
    , [ 1047, 1048, 472, 471 ]
    , [ 1048, 1049, 473, 472 ]
    , [ 1049, 1050, 474, 473 ]
    , [ 1050, 1051, 475, 474 ]
    , [ 1051, 1052, 476, 475 ]
    , [ 278, 1125, 1101, 279 ]
    , [ 1125, 1126, 1102, 1101 ]
    , [ 1126, 1127, 1103, 1102 ]
    , [ 1127, 1128, 1104, 1103 ]
    , [ 1128, 1129, 1105, 1104 ]
    , [ 1129, 1130, 1106, 1105 ]
    , [ 1130, 1131, 1107, 1106 ]
    , [ 1131, 1132, 1108, 1107 ]
    , [ 1132, 1133, 1109, 1108 ]
    , [ 1133, 1134, 1110, 1109 ]
    , [ 1134, 1135, 1111, 1110 ]
    , [ 1135, 1136, 1112, 1111 ]
    , [ 1136, 1137, 1113, 1112 ]
    , [ 1137, 1138, 1114, 1113 ]
    , [ 1138, 1139, 1115, 1114 ]
    , [ 1139, 1140, 1116, 1115 ]
    , [ 1140, 1141, 1117, 1116 ]
    , [ 1141, 1142, 1118, 1117 ]
    , [ 1142, 1143, 1119, 1118 ]
    , [ 1143, 1144, 1120, 1119 ]
    , [ 1144, 1145, 1121, 1120 ]
    , [ 1145, 1146, 1122, 1121 ]
    , [ 1146, 1147, 1123, 1122 ]
    , [ 1147, 1148, 1124, 1123 ]
    , [ 1149, 1208, 1166, 305 ]
    , [ 1208, 1212, 1165, 1166 ]
    , [ 1212, 1216, 1164, 1165 ]
    , [ 1216, 1220, 1163, 1164 ]
    , [ 1220, 1224, 1162, 1163 ]
    , [ 309, 1153, 1205, 1152 ]
    , [ 1152, 1205, 1206, 1151 ]
    , [ 1150, 1207, 1208, 1149 ]
    , [ 1153, 1154, 1209, 1205 ]
    , [ 1205, 1209, 1210, 1206 ]
    , [ 1207, 1211, 1212, 1208 ]
    , [ 1154, 1155, 1213, 1209 ]
    , [ 1209, 1213, 1214, 1210 ]
    , [ 1211, 1215, 1216, 1212 ]
    , [ 1155, 1156, 1217, 1213 ]
    , [ 1213, 1217, 1218, 1214 ]
    , [ 1215, 1219, 1220, 1216 ]
    , [ 1156, 1157, 1221, 1217 ]
    , [ 1217, 1221, 1222, 1218 ]
    , [ 1219, 1223, 1224, 1220 ]
    , [ 1157, 310, 1158, 1221 ]
    , [ 1221, 1158, 1159, 1222 ]
    , [ 1223, 1160, 1161, 1224 ]
    , [ 1161, 1228, 1180, 306 ]
    , [ 1228, 1232, 1179, 1180 ]
    , [ 1232, 1236, 1178, 1179 ]
    , [ 1236, 1240, 1177, 1178 ]
    , [ 1240, 1244, 1176, 1177 ]
    , [ 310, 1167, 1225, 1158 ]
    , [ 1158, 1225, 1226, 1159 ]
    , [ 1160, 1227, 1228, 1161 ]
    , [ 1167, 1168, 1229, 1225 ]
    , [ 1225, 1229, 1230, 1226 ]
    , [ 1227, 1231, 1232, 1228 ]
    , [ 1168, 1169, 1233, 1229 ]
    , [ 1229, 1233, 1234, 1230 ]
    , [ 1231, 1235, 1236, 1232 ]
    , [ 1169, 1170, 1237, 1233 ]
    , [ 1233, 1237, 1238, 1234 ]
    , [ 1235, 1239, 1240, 1236 ]
    , [ 1170, 1171, 1241, 1237 ]
    , [ 1237, 1241, 1242, 1238 ]
    , [ 1239, 1243, 1244, 1240 ]
    , [ 1171, 311, 1172, 1241 ]
    , [ 1241, 1172, 1173, 1242 ]
    , [ 1243, 1174, 1175, 1244 ]
    , [ 1175, 1248, 1194, 307 ]
    , [ 1248, 1252, 1193, 1194 ]
    , [ 1252, 1256, 1192, 1193 ]
    , [ 1256, 1260, 1191, 1192 ]
    , [ 1260, 1264, 1190, 1191 ]
    , [ 311, 1181, 1245, 1172 ]
    , [ 1172, 1245, 1246, 1173 ]
    , [ 1174, 1247, 1248, 1175 ]
    , [ 1181, 1182, 1249, 1245 ]
    , [ 1245, 1249, 1250, 1246 ]
    , [ 1247, 1251, 1252, 1248 ]
    , [ 1182, 1183, 1253, 1249 ]
    , [ 1249, 1253, 1254, 1250 ]
    , [ 1251, 1255, 1256, 1252 ]
    , [ 1183, 1184, 1257, 1253 ]
    , [ 1253, 1257, 1258, 1254 ]
    , [ 1255, 1259, 1260, 1256 ]
    , [ 1184, 1185, 1261, 1257 ]
    , [ 1257, 1261, 1262, 1258 ]
    , [ 1259, 1263, 1264, 1260 ]
    , [ 1185, 312, 1186, 1261 ]
    , [ 1261, 1186, 1187, 1262 ]
    , [ 1263, 1188, 1189, 1264 ]
    , [ 1189, 1268, 1204, 308 ]
    , [ 1268, 1272, 1203, 1204 ]
    , [ 1272, 1276, 1202, 1203 ]
    , [ 1276, 1280, 1201, 1202 ]
    , [ 1280, 1284, 1200, 1201 ]
    , [ 312, 1195, 1265, 1186 ]
    , [ 1186, 1265, 1266, 1187 ]
    , [ 1263, 1262, 1187, 1188 ]
    , [ 1259, 1258, 1262, 1263 ]
    , [ 1188, 1267, 1268, 1189 ]
    , [ 1195, 1196, 1269, 1265 ]
    , [ 1265, 1269, 1270, 1266 ]
    , [ 1255, 1254, 1258, 1259 ]
    , [ 1251, 1250, 1254, 1255 ]
    , [ 1267, 1271, 1272, 1268 ]
    , [ 1196, 1197, 1273, 1269 ]
    , [ 1269, 1273, 1274, 1270 ]
    , [ 1247, 1246, 1250, 1251 ]
    , [ 1173, 1246, 1247, 1174 ]
    , [ 1271, 1275, 1276, 1272 ]
    , [ 1197, 1198, 1277, 1273 ]
    , [ 1273, 1277, 1278, 1274 ]
    , [ 1279, 1278, 1282, 1283 ]
    , [ 1275, 1274, 1278, 1279 ]
    , [ 1275, 1279, 1280, 1276 ]
    , [ 1198, 1199, 1281, 1277 ]
    , [ 1277, 1281, 1282, 1278 ]
    , [ 1271, 1270, 1274, 1275 ]
    , [ 1267, 1266, 1270, 1271 ]
    , [ 1279, 1283, 1284, 1280 ]
    , [ 1199, 309, 1152, 1281 ]
    , [ 1281, 1152, 1151, 1282 ]
    , [ 1187, 1266, 1267, 1188 ]
    , [ 1150, 1283, 1282, 1151 ]
    , [ 1283, 1150, 1149, 1284 ]
    , [ 1204, 1289, 1190, 308 ]
    , [ 1289, 1294, 1191, 1190 ]
    , [ 1294, 1299, 1192, 1191 ]
    , [ 1299, 1304, 1193, 1192 ]
    , [ 1304, 1309, 1194, 1193 ]
    , [ 305, 1166, 1285, 1200 ]
    , [ 1200, 1285, 1286, 1201 ]
    , [ 1201, 1286, 1287, 1202 ]
    , [ 1202, 1287, 1288, 1203 ]
    , [ 1203, 1288, 1289, 1204 ]
    , [ 1166, 1165, 1290, 1285 ]
    , [ 1285, 1290, 1291, 1286 ]
    , [ 1286, 1291, 1292, 1287 ]
    , [ 1287, 1292, 1293, 1288 ]
    , [ 1288, 1293, 1294, 1289 ]
    , [ 1165, 1164, 1295, 1290 ]
    , [ 1290, 1295, 1296, 1291 ]
    , [ 1291, 1296, 1297, 1292 ]
    , [ 1292, 1297, 1298, 1293 ]
    , [ 1293, 1298, 1299, 1294 ]
    , [ 1164, 1163, 1300, 1295 ]
    , [ 1295, 1300, 1301, 1296 ]
    , [ 1296, 1301, 1302, 1297 ]
    , [ 1297, 1302, 1303, 1298 ]
    , [ 1298, 1303, 1304, 1299 ]
    , [ 1163, 1162, 1305, 1300 ]
    , [ 1300, 1305, 1306, 1301 ]
    , [ 1301, 1306, 1307, 1302 ]
    , [ 1302, 1307, 1308, 1303 ]
    , [ 1303, 1308, 1309, 1304 ]
    , [ 1162, 306, 1180, 1305 ]
    , [ 1305, 1180, 1179, 1306 ]
    , [ 1306, 1179, 1178, 1307 ]
    , [ 1307, 1178, 1177, 1308 ]
    , [ 1308, 1177, 1176, 1309 ]
    , [ 1199, 1314, 1153, 309 ]
    , [ 1314, 1319, 1154, 1153 ]
    , [ 1319, 1324, 1155, 1154 ]
    , [ 1324, 1329, 1156, 1155 ]
    , [ 1329, 1334, 1157, 1156 ]
    , [ 312, 1185, 1310, 1195 ]
    , [ 1195, 1310, 1311, 1196 ]
    , [ 1196, 1311, 1312, 1197 ]
    , [ 1197, 1312, 1313, 1198 ]
    , [ 1198, 1313, 1314, 1199 ]
    , [ 1185, 1184, 1315, 1310 ]
    , [ 1310, 1315, 1316, 1311 ]
    , [ 1311, 1316, 1317, 1312 ]
    , [ 1312, 1317, 1318, 1313 ]
    , [ 1313, 1318, 1319, 1314 ]
    , [ 1184, 1183, 1320, 1315 ]
    , [ 1315, 1320, 1321, 1316 ]
    , [ 1316, 1321, 1322, 1317 ]
    , [ 1317, 1322, 1323, 1318 ]
    , [ 1318, 1323, 1324, 1319 ]
    , [ 1183, 1182, 1325, 1320 ]
    , [ 1320, 1325, 1326, 1321 ]
    , [ 1321, 1326, 1327, 1322 ]
    , [ 1322, 1327, 1328, 1323 ]
    , [ 1323, 1328, 1329, 1324 ]
    , [ 1182, 1181, 1330, 1325 ]
    , [ 1325, 1330, 1331, 1326 ]
    , [ 1326, 1331, 1332, 1327 ]
    , [ 1327, 1332, 1333, 1328 ]
    , [ 1328, 1333, 1334, 1329 ]
    , [ 1181, 311, 1171, 1330 ]
    , [ 1330, 1171, 1170, 1331 ]
    , [ 1331, 1170, 1169, 1332 ]
    , [ 1332, 1169, 1168, 1333 ]
    , [ 1333, 1168, 1167, 1334 ]
    , [ 1340, 1359, 1349, 363 ]
    , [ 1359, 1364, 1348, 1349 ]
    , [ 1364, 1369, 1347, 1348 ]
    , [ 1369, 1374, 1346, 1347 ]
    , [ 1374, 1379, 1345, 1346 ]
    , [ 1400, 1343, 1391, 1399 ]
    , [ 1343, 1342, 1380, 1391 ]
    , [ 1343, 1356, 1357, 1342 ]
    , [ 1342, 1357, 1358, 1341 ]
    , [ 1341, 1358, 1359, 1340 ]
    , [ 1339, 1338, 1360, 1355 ]
    , [ 1355, 1360, 1361, 1356 ]
    , [ 1356, 1361, 1362, 1357 ]
    , [ 1357, 1362, 1363, 1358 ]
    , [ 1358, 1363, 1364, 1359 ]
    , [ 1338, 1337, 1365, 1360 ]
    , [ 1360, 1365, 1366, 1361 ]
    , [ 1361, 1366, 1367, 1362 ]
    , [ 1362, 1367, 1368, 1363 ]
    , [ 1363, 1368, 1369, 1364 ]
    , [ 1337, 1336, 1370, 1365 ]
    , [ 1365, 1370, 1371, 1366 ]
    , [ 1366, 1371, 1372, 1367 ]
    , [ 1367, 1372, 1373, 1368 ]
    , [ 1368, 1373, 1374, 1369 ]
    , [ 1336, 1335, 1375, 1370 ]
    , [ 1370, 1375, 1376, 1371 ]
    , [ 1371, 1376, 1377, 1372 ]
    , [ 1372, 1377, 1378, 1373 ]
    , [ 1373, 1378, 1379, 1374 ]
    , [ 1335, 313, 1350, 1375 ]
    , [ 1375, 1350, 1351, 1376 ]
    , [ 1376, 1351, 1352, 1377 ]
    , [ 1377, 1352, 1353, 1378 ]
    , [ 1378, 1353, 1354, 1379 ]
    , [ 1406, 1409, 359, 361 ]
    , [ 316, 1399, 1398, 318 ]
    , [ 314, 1400, 1399, 316 ]
    , [ 1400, 1355, 1356, 1343 ]
    , [ 320, 1397, 322 ]
    , [ 1382, 1395, 1396, 1383 ]
    , [ 318, 1398, 1397, 320 ]
    , [ 1381, 1394, 1395, 1382 ]
    , [ 326, 1388, 330, 328 ]
    , [ 1388, 334, 332, 330 ]
    , [ 322, 1385, 1389, 324 ]
    , [ 1383, 1396, 1392, 1384 ]
    , [ 1384, 1392, 334, 1388 ]
    , [ 1390, 1382, 1383, 1385 ]
    , [ 1386, 1381, 1382, 1390 ]
    , [ 324, 1389, 326 ]
    , [ 1389, 1384, 1388, 326 ]
    , [ 1385, 1383, 1384, 1389 ]
    , [ 1391, 1380, 1381, 1386 ]
    , [ 1394, 1403, 1402, 1395 ]
    , [ 1396, 338, 336, 1392 ]
    , [ 1395, 1402, 338, 1396 ]
    , [ 1392, 336, 334 ]
    , [ 1393, 1401, 1403, 1394 ]
    , [ 1398, 1386, 1390, 1397 ]
    , [ 1397, 1390, 1385, 322 ]
    , [ 1399, 1391, 1386, 1398 ]
    , [ 364, 1339, 1355, 1400 ]
    , [ 1402, 340, 338 ]
    , [ 1403, 342, 340, 1402 ]
    , [ 1401, 344, 342, 1403 ]
    , [ 1341, 1340, 1401, 1393 ]
    , [ 363, 344, 1401, 1340 ]
    , [ 1410, 1413, 1407, 1404 ]
    , [ 1413, 1409, 1406, 1407 ]
    , [ 1411, 1405, 1408, 1412 ]
    , [ 1412, 1408, 367, 369 ]
    , [ 1405, 1346, 1345, 1408 ]
    , [ 1408, 1345, 365, 367 ]
    , [ 1404, 1347, 1346, 1405 ]
    , [ 1404, 1407, 1348, 1347 ]
    , [ 1349, 1406, 361, 363 ]
    , [ 1407, 1406, 1349, 1348 ]
    , [ 1420, 1416, 1417, 373 ]
    , [ 373, 1417, 371 ]
    , [ 1419, 1414, 1416, 1420 ]
    , [ 1415, 355, 357 ]
    , [ 1419, 1421, 1418, 1414 ]
    , [ 1421, 355, 1415, 1418 ]
    , [ 1418, 1415, 1409, 1413 ]
    , [ 1414, 1410, 1411, 1416 ]
    , [ 1409, 1415, 357, 359 ]
    , [ 1416, 1411, 1412, 1417 ]
    , [ 1414, 1418, 1413, 1410 ]
    , [ 1417, 1412, 369, 371 ]
    , [ 351, 353, 1424 ]
    , [ 347, 1425, 377, 379 ]
    , [ 377, 1423, 375 ]
    , [ 349, 351, 1425, 347 ]
    , [ 353, 355, 1421, 1424 ]
    , [ 1422, 1419, 1420, 1423 ]
    , [ 1423, 1420, 373, 375 ]
    , [ 1422, 1424, 1421, 1419 ]
    , [ 1425, 1422, 1423, 377 ]
    , [ 351, 1424, 1422, 1425 ]
    , [ 1436, 1432, 1427, 1429 ]
    , [ 1428, 1433, 341, 343 ]
    , [ 1432, 1435, 1430, 1427 ]
    , [ 1352, 1430, 1431, 1353 ]
    , [ 1430, 1435, 1434, 1431 ]
    , [ 1436, 1429, 315, 317 ]
    , [ 1429, 1427, 1351, 1350 ]
    , [ 1354, 1428, 343, 345 ]
    , [ 1429, 1350, 313, 315 ]
    , [ 1427, 1430, 1352, 1351 ]
    , [ 1353, 1431, 1428, 1354 ]
    , [ 321, 1442, 1437, 1441 ]
    , [ 1440, 1444, 1443, 1439 ]
    , [ 1438, 337, 339 ]
    , [ 321, 1441, 319 ]
    , [ 1442, 1444, 1440, 1437 ]
    , [ 1439, 1443, 337, 1438 ]
    , [ 1441, 1436, 317, 319 ]
    , [ 1441, 1437, 1432, 1436 ]
    , [ 1437, 1440, 1435, 1432 ]
    , [ 1435, 1440, 1439, 1434 ]
    , [ 1434, 1439, 1438, 1433 ]
    , [ 1433, 1438, 339, 341 ]
    , [ 323, 325, 1445 ]
    , [ 325, 327, 329, 1448 ]
    , [ 1448, 329, 331, 333 ]
    , [ 1446, 333, 335 ]
    , [ 1445, 1447, 1444, 1442 ]
    , [ 1444, 1447, 1446, 1443 ]
    , [ 1443, 1446, 335, 337 ]
    , [ 321, 323, 1445, 1442 ]
    , [ 1445, 325, 1448, 1447 ]
    , [ 1447, 1448, 333, 1446 ]
    , [ 1387, 1338, 1339, 1344 ]
    , [ 1449, 1451, 1336, 1337 ]
    , [ 1336, 1451, 1450, 1335 ]
    , [ 1387, 1449, 1337, 1338 ]
    , [ 1344, 1339, 364, 362 ]
    , [ 1335, 1450, 368, 366 ]
    , [ 1342, 1341, 1393, 1380 ]
    , [ 1456, 1461, 372, 370 ]
    , [ 1455, 1460, 1461, 1456 ]
    , [ 1458, 1457, 1452, 1453 ]
    , [ 1458, 1453, 1454, 1459 ]
    , [ 1459, 1454, 360, 358 ]
    , [ 1457, 1460, 1455, 1452 ]
    , [ 1452, 1455, 1451, 1449 ]
    , [ 1453, 1452, 1449, 1387 ]
    , [ 1453, 1387, 1344, 1454 ]
    , [ 1450, 1456, 370, 368 ]
    , [ 1454, 1344, 362, 360 ]
    , [ 1451, 1455, 1456, 1450 ]
    , [ 1465, 1467, 1464, 1462 ]
    , [ 1466, 1465, 1462, 1463 ]
    , [ 1466, 1463, 356, 354 ]
    , [ 1461, 374, 372 ]
    , [ 356, 1459, 358 ]
    , [ 1464, 1467, 376, 374 ]
    , [ 1462, 1464, 1460, 1457 ]
    , [ 1463, 1462, 1457, 1458 ]
    , [ 1460, 1464, 374, 1461 ]
    , [ 1463, 1458, 1459, 356 ]
    , [ 348, 380, 378, 1468 ]
    , [ 350, 348, 1468, 352 ]
    , [ 1467, 378, 376 ]
    , [ 352, 1466, 354 ]
    , [ 1468, 378, 1467, 1465 ]
    , [ 352, 1468, 1465, 1466 ]
    , [ 1159, 1226, 1227, 1160 ]
    , [ 1227, 1226, 1230, 1231 ]
    , [ 1231, 1230, 1234, 1235 ]
    , [ 1235, 1234, 1238, 1239 ]
    , [ 1239, 1238, 1242, 1243 ]
    , [ 1243, 1242, 1173, 1174 ]
    , [ 1151, 1206, 1207, 1150 ]
    , [ 1207, 1206, 1210, 1211 ]
    , [ 1211, 1210, 1214, 1215 ]
    , [ 1215, 1214, 1218, 1219 ]
    , [ 1219, 1218, 1222, 1223 ]
    , [ 1223, 1222, 1159, 1160 ]
    ]
