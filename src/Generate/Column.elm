module Generate.Column (model) where

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
    , Vector.vector 9.550158 41.781990 0.109024
    , Vector.vector 9.282208 43.181988 0.109024
    , Vector.vector 6.500000 40.000000 -0.000000
    , Vector.vector 7.550158 39.781986 0.109024
    , Vector.vector 8.550159 40.049938 0.109024
    , Vector.vector 9.282208 40.781990 0.109024
    , Vector.vector 9.468884 41.781990 -1.130974
    , Vector.vector 9.203228 43.181988 -1.096000
    , Vector.vector 6.375104 40.000000 -1.268087
    , Vector.vector 7.485995 39.781986 -0.869922
    , Vector.vector 8.477440 40.049938 -1.000448
    , Vector.vector 9.203228 40.781990 -1.096000
    , Vector.vector 9.226454 41.781990 -2.349756
    , Vector.vector 8.967634 43.181988 -2.280406
    , Vector.vector 7.294602 39.781986 -1.832118
    , Vector.vector 8.260528 40.049938 -2.090937
    , Vector.vector 8.967634 40.781990 -2.280406
    , Vector.vector 8.827014 41.781990 -3.526467
    , Vector.vector 8.579461 43.181988 -3.423928
    , Vector.vector 6.005217 40.000000 -2.487442
    , Vector.vector 6.979255 39.781986 -2.761101
    , Vector.vector 7.903134 40.049938 -3.143784
    , Vector.vector 8.579461 40.781990 -3.423928
    , Vector.vector 8.277399 41.781990 -4.640976
    , Vector.vector 8.045348 43.181988 -4.507002
    , Vector.vector 5.404553 40.000000 -3.611206
    , Vector.vector 6.545348 39.781986 -3.640976
    , Vector.vector 7.411373 40.049938 -4.140976
    , Vector.vector 8.045348 40.781990 -4.507002
    , Vector.vector 7.587016 41.781990 -5.674209
    , Vector.vector 7.374437 43.181988 -5.511092
    , Vector.vector 6.000309 39.781986 -4.456686
    , Vector.vector 6.793662 40.049938 -5.065447
    , Vector.vector 7.374437 40.781990 -5.511092
    , Vector.vector 6.767672 41.781990 -6.608491
    , Vector.vector 6.578203 43.181988 -6.419022
    , Vector.vector 4.596194 40.000000 -4.596194
    , Vector.vector 5.353458 39.781986 -5.194277
    , Vector.vector 6.060565 40.049938 -5.901383
    , Vector.vector 6.578203 40.781990 -6.419022
    , Vector.vector 5.833393 41.781990 -7.427831
    , Vector.vector 5.670276 43.181988 -7.215253
    , Vector.vector 3.611207 40.000000 -5.404552
    , Vector.vector 4.615870 39.781986 -5.841125
    , Vector.vector 5.224631 40.049938 -6.634479
    , Vector.vector 5.670276 40.781990 -7.215253
    , Vector.vector 4.800158 41.781990 -8.118217
    , Vector.vector 4.666183 43.181988 -7.886167
    , Vector.vector 3.800157 39.781986 -6.386166
    , Vector.vector 4.300158 40.049938 -7.252192
    , Vector.vector 4.666183 40.781990 -7.886167
    , Vector.vector 3.685652 41.781990 -8.667830
    , Vector.vector 3.583112 43.181988 -8.420278
    , Vector.vector 2.487442 40.000000 -6.005217
    , Vector.vector 2.920285 39.781986 -6.820072
    , Vector.vector 3.302969 40.049938 -7.743951
    , Vector.vector 3.583112 40.781990 -8.420278
    , Vector.vector 2.508939 41.781990 -9.067270
    , Vector.vector 2.439588 43.181988 -8.808452
    , Vector.vector 1.268087 40.000000 -6.375104
    , Vector.vector 1.991300 39.781986 -7.135419
    , Vector.vector 2.250119 40.049938 -8.101345
    , Vector.vector 2.439588 40.781990 -8.808452
    , Vector.vector 1.290156 41.781990 -9.309702
    , Vector.vector 1.255181 43.181988 -9.044045
    , Vector.vector 1.029103 39.781986 -7.326813
    , Vector.vector 1.159629 40.049938 -8.318257
    , Vector.vector 1.255181 40.781990 -9.044045
    , Vector.vector 0.050159 41.781990 -9.390976
    , Vector.vector 0.050159 43.181988 -9.123028
    , Vector.vector 0.000000 40.000000 -6.500000
    , Vector.vector 0.050159 39.781986 -7.390976
    , Vector.vector 0.050158 40.049938 -8.390976
    , Vector.vector 0.050159 40.781990 -9.123028
    , Vector.vector -1.189843 41.781990 -9.309702
    , Vector.vector -1.154868 43.181988 -9.044045
    , Vector.vector -1.268077 40.000000 -6.375106
    , Vector.vector -0.928790 39.781986 -7.326812
    , Vector.vector -1.059317 40.049938 -8.318257
    , Vector.vector -1.154868 40.781990 -9.044045
    , Vector.vector -2.408622 41.781990 -9.067272
    , Vector.vector -2.339272 43.181988 -8.808453
    , Vector.vector -1.890984 39.781986 -7.135420
    , Vector.vector -2.149803 40.049938 -8.101347
    , Vector.vector -2.339272 40.781990 -8.808453
    , Vector.vector -3.585336 41.781990 -8.667831
    , Vector.vector -3.482796 43.181988 -8.420279
    , Vector.vector -2.487433 40.000000 -6.005220
    , Vector.vector -2.819969 39.781986 -6.820072
    , Vector.vector -3.202652 40.049938 -7.743951
    , Vector.vector -3.482796 40.781990 -8.420279
    , Vector.vector -4.699841 41.781990 -8.118218
    , Vector.vector -4.565866 43.181988 -7.886168
    , Vector.vector -3.611199 40.000000 -5.404557
    , Vector.vector -3.699841 39.781986 -6.386167
    , Vector.vector -4.199841 40.049938 -7.252192
    , Vector.vector -4.565866 40.781990 -7.886168
    , Vector.vector -5.733076 41.781990 -7.427832
    , Vector.vector -5.569959 43.181988 -7.215254
    , Vector.vector -4.515553 39.781986 -5.841125
    , Vector.vector -5.124314 40.049938 -6.634480
    , Vector.vector -5.569959 40.781990 -7.215254
    , Vector.vector -6.667357 41.781990 -6.608489
    , Vector.vector -6.477890 43.181988 -6.419020
    , Vector.vector -4.596188 40.000000 -4.596200
    , Vector.vector -5.253144 39.781986 -5.194275
    , Vector.vector -5.960251 40.049938 -5.901382
    , Vector.vector -6.477890 40.781990 -6.419020
    , Vector.vector -7.486698 41.781990 -5.674210
    , Vector.vector -7.274120 43.181988 -5.511092
    , Vector.vector -5.404548 40.000000 -3.611213
    , Vector.vector -5.899992 39.781986 -4.456686
    , Vector.vector -6.693346 40.049938 -5.065448
    , Vector.vector -7.274120 40.781990 -5.511092
    , Vector.vector -8.177082 41.781990 -4.640978
    , Vector.vector -7.945032 43.181988 -4.507003
    , Vector.vector -6.445032 39.781986 -3.640978
    , Vector.vector -7.311058 40.049938 -4.140978
    , Vector.vector -7.945032 40.781990 -4.507003
    , Vector.vector -8.726697 41.781990 -3.526469
    , Vector.vector -8.479144 43.181988 -3.423929
    , Vector.vector -6.005214 40.000000 -2.487449
    , Vector.vector -6.878938 39.781986 -2.761102
    , Vector.vector -7.802818 40.049938 -3.143785
    , Vector.vector -8.479144 40.781990 -3.423929
    , Vector.vector -9.126138 41.781990 -2.349756
    , Vector.vector -8.867319 43.181988 -2.280405
    , Vector.vector -6.375103 40.000000 -1.268094
    , Vector.vector -7.194286 39.781986 -1.832118
    , Vector.vector -8.160213 40.049938 -2.090937
    , Vector.vector -8.867319 40.781990 -2.280405
    , Vector.vector -9.368568 41.781990 -1.130976
    , Vector.vector -9.102912 43.181988 -1.096001
    , Vector.vector -7.385679 39.781986 -0.869923
    , Vector.vector -8.377124 40.049938 -1.000449
    , Vector.vector -9.102912 40.781990 -1.096001
    , Vector.vector -9.449842 41.781990 0.109024
    , Vector.vector -9.181892 43.181988 0.109024
    , Vector.vector -6.500000 40.000000 -0.000006
    , Vector.vector -7.449842 39.781986 0.109024
    , Vector.vector -8.449842 40.049938 0.109024
    , Vector.vector -9.181892 40.781990 0.109024
    , Vector.vector -9.368568 41.781990 1.349025
    , Vector.vector -9.102912 43.181988 1.314050
    , Vector.vector -6.375105 40.000000 1.268081
    , Vector.vector -7.385679 39.781986 1.087972
    , Vector.vector -8.377124 40.049938 1.218498
    , Vector.vector -9.102912 40.781990 1.314050
    , Vector.vector -9.126138 41.781990 2.567804
    , Vector.vector -8.867319 43.181988 2.498454
    , Vector.vector -7.194286 39.781986 2.050166
    , Vector.vector -8.160213 40.049938 2.308985
    , Vector.vector -8.867319 40.781990 2.498454
    , Vector.vector -8.726699 41.781990 3.744514
    , Vector.vector -8.479146 43.181988 3.641974
    , Vector.vector -6.005219 40.000000 2.487437
    , Vector.vector -6.878939 39.781986 2.979147
    , Vector.vector -7.802819 40.049938 3.361830
    , Vector.vector -8.479146 40.781990 3.641974
    , Vector.vector -8.177084 41.781990 4.859023
    , Vector.vector -7.945034 43.181988 4.725048
    , Vector.vector -5.404554 40.000000 3.611202
    , Vector.vector -6.445034 39.781986 3.859023
    , Vector.vector -7.311059 40.049938 4.359023
    , Vector.vector -7.945034 40.781990 4.725048
    , Vector.vector -7.486698 41.781990 5.892258
    , Vector.vector -7.274120 43.181988 5.729141
    , Vector.vector -5.899992 39.781986 4.674735
    , Vector.vector -6.693346 40.049938 5.283496
    , Vector.vector -7.274120 40.781990 5.729141
    , Vector.vector -6.667357 41.781990 6.826537
    , Vector.vector -6.477890 43.181988 6.637068
    , Vector.vector -4.596197 40.000000 4.596191
    , Vector.vector -5.253144 39.781986 5.412323
    , Vector.vector -5.960251 40.049938 6.119430
    , Vector.vector -6.477890 40.781990 6.637068
    , Vector.vector -5.733080 41.781990 7.645878
    , Vector.vector -5.569963 43.181988 7.433300
    , Vector.vector -3.611210 40.000000 5.404551
    , Vector.vector -4.515555 39.781986 6.059172
    , Vector.vector -5.124319 40.049938 6.852526
    , Vector.vector -5.569963 40.781990 7.433300
    , Vector.vector -4.699841 41.781990 8.336267
    , Vector.vector -4.565866 43.181988 8.104216
    , Vector.vector -3.699841 39.781986 6.604215
    , Vector.vector -4.199841 40.049938 7.470241
    , Vector.vector -4.565866 40.781990 8.104216
    , Vector.vector -3.585336 41.781990 8.885880
    , Vector.vector -3.482796 43.181988 8.638327
    , Vector.vector -2.487445 40.000000 6.005216
    , Vector.vector -2.819969 39.781986 7.038121
    , Vector.vector -3.202652 40.049938 7.962000
    , Vector.vector -3.482796 40.781990 8.638327
    , Vector.vector -2.408626 41.781990 9.285318
    , Vector.vector -2.339275 43.181988 9.026500
    , Vector.vector -1.268090 40.000000 6.375103
    , Vector.vector -1.890987 39.781986 7.353467
    , Vector.vector -2.149807 40.049938 8.319393
    , Vector.vector -2.339275 40.781990 9.026500
    , Vector.vector -1.189847 41.781990 9.527750
    , Vector.vector -1.154872 43.181988 9.262093
    , Vector.vector -0.928793 39.781986 7.544860
    , Vector.vector -1.059320 40.049938 8.536305
    , Vector.vector -1.154872 40.781990 9.262093
    , Vector.vector 0.050159 41.781990 9.609024
    , Vector.vector 0.050159 43.181988 9.341076
    , Vector.vector -0.000002 40.000000 6.500000
    , Vector.vector 0.050159 39.781986 7.609024
    , Vector.vector 0.050158 40.049938 8.609026
    , Vector.vector 0.050159 40.781990 9.341076
    , Vector.vector 1.290156 41.781990 9.527750
    , Vector.vector 1.255181 43.181988 9.262094
    , Vector.vector 1.268085 40.000000 6.375104
    , Vector.vector 1.029103 39.781986 7.544861
    , Vector.vector 1.159629 40.049938 8.536305
    , Vector.vector 1.255181 40.781990 9.262094
    , Vector.vector 2.508934 41.781990 9.285321
    , Vector.vector 2.439584 43.181988 9.026501
    , Vector.vector 1.991297 39.781986 7.353469
    , Vector.vector 2.250116 40.049938 8.319395
    , Vector.vector 2.439584 40.781990 9.026501
    , Vector.vector 3.685652 41.781990 8.885879
    , Vector.vector 3.583112 43.181988 8.638326
    , Vector.vector 2.487441 40.000000 6.005218
    , Vector.vector 2.920285 39.781986 7.038120
    , Vector.vector 3.302969 40.049938 7.961999
    , Vector.vector 3.583112 40.781990 8.638326
    , Vector.vector 4.800158 41.781990 8.336266
    , Vector.vector 4.666183 43.181988 8.104215
    , Vector.vector 3.611206 40.000000 5.404553
    , Vector.vector 3.800157 39.781986 6.604215
    , Vector.vector 4.300158 40.049938 7.470241
    , Vector.vector 4.666183 40.781990 8.104215
    , Vector.vector 5.833390 41.781990 7.645883
    , Vector.vector 5.670273 43.181988 7.433305
    , Vector.vector 4.615868 39.781986 6.059175
    , Vector.vector 5.224628 40.049938 6.852529
    , Vector.vector 5.670273 40.781990 7.433305
    , Vector.vector 6.767669 41.781990 6.826543
    , Vector.vector 6.578200 43.181988 6.637074
    , Vector.vector 4.596194 40.000000 4.596194
    , Vector.vector 5.353456 39.781986 5.412328
    , Vector.vector 6.060563 40.049938 6.119436
    , Vector.vector 6.578200 40.781990 6.637074
    , Vector.vector 7.587016 41.781990 5.892258
    , Vector.vector 7.374437 43.181988 5.729140
    , Vector.vector 5.404553 40.000000 3.611206
    , Vector.vector 6.000309 39.781986 4.674735
    , Vector.vector 6.793662 40.049938 5.283496
    , Vector.vector 7.374437 40.781990 5.729140
    , Vector.vector 8.277399 41.781990 4.859025
    , Vector.vector 8.045348 43.181988 4.725050
    , Vector.vector 6.545348 39.781986 3.859025
    , Vector.vector 7.411373 40.049938 4.359025
    , Vector.vector 8.045348 40.781990 4.725050
    , Vector.vector 8.827012 41.781990 3.744521
    , Vector.vector 8.579459 43.181988 3.641981
    , Vector.vector 6.005217 40.000000 2.487441
    , Vector.vector 6.979253 39.781986 2.979153
    , Vector.vector 7.903133 40.049938 3.361837
    , Vector.vector 8.579459 40.781990 3.641981
    , Vector.vector 9.226454 41.781990 2.567803
    , Vector.vector 8.967634 43.181988 2.498452
    , Vector.vector 6.375104 40.000000 1.268086
    , Vector.vector 7.294602 39.781986 2.050165
    , Vector.vector 8.260529 40.049938 2.308984
    , Vector.vector 8.967634 40.781990 2.498452
    , Vector.vector 9.468884 41.781990 1.349023
    , Vector.vector 9.203228 43.181988 1.314049
    , Vector.vector 7.485995 39.781986 1.087971
    , Vector.vector 8.477440 40.049938 1.218497
    , Vector.vector 9.203228 40.781990 1.314049
    , Vector.vector -0.000000 -40.000000 -8.449999
    , Vector.vector 1.648513 -40.000000 -8.287635
    , Vector.vector 3.233675 -40.000000 -7.806781
    , Vector.vector 4.694568 -40.000000 -7.025917
    , Vector.vector 5.975051 -40.000000 -5.975051
    , Vector.vector 7.025918 -40.000000 -4.694567
    , Vector.vector 7.806782 -40.000000 -3.233674
    , Vector.vector 8.287635 -40.000000 -1.648513
    , Vector.vector 8.449999 -40.000000 -0.000000
    , Vector.vector 8.287635 -40.000000 1.648513
    , Vector.vector 7.806782 -40.000000 3.233674
    , Vector.vector 7.025918 -40.000000 4.694569
    , Vector.vector 5.975051 -40.000000 5.975053
    , Vector.vector 4.694568 -40.000000 7.025919
    , Vector.vector 3.233673 -40.000000 7.806783
    , Vector.vector 1.648511 -40.000000 8.287636
    , Vector.vector -0.000003 -40.000000 8.450000
    , Vector.vector -1.648517 -40.000000 8.287635
    , Vector.vector -3.233679 -40.000000 7.806780
    , Vector.vector -4.694572 -40.000000 7.025916
    , Vector.vector -5.975056 -40.000000 5.975049
    , Vector.vector -7.025921 -40.000000 4.694564
    , Vector.vector -7.806784 -40.000000 3.233669
    , Vector.vector -8.287636 -40.000000 1.648506
    , Vector.vector -8.450000 -40.000000 -0.000008
    , Vector.vector -8.287634 -40.000000 -1.648521
    , Vector.vector -7.806778 -40.000000 -3.233683
    , Vector.vector -7.025912 -40.000000 -4.694576
    , Vector.vector -5.975044 -40.000000 -5.975059
    , Vector.vector -4.694559 -40.000000 -7.025923
    , Vector.vector -3.233664 -40.000000 -7.806786
    , Vector.vector -1.648501 -40.000000 -8.287637
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
    , Vector.vector 5.849701 -32.727272 -5.849700
    , Vector.vector -1.634092 -36.969894 -8.215197
    , Vector.vector -1.618875 -33.769897 -8.138696
    , Vector.vector -1.603658 -30.569897 -8.062194
    , Vector.vector -1.588441 -27.369898 -7.985693
    , Vector.vector -1.573224 -24.169899 -7.909191
    , Vector.vector -1.558007 -20.969898 -7.832690
    , Vector.vector -1.542790 -17.769897 -7.756188
    , Vector.vector -1.527573 -14.569897 -7.679687
    , Vector.vector -1.512356 -11.369896 -7.603186
    , Vector.vector -1.497139 -8.169896 -7.526684
    , Vector.vector -1.481923 -4.969895 -7.450183
    , Vector.vector -1.466706 -1.769895 -7.373682
    , Vector.vector -1.451489 1.430105 -7.297180
    , Vector.vector -1.436272 4.630105 -7.220679
    , Vector.vector -1.421055 7.830105 -7.144178
    , Vector.vector -1.405838 11.030107 -7.067677
    , Vector.vector -1.390621 14.230107 -6.991176
    , Vector.vector -1.375404 17.430107 -6.914675
    , Vector.vector -1.360187 20.630104 -6.838174
    , Vector.vector -1.344970 23.830105 -6.761672
    , Vector.vector -1.329753 27.030104 -6.685172
    , Vector.vector -1.314536 30.230104 -6.608671
    , Vector.vector -1.299319 33.430103 -6.532169
    , Vector.vector -1.284102 36.630104 -6.455668
    , Vector.vector 6.964507 -36.969894 4.653535
    , Vector.vector 6.899652 -33.769897 4.610200
    , Vector.vector 6.834798 -30.569897 4.566866
    , Vector.vector 6.769943 -27.369898 4.523532
    , Vector.vector 6.705089 -24.169899 4.480197
    , Vector.vector 6.640234 -20.969898 4.436862
    , Vector.vector 6.575379 -17.769897 4.393528
    , Vector.vector 6.510525 -14.569897 4.350194
    , Vector.vector 6.445670 -11.369896 4.306859
    , Vector.vector 6.380816 -8.169896 4.263525
    , Vector.vector 6.315961 -4.969895 4.220190
    , Vector.vector 6.251106 -1.769895 4.176856
    , Vector.vector 6.186252 1.430105 4.133521
    , Vector.vector 6.121397 4.630105 4.090186
    , Vector.vector 6.056542 7.830105 4.046852
    , Vector.vector 5.991688 11.030107 4.003518
    , Vector.vector 5.926833 14.230107 3.960183
    , Vector.vector 5.861979 17.430107 3.916848
    , Vector.vector 5.797124 20.630104 3.873514
    , Vector.vector 5.732269 23.830105 3.830180
    , Vector.vector 5.667415 27.030104 3.786845
    , Vector.vector 5.602560 30.230104 3.743510
    , Vector.vector 5.537705 33.430103 3.700176
    , Vector.vector 5.472851 36.630104 3.656842
    , Vector.vector 1.634104 -36.969894 -8.215195
    , Vector.vector 1.618887 -33.769897 -8.138694
    , Vector.vector 1.603670 -30.569897 -8.062192
    , Vector.vector 1.588453 -27.369898 -7.985691
    , Vector.vector 1.573236 -24.169899 -7.909189
    , Vector.vector 1.558018 -20.969898 -7.832688
    , Vector.vector 1.542801 -17.769897 -7.756186
    , Vector.vector 1.527584 -14.569897 -7.679686
    , Vector.vector 1.512367 -11.369896 -7.603184
    , Vector.vector 1.497150 -8.169896 -7.526683
    , Vector.vector 1.481933 -4.969895 -7.450181
    , Vector.vector 1.466716 -1.769895 -7.373680
    , Vector.vector 1.451499 1.430105 -7.297178
    , Vector.vector 1.436282 4.630105 -7.220677
    , Vector.vector 1.421065 7.830105 -7.144176
    , Vector.vector 1.405848 11.030107 -7.067676
    , Vector.vector 1.390631 14.230107 -6.991174
    , Vector.vector 1.375414 17.430107 -6.914673
    , Vector.vector 1.360197 20.630104 -6.838172
    , Vector.vector 1.344980 23.830105 -6.761671
    , Vector.vector 1.329763 27.030104 -6.685170
    , Vector.vector 1.314546 30.230104 -6.608668
    , Vector.vector 1.299329 33.430103 -6.532168
    , Vector.vector 1.284112 36.630104 -6.455667
    , Vector.vector 4.653534 -36.969894 -6.964506
    , Vector.vector 4.610200 -33.769897 -6.899652
    , Vector.vector 4.566865 -30.569897 -6.834797
    , Vector.vector 4.523531 -27.369898 -6.769942
    , Vector.vector 4.480197 -24.169899 -6.705088
    , Vector.vector 4.436862 -20.969898 -6.640233
    , Vector.vector 4.393528 -17.769897 -6.575378
    , Vector.vector 4.350194 -14.569897 -6.510524
    , Vector.vector 4.306859 -11.369896 -6.445669
    , Vector.vector 4.263525 -8.169896 -6.380815
    , Vector.vector 4.220191 -4.969895 -6.315960
    , Vector.vector 4.176856 -1.769895 -6.251105
    , Vector.vector 4.133521 1.430105 -6.186251
    , Vector.vector 4.090187 4.630105 -6.121396
    , Vector.vector 4.046852 7.830105 -6.056541
    , Vector.vector 4.003518 11.030107 -5.991687
    , Vector.vector 3.960183 14.230107 -5.926832
    , Vector.vector 3.916849 17.430107 -5.861978
    , Vector.vector 3.873514 20.630104 -5.797123
    , Vector.vector 3.830180 23.830105 -5.732268
    , Vector.vector 3.786845 27.030104 -5.667414
    , Vector.vector 3.743511 30.230104 -5.602559
    , Vector.vector 3.700176 33.430103 -5.537704
    , Vector.vector 3.656842 36.630104 -5.472850
    , Vector.vector 8.215195 -36.969894 -1.634104
    , Vector.vector 8.138694 -33.769897 -1.618886
    , Vector.vector 8.062192 -30.569897 -1.603669
    , Vector.vector 7.985691 -27.369898 -1.588452
    , Vector.vector 7.909189 -24.169899 -1.573235
    , Vector.vector 7.832688 -20.969898 -1.558018
    , Vector.vector 7.756186 -17.769897 -1.542801
    , Vector.vector 7.679686 -14.569897 -1.527584
    , Vector.vector 7.603184 -11.369896 -1.512367
    , Vector.vector 7.526683 -8.169896 -1.497150
    , Vector.vector 7.450181 -4.969895 -1.481933
    , Vector.vector 7.373680 -1.769895 -1.466716
    , Vector.vector 7.297178 1.430105 -1.451499
    , Vector.vector 7.220677 4.630105 -1.436282
    , Vector.vector 7.144176 7.830105 -1.421065
    , Vector.vector 7.067676 11.030107 -1.405848
    , Vector.vector 6.991174 14.230107 -1.390631
    , Vector.vector 6.914673 17.430107 -1.375414
    , Vector.vector 6.838172 20.630104 -1.360197
    , Vector.vector 6.761671 23.830105 -1.344980
    , Vector.vector 6.685170 27.030104 -1.329763
    , Vector.vector 6.608668 30.230104 -1.314546
    , Vector.vector 6.532168 33.430103 -1.299329
    , Vector.vector 6.455667 36.630104 -1.284112
    , Vector.vector 4.653534 -36.969894 6.964508
    , Vector.vector 4.610199 -33.769897 6.899653
    , Vector.vector 4.566865 -30.569897 6.834798
    , Vector.vector 4.523531 -27.369898 6.769944
    , Vector.vector 4.480196 -24.169899 6.705089
    , Vector.vector 4.436862 -20.969898 6.640234
    , Vector.vector 4.393528 -17.769897 6.575380
    , Vector.vector 4.350194 -14.569897 6.510525
    , Vector.vector 4.306859 -11.369896 6.445671
    , Vector.vector 4.263525 -8.169896 6.380816
    , Vector.vector 4.220190 -4.969895 6.315961
    , Vector.vector 4.176856 -1.769895 6.251107
    , Vector.vector 4.133521 1.430105 6.186252
    , Vector.vector 4.090186 4.630105 6.121397
    , Vector.vector 4.046852 7.830105 6.056543
    , Vector.vector 4.003518 11.030107 5.991688
    , Vector.vector 3.960183 14.230107 5.926834
    , Vector.vector 3.916848 17.430107 5.861979
    , Vector.vector 3.873514 20.630104 5.797124
    , Vector.vector 3.830180 23.830105 5.732270
    , Vector.vector 3.786845 27.030104 5.667415
    , Vector.vector 3.743510 30.230104 5.602561
    , Vector.vector 3.700176 33.430103 5.537706
    , Vector.vector 3.656842 36.630104 5.472851
    , Vector.vector 1.634102 -36.969894 8.215196
    , Vector.vector 1.618885 -33.769897 8.138694
    , Vector.vector 1.603668 -30.569897 8.062193
    , Vector.vector 1.588451 -27.369898 7.985692
    , Vector.vector 1.573234 -24.169899 7.909190
    , Vector.vector 1.558017 -20.969898 7.832689
    , Vector.vector 1.542799 -17.769897 7.756187
    , Vector.vector 1.527582 -14.569897 7.679686
    , Vector.vector 1.512365 -11.369896 7.603185
    , Vector.vector 1.497148 -8.169896 7.526683
    , Vector.vector 1.481931 -4.969895 7.450182
    , Vector.vector 1.466714 -1.769895 7.373681
    , Vector.vector 1.451497 1.430105 7.297179
    , Vector.vector 1.436280 4.630105 7.220678
    , Vector.vector 1.421063 7.830105 7.144176
    , Vector.vector 1.405846 11.030107 7.067676
    , Vector.vector 1.390629 14.230107 6.991174
    , Vector.vector 1.375412 17.430107 6.914673
    , Vector.vector 1.360195 20.630104 6.838172
    , Vector.vector 1.344979 23.830105 6.761671
    , Vector.vector 1.329762 27.030104 6.685170
    , Vector.vector 1.314544 30.230104 6.608668
    , Vector.vector 1.299327 33.430103 6.532168
    , Vector.vector 1.284111 36.630104 6.455667
    , Vector.vector -1.634108 -36.969894 8.215195
    , Vector.vector -1.618891 -33.769897 8.138694
    , Vector.vector -1.603674 -30.569897 8.062192
    , Vector.vector -1.588457 -27.369898 7.985691
    , Vector.vector -1.573239 -24.169899 7.909189
    , Vector.vector -1.558022 -20.969898 7.832688
    , Vector.vector -1.542805 -17.769897 7.756186
    , Vector.vector -1.527588 -14.569897 7.679686
    , Vector.vector -1.512371 -11.369896 7.603184
    , Vector.vector -1.497154 -8.169896 7.526683
    , Vector.vector -1.481937 -4.969895 7.450181
    , Vector.vector -1.466720 -1.769895 7.373680
    , Vector.vector -1.451503 1.430105 7.297178
    , Vector.vector -1.436286 4.630105 7.220677
    , Vector.vector -1.421069 7.830105 7.144176
    , Vector.vector -1.405852 11.030107 7.067675
    , Vector.vector -1.390635 14.230107 6.991174
    , Vector.vector -1.375418 17.430107 6.914673
    , Vector.vector -1.360201 20.630104 6.838171
    , Vector.vector -1.344983 23.830105 6.761670
    , Vector.vector -1.329766 27.030104 6.685169
    , Vector.vector -1.314549 30.230104 6.608668
    , Vector.vector -1.299332 33.430103 6.532167
    , Vector.vector -1.284115 36.630104 6.455666
    , Vector.vector -4.653539 -36.969894 6.964505
    , Vector.vector -4.610204 -33.769897 6.899650
    , Vector.vector -4.566870 -30.569897 6.834795
    , Vector.vector -4.523535 -27.369898 6.769941
    , Vector.vector -4.480201 -24.169899 6.705086
    , Vector.vector -4.436866 -20.969898 6.640232
    , Vector.vector -4.393532 -17.769897 6.575377
    , Vector.vector -4.350197 -14.569897 6.510522
    , Vector.vector -4.306863 -11.369896 6.445668
    , Vector.vector -4.263528 -8.169896 6.380813
    , Vector.vector -4.220194 -4.969895 6.315958
    , Vector.vector -4.176859 -1.769895 6.251104
    , Vector.vector -4.133524 1.430105 6.186249
    , Vector.vector -4.090190 4.630105 6.121395
    , Vector.vector -4.046855 7.830105 6.056540
    , Vector.vector -4.003521 11.030107 5.991685
    , Vector.vector -3.960186 14.230107 5.926831
    , Vector.vector -3.916852 17.430107 5.861976
    , Vector.vector -3.873518 20.630104 5.797122
    , Vector.vector -3.830183 23.830105 5.732267
    , Vector.vector -3.786849 27.030104 5.667412
    , Vector.vector -3.743514 30.230104 5.602558
    , Vector.vector -3.700180 33.430103 5.537703
    , Vector.vector -3.656845 36.630104 5.472848
    , Vector.vector -6.964509 -36.969894 4.653530
    , Vector.vector -6.899655 -33.769897 4.610196
    , Vector.vector -6.834800 -30.569897 4.566861
    , Vector.vector -6.769946 -27.369898 4.523527
    , Vector.vector -6.705091 -24.169899 4.480193
    , Vector.vector -6.640236 -20.969898 4.436858
    , Vector.vector -6.575382 -17.769897 4.393524
    , Vector.vector -6.510527 -14.569897 4.350190
    , Vector.vector -6.445673 -11.369896 4.306855
    , Vector.vector -6.380818 -8.169896 4.263521
    , Vector.vector -6.315963 -4.969895 4.220186
    , Vector.vector -6.251109 -1.769895 4.176852
    , Vector.vector -6.186254 1.430105 4.133517
    , Vector.vector -6.121399 4.630105 4.090183
    , Vector.vector -6.056545 7.830105 4.046848
    , Vector.vector -5.991690 11.030107 4.003514
    , Vector.vector -5.926836 14.230107 3.960179
    , Vector.vector -5.861981 17.430107 3.916845
    , Vector.vector -5.797126 20.630104 3.873510
    , Vector.vector -5.732272 23.830105 3.830176
    , Vector.vector -5.667417 27.030104 3.786841
    , Vector.vector -5.602562 30.230104 3.743507
    , Vector.vector -5.537708 33.430103 3.700172
    , Vector.vector -5.472853 36.630104 3.656838
    , Vector.vector -8.215197 -36.969894 1.634097
    , Vector.vector -8.138695 -33.769897 1.618880
    , Vector.vector -8.062193 -30.569897 1.603663
    , Vector.vector -7.985692 -27.369898 1.588446
    , Vector.vector -7.909191 -24.169899 1.573229
    , Vector.vector -7.832689 -20.969898 1.558012
    , Vector.vector -7.756188 -17.769897 1.542795
    , Vector.vector -7.679687 -14.569897 1.527578
    , Vector.vector -7.603185 -11.369896 1.512361
    , Vector.vector -7.526684 -8.169896 1.497144
    , Vector.vector -7.450182 -4.969895 1.481927
    , Vector.vector -7.373681 -1.769895 1.466710
    , Vector.vector -7.297180 1.430105 1.451493
    , Vector.vector -7.220678 4.630105 1.436276
    , Vector.vector -7.144177 7.830105 1.421059
    , Vector.vector -7.067676 11.030107 1.405842
    , Vector.vector -6.991175 14.230107 1.390625
    , Vector.vector -6.914674 17.430107 1.375408
    , Vector.vector -6.838173 20.630104 1.360191
    , Vector.vector -6.761671 23.830105 1.344974
    , Vector.vector -6.685171 27.030104 1.329757
    , Vector.vector -6.608670 30.230104 1.314540
    , Vector.vector -6.532168 33.430103 1.299323
    , Vector.vector -6.455667 36.630104 1.284106
    , Vector.vector -8.215194 -36.969894 -1.634112
    , Vector.vector -8.138693 -33.769897 -1.618895
    , Vector.vector -8.062191 -30.569897 -1.603678
    , Vector.vector -7.985690 -27.369898 -1.588461
    , Vector.vector -7.909188 -24.169899 -1.573244
    , Vector.vector -7.832687 -20.969898 -1.558027
    , Vector.vector -7.756186 -17.769897 -1.542810
    , Vector.vector -7.679684 -14.569897 -1.527593
    , Vector.vector -7.603183 -11.369896 -1.512376
    , Vector.vector -7.526681 -8.169896 -1.497159
    , Vector.vector -7.450180 -4.969895 -1.481941
    , Vector.vector -7.373679 -1.769895 -1.466724
    , Vector.vector -7.297177 1.430105 -1.451507
    , Vector.vector -7.220676 4.630105 -1.436290
    , Vector.vector -7.144175 7.830105 -1.421073
    , Vector.vector -7.067675 11.030107 -1.405856
    , Vector.vector -6.991173 14.230107 -1.390639
    , Vector.vector -6.914672 17.430107 -1.375422
    , Vector.vector -6.838171 20.630104 -1.360204
    , Vector.vector -6.761670 23.830105 -1.344987
    , Vector.vector -6.685169 27.030104 -1.329770
    , Vector.vector -6.608667 30.230104 -1.314553
    , Vector.vector -6.532166 33.430103 -1.299336
    , Vector.vector -6.455666 36.630104 -1.284119
    , Vector.vector -6.964501 -36.969894 -4.653542
    , Vector.vector -6.899647 -33.769897 -4.610208
    , Vector.vector -6.834792 -30.569897 -4.566873
    , Vector.vector -6.769938 -27.369898 -4.523539
    , Vector.vector -6.705083 -24.169899 -4.480204
    , Vector.vector -6.640228 -20.969898 -4.436870
    , Vector.vector -6.575374 -17.769897 -4.393535
    , Vector.vector -6.510519 -14.569897 -4.350200
    , Vector.vector -6.445664 -11.369896 -4.306866
    , Vector.vector -6.380810 -8.169896 -4.263532
    , Vector.vector -6.315955 -4.969895 -4.220197
    , Vector.vector -6.251101 -1.769895 -4.176862
    , Vector.vector -6.186246 1.430105 -4.133528
    , Vector.vector -6.121391 4.630105 -4.090194
    , Vector.vector -6.056537 7.830105 -4.046859
    , Vector.vector -5.991682 11.030107 -4.003524
    , Vector.vector -5.926827 14.230107 -3.960190
    , Vector.vector -5.861973 17.430107 -3.916855
    , Vector.vector -5.797118 20.630104 -3.873521
    , Vector.vector -5.732264 23.830105 -3.830186
    , Vector.vector -5.667409 27.030104 -3.786852
    , Vector.vector -5.602555 30.230104 -3.743517
    , Vector.vector -5.537700 33.430103 -3.700183
    , Vector.vector -5.472846 36.630104 -3.656848
    , Vector.vector -4.653525 -36.969894 -6.964512
    , Vector.vector -4.610191 -33.769897 -6.899657
    , Vector.vector -4.566856 -30.569897 -6.834803
    , Vector.vector -4.523522 -27.369898 -6.769948
    , Vector.vector -4.480187 -24.169899 -6.705093
    , Vector.vector -4.436853 -20.969898 -6.640239
    , Vector.vector -4.393519 -17.769897 -6.575384
    , Vector.vector -4.350184 -14.569897 -6.510530
    , Vector.vector -4.306850 -11.369896 -6.445675
    , Vector.vector -4.263516 -8.169896 -6.380820
    , Vector.vector -4.220181 -4.969895 -6.315966
    , Vector.vector -4.176847 -1.769895 -6.251111
    , Vector.vector -4.133512 1.430105 -6.186256
    , Vector.vector -4.090178 4.630105 -6.121402
    , Vector.vector -4.046844 7.830105 -6.056547
    , Vector.vector -4.003510 11.030107 -5.991693
    , Vector.vector -3.960175 14.230107 -5.926838
    , Vector.vector -3.916841 17.430107 -5.861983
    , Vector.vector -3.873507 20.630104 -5.797129
    , Vector.vector -3.830172 23.830105 -5.732274
    , Vector.vector -3.786838 27.030104 -5.667419
    , Vector.vector -3.743503 30.230104 -5.602565
    , Vector.vector -3.700169 33.430103 -5.537710
    , Vector.vector -3.656834 36.630104 -5.472855
    , Vector.vector -0.000000 -36.969894 -8.376141
    , Vector.vector -0.000000 -33.769897 -8.298141
    , Vector.vector -0.000000 -30.569897 -8.220140
    , Vector.vector -0.000000 -27.369898 -8.142141
    , Vector.vector -0.000000 -24.169899 -8.064141
    , Vector.vector -0.000000 -20.969898 -7.986141
    , Vector.vector -0.000000 -17.769897 -7.908142
    , Vector.vector -0.000000 -14.569897 -7.830142
    , Vector.vector -0.000000 -11.369896 -7.752142
    , Vector.vector -0.000000 -8.169896 -7.674142
    , Vector.vector -0.000000 -4.969895 -7.596142
    , Vector.vector -0.000000 -1.769895 -7.518143
    , Vector.vector -0.000000 1.430105 -7.440143
    , Vector.vector -0.000000 4.630105 -7.362143
    , Vector.vector -0.000000 7.830105 -7.284142
    , Vector.vector -0.000000 11.030107 -7.206142
    , Vector.vector -0.000000 14.230107 -7.128142
    , Vector.vector -0.000000 17.430107 -7.050142
    , Vector.vector -0.000000 20.630104 -6.972142
    , Vector.vector -0.000000 23.830105 -6.894141
    , Vector.vector -0.000000 27.030104 -6.816142
    , Vector.vector -0.000000 30.230104 -6.738142
    , Vector.vector -0.000000 33.430103 -6.660141
    , Vector.vector -0.000000 36.630104 -6.582141
    , Vector.vector 5.922825 -36.969894 -5.922825
    , Vector.vector 5.867671 -33.769897 -5.867670
    , Vector.vector 5.812516 -30.569897 -5.812516
    , Vector.vector 5.757361 -27.369898 -5.757361
    , Vector.vector 5.702208 -24.169899 -5.702208
    , Vector.vector 5.647053 -20.969898 -5.647053
    , Vector.vector 5.591898 -17.769897 -5.591898
    , Vector.vector 5.536745 -14.569897 -5.536745
    , Vector.vector 5.481591 -11.369896 -5.481591
    , Vector.vector 5.426436 -8.169896 -5.426436
    , Vector.vector 5.371282 -4.969895 -5.371282
    , Vector.vector 5.316128 -1.769895 -5.316128
    , Vector.vector 5.260973 1.430105 -5.260973
    , Vector.vector 5.205819 4.630105 -5.205819
    , Vector.vector 5.150664 7.830105 -5.150664
    , Vector.vector 5.095510 11.030107 -5.095510
    , Vector.vector 5.040357 14.230107 -5.040357
    , Vector.vector 4.985202 17.430107 -4.985202
    , Vector.vector 4.930048 20.630104 -4.930048
    , Vector.vector 4.874894 23.830105 -4.874894
    , Vector.vector 4.819739 27.030104 -4.819739
    , Vector.vector 4.764585 30.230104 -4.764585
    , Vector.vector 4.709431 33.430103 -4.709431
    , Vector.vector 4.654276 36.630104 -4.654276
    , Vector.vector 8.376141 -36.969894 -0.000000
    , Vector.vector 8.298141 -33.769897 -0.000000
    , Vector.vector 8.220140 -30.569897 -0.000000
    , Vector.vector 8.142141 -27.369898 -0.000000
    , Vector.vector 8.064141 -24.169899 -0.000000
    , Vector.vector 7.986141 -20.969898 -0.000000
    , Vector.vector 7.908142 -17.769897 -0.000000
    , Vector.vector 7.830142 -14.569897 -0.000000
    , Vector.vector 7.752142 -11.369896 -0.000000
    , Vector.vector 7.674142 -8.169896 -0.000000
    , Vector.vector 7.596142 -4.969895 -0.000000
    , Vector.vector 7.518143 -1.769895 -0.000000
    , Vector.vector 7.440143 1.430105 -0.000000
    , Vector.vector 7.362143 4.630105 -0.000000
    , Vector.vector 7.284142 7.830105 -0.000000
    , Vector.vector 7.206142 11.030107 -0.000000
    , Vector.vector 7.128142 14.230107 -0.000000
    , Vector.vector 7.050142 17.430107 -0.000000
    , Vector.vector 6.972142 20.630104 -0.000000
    , Vector.vector 6.894141 23.830105 -0.000000
    , Vector.vector 6.816142 27.030104 -0.000000
    , Vector.vector 6.738142 30.230104 -0.000000
    , Vector.vector 6.660141 33.430103 -0.000000
    , Vector.vector 6.582141 36.630104 -0.000000
    , Vector.vector 5.922825 -36.969894 5.922827
    , Vector.vector 5.867671 -33.769897 5.867672
    , Vector.vector 5.812516 -30.569897 5.812517
    , Vector.vector 5.757361 -27.369898 5.757363
    , Vector.vector 5.702208 -24.169899 5.702209
    , Vector.vector 5.647053 -20.969898 5.647054
    , Vector.vector 5.591898 -17.769897 5.591899
    , Vector.vector 5.536745 -14.569897 5.536745
    , Vector.vector 5.481591 -11.369896 5.481591
    , Vector.vector 5.426436 -8.169896 5.426436
    , Vector.vector 5.371282 -4.969895 5.371282
    , Vector.vector 5.316128 -1.769895 5.316128
    , Vector.vector 5.260973 1.430105 5.260973
    , Vector.vector 5.205819 4.630105 5.205819
    , Vector.vector 5.150664 7.830105 5.150664
    , Vector.vector 5.095510 11.030107 5.095510
    , Vector.vector 5.040357 14.230107 5.040357
    , Vector.vector 4.985202 17.430107 4.985202
    , Vector.vector 4.930048 20.630104 4.930048
    , Vector.vector 4.874894 23.830105 4.874894
    , Vector.vector 4.819739 27.030104 4.819739
    , Vector.vector 4.764585 30.230104 4.764585
    , Vector.vector 4.709431 33.430103 4.709431
    , Vector.vector 4.654276 36.630104 4.654276
    , Vector.vector 3.205409 -36.969894 7.738546
    , Vector.vector 3.175559 -33.769897 7.666483
    , Vector.vector 3.145710 -30.569897 7.594421
    , Vector.vector 3.115860 -27.369898 7.522358
    , Vector.vector 3.086011 -24.169899 7.450295
    , Vector.vector 3.056162 -20.969898 7.378233
    , Vector.vector 3.026313 -17.769897 7.306170
    , Vector.vector 2.996464 -14.569897 7.234108
    , Vector.vector 2.966614 -11.369896 7.162045
    , Vector.vector 2.936765 -8.169896 7.089983
    , Vector.vector 2.906916 -4.969895 7.017920
    , Vector.vector 2.877066 -1.769895 6.945858
    , Vector.vector 2.847217 1.430105 6.873795
    , Vector.vector 2.817368 4.630105 6.801732
    , Vector.vector 2.787519 7.830105 6.729670
    , Vector.vector 2.757669 11.030107 6.657607
    , Vector.vector 2.727820 14.230107 6.585545
    , Vector.vector 2.697971 17.430107 6.513482
    , Vector.vector 2.668121 20.630104 6.441419
    , Vector.vector 2.638272 23.830105 6.369357
    , Vector.vector 2.608423 27.030104 6.297294
    , Vector.vector 2.578574 30.230104 6.225231
    , Vector.vector 2.548724 33.430103 6.153169
    , Vector.vector 2.518875 36.630104 6.081106
    , Vector.vector -0.000003 -36.969894 8.376142
    , Vector.vector -0.000003 -33.769897 8.298141
    , Vector.vector -0.000003 -30.569897 8.220141
    , Vector.vector -0.000003 -27.369898 8.142141
    , Vector.vector -0.000003 -24.169899 8.064142
    , Vector.vector -0.000003 -20.969898 7.986142
    , Vector.vector -0.000003 -17.769897 7.908142
    , Vector.vector -0.000003 -14.569897 7.830142
    , Vector.vector -0.000003 -11.369896 7.752142
    , Vector.vector -0.000003 -8.169896 7.674143
    , Vector.vector -0.000003 -4.969895 7.596143
    , Vector.vector -0.000003 -1.769895 7.518143
    , Vector.vector -0.000003 1.430105 7.440143
    , Vector.vector -0.000002 4.630105 7.362143
    , Vector.vector -0.000002 7.830105 7.284142
    , Vector.vector -0.000002 11.030107 7.206142
    , Vector.vector -0.000002 14.230107 7.128142
    , Vector.vector -0.000002 17.430107 7.050142
    , Vector.vector -0.000002 20.630104 6.972142
    , Vector.vector -0.000002 23.830105 6.894141
    , Vector.vector -0.000002 27.030104 6.816142
    , Vector.vector -0.000002 30.230104 6.738142
    , Vector.vector -0.000002 33.430103 6.660141
    , Vector.vector -0.000002 36.630104 6.582141
    , Vector.vector -3.205414 -36.969894 7.738544
    , Vector.vector -3.175565 -33.769897 7.666481
    , Vector.vector -3.145715 -30.569897 7.594419
    , Vector.vector -3.115866 -27.369898 7.522356
    , Vector.vector -3.086016 -24.169899 7.450294
    , Vector.vector -3.056167 -20.969898 7.378231
    , Vector.vector -3.026318 -17.769897 7.306168
    , Vector.vector -2.996468 -14.569897 7.234106
    , Vector.vector -2.966619 -11.369896 7.162043
    , Vector.vector -2.936769 -8.169896 7.089980
    , Vector.vector -2.906920 -4.969895 7.017918
    , Vector.vector -2.877071 -1.769895 6.945855
    , Vector.vector -2.847221 1.430105 6.873793
    , Vector.vector -2.817372 4.630105 6.801730
    , Vector.vector -2.787523 7.830105 6.729667
    , Vector.vector -2.757673 11.030107 6.657605
    , Vector.vector -2.727824 14.230107 6.585542
    , Vector.vector -2.697975 17.430107 6.513479
    , Vector.vector -2.668125 20.630104 6.441417
    , Vector.vector -2.638276 23.830105 6.369354
    , Vector.vector -2.608427 27.030104 6.297292
    , Vector.vector -2.578578 30.230104 6.225229
    , Vector.vector -2.548728 33.430103 6.153166
    , Vector.vector -2.518879 36.630104 6.081104
    , Vector.vector -5.922830 -36.969894 5.922823
    , Vector.vector -5.867676 -33.769897 5.867668
    , Vector.vector -5.812521 -30.569897 5.812514
    , Vector.vector -5.757366 -27.369898 5.757360
    , Vector.vector -5.702212 -24.169899 5.702205
    , Vector.vector -5.647058 -20.969898 5.647051
    , Vector.vector -5.591903 -17.769897 5.591896
    , Vector.vector -5.536748 -14.569897 5.536742
    , Vector.vector -5.481594 -11.369896 5.481587
    , Vector.vector -5.426440 -8.169896 5.426434
    , Vector.vector -5.371285 -4.969895 5.371279
    , Vector.vector -5.316131 -1.769895 5.316124
    , Vector.vector -5.260977 1.430105 5.260971
    , Vector.vector -5.205822 4.630105 5.205817
    , Vector.vector -5.150668 7.830105 5.150662
    , Vector.vector -5.095513 11.030107 5.095508
    , Vector.vector -5.040359 14.230107 5.040354
    , Vector.vector -4.985205 17.430107 4.985199
    , Vector.vector -4.930051 20.630104 4.930045
    , Vector.vector -4.874897 23.830105 4.874891
    , Vector.vector -4.819742 27.030104 4.819736
    , Vector.vector -4.764588 30.230104 4.764582
    , Vector.vector -4.709434 33.430103 4.709428
    , Vector.vector -4.654280 36.630104 4.654274
    , Vector.vector -7.738547 -36.969894 3.205404
    , Vector.vector -7.666485 -33.769897 3.175555
    , Vector.vector -7.594422 -30.569897 3.145706
    , Vector.vector -7.522359 -27.369898 3.115857
    , Vector.vector -7.450297 -24.169899 3.086007
    , Vector.vector -7.378234 -20.969898 3.056158
    , Vector.vector -7.306171 -17.769897 3.026309
    , Vector.vector -7.234109 -14.569897 2.996459
    , Vector.vector -7.162046 -11.369896 2.966610
    , Vector.vector -7.089984 -8.169896 2.936761
    , Vector.vector -7.017921 -4.969895 2.906912
    , Vector.vector -6.945858 -1.769895 2.877063
    , Vector.vector -6.873796 1.430105 2.847213
    , Vector.vector -6.801733 4.630105 2.817364
    , Vector.vector -6.729671 7.830105 2.787515
    , Vector.vector -6.657608 11.030107 2.757666
    , Vector.vector -6.585546 14.230107 2.727816
    , Vector.vector -6.513483 17.430107 2.697967
    , Vector.vector -6.441421 20.630104 2.668118
    , Vector.vector -6.369358 23.830105 2.638268
    , Vector.vector -6.297295 27.030104 2.608419
    , Vector.vector -6.225233 30.230104 2.578570
    , Vector.vector -6.153170 33.430103 2.548721
    , Vector.vector -6.081107 36.630104 2.518871
    , Vector.vector -8.376142 -36.969894 -0.000008
    , Vector.vector -8.298141 -33.769897 -0.000007
    , Vector.vector -8.220141 -30.569897 -0.000007
    , Vector.vector -8.142141 -27.369898 -0.000007
    , Vector.vector -8.064142 -24.169899 -0.000007
    , Vector.vector -7.986142 -20.969898 -0.000007
    , Vector.vector -7.908142 -17.769897 -0.000007
    , Vector.vector -7.830142 -14.569897 -0.000007
    , Vector.vector -7.752142 -11.369896 -0.000007
    , Vector.vector -7.674143 -8.169896 -0.000007
    , Vector.vector -7.596143 -4.969895 -0.000007
    , Vector.vector -7.518143 -1.769895 -0.000007
    , Vector.vector -7.440143 1.430105 -0.000007
    , Vector.vector -7.362143 4.630105 -0.000007
    , Vector.vector -7.284142 7.830105 -0.000007
    , Vector.vector -7.206142 11.030107 -0.000007
    , Vector.vector -7.128142 14.230107 -0.000007
    , Vector.vector -7.050142 17.430107 -0.000007
    , Vector.vector -6.972142 20.630104 -0.000007
    , Vector.vector -6.894141 23.830105 -0.000007
    , Vector.vector -6.816142 27.030104 -0.000006
    , Vector.vector -6.738142 30.230104 -0.000006
    , Vector.vector -6.660141 33.430103 -0.000006
    , Vector.vector -6.582141 36.630104 -0.000006
    , Vector.vector -7.738542 -36.969894 -3.205419
    , Vector.vector -7.666479 -33.769897 -3.175569
    , Vector.vector -7.594416 -30.569897 -3.145720
    , Vector.vector -7.522354 -27.369898 -3.115870
    , Vector.vector -7.450291 -24.169899 -3.086021
    , Vector.vector -7.378228 -20.969898 -3.056171
    , Vector.vector -7.306166 -17.769897 -3.026322
    , Vector.vector -7.234103 -14.569897 -2.996473
    , Vector.vector -7.162041 -11.369896 -2.966623
    , Vector.vector -7.089978 -8.169896 -2.936774
    , Vector.vector -7.017915 -4.969895 -2.906924
    , Vector.vector -6.945853 -1.769895 -2.877075
    , Vector.vector -6.873790 1.430105 -2.847226
    , Vector.vector -6.801727 4.630105 -2.817376
    , Vector.vector -6.729665 7.830105 -2.787527
    , Vector.vector -6.657602 11.030107 -2.757678
    , Vector.vector -6.585540 14.230107 -2.727828
    , Vector.vector -6.513477 17.430107 -2.697978
    , Vector.vector -6.441414 20.630104 -2.668129
    , Vector.vector -6.369352 23.830105 -2.638280
    , Vector.vector -6.297289 27.030104 -2.608431
    , Vector.vector -6.225226 30.230104 -2.578582
    , Vector.vector -6.153164 33.430103 -2.548732
    , Vector.vector -6.081102 36.630104 -2.518883
    , Vector.vector -5.922819 -36.969894 -5.922832
    , Vector.vector -5.867664 -33.769897 -5.867678
    , Vector.vector -5.812510 -30.569897 -5.812523
    , Vector.vector -5.757356 -27.369898 -5.757369
    , Vector.vector -5.702202 -24.169899 -5.702214
    , Vector.vector -5.647047 -20.969898 -5.647059
    , Vector.vector -5.591893 -17.769897 -5.591905
    , Vector.vector -5.536739 -14.569897 -5.536751
    , Vector.vector -5.481585 -11.369896 -5.481596
    , Vector.vector -5.426430 -8.169896 -5.426442
    , Vector.vector -5.371276 -4.969895 -5.371287
    , Vector.vector -5.316122 -1.769895 -5.316133
    , Vector.vector -5.260968 1.430105 -5.260980
    , Vector.vector -5.205813 4.630105 -5.205825
    , Vector.vector -5.150659 7.830105 -5.150671
    , Vector.vector -5.095505 11.030107 -5.095516
    , Vector.vector -5.040350 14.230107 -5.040362
    , Vector.vector -4.985196 17.430107 -4.985208
    , Vector.vector -4.930042 20.630104 -4.930054
    , Vector.vector -4.874888 23.830105 -4.874900
    , Vector.vector -4.819734 27.030104 -4.819746
    , Vector.vector -4.764579 30.230104 -4.764591
    , Vector.vector -4.709425 33.430103 -4.709437
    , Vector.vector -4.654271 36.630104 -4.654283
    , Vector.vector -3.205399 -36.969894 -7.738549
    , Vector.vector -3.175550 -33.769897 -7.666487
    , Vector.vector -3.145701 -30.569897 -7.594424
    , Vector.vector -3.115852 -27.369898 -7.522361
    , Vector.vector -3.086003 -24.169899 -7.450299
    , Vector.vector -3.056154 -20.969898 -7.378236
    , Vector.vector -3.026304 -17.769897 -7.306173
    , Vector.vector -2.996455 -14.569897 -7.234111
    , Vector.vector -2.966606 -11.369896 -7.162048
    , Vector.vector -2.936757 -8.169896 -7.089986
    , Vector.vector -2.906908 -4.969895 -7.017923
    , Vector.vector -2.877059 -1.769895 -6.945860
    , Vector.vector -2.847209 1.430105 -6.873798
    , Vector.vector -2.817360 4.630105 -6.801735
    , Vector.vector -2.787511 7.830105 -6.729672
    , Vector.vector -2.757662 11.030107 -6.657610
    , Vector.vector -2.727813 14.230107 -6.585547
    , Vector.vector -2.697963 17.430107 -6.513485
    , Vector.vector -2.668114 20.630104 -6.441422
    , Vector.vector -2.638265 23.830105 -6.369359
    , Vector.vector -2.608416 27.030104 -6.297297
    , Vector.vector -2.578566 30.230104 -6.225234
    , Vector.vector -2.548717 33.430103 -6.153172
    , Vector.vector -2.518867 36.630104 -6.081109
    , Vector.vector 3.205410 -36.969894 -7.738544
    , Vector.vector 3.175561 -33.769897 -7.666482
    , Vector.vector 3.145711 -30.569897 -7.594419
    , Vector.vector 3.115862 -27.369898 -7.522357
    , Vector.vector 3.086013 -24.169899 -7.450294
    , Vector.vector 3.056163 -20.969898 -7.378231
    , Vector.vector 3.026314 -17.769897 -7.306169
    , Vector.vector 2.996465 -14.569897 -7.234106
    , Vector.vector 2.966616 -11.369896 -7.162044
    , Vector.vector 2.936766 -8.169896 -7.089981
    , Vector.vector 2.906917 -4.969895 -7.017918
    , Vector.vector 2.877068 -1.769895 -6.945856
    , Vector.vector 2.847219 1.430105 -6.873793
    , Vector.vector 2.817369 4.630105 -6.801730
    , Vector.vector 2.787520 7.830105 -6.729668
    , Vector.vector 2.757671 11.030107 -6.657605
    , Vector.vector 2.727821 14.230107 -6.585543
    , Vector.vector 2.697972 17.430107 -6.513480
    , Vector.vector 2.668123 20.630104 -6.441417
    , Vector.vector 2.638273 23.830105 -6.369355
    , Vector.vector 2.608424 27.030104 -6.297292
    , Vector.vector 2.578575 30.230104 -6.225230
    , Vector.vector 2.548726 33.430103 -6.153168
    , Vector.vector 2.518877 36.630104 -6.081105
    , Vector.vector 7.738545 -36.969894 3.205409
    , Vector.vector 7.666482 -33.769897 3.175560
    , Vector.vector 7.594419 -30.569897 3.145710
    , Vector.vector 7.522357 -27.369898 3.115861
    , Vector.vector 7.450294 -24.169899 3.086012
    , Vector.vector 7.378232 -20.969898 3.056162
    , Vector.vector 7.306170 -17.769897 3.026313
    , Vector.vector 7.234107 -14.569897 2.996464
    , Vector.vector 7.162044 -11.369896 2.966614
    , Vector.vector 7.089982 -8.169896 2.936765
    , Vector.vector 7.017919 -4.969895 2.906916
    , Vector.vector 6.945856 -1.769895 2.877066
    , Vector.vector 6.873794 1.430105 2.847217
    , Vector.vector 6.801731 4.630105 2.817368
    , Vector.vector 6.729669 7.830105 2.787519
    , Vector.vector 6.657606 11.030107 2.757669
    , Vector.vector 6.585543 14.230107 2.727820
    , Vector.vector 6.513481 17.430107 2.697971
    , Vector.vector 6.441418 20.630104 2.668121
    , Vector.vector 6.369355 23.830105 2.638272
    , Vector.vector 6.297293 27.030104 2.608423
    , Vector.vector 6.225230 30.230104 2.578574
    , Vector.vector 6.153168 33.430103 2.548724
    , Vector.vector 6.081105 36.630104 2.518875
    , Vector.vector 8.215195 -36.969894 1.634104
    , Vector.vector 8.138694 -33.769897 1.618886
    , Vector.vector 8.062192 -30.569897 1.603669
    , Vector.vector 7.985691 -27.369898 1.588452
    , Vector.vector 7.909189 -24.169899 1.573235
    , Vector.vector 7.832688 -20.969898 1.558018
    , Vector.vector 7.756186 -17.769897 1.542801
    , Vector.vector 7.679686 -14.569897 1.527584
    , Vector.vector 7.603184 -11.369896 1.512367
    , Vector.vector 7.526683 -8.169896 1.497150
    , Vector.vector 7.450181 -4.969895 1.481933
    , Vector.vector 7.373680 -1.769895 1.466716
    , Vector.vector 7.297178 1.430105 1.451499
    , Vector.vector 7.220677 4.630105 1.436282
    , Vector.vector 7.144176 7.830105 1.421065
    , Vector.vector 7.067676 11.030107 1.405848
    , Vector.vector 6.991174 14.230107 1.390630
    , Vector.vector 6.914673 17.430107 1.375413
    , Vector.vector 6.838172 20.630104 1.360196
    , Vector.vector 6.761671 23.830105 1.344979
    , Vector.vector 6.685170 27.030104 1.329762
    , Vector.vector 6.608668 30.230104 1.314545
    , Vector.vector 6.532168 33.430103 1.299328
    , Vector.vector 6.455667 36.630104 1.284111
    , Vector.vector 7.738545 -36.969894 -3.205410
    , Vector.vector 7.666482 -33.769897 -3.175560
    , Vector.vector 7.594419 -30.569897 -3.145711
    , Vector.vector 7.522357 -27.369898 -3.115861
    , Vector.vector 7.450294 -24.169899 -3.086012
    , Vector.vector 7.378232 -20.969898 -3.056163
    , Vector.vector 7.306170 -17.769897 -3.026314
    , Vector.vector 7.234107 -14.569897 -2.996464
    , Vector.vector 7.162044 -11.369896 -2.966615
    , Vector.vector 7.089982 -8.169896 -2.936766
    , Vector.vector 7.017919 -4.969895 -2.906917
    , Vector.vector 6.945856 -1.769895 -2.877067
    , Vector.vector 6.873794 1.430105 -2.847218
    , Vector.vector 6.801731 4.630105 -2.817369
    , Vector.vector 6.729669 7.830105 -2.787520
    , Vector.vector 6.657606 11.030107 -2.757670
    , Vector.vector 6.585543 14.230107 -2.727821
    , Vector.vector 6.513481 17.430107 -2.697972
    , Vector.vector 6.441418 20.630104 -2.668123
    , Vector.vector 6.369355 23.830105 -2.638273
    , Vector.vector 6.297293 27.030104 -2.608424
    , Vector.vector 6.225230 30.230104 -2.578575
    , Vector.vector 6.153168 33.430103 -2.548726
    , Vector.vector 6.081105 36.630104 -2.518876
    , Vector.vector 6.964507 -36.969894 -4.653533
    , Vector.vector 6.899652 -33.769897 -4.610199
    , Vector.vector 6.834798 -30.569897 -4.566864
    , Vector.vector 6.769943 -27.369898 -4.523530
    , Vector.vector 6.705089 -24.169899 -4.480196
    , Vector.vector 6.640234 -20.969898 -4.436862
    , Vector.vector 6.575379 -17.769897 -4.393527
    , Vector.vector 6.510525 -14.569897 -4.350193
    , Vector.vector 6.445670 -11.369896 -4.306859
    , Vector.vector 6.380816 -8.169896 -4.263524
    , Vector.vector 6.315961 -4.969895 -4.220190
    , Vector.vector 6.251106 -1.769895 -4.176856
    , Vector.vector 6.186252 1.430105 -4.133521
    , Vector.vector 6.121397 4.630105 -4.090186
    , Vector.vector 6.056542 7.830105 -4.046852
    , Vector.vector 5.991688 11.030107 -4.003518
    , Vector.vector 5.926833 14.230107 -3.960183
    , Vector.vector 5.861979 17.430107 -3.916848
    , Vector.vector 5.797124 20.630104 -3.873514
    , Vector.vector 5.732269 23.830105 -3.830180
    , Vector.vector 5.667415 27.030104 -3.786845
    , Vector.vector 5.602560 30.230104 -3.743510
    , Vector.vector 5.537705 33.430103 -3.700176
    , Vector.vector 5.472851 36.630104 -3.656842
    , Vector.vector -9.999999 -48.436195 9.999998
    , Vector.vector -9.999999 -46.774666 9.999998
    , Vector.vector -9.999999 -45.113136 9.999998
    , Vector.vector -9.999999 -43.451599 9.999998
    , Vector.vector -9.999999 -41.790066 9.999998
    , Vector.vector -9.999999 -40.128536 6.666665
    , Vector.vector -9.999999 -40.128536 3.333332
    , Vector.vector -9.999999 -40.128536 -0.000002
    , Vector.vector -9.999999 -40.128536 -3.333335
    , Vector.vector -9.999999 -40.128536 -6.666669
    , Vector.vector -9.999999 -41.790066 -10.000002
    , Vector.vector -9.999999 -43.451595 -10.000002
    , Vector.vector -9.999999 -45.113125 -10.000002
    , Vector.vector -9.999999 -46.774658 -10.000002
    , Vector.vector -9.999999 -48.436195 -10.000002
    , Vector.vector -9.999999 -50.097725 -6.666669
    , Vector.vector -9.999999 -50.097725 -3.333335
    , Vector.vector -9.999999 -50.097725 -0.000002
    , Vector.vector -9.999999 -50.097725 3.333332
    , Vector.vector -9.999999 -50.097725 6.666665
    , Vector.vector -6.666666 -40.128536 -10.000002
    , Vector.vector -3.333333 -40.128536 -10.000002
    , Vector.vector 0.000000 -40.128536 -10.000002
    , Vector.vector 3.333334 -40.128536 -10.000002
    , Vector.vector 6.666667 -40.128536 -10.000002
    , Vector.vector 10.000000 -41.790066 -10.000002
    , Vector.vector 10.000000 -43.451595 -10.000002
    , Vector.vector 10.000000 -45.113125 -10.000002
    , Vector.vector 10.000000 -46.774658 -10.000002
    , Vector.vector 10.000000 -48.436195 -10.000002
    , Vector.vector 6.666666 -50.097725 -10.000002
    , Vector.vector 3.333333 -50.097725 -10.000002
    , Vector.vector 0.000000 -50.097725 -10.000002
    , Vector.vector -3.333333 -50.097725 -10.000002
    , Vector.vector -6.666666 -50.097725 -10.000002
    , Vector.vector 10.000000 -40.128536 -6.666669
    , Vector.vector 10.000000 -40.128536 -3.333335
    , Vector.vector 10.000000 -40.128536 -0.000002
    , Vector.vector 10.000000 -40.128536 3.333332
    , Vector.vector 10.000000 -40.128536 6.666665
    , Vector.vector 10.000000 -41.790066 9.999998
    , Vector.vector 10.000000 -43.451595 9.999998
    , Vector.vector 10.000000 -45.113125 9.999998
    , Vector.vector 10.000000 -46.774658 9.999998
    , Vector.vector 10.000000 -48.436195 9.999998
    , Vector.vector 10.000000 -50.097725 6.666665
    , Vector.vector 10.000000 -50.097725 3.333332
    , Vector.vector 10.000000 -50.097725 -0.000002
    , Vector.vector 10.000000 -50.097725 -3.333335
    , Vector.vector 10.000000 -50.097725 -6.666669
    , Vector.vector 6.666666 -40.128536 9.999998
    , Vector.vector 3.333333 -40.128536 9.999998
    , Vector.vector 0.000000 -40.128536 9.999998
    , Vector.vector -3.333333 -40.128536 9.999998
    , Vector.vector -6.666666 -40.128536 9.999998
    , Vector.vector -6.666666 -50.097725 9.999998
    , Vector.vector -3.333333 -50.097725 9.999998
    , Vector.vector 0.000000 -50.097725 9.999998
    , Vector.vector 3.333334 -50.097725 9.999998
    , Vector.vector 6.666667 -50.097725 9.999998
    , Vector.vector -9.999999 -41.790066 6.666665
    , Vector.vector -9.999999 -43.451595 6.666665
    , Vector.vector -9.999999 -45.113125 6.666665
    , Vector.vector -9.999999 -46.774658 6.666665
    , Vector.vector -9.999999 -48.436195 6.666665
    , Vector.vector -9.999999 -41.790066 3.333332
    , Vector.vector -9.999999 -43.451595 3.333332
    , Vector.vector -9.999999 -45.113125 3.333332
    , Vector.vector -9.999999 -46.774658 3.333332
    , Vector.vector -9.999999 -48.436195 3.333332
    , Vector.vector -9.999999 -41.790066 -0.000002
    , Vector.vector -9.999999 -43.451595 -0.000002
    , Vector.vector -9.999999 -45.113125 -0.000002
    , Vector.vector -9.999999 -46.774658 -0.000002
    , Vector.vector -9.999999 -48.436195 -0.000002
    , Vector.vector -9.999999 -41.790066 -3.333335
    , Vector.vector -9.999999 -43.451595 -3.333335
    , Vector.vector -9.999999 -45.113125 -3.333335
    , Vector.vector -9.999999 -46.774658 -3.333335
    , Vector.vector -9.999999 -48.436195 -3.333335
    , Vector.vector -9.999999 -41.790066 -6.666669
    , Vector.vector -9.999999 -43.451595 -6.666669
    , Vector.vector -9.999999 -45.113125 -6.666669
    , Vector.vector -9.999999 -46.774658 -6.666669
    , Vector.vector -9.999999 -48.436195 -6.666669
    , Vector.vector -6.666666 -41.790066 -10.000002
    , Vector.vector -6.666666 -43.451595 -10.000002
    , Vector.vector -6.666666 -45.113125 -10.000002
    , Vector.vector -6.666666 -46.774658 -10.000002
    , Vector.vector -6.666666 -48.436195 -10.000002
    , Vector.vector -3.333333 -41.790066 -10.000002
    , Vector.vector -3.333333 -43.451595 -10.000002
    , Vector.vector -3.333333 -45.113125 -10.000002
    , Vector.vector -3.333333 -46.774658 -10.000002
    , Vector.vector -3.333333 -48.436195 -10.000002
    , Vector.vector 0.000000 -41.790066 -10.000002
    , Vector.vector 0.000000 -43.451595 -10.000002
    , Vector.vector 0.000000 -45.113125 -10.000002
    , Vector.vector 0.000000 -46.774658 -10.000002
    , Vector.vector 0.000000 -48.436195 -10.000002
    , Vector.vector 3.333334 -41.790066 -10.000002
    , Vector.vector 3.333334 -43.451595 -10.000002
    , Vector.vector 3.333334 -45.113125 -10.000002
    , Vector.vector 3.333333 -46.774658 -10.000002
    , Vector.vector 3.333333 -48.436195 -10.000002
    , Vector.vector 6.666667 -41.790066 -10.000002
    , Vector.vector 6.666667 -43.451595 -10.000002
    , Vector.vector 6.666667 -45.113125 -10.000002
    , Vector.vector 6.666667 -46.774658 -10.000002
    , Vector.vector 6.666666 -48.436195 -10.000002
    , Vector.vector 10.000000 -41.790066 -6.666669
    , Vector.vector 10.000000 -43.451595 -6.666669
    , Vector.vector 10.000000 -45.113125 -6.666669
    , Vector.vector 10.000000 -46.774658 -6.666669
    , Vector.vector 10.000000 -48.436195 -6.666669
    , Vector.vector 10.000000 -41.790066 -3.333335
    , Vector.vector 10.000000 -43.451595 -3.333335
    , Vector.vector 10.000000 -45.113125 -3.333335
    , Vector.vector 10.000000 -46.774658 -3.333335
    , Vector.vector 10.000000 -48.436195 -3.333335
    , Vector.vector 10.000000 -41.790066 -0.000002
    , Vector.vector 10.000000 -43.451595 -0.000002
    , Vector.vector 10.000000 -45.113125 -0.000002
    , Vector.vector 10.000000 -46.774658 -0.000002
    , Vector.vector 10.000000 -48.436195 -0.000002
    , Vector.vector 10.000000 -41.790066 3.333332
    , Vector.vector 10.000000 -43.451595 3.333332
    , Vector.vector 10.000000 -45.113125 3.333332
    , Vector.vector 10.000000 -46.774658 3.333332
    , Vector.vector 10.000000 -48.436195 3.333332
    , Vector.vector 10.000000 -41.790066 6.666665
    , Vector.vector 10.000000 -43.451595 6.666665
    , Vector.vector 10.000000 -45.113125 6.666665
    , Vector.vector 10.000000 -46.774658 6.666665
    , Vector.vector 10.000000 -48.436195 6.666665
    , Vector.vector 6.666666 -41.790066 9.999998
    , Vector.vector 6.666666 -43.451595 9.999998
    , Vector.vector 6.666666 -45.113125 9.999998
    , Vector.vector 6.666666 -46.774658 9.999998
    , Vector.vector 6.666666 -48.436195 9.999998
    , Vector.vector 3.333333 -41.790066 9.999998
    , Vector.vector 3.333333 -43.451595 9.999998
    , Vector.vector 3.333333 -45.113125 9.999998
    , Vector.vector 3.333333 -46.774658 9.999998
    , Vector.vector 3.333334 -48.436195 9.999998
    , Vector.vector 0.000000 -41.790066 9.999998
    , Vector.vector 0.000000 -43.451595 9.999998
    , Vector.vector 0.000000 -45.113125 9.999998
    , Vector.vector 0.000000 -46.774658 9.999998
    , Vector.vector 0.000000 -48.436195 9.999998
    , Vector.vector -3.333333 -41.790066 9.999998
    , Vector.vector -3.333333 -43.451595 9.999998
    , Vector.vector -3.333333 -45.113125 9.999998
    , Vector.vector -3.333333 -46.774658 9.999998
    , Vector.vector -3.333333 -48.436195 9.999998
    , Vector.vector -6.666666 -41.790066 9.999998
    , Vector.vector -6.666666 -43.451595 9.999998
    , Vector.vector -6.666666 -45.113125 9.999998
    , Vector.vector -6.666666 -46.774658 9.999998
    , Vector.vector -6.666666 -48.436195 9.999998
    , Vector.vector -6.666666 -50.097725 6.666665
    , Vector.vector -3.333333 -50.097725 6.666665
    , Vector.vector 0.000000 -50.097725 6.666665
    , Vector.vector 3.333334 -50.097725 6.666665
    , Vector.vector 6.666667 -50.097725 6.666665
    , Vector.vector -6.666666 -50.097725 3.333332
    , Vector.vector -3.333333 -50.097725 3.333332
    , Vector.vector 0.000000 -50.097725 3.333332
    , Vector.vector 3.333334 -50.097725 3.333332
    , Vector.vector 6.666667 -50.097725 3.333332
    , Vector.vector -6.666666 -50.097725 -0.000002
    , Vector.vector -3.333333 -50.097725 -0.000002
    , Vector.vector 0.000000 -50.097725 -0.000002
    , Vector.vector 3.333334 -50.097725 -0.000002
    , Vector.vector 6.666667 -50.097725 -0.000002
    , Vector.vector -6.666666 -50.097725 -3.333335
    , Vector.vector -3.333333 -50.097725 -3.333335
    , Vector.vector 0.000000 -50.097725 -3.333335
    , Vector.vector 3.333334 -50.097725 -3.333335
    , Vector.vector 6.666667 -50.097725 -3.333335
    , Vector.vector -6.666666 -50.097725 -6.666669
    , Vector.vector -3.333333 -50.097725 -6.666669
    , Vector.vector 0.000000 -50.097725 -6.666669
    , Vector.vector 3.333334 -50.097725 -6.666669
    , Vector.vector 6.666667 -50.097725 -6.666669
    , Vector.vector 6.666666 -40.128536 6.666665
    , Vector.vector 3.333333 -40.128536 6.666665
    , Vector.vector 0.000000 -40.128536 6.666665
    , Vector.vector -3.333333 -40.128536 6.666665
    , Vector.vector -6.666666 -40.128536 6.666665
    , Vector.vector 6.666666 -40.128536 3.333332
    , Vector.vector 3.333333 -40.128536 3.333332
    , Vector.vector 0.000000 -40.128536 3.333332
    , Vector.vector -3.333333 -40.128536 3.333332
    , Vector.vector -6.666666 -40.128536 3.333332
    , Vector.vector 6.666666 -40.128536 -0.000002
    , Vector.vector 3.333333 -40.128536 -0.000002
    , Vector.vector 0.000000 -40.128536 -0.000002
    , Vector.vector -3.333333 -40.128536 -0.000002
    , Vector.vector -6.666666 -40.128536 -0.000002
    , Vector.vector 6.666666 -40.128536 -3.333335
    , Vector.vector 3.333333 -40.128536 -3.333335
    , Vector.vector 0.000000 -40.128536 -3.333335
    , Vector.vector -3.333333 -40.128536 -3.333335
    , Vector.vector -6.666666 -40.128536 -3.333335
    , Vector.vector 6.666666 -40.128536 -6.666669
    , Vector.vector 3.333333 -40.128536 -6.666669
    , Vector.vector 0.000000 -40.128536 -6.666669
    , Vector.vector -3.333333 -40.128536 -6.666669
    , Vector.vector -6.666666 -40.128536 -6.666669
    , Vector.vector -6.676624 52.537735 -9.890543
    , Vector.vector -3.343290 52.537735 -9.890544
    , Vector.vector -0.009957 52.537735 -9.890545
    , Vector.vector 3.323376 52.537735 -9.890546
    , Vector.vector 6.656710 52.537735 -9.890547
    , Vector.vector 9.990044 52.537735 6.776119
    , Vector.vector 9.990044 52.537735 3.442786
    , Vector.vector 9.990044 52.537735 0.109453
    , Vector.vector 9.990044 52.537735 -3.223881
    , Vector.vector 6.768284 50.586830 -9.890547
    , Vector.vector -6.676622 52.537727 10.109453
    , Vector.vector -3.343289 52.537727 10.109453
    , Vector.vector -0.009956 52.537727 10.109453
    , Vector.vector 3.323377 52.537731 10.109453
    , Vector.vector 6.656711 52.537735 10.109453
    , Vector.vector -10.009957 52.537735 -6.557210
    , Vector.vector -10.009957 52.537735 -3.223877
    , Vector.vector -10.009957 52.537735 0.109455
    , Vector.vector -10.009957 52.537731 3.442788
    , Vector.vector -10.009956 52.537727 6.776121
    , Vector.vector 6.656710 52.537735 -6.557213
    , Vector.vector 6.656710 52.537735 -3.223880
    , Vector.vector 6.656710 52.537735 0.109453
    , Vector.vector 6.656710 52.537735 3.442787
    , Vector.vector 6.656710 52.537735 6.776120
    , Vector.vector 3.323377 52.537735 -6.557212
    , Vector.vector 3.323377 52.537735 -3.223879
    , Vector.vector 3.323377 52.537735 0.109454
    , Vector.vector 3.323377 52.537735 3.442787
    , Vector.vector 3.323377 52.537735 6.776120
    , Vector.vector -0.009957 52.537735 -6.557211
    , Vector.vector -0.009957 52.537735 -3.223878
    , Vector.vector -0.009957 52.537735 0.109455
    , Vector.vector -0.009956 52.537731 3.442788
    , Vector.vector -0.009956 52.537727 6.776121
    , Vector.vector -3.343290 52.537735 -6.557211
    , Vector.vector -3.343290 52.537735 -3.223878
    , Vector.vector -3.343289 52.537735 0.109455
    , Vector.vector -3.343289 52.537731 3.442788
    , Vector.vector -3.343289 52.537727 6.776121
    , Vector.vector -6.676624 52.537735 -6.557211
    , Vector.vector -6.676624 52.537735 -3.223878
    , Vector.vector -6.676624 52.537735 0.109455
    , Vector.vector -6.676623 52.537731 3.442788
    , Vector.vector -6.676622 52.537727 6.776121
    , Vector.vector 9.990045 50.586830 0.169081
    , Vector.vector 9.990045 48.710907 0.155184
    , Vector.vector 9.990045 46.982040 0.142377
    , Vector.vector 9.990045 45.466671 0.131150
    , Vector.vector 9.990045 44.223042 0.121937
    , Vector.vector 9.990044 45.466671 -3.606444
    , Vector.vector 9.990044 48.710907 -3.440417
    , Vector.vector 3.427587 50.586830 -9.890546
    , Vector.vector 9.990045 43.298943 0.115092
    , Vector.vector 9.990044 44.223042 -3.670089
    , Vector.vector 9.990045 46.982040 -3.528893
    , Vector.vector 9.990044 50.586830 -3.344414
    , Vector.vector 9.990045 44.223042 3.890715
    , Vector.vector 9.990045 50.586830 3.576888
    , Vector.vector 9.990045 48.710907 3.669398
    , Vector.vector 9.990045 46.982040 3.754656
    , Vector.vector 9.990045 45.466671 3.829386
    , Vector.vector 9.990044 46.982037 -6.874952
    , Vector.vector 9.990043 48.710903 -6.776077
    , Vector.vector 9.990043 50.586834 -6.668795
    , Vector.vector 9.990044 52.537743 -6.557026
    , Vector.vector 9.990045 50.586834 6.887701
    , Vector.vector 9.990045 46.982037 7.093852
    , Vector.vector 9.990045 48.710903 6.994976
    , Vector.vector -0.009956 50.586834 10.109453
    , Vector.vector -3.447496 50.586830 10.109453
    , Vector.vector 6.768284 50.586834 10.109453
    , Vector.vector 3.427587 50.586834 10.109453
    , Vector.vector -6.788194 50.586830 10.109453
    , Vector.vector 6.875571 48.710899 10.109453
    , Vector.vector -0.009956 48.710899 10.109453
    , Vector.vector -3.547698 48.710899 10.109453
    , Vector.vector -6.895478 48.710899 10.109453
    , Vector.vector 3.527792 48.710903 10.109453
    , Vector.vector -0.009956 46.982040 10.109453
    , Vector.vector 6.974446 46.982040 10.109452
    , Vector.vector -3.640046 46.982033 10.109453
    , Vector.vector -6.994351 46.982033 10.109452
    , Vector.vector 3.620141 46.982040 10.109453
    , Vector.vector -0.009956 45.466667 10.109453
    , Vector.vector -3.720988 45.466671 10.109453
    , Vector.vector 3.701086 45.466671 10.109453
    , Vector.vector -0.009956 44.223042 10.109453
    , Vector.vector -3.787416 44.223042 10.109452
    , Vector.vector 3.767516 44.223042 10.109452
    , Vector.vector -0.009956 43.298946 10.109452
    , Vector.vector -9.316501 42.478676 0.109024
    , Vector.vector -10.009957 50.586830 -3.328087
    , Vector.vector -10.009956 50.586823 6.887695
    , Vector.vector -10.009957 50.586830 -6.668785
    , Vector.vector -10.009957 50.586830 0.109455
    , Vector.vector -10.009957 50.586830 3.546998
    , Vector.vector -10.009956 48.710899 -3.428292
    , Vector.vector -10.009956 48.710903 6.994982
    , Vector.vector -10.009956 48.710899 3.647202
    , Vector.vector -10.009957 48.710899 0.109455
    , Vector.vector -10.009957 48.710903 -6.776071
    , Vector.vector -10.009956 46.982033 -3.520642
    , Vector.vector -10.009955 46.982037 7.093858
    , Vector.vector -10.009956 46.982037 3.739552
    , Vector.vector -10.009956 46.982040 0.109455
    , Vector.vector -10.009956 46.982037 -6.874947
    , Vector.vector -10.009956 45.466671 -3.601586
    , Vector.vector -10.009956 45.466671 3.820497
    , Vector.vector -10.009956 45.466671 0.109455
    , Vector.vector -10.009955 44.223038 -3.668016
    , Vector.vector -10.009955 44.223038 3.886927
    , Vector.vector -10.009956 44.223038 0.109455
    , Vector.vector -10.009955 43.298943 0.109455
    , Vector.vector -0.009957 50.586830 -9.890545
    , Vector.vector -6.788196 50.586819 -9.890545
    , Vector.vector -3.447497 50.586823 -9.890545
    , Vector.vector -0.009957 48.710899 -9.890546
    , Vector.vector 3.527792 48.710903 -9.890547
    , Vector.vector 6.875570 48.710903 -9.890547
    , Vector.vector -3.547699 48.710899 -9.890546
    , Vector.vector -6.895479 48.710899 -9.890546
    , Vector.vector -0.009957 46.982033 -9.890546
    , Vector.vector 3.620142 46.982033 -9.890548
    , Vector.vector 6.974446 46.982037 -9.890548
    , Vector.vector -3.640047 46.982025 -9.890547
    , Vector.vector -6.994352 46.982033 -9.890547
    , Vector.vector -0.009957 45.466660 -9.890547
    , Vector.vector 3.701087 45.466667 -9.890548
    , Vector.vector -3.720989 45.466660 -9.890548
    , Vector.vector -0.009957 44.223038 -9.890548
    , Vector.vector 3.767517 44.223038 -9.890549
    , Vector.vector -3.787417 44.223030 -9.890548
    , Vector.vector -0.009957 43.298943 -9.890548
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
  , [ 477, 43, 37, 765]
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
  , [ 453, 60, 54, 1053]
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
  , [ 405, 77, 71, 741]
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
  , [ 717, 94, 88, 1029]
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
  , [ 693, 111, 105, 1005]
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
  , [ 669, 128, 122, 981]
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
  , [ 132, 137, 1451, 138, 133]
  , [ 645, 145, 139, 957]
  , [ 134, 140, 141, 135]
  , [ 135, 141, 142, 136]
  , [ 136, 142, 137, 132]
  , [ 137, 143, 144, 138, 1451]
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
  , [ 621, 162, 156, 933]
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
  , [ 597, 179, 173, 909]
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
  , [ 573, 196, 190, 885]
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
  , [ 549, 213, 207, 861]
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
  , [ 525, 230, 224, 837]
  , [ 219, 225, 226, 220]
  , [ 220, 226, 227, 221]
  , [ 221, 227, 222, 217]
  , [ 222, 228, 229, 223]
  , [ 224, 230, 231, 225]
  , [ 225, 231, 232, 226]
  , [ 226, 232, 233, 227]
  , [ 227, 233, 228, 222]
  , [ 228, 234, 235, 229]
  , [ 1077, 258, 247, 429]
  , [ 231, 236, 237, 232]
  , [ 232, 237, 238, 233]
  , [ 233, 238, 234, 228]
  , [ 234, 239, 240, 235]
  , [ 429, 247, 241, 813]
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
  , [ 501, 9, 3, 789]
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
  , [ 765, 37, 26, 1149]
  , [ 26, 32, 27]
  , [ 9, 20, 21, 15]
  , [ 789, 3, 264, 1101]
  , [ 264, 3, 4, 270]
  , [ 264, 270, 265]
  , [ 247, 253, 248]
  , [ 813, 241, 230, 525]
  , [ 230, 236, 231]
  , [ 837, 224, 213, 549]
  , [ 213, 219, 214]
  , [ 861, 207, 196, 573]
  , [ 196, 202, 197]
  , [ 885, 190, 179, 597]
  , [ 179, 185, 180]
  , [ 909, 173, 162, 621]
  , [ 162, 168, 163]
  , [ 933, 156, 145, 645]
  , [ 145, 151, 146]
  , [ 957, 139, 128, 669]
  , [ 128, 134, 129]
  , [ 981, 122, 111, 693]
  , [ 111, 117, 112]
  , [ 1005, 105, 94, 717]
  , [ 94, 100, 95]
  , [ 77, 83, 78]
  , [ 1029, 88, 77, 405]
  , [ 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304]
  , [ 1234, 1164, 306, 1165]
  , [ 1259, 1179, 307, 1180]
  , [ 1284, 1194, 308, 1195]
  , [ 1309, 1150, 305, 1205]
  , [ 1334, 1180, 307, 1199]
  , [ 1359, 1170, 310, 1159]
  , [ 1405, 1418, 1419, 1406]
  , [ 1435, 1429, 1430, 1436]
  , [ 1456, 1459, 1458, 1453]
  , [ 331, 329, 347, 379]
  , [ 379, 377, 333, 331]
  , [ 377, 375, 335, 333]
  , [ 375, 373, 337, 335]
  , [ 373, 371, 339, 337]
  , [ 371, 369, 341, 339]
  , [ 369, 367, 343, 341]
  , [ 362, 316, 318, 360]
  , [ 361, 359, 342, 344]
  , [ 344, 346, 363, 361]
  , [ 359, 357, 340, 342]
  , [ 357, 355, 338, 340]
  , [ 355, 353, 336, 338]
  , [ 353, 351, 334, 336]
  , [ 351, 349, 332, 334]
  , [ 349, 347, 330, 332]
  , [ 362, 364, 316]
  , [ 348, 329, 327, 380]
  , [ 380, 327, 325, 378]
  , [ 378, 325, 323, 376]
  , [ 376, 323, 321, 374]
  , [ 374, 321, 319, 372]
  , [ 372, 319, 317, 370]
  , [ 370, 317, 315, 368]
  , [ 345, 343, 367, 365]
  , [ 348, 350, 328, 330]
  , [ 350, 352, 326, 328]
  , [ 352, 354, 324, 326]
  , [ 354, 356, 322, 324]
  , [ 356, 358, 320, 322]
  , [ 358, 360, 318, 320]
  , [ 368, 366, 315]
  , [ 741, 71, 60, 453]
  , [ 9, 15, 10]
  , [ 1101, 264, 258, 1077]
  , [ 1125, 20, 9, 501]
  , [ 1053, 54, 43, 477]
  , [ 43, 49, 44]
  , [ 1149, 26, 20, 1125]
  , [ 329, 348, 330, 347]
  , [ 1404, 1379, 365, 1370]
  , [ 276, 454, 742, 277]
  , [ 454, 455, 743, 742]
  , [ 455, 456, 744, 743]
  , [ 456, 457, 745, 744]
  , [ 457, 458, 746, 745]
  , [ 458, 459, 747, 746]
  , [ 459, 460, 748, 747]
  , [ 460, 461, 749, 748]
  , [ 461, 462, 750, 749]
  , [ 462, 463, 751, 750]
  , [ 463, 464, 752, 751]
  , [ 464, 465, 753, 752]
  , [ 465, 466, 754, 753]
  , [ 466, 467, 755, 754]
  , [ 467, 468, 756, 755]
  , [ 468, 469, 757, 756]
  , [ 469, 470, 758, 757]
  , [ 470, 471, 759, 758]
  , [ 471, 472, 760, 759]
  , [ 472, 473, 761, 760]
  , [ 473, 474, 762, 761]
  , [ 474, 475, 763, 762]
  , [ 475, 476, 764, 763]
  , [ 476, 477, 765, 764]
  , [ 274, 430, 1030, 275]
  , [ 430, 431, 1031, 1030]
  , [ 431, 432, 1032, 1031]
  , [ 432, 433, 1033, 1032]
  , [ 433, 434, 1034, 1033]
  , [ 434, 435, 1035, 1034]
  , [ 435, 436, 1036, 1035]
  , [ 436, 437, 1037, 1036]
  , [ 437, 438, 1038, 1037]
  , [ 438, 439, 1039, 1038]
  , [ 439, 440, 1040, 1039]
  , [ 440, 441, 1041, 1040]
  , [ 441, 442, 1042, 1041]
  , [ 442, 443, 1043, 1042]
  , [ 443, 444, 1044, 1043]
  , [ 444, 445, 1045, 1044]
  , [ 445, 446, 1046, 1045]
  , [ 446, 447, 1047, 1046]
  , [ 447, 448, 1048, 1047]
  , [ 448, 449, 1049, 1048]
  , [ 449, 450, 1050, 1049]
  , [ 450, 451, 1051, 1050]
  , [ 451, 452, 1052, 1051]
  , [ 452, 453, 1053, 1052]
  , [ 304, 382, 718, 273]
  , [ 382, 383, 719, 718]
  , [ 383, 384, 720, 719]
  , [ 384, 385, 721, 720]
  , [ 385, 386, 722, 721]
  , [ 386, 387, 723, 722]
  , [ 387, 388, 724, 723]
  , [ 388, 389, 725, 724]
  , [ 389, 390, 726, 725]
  , [ 390, 391, 727, 726]
  , [ 391, 392, 728, 727]
  , [ 392, 393, 729, 728]
  , [ 393, 394, 730, 729]
  , [ 394, 395, 731, 730]
  , [ 395, 396, 732, 731]
  , [ 396, 397, 733, 732]
  , [ 397, 398, 734, 733]
  , [ 398, 399, 735, 734]
  , [ 399, 400, 736, 735]
  , [ 400, 401, 737, 736]
  , [ 401, 402, 738, 737]
  , [ 402, 403, 739, 738]
  , [ 403, 404, 740, 739]
  , [ 404, 405, 741, 740]
  , [ 302, 694, 1006, 303]
  , [ 694, 695, 1007, 1006]
  , [ 695, 696, 1008, 1007]
  , [ 696, 697, 1009, 1008]
  , [ 697, 698, 1010, 1009]
  , [ 698, 699, 1011, 1010]
  , [ 699, 700, 1012, 1011]
  , [ 700, 701, 1013, 1012]
  , [ 701, 702, 1014, 1013]
  , [ 702, 703, 1015, 1014]
  , [ 703, 704, 1016, 1015]
  , [ 704, 705, 1017, 1016]
  , [ 705, 706, 1018, 1017]
  , [ 706, 707, 1019, 1018]
  , [ 707, 708, 1020, 1019]
  , [ 708, 709, 1021, 1020]
  , [ 709, 710, 1022, 1021]
  , [ 710, 711, 1023, 1022]
  , [ 711, 712, 1024, 1023]
  , [ 712, 713, 1025, 1024]
  , [ 713, 714, 1026, 1025]
  , [ 714, 715, 1027, 1026]
  , [ 715, 716, 1028, 1027]
  , [ 716, 717, 1029, 1028]
  , [ 300, 670, 982, 301]
  , [ 670, 671, 983, 982]
  , [ 671, 672, 984, 983]
  , [ 672, 673, 985, 984]
  , [ 673, 674, 986, 985]
  , [ 674, 675, 987, 986]
  , [ 675, 676, 988, 987]
  , [ 676, 677, 989, 988]
  , [ 677, 678, 990, 989]
  , [ 678, 679, 991, 990]
  , [ 679, 680, 992, 991]
  , [ 680, 681, 993, 992]
  , [ 681, 682, 994, 993]
  , [ 682, 683, 995, 994]
  , [ 683, 684, 996, 995]
  , [ 684, 685, 997, 996]
  , [ 685, 686, 998, 997]
  , [ 686, 687, 999, 998]
  , [ 687, 688, 1000, 999]
  , [ 688, 689, 1001, 1000]
  , [ 689, 690, 1002, 1001]
  , [ 690, 691, 1003, 1002]
  , [ 691, 692, 1004, 1003]
  , [ 692, 693, 1005, 1004]
  , [ 298, 646, 958, 299]
  , [ 646, 647, 959, 958]
  , [ 647, 648, 960, 959]
  , [ 648, 649, 961, 960]
  , [ 649, 650, 962, 961]
  , [ 650, 651, 963, 962]
  , [ 651, 652, 964, 963]
  , [ 652, 653, 965, 964]
  , [ 653, 654, 966, 965]
  , [ 654, 655, 967, 966]
  , [ 655, 656, 968, 967]
  , [ 656, 657, 969, 968]
  , [ 657, 658, 970, 969]
  , [ 658, 659, 971, 970]
  , [ 659, 660, 972, 971]
  , [ 660, 661, 973, 972]
  , [ 661, 662, 974, 973]
  , [ 662, 663, 975, 974]
  , [ 663, 664, 976, 975]
  , [ 664, 665, 977, 976]
  , [ 665, 666, 978, 977]
  , [ 666, 667, 979, 978]
  , [ 667, 668, 980, 979]
  , [ 668, 669, 981, 980]
  , [ 296, 622, 934, 297]
  , [ 622, 623, 935, 934]
  , [ 623, 624, 936, 935]
  , [ 624, 625, 937, 936]
  , [ 625, 626, 938, 937]
  , [ 626, 627, 939, 938]
  , [ 627, 628, 940, 939]
  , [ 628, 629, 941, 940]
  , [ 629, 630, 942, 941]
  , [ 630, 631, 943, 942]
  , [ 631, 632, 944, 943]
  , [ 632, 633, 945, 944]
  , [ 633, 634, 946, 945]
  , [ 634, 635, 947, 946]
  , [ 635, 636, 948, 947]
  , [ 636, 637, 949, 948]
  , [ 637, 638, 950, 949]
  , [ 638, 639, 951, 950]
  , [ 639, 640, 952, 951]
  , [ 640, 641, 953, 952]
  , [ 641, 642, 954, 953]
  , [ 642, 643, 955, 954]
  , [ 643, 644, 956, 955]
  , [ 644, 645, 957, 956]
  , [ 294, 598, 910, 295]
  , [ 598, 599, 911, 910]
  , [ 599, 600, 912, 911]
  , [ 600, 601, 913, 912]
  , [ 601, 602, 914, 913]
  , [ 602, 603, 915, 914]
  , [ 603, 604, 916, 915]
  , [ 604, 605, 917, 916]
  , [ 605, 606, 918, 917]
  , [ 606, 607, 919, 918]
  , [ 607, 608, 920, 919]
  , [ 608, 609, 921, 920]
  , [ 609, 610, 922, 921]
  , [ 610, 611, 923, 922]
  , [ 611, 612, 924, 923]
  , [ 612, 613, 925, 924]
  , [ 613, 614, 926, 925]
  , [ 614, 615, 927, 926]
  , [ 615, 616, 928, 927]
  , [ 616, 617, 929, 928]
  , [ 617, 618, 930, 929]
  , [ 618, 619, 931, 930]
  , [ 619, 620, 932, 931]
  , [ 620, 621, 933, 932]
  , [ 292, 574, 886, 293]
  , [ 574, 575, 887, 886]
  , [ 575, 576, 888, 887]
  , [ 576, 577, 889, 888]
  , [ 577, 578, 890, 889]
  , [ 578, 579, 891, 890]
  , [ 579, 580, 892, 891]
  , [ 580, 581, 893, 892]
  , [ 581, 582, 894, 893]
  , [ 582, 583, 895, 894]
  , [ 583, 584, 896, 895]
  , [ 584, 585, 897, 896]
  , [ 585, 586, 898, 897]
  , [ 586, 587, 899, 898]
  , [ 587, 588, 900, 899]
  , [ 588, 589, 901, 900]
  , [ 589, 590, 902, 901]
  , [ 590, 591, 903, 902]
  , [ 591, 592, 904, 903]
  , [ 592, 593, 905, 904]
  , [ 593, 594, 906, 905]
  , [ 594, 595, 907, 906]
  , [ 595, 596, 908, 907]
  , [ 596, 597, 909, 908]
  , [ 290, 550, 862, 291]
  , [ 550, 551, 863, 862]
  , [ 551, 552, 864, 863]
  , [ 552, 553, 865, 864]
  , [ 553, 554, 866, 865]
  , [ 554, 555, 867, 866]
  , [ 555, 556, 868, 867]
  , [ 556, 557, 869, 868]
  , [ 557, 558, 870, 869]
  , [ 558, 559, 871, 870]
  , [ 559, 560, 872, 871]
  , [ 560, 561, 873, 872]
  , [ 561, 562, 874, 873]
  , [ 562, 563, 875, 874]
  , [ 563, 564, 876, 875]
  , [ 564, 565, 877, 876]
  , [ 565, 566, 878, 877]
  , [ 566, 567, 879, 878]
  , [ 567, 568, 880, 879]
  , [ 568, 569, 881, 880]
  , [ 569, 570, 882, 881]
  , [ 570, 571, 883, 882]
  , [ 571, 572, 884, 883]
  , [ 572, 573, 885, 884]
  , [ 288, 526, 838, 289]
  , [ 526, 527, 839, 838]
  , [ 527, 528, 840, 839]
  , [ 528, 529, 841, 840]
  , [ 529, 530, 842, 841]
  , [ 530, 531, 843, 842]
  , [ 531, 532, 844, 843]
  , [ 532, 533, 845, 844]
  , [ 533, 534, 846, 845]
  , [ 534, 535, 847, 846]
  , [ 535, 536, 848, 847]
  , [ 536, 537, 849, 848]
  , [ 537, 538, 850, 849]
  , [ 538, 539, 851, 850]
  , [ 539, 540, 852, 851]
  , [ 540, 541, 853, 852]
  , [ 541, 542, 854, 853]
  , [ 542, 543, 855, 854]
  , [ 543, 544, 856, 855]
  , [ 544, 545, 857, 856]
  , [ 545, 546, 858, 857]
  , [ 546, 547, 859, 858]
  , [ 547, 548, 860, 859]
  , [ 548, 549, 861, 860]
  , [ 286, 502, 814, 287]
  , [ 502, 503, 815, 814]
  , [ 503, 504, 816, 815]
  , [ 504, 505, 817, 816]
  , [ 505, 506, 818, 817]
  , [ 506, 507, 819, 818]
  , [ 507, 508, 820, 819]
  , [ 508, 509, 821, 820]
  , [ 509, 510, 822, 821]
  , [ 510, 511, 823, 822]
  , [ 511, 512, 824, 823]
  , [ 512, 513, 825, 824]
  , [ 513, 514, 826, 825]
  , [ 514, 515, 827, 826]
  , [ 515, 516, 828, 827]
  , [ 516, 517, 829, 828]
  , [ 517, 518, 830, 829]
  , [ 518, 519, 831, 830]
  , [ 519, 520, 832, 831]
  , [ 520, 521, 833, 832]
  , [ 521, 522, 834, 833]
  , [ 522, 523, 835, 834]
  , [ 523, 524, 836, 835]
  , [ 524, 525, 837, 836]
  , [ 283, 1054, 406, 284]
  , [ 1054, 1055, 407, 406]
  , [ 1055, 1056, 408, 407]
  , [ 1056, 1057, 409, 408]
  , [ 1057, 1058, 410, 409]
  , [ 1058, 1059, 411, 410]
  , [ 1059, 1060, 412, 411]
  , [ 1060, 1061, 413, 412]
  , [ 1061, 1062, 414, 413]
  , [ 1062, 1063, 415, 414]
  , [ 1063, 1064, 416, 415]
  , [ 1064, 1065, 417, 416]
  , [ 1065, 1066, 418, 417]
  , [ 1066, 1067, 419, 418]
  , [ 1067, 1068, 420, 419]
  , [ 1068, 1069, 421, 420]
  , [ 1069, 1070, 422, 421]
  , [ 1070, 1071, 423, 422]
  , [ 1071, 1072, 424, 423]
  , [ 1072, 1073, 425, 424]
  , [ 1073, 1074, 426, 425]
  , [ 1074, 1075, 427, 426]
  , [ 1075, 1076, 428, 427]
  , [ 1076, 1077, 429, 428]
  , [ 284, 406, 790, 285]
  , [ 406, 407, 791, 790]
  , [ 407, 408, 792, 791]
  , [ 408, 409, 793, 792]
  , [ 409, 410, 794, 793]
  , [ 410, 411, 795, 794]
  , [ 411, 412, 796, 795]
  , [ 412, 413, 797, 796]
  , [ 413, 414, 798, 797]
  , [ 414, 415, 799, 798]
  , [ 415, 416, 800, 799]
  , [ 416, 417, 801, 800]
  , [ 417, 418, 802, 801]
  , [ 418, 419, 803, 802]
  , [ 419, 420, 804, 803]
  , [ 420, 421, 805, 804]
  , [ 421, 422, 806, 805]
  , [ 422, 423, 807, 806]
  , [ 423, 424, 808, 807]
  , [ 424, 425, 809, 808]
  , [ 425, 426, 810, 809]
  , [ 426, 427, 811, 810]
  , [ 427, 428, 812, 811]
  , [ 428, 429, 813, 812]
  , [ 280, 478, 766, 281]
  , [ 478, 479, 767, 766]
  , [ 479, 480, 768, 767]
  , [ 480, 481, 769, 768]
  , [ 481, 482, 770, 769]
  , [ 482, 483, 771, 770]
  , [ 483, 484, 772, 771]
  , [ 484, 485, 773, 772]
  , [ 485, 486, 774, 773]
  , [ 486, 487, 775, 774]
  , [ 487, 488, 776, 775]
  , [ 488, 489, 777, 776]
  , [ 489, 490, 778, 777]
  , [ 490, 491, 779, 778]
  , [ 491, 492, 780, 779]
  , [ 492, 493, 781, 780]
  , [ 493, 494, 782, 781]
  , [ 494, 495, 783, 782]
  , [ 495, 496, 784, 783]
  , [ 496, 497, 785, 784]
  , [ 497, 498, 786, 785]
  , [ 498, 499, 787, 786]
  , [ 499, 500, 788, 787]
  , [ 500, 501, 789, 788]
  , [ 277, 742, 1126, 278]
  , [ 742, 743, 1127, 1126]
  , [ 743, 744, 1128, 1127]
  , [ 744, 745, 1129, 1128]
  , [ 745, 746, 1130, 1129]
  , [ 746, 747, 1131, 1130]
  , [ 747, 748, 1132, 1131]
  , [ 748, 749, 1133, 1132]
  , [ 749, 750, 1134, 1133]
  , [ 750, 751, 1135, 1134]
  , [ 751, 752, 1136, 1135]
  , [ 752, 753, 1137, 1136]
  , [ 753, 754, 1138, 1137]
  , [ 754, 755, 1139, 1138]
  , [ 755, 756, 1140, 1139]
  , [ 756, 757, 1141, 1140]
  , [ 757, 758, 1142, 1141]
  , [ 758, 759, 1143, 1142]
  , [ 759, 760, 1144, 1143]
  , [ 760, 761, 1145, 1144]
  , [ 761, 762, 1146, 1145]
  , [ 762, 763, 1147, 1146]
  , [ 763, 764, 1148, 1147]
  , [ 764, 765, 1149, 1148]
  , [ 281, 766, 1078, 282]
  , [ 766, 767, 1079, 1078]
  , [ 767, 768, 1080, 1079]
  , [ 768, 769, 1081, 1080]
  , [ 769, 770, 1082, 1081]
  , [ 770, 771, 1083, 1082]
  , [ 771, 772, 1084, 1083]
  , [ 772, 773, 1085, 1084]
  , [ 773, 774, 1086, 1085]
  , [ 774, 775, 1087, 1086]
  , [ 775, 776, 1088, 1087]
  , [ 776, 777, 1089, 1088]
  , [ 777, 778, 1090, 1089]
  , [ 778, 779, 1091, 1090]
  , [ 779, 780, 1092, 1091]
  , [ 780, 781, 1093, 1092]
  , [ 781, 782, 1094, 1093]
  , [ 782, 783, 1095, 1094]
  , [ 783, 784, 1096, 1095]
  , [ 784, 785, 1097, 1096]
  , [ 785, 786, 1098, 1097]
  , [ 786, 787, 1099, 1098]
  , [ 787, 788, 1100, 1099]
  , [ 788, 789, 1101, 1100]
  , [ 285, 790, 502, 286]
  , [ 790, 791, 503, 502]
  , [ 791, 792, 504, 503]
  , [ 792, 793, 505, 504]
  , [ 793, 794, 506, 505]
  , [ 794, 795, 507, 506]
  , [ 795, 796, 508, 507]
  , [ 796, 797, 509, 508]
  , [ 797, 798, 510, 509]
  , [ 798, 799, 511, 510]
  , [ 799, 800, 512, 511]
  , [ 800, 801, 513, 512]
  , [ 801, 802, 514, 513]
  , [ 802, 803, 515, 514]
  , [ 803, 804, 516, 515]
  , [ 804, 805, 517, 516]
  , [ 805, 806, 518, 517]
  , [ 806, 807, 519, 518]
  , [ 807, 808, 520, 519]
  , [ 808, 809, 521, 520]
  , [ 809, 810, 522, 521]
  , [ 810, 811, 523, 522]
  , [ 811, 812, 524, 523]
  , [ 812, 813, 525, 524]
  , [ 287, 814, 526, 288]
  , [ 814, 815, 527, 526]
  , [ 815, 816, 528, 527]
  , [ 816, 817, 529, 528]
  , [ 817, 818, 530, 529]
  , [ 818, 819, 531, 530]
  , [ 819, 820, 532, 531]
  , [ 820, 821, 533, 532]
  , [ 821, 822, 534, 533]
  , [ 822, 823, 535, 534]
  , [ 823, 824, 536, 535]
  , [ 824, 825, 537, 536]
  , [ 825, 826, 538, 537]
  , [ 826, 827, 539, 538]
  , [ 827, 828, 540, 539]
  , [ 828, 829, 541, 540]
  , [ 829, 830, 542, 541]
  , [ 830, 831, 543, 542]
  , [ 831, 832, 544, 543]
  , [ 832, 833, 545, 544]
  , [ 833, 834, 546, 545]
  , [ 834, 835, 547, 546]
  , [ 835, 836, 548, 547]
  , [ 836, 837, 549, 548]
  , [ 289, 838, 550, 290]
  , [ 838, 839, 551, 550]
  , [ 839, 840, 552, 551]
  , [ 840, 841, 553, 552]
  , [ 841, 842, 554, 553]
  , [ 842, 843, 555, 554]
  , [ 843, 844, 556, 555]
  , [ 844, 845, 557, 556]
  , [ 845, 846, 558, 557]
  , [ 846, 847, 559, 558]
  , [ 847, 848, 560, 559]
  , [ 848, 849, 561, 560]
  , [ 849, 850, 562, 561]
  , [ 850, 851, 563, 562]
  , [ 851, 852, 564, 563]
  , [ 852, 853, 565, 564]
  , [ 853, 854, 566, 565]
  , [ 854, 855, 567, 566]
  , [ 855, 856, 568, 567]
  , [ 856, 857, 569, 568]
  , [ 857, 858, 570, 569]
  , [ 858, 859, 571, 570]
  , [ 859, 860, 572, 571]
  , [ 860, 861, 573, 572]
  , [ 291, 862, 574, 292]
  , [ 862, 863, 575, 574]
  , [ 863, 864, 576, 575]
  , [ 864, 865, 577, 576]
  , [ 865, 866, 578, 577]
  , [ 866, 867, 579, 578]
  , [ 867, 868, 580, 579]
  , [ 868, 869, 581, 580]
  , [ 869, 870, 582, 581]
  , [ 870, 871, 583, 582]
  , [ 871, 872, 584, 583]
  , [ 872, 873, 585, 584]
  , [ 873, 874, 586, 585]
  , [ 874, 875, 587, 586]
  , [ 875, 876, 588, 587]
  , [ 876, 877, 589, 588]
  , [ 877, 878, 590, 589]
  , [ 878, 879, 591, 590]
  , [ 879, 880, 592, 591]
  , [ 880, 881, 593, 592]
  , [ 881, 882, 594, 593]
  , [ 882, 883, 595, 594]
  , [ 883, 884, 596, 595]
  , [ 884, 885, 597, 596]
  , [ 293, 886, 598, 294]
  , [ 886, 887, 599, 598]
  , [ 887, 888, 600, 599]
  , [ 888, 889, 601, 600]
  , [ 889, 890, 602, 601]
  , [ 890, 891, 603, 602]
  , [ 891, 892, 604, 603]
  , [ 892, 893, 605, 604]
  , [ 893, 894, 606, 605]
  , [ 894, 895, 607, 606]
  , [ 895, 896, 608, 607]
  , [ 896, 897, 609, 608]
  , [ 897, 898, 610, 609]
  , [ 898, 899, 611, 610]
  , [ 899, 900, 612, 611]
  , [ 900, 901, 613, 612]
  , [ 901, 902, 614, 613]
  , [ 902, 903, 615, 614]
  , [ 903, 904, 616, 615]
  , [ 904, 905, 617, 616]
  , [ 905, 906, 618, 617]
  , [ 906, 907, 619, 618]
  , [ 907, 908, 620, 619]
  , [ 908, 909, 621, 620]
  , [ 295, 910, 622, 296]
  , [ 910, 911, 623, 622]
  , [ 911, 912, 624, 623]
  , [ 912, 913, 625, 624]
  , [ 913, 914, 626, 625]
  , [ 914, 915, 627, 626]
  , [ 915, 916, 628, 627]
  , [ 916, 917, 629, 628]
  , [ 917, 918, 630, 629]
  , [ 918, 919, 631, 630]
  , [ 919, 920, 632, 631]
  , [ 920, 921, 633, 632]
  , [ 921, 922, 634, 633]
  , [ 922, 923, 635, 634]
  , [ 923, 924, 636, 635]
  , [ 924, 925, 637, 636]
  , [ 925, 926, 638, 637]
  , [ 926, 927, 639, 638]
  , [ 927, 928, 640, 639]
  , [ 928, 929, 641, 640]
  , [ 929, 930, 642, 641]
  , [ 930, 931, 643, 642]
  , [ 931, 932, 644, 643]
  , [ 932, 933, 645, 644]
  , [ 297, 934, 646, 298]
  , [ 934, 935, 647, 646]
  , [ 935, 936, 648, 647]
  , [ 936, 937, 649, 648]
  , [ 937, 938, 650, 649]
  , [ 938, 939, 651, 650]
  , [ 939, 940, 652, 651]
  , [ 940, 941, 653, 652]
  , [ 941, 942, 654, 653]
  , [ 942, 943, 655, 654]
  , [ 943, 944, 656, 655]
  , [ 944, 945, 657, 656]
  , [ 945, 946, 658, 657]
  , [ 946, 947, 659, 658]
  , [ 947, 948, 660, 659]
  , [ 948, 949, 661, 660]
  , [ 949, 950, 662, 661]
  , [ 950, 951, 663, 662]
  , [ 951, 952, 664, 663]
  , [ 952, 953, 665, 664]
  , [ 953, 954, 666, 665]
  , [ 954, 955, 667, 666]
  , [ 955, 956, 668, 667]
  , [ 956, 957, 669, 668]
  , [ 299, 958, 670, 300]
  , [ 958, 959, 671, 670]
  , [ 959, 960, 672, 671]
  , [ 960, 961, 673, 672]
  , [ 961, 962, 674, 673]
  , [ 962, 963, 675, 674]
  , [ 963, 964, 676, 675]
  , [ 964, 965, 677, 676]
  , [ 965, 966, 678, 677]
  , [ 966, 967, 679, 678]
  , [ 967, 968, 680, 679]
  , [ 968, 969, 681, 680]
  , [ 969, 970, 682, 681]
  , [ 970, 971, 683, 682]
  , [ 971, 972, 684, 683]
  , [ 972, 973, 685, 684]
  , [ 973, 974, 686, 685]
  , [ 974, 975, 687, 686]
  , [ 975, 976, 688, 687]
  , [ 976, 977, 689, 688]
  , [ 977, 978, 690, 689]
  , [ 978, 979, 691, 690]
  , [ 979, 980, 692, 691]
  , [ 980, 981, 693, 692]
  , [ 301, 982, 694, 302]
  , [ 982, 983, 695, 694]
  , [ 983, 984, 696, 695]
  , [ 984, 985, 697, 696]
  , [ 985, 986, 698, 697]
  , [ 986, 987, 699, 698]
  , [ 987, 988, 700, 699]
  , [ 988, 989, 701, 700]
  , [ 989, 990, 702, 701]
  , [ 990, 991, 703, 702]
  , [ 991, 992, 704, 703]
  , [ 992, 993, 705, 704]
  , [ 993, 994, 706, 705]
  , [ 994, 995, 707, 706]
  , [ 995, 996, 708, 707]
  , [ 996, 997, 709, 708]
  , [ 997, 998, 710, 709]
  , [ 998, 999, 711, 710]
  , [ 999, 1000, 712, 711]
  , [ 1000, 1001, 713, 712]
  , [ 1001, 1002, 714, 713]
  , [ 1002, 1003, 715, 714]
  , [ 1003, 1004, 716, 715]
  , [ 1004, 1005, 717, 716]
  , [ 303, 1006, 382, 304]
  , [ 1006, 1007, 383, 382]
  , [ 1007, 1008, 384, 383]
  , [ 1008, 1009, 385, 384]
  , [ 1009, 1010, 386, 385]
  , [ 1010, 1011, 387, 386]
  , [ 1011, 1012, 388, 387]
  , [ 1012, 1013, 389, 388]
  , [ 1013, 1014, 390, 389]
  , [ 1014, 1015, 391, 390]
  , [ 1015, 1016, 392, 391]
  , [ 1016, 1017, 393, 392]
  , [ 1017, 1018, 394, 393]
  , [ 1018, 1019, 395, 394]
  , [ 1019, 1020, 396, 395]
  , [ 1020, 1021, 397, 396]
  , [ 1021, 1022, 398, 397]
  , [ 1022, 1023, 399, 398]
  , [ 1023, 1024, 400, 399]
  , [ 1024, 1025, 401, 400]
  , [ 1025, 1026, 402, 401]
  , [ 1026, 1027, 403, 402]
  , [ 1027, 1028, 404, 403]
  , [ 1028, 1029, 405, 404]
  , [ 273, 718, 430, 274]
  , [ 718, 719, 431, 430]
  , [ 719, 720, 432, 431]
  , [ 720, 721, 433, 432]
  , [ 721, 722, 434, 433]
  , [ 722, 723, 435, 434]
  , [ 723, 724, 436, 435]
  , [ 724, 725, 437, 436]
  , [ 725, 726, 438, 437]
  , [ 726, 727, 439, 438]
  , [ 727, 728, 440, 439]
  , [ 728, 729, 441, 440]
  , [ 729, 730, 442, 441]
  , [ 730, 731, 443, 442]
  , [ 731, 732, 444, 443]
  , [ 732, 733, 445, 444]
  , [ 733, 734, 446, 445]
  , [ 734, 735, 447, 446]
  , [ 735, 736, 448, 447]
  , [ 736, 737, 449, 448]
  , [ 737, 738, 450, 449]
  , [ 738, 739, 451, 450]
  , [ 739, 740, 452, 451]
  , [ 740, 741, 453, 452]
  , [ 282, 1078, 1054, 283]
  , [ 1078, 1079, 1055, 1054]
  , [ 1079, 1080, 1056, 1055]
  , [ 1080, 1081, 1057, 1056]
  , [ 1081, 1082, 1058, 1057]
  , [ 1082, 1083, 1059, 1058]
  , [ 1083, 1084, 1060, 1059]
  , [ 1084, 1085, 1061, 1060]
  , [ 1085, 1086, 1062, 1061]
  , [ 1086, 1087, 1063, 1062]
  , [ 1087, 1088, 1064, 1063]
  , [ 1088, 1089, 1065, 1064]
  , [ 1089, 1090, 1066, 1065]
  , [ 1090, 1091, 1067, 1066]
  , [ 1091, 1092, 1068, 1067]
  , [ 1092, 1093, 1069, 1068]
  , [ 1093, 1094, 1070, 1069]
  , [ 1094, 1095, 1071, 1070]
  , [ 1095, 1096, 1072, 1071]
  , [ 1096, 1097, 1073, 1072]
  , [ 1097, 1098, 1074, 1073]
  , [ 1098, 1099, 1075, 1074]
  , [ 1099, 1100, 1076, 1075]
  , [ 1100, 1101, 1077, 1076]
  , [ 279, 1102, 478, 280]
  , [ 1102, 1103, 479, 478]
  , [ 1103, 1104, 480, 479]
  , [ 1104, 1105, 481, 480]
  , [ 1105, 1106, 482, 481]
  , [ 1106, 1107, 483, 482]
  , [ 1107, 1108, 484, 483]
  , [ 1108, 1109, 485, 484]
  , [ 1109, 1110, 486, 485]
  , [ 1110, 1111, 487, 486]
  , [ 1111, 1112, 488, 487]
  , [ 1112, 1113, 489, 488]
  , [ 1113, 1114, 490, 489]
  , [ 1114, 1115, 491, 490]
  , [ 1115, 1116, 492, 491]
  , [ 1116, 1117, 493, 492]
  , [ 1117, 1118, 494, 493]
  , [ 1118, 1119, 495, 494]
  , [ 1119, 1120, 496, 495]
  , [ 1120, 1121, 497, 496]
  , [ 1121, 1122, 498, 497]
  , [ 1122, 1123, 499, 498]
  , [ 1123, 1124, 500, 499]
  , [ 1124, 1125, 501, 500]
  , [ 275, 1030, 454, 276]
  , [ 1030, 1031, 455, 454]
  , [ 1031, 1032, 456, 455]
  , [ 1032, 1033, 457, 456]
  , [ 1033, 1034, 458, 457]
  , [ 1034, 1035, 459, 458]
  , [ 1035, 1036, 460, 459]
  , [ 1036, 1037, 461, 460]
  , [ 1037, 1038, 462, 461]
  , [ 1038, 1039, 463, 462]
  , [ 1039, 1040, 464, 463]
  , [ 1040, 1041, 465, 464]
  , [ 1041, 1042, 466, 465]
  , [ 1042, 1043, 467, 466]
  , [ 1043, 1044, 468, 467]
  , [ 1044, 1045, 469, 468]
  , [ 1045, 1046, 470, 469]
  , [ 1046, 1047, 471, 470]
  , [ 1047, 1048, 472, 471]
  , [ 1048, 1049, 473, 472]
  , [ 1049, 1050, 474, 473]
  , [ 1050, 1051, 475, 474]
  , [ 1051, 1052, 476, 475]
  , [ 1052, 1053, 477, 476]
  , [ 278, 1126, 1102, 279]
  , [ 1126, 1127, 1103, 1102]
  , [ 1127, 1128, 1104, 1103]
  , [ 1128, 1129, 1105, 1104]
  , [ 1129, 1130, 1106, 1105]
  , [ 1130, 1131, 1107, 1106]
  , [ 1131, 1132, 1108, 1107]
  , [ 1132, 1133, 1109, 1108]
  , [ 1133, 1134, 1110, 1109]
  , [ 1134, 1135, 1111, 1110]
  , [ 1135, 1136, 1112, 1111]
  , [ 1136, 1137, 1113, 1112]
  , [ 1137, 1138, 1114, 1113]
  , [ 1138, 1139, 1115, 1114]
  , [ 1139, 1140, 1116, 1115]
  , [ 1140, 1141, 1117, 1116]
  , [ 1141, 1142, 1118, 1117]
  , [ 1142, 1143, 1119, 1118]
  , [ 1143, 1144, 1120, 1119]
  , [ 1144, 1145, 1121, 1120]
  , [ 1145, 1146, 1122, 1121]
  , [ 1146, 1147, 1123, 1122]
  , [ 1147, 1148, 1124, 1123]
  , [ 1148, 1149, 1125, 1124]
  , [ 1150, 1214, 1169, 305]
  , [ 1214, 1219, 1168, 1169]
  , [ 1219, 1224, 1167, 1168]
  , [ 1224, 1229, 1166, 1167]
  , [ 1229, 1234, 1165, 1166]
  , [ 309, 1155, 1210, 1154]
  , [ 1154, 1210, 1211, 1153]
  , [ 1153, 1211, 1212, 1152]
  , [ 1152, 1212, 1213, 1151]
  , [ 1151, 1213, 1214, 1150]
  , [ 1155, 1156, 1215, 1210]
  , [ 1210, 1215, 1216, 1211]
  , [ 1211, 1216, 1217, 1212]
  , [ 1212, 1217, 1218, 1213]
  , [ 1213, 1218, 1219, 1214]
  , [ 1156, 1157, 1220, 1215]
  , [ 1215, 1220, 1221, 1216]
  , [ 1216, 1221, 1222, 1217]
  , [ 1217, 1222, 1223, 1218]
  , [ 1218, 1223, 1224, 1219]
  , [ 1157, 1158, 1225, 1220]
  , [ 1220, 1225, 1226, 1221]
  , [ 1221, 1226, 1227, 1222]
  , [ 1222, 1227, 1228, 1223]
  , [ 1223, 1228, 1229, 1224]
  , [ 1158, 1159, 1230, 1225]
  , [ 1225, 1230, 1231, 1226]
  , [ 1226, 1231, 1232, 1227]
  , [ 1227, 1232, 1233, 1228]
  , [ 1228, 1233, 1234, 1229]
  , [ 1159, 310, 1160, 1230]
  , [ 1230, 1160, 1161, 1231]
  , [ 1231, 1161, 1162, 1232]
  , [ 1232, 1162, 1163, 1233]
  , [ 1233, 1163, 1164, 1234]
  , [ 1164, 1239, 1184, 306]
  , [ 1239, 1244, 1183, 1184]
  , [ 1244, 1249, 1182, 1183]
  , [ 1249, 1254, 1181, 1182]
  , [ 1254, 1259, 1180, 1181]
  , [ 310, 1170, 1235, 1160]
  , [ 1160, 1235, 1236, 1161]
  , [ 1161, 1236, 1237, 1162]
  , [ 1162, 1237, 1238, 1163]
  , [ 1163, 1238, 1239, 1164]
  , [ 1170, 1171, 1240, 1235]
  , [ 1235, 1240, 1241, 1236]
  , [ 1236, 1241, 1242, 1237]
  , [ 1237, 1242, 1243, 1238]
  , [ 1238, 1243, 1244, 1239]
  , [ 1171, 1172, 1245, 1240]
  , [ 1240, 1245, 1246, 1241]
  , [ 1241, 1246, 1247, 1242]
  , [ 1242, 1247, 1248, 1243]
  , [ 1243, 1248, 1249, 1244]
  , [ 1172, 1173, 1250, 1245]
  , [ 1245, 1250, 1251, 1246]
  , [ 1246, 1251, 1252, 1247]
  , [ 1247, 1252, 1253, 1248]
  , [ 1248, 1253, 1254, 1249]
  , [ 1173, 1174, 1255, 1250]
  , [ 1250, 1255, 1256, 1251]
  , [ 1251, 1256, 1257, 1252]
  , [ 1252, 1257, 1258, 1253]
  , [ 1253, 1258, 1259, 1254]
  , [ 1174, 311, 1175, 1255]
  , [ 1255, 1175, 1176, 1256]
  , [ 1256, 1176, 1177, 1257]
  , [ 1257, 1177, 1178, 1258]
  , [ 1258, 1178, 1179, 1259]
  , [ 1179, 1264, 1199, 307]
  , [ 1264, 1269, 1198, 1199]
  , [ 1269, 1274, 1197, 1198]
  , [ 1274, 1279, 1196, 1197]
  , [ 1279, 1284, 1195, 1196]
  , [ 311, 1185, 1260, 1175]
  , [ 1175, 1260, 1261, 1176]
  , [ 1176, 1261, 1262, 1177]
  , [ 1177, 1262, 1263, 1178]
  , [ 1178, 1263, 1264, 1179]
  , [ 1185, 1186, 1265, 1260]
  , [ 1260, 1265, 1266, 1261]
  , [ 1261, 1266, 1267, 1262]
  , [ 1262, 1267, 1268, 1263]
  , [ 1263, 1268, 1269, 1264]
  , [ 1186, 1187, 1270, 1265]
  , [ 1265, 1270, 1271, 1266]
  , [ 1266, 1271, 1272, 1267]
  , [ 1267, 1272, 1273, 1268]
  , [ 1268, 1273, 1274, 1269]
  , [ 1187, 1188, 1275, 1270]
  , [ 1270, 1275, 1276, 1271]
  , [ 1271, 1276, 1277, 1272]
  , [ 1272, 1277, 1278, 1273]
  , [ 1273, 1278, 1279, 1274]
  , [ 1188, 1189, 1280, 1275]
  , [ 1275, 1280, 1281, 1276]
  , [ 1276, 1281, 1282, 1277]
  , [ 1277, 1282, 1283, 1278]
  , [ 1278, 1283, 1284, 1279]
  , [ 1189, 312, 1190, 1280]
  , [ 1280, 1190, 1191, 1281]
  , [ 1281, 1191, 1192, 1282]
  , [ 1282, 1192, 1193, 1283]
  , [ 1283, 1193, 1194, 1284]
  , [ 1194, 1289, 1209, 308]
  , [ 1289, 1294, 1208, 1209]
  , [ 1294, 1299, 1207, 1208]
  , [ 1299, 1304, 1206, 1207]
  , [ 1304, 1309, 1205, 1206]
  , [ 312, 1200, 1285, 1190]
  , [ 1190, 1285, 1286, 1191]
  , [ 1191, 1286, 1287, 1192]
  , [ 1192, 1287, 1288, 1193]
  , [ 1193, 1288, 1289, 1194]
  , [ 1200, 1201, 1290, 1285]
  , [ 1285, 1290, 1291, 1286]
  , [ 1286, 1291, 1292, 1287]
  , [ 1287, 1292, 1293, 1288]
  , [ 1288, 1293, 1294, 1289]
  , [ 1201, 1202, 1295, 1290]
  , [ 1290, 1295, 1296, 1291]
  , [ 1291, 1296, 1297, 1292]
  , [ 1292, 1297, 1298, 1293]
  , [ 1293, 1298, 1299, 1294]
  , [ 1202, 1203, 1300, 1295]
  , [ 1295, 1300, 1301, 1296]
  , [ 1296, 1301, 1302, 1297]
  , [ 1297, 1302, 1303, 1298]
  , [ 1298, 1303, 1304, 1299]
  , [ 1203, 1204, 1305, 1300]
  , [ 1300, 1305, 1306, 1301]
  , [ 1301, 1306, 1307, 1302]
  , [ 1302, 1307, 1308, 1303]
  , [ 1303, 1308, 1309, 1304]
  , [ 1204, 309, 1154, 1305]
  , [ 1305, 1154, 1153, 1306]
  , [ 1306, 1153, 1152, 1307]
  , [ 1307, 1152, 1151, 1308]
  , [ 1308, 1151, 1150, 1309]
  , [ 1209, 1314, 1195, 308]
  , [ 1314, 1319, 1196, 1195]
  , [ 1319, 1324, 1197, 1196]
  , [ 1324, 1329, 1198, 1197]
  , [ 1329, 1334, 1199, 1198]
  , [ 305, 1169, 1310, 1205]
  , [ 1205, 1310, 1311, 1206]
  , [ 1206, 1311, 1312, 1207]
  , [ 1207, 1312, 1313, 1208]
  , [ 1208, 1313, 1314, 1209]
  , [ 1169, 1168, 1315, 1310]
  , [ 1310, 1315, 1316, 1311]
  , [ 1311, 1316, 1317, 1312]
  , [ 1312, 1317, 1318, 1313]
  , [ 1313, 1318, 1319, 1314]
  , [ 1168, 1167, 1320, 1315]
  , [ 1315, 1320, 1321, 1316]
  , [ 1316, 1321, 1322, 1317]
  , [ 1317, 1322, 1323, 1318]
  , [ 1318, 1323, 1324, 1319]
  , [ 1167, 1166, 1325, 1320]
  , [ 1320, 1325, 1326, 1321]
  , [ 1321, 1326, 1327, 1322]
  , [ 1322, 1327, 1328, 1323]
  , [ 1323, 1328, 1329, 1324]
  , [ 1166, 1165, 1330, 1325]
  , [ 1325, 1330, 1331, 1326]
  , [ 1326, 1331, 1332, 1327]
  , [ 1327, 1332, 1333, 1328]
  , [ 1328, 1333, 1334, 1329]
  , [ 1165, 306, 1184, 1330]
  , [ 1330, 1184, 1183, 1331]
  , [ 1331, 1183, 1182, 1332]
  , [ 1332, 1182, 1181, 1333]
  , [ 1333, 1181, 1180, 1334]
  , [ 1204, 1339, 1155, 309]
  , [ 1339, 1344, 1156, 1155]
  , [ 1344, 1349, 1157, 1156]
  , [ 1349, 1354, 1158, 1157]
  , [ 1354, 1359, 1159, 1158]
  , [ 312, 1189, 1335, 1200]
  , [ 1200, 1335, 1336, 1201]
  , [ 1201, 1336, 1337, 1202]
  , [ 1202, 1337, 1338, 1203]
  , [ 1203, 1338, 1339, 1204]
  , [ 1189, 1188, 1340, 1335]
  , [ 1335, 1340, 1341, 1336]
  , [ 1336, 1341, 1342, 1337]
  , [ 1337, 1342, 1343, 1338]
  , [ 1338, 1343, 1344, 1339]
  , [ 1188, 1187, 1345, 1340]
  , [ 1340, 1345, 1346, 1341]
  , [ 1341, 1346, 1347, 1342]
  , [ 1342, 1347, 1348, 1343]
  , [ 1343, 1348, 1349, 1344]
  , [ 1187, 1186, 1350, 1345]
  , [ 1345, 1350, 1351, 1346]
  , [ 1346, 1351, 1352, 1347]
  , [ 1347, 1352, 1353, 1348]
  , [ 1348, 1353, 1354, 1349]
  , [ 1186, 1185, 1355, 1350]
  , [ 1350, 1355, 1356, 1351]
  , [ 1351, 1356, 1357, 1352]
  , [ 1352, 1357, 1358, 1353]
  , [ 1353, 1358, 1359, 1354]
  , [ 1185, 311, 1174, 1355]
  , [ 1355, 1174, 1173, 1356]
  , [ 1356, 1173, 1172, 1357]
  , [ 1357, 1172, 1171, 1358]
  , [ 1358, 1171, 1170, 1359]
  , [ 1365, 1384, 1374, 363]
  , [ 1384, 1389, 1373, 1374]
  , [ 1389, 1394, 1372, 1373]
  , [ 1394, 1399, 1371, 1372]
  , [ 1399, 1404, 1370, 1371]
  , [ 1425, 1368, 1416, 1424]
  , [ 1368, 1367, 1405, 1416]
  , [ 1368, 1381, 1382, 1367]
  , [ 1367, 1382, 1383, 1366]
  , [ 1366, 1383, 1384, 1365]
  , [ 1364, 1363, 1385, 1380]
  , [ 1380, 1385, 1386, 1381]
  , [ 1381, 1386, 1387, 1382]
  , [ 1382, 1387, 1388, 1383]
  , [ 1383, 1388, 1389, 1384]
  , [ 1363, 1362, 1390, 1385]
  , [ 1385, 1390, 1391, 1386]
  , [ 1386, 1391, 1392, 1387]
  , [ 1387, 1392, 1393, 1388]
  , [ 1388, 1393, 1394, 1389]
  , [ 1362, 1361, 1395, 1390]
  , [ 1390, 1395, 1396, 1391]
  , [ 1391, 1396, 1397, 1392]
  , [ 1392, 1397, 1398, 1393]
  , [ 1393, 1398, 1399, 1394]
  , [ 1361, 1360, 1400, 1395]
  , [ 1395, 1400, 1401, 1396]
  , [ 1396, 1401, 1402, 1397]
  , [ 1397, 1402, 1403, 1398]
  , [ 1398, 1403, 1404, 1399]
  , [ 1360, 313, 1375, 1400]
  , [ 1400, 1375, 1376, 1401]
  , [ 1401, 1376, 1377, 1402]
  , [ 1402, 1377, 1378, 1403]
  , [ 1403, 1378, 1379, 1404]
  , [ 1431, 1434, 359, 361]
  , [ 316, 1424, 1423, 318]
  , [ 314, 1425, 1424, 316]
  , [ 1425, 1380, 1381, 1368]
  , [ 320, 1422, 322]
  , [ 1407, 1420, 1421, 1408]
  , [ 318, 1423, 1422, 320]
  , [ 1406, 1419, 1420, 1407]
  , [ 326, 1413, 330, 328]
  , [ 1413, 334, 332, 330]
  , [ 322, 1410, 1414, 324]
  , [ 1408, 1421, 1417, 1409]
  , [ 1409, 1417, 334, 1413]
  , [ 1415, 1407, 1408, 1410]
  , [ 1411, 1406, 1407, 1415]
  , [ 324, 1414, 326]
  , [ 1414, 1409, 1413, 326]
  , [ 1410, 1408, 1409, 1414]
  , [ 1416, 1405, 1406, 1411]
  , [ 1419, 1428, 1427, 1420]
  , [ 1421, 338, 336, 1417]
  , [ 1420, 1427, 338, 1421]
  , [ 1417, 336, 334]
  , [ 1418, 1426, 1428, 1419]
  , [ 1423, 1411, 1415, 1422]
  , [ 1422, 1415, 1410, 322]
  , [ 1424, 1416, 1411, 1423]
  , [ 364, 1364, 1380, 1425]
  , [ 1427, 340, 338]
  , [ 1428, 342, 340, 1427]
  , [ 1426, 344, 342, 1428]
  , [ 1366, 1365, 1426, 1418]
  , [ 363, 344, 1426, 1365]
  , [ 1435, 1438, 1432, 1429]
  , [ 1438, 1434, 1431, 1432]
  , [ 1436, 1430, 1433, 1437]
  , [ 1437, 1433, 367, 369]
  , [ 1430, 1371, 1370, 1433]
  , [ 1433, 1370, 365, 367]
  , [ 1429, 1372, 1371, 1430]
  , [ 1429, 1432, 1373, 1372]
  , [ 1374, 1431, 361, 363]
  , [ 1432, 1431, 1374, 1373]
  , [ 1445, 1441, 1442, 373]
  , [ 373, 1442, 371]
  , [ 1444, 1439, 1441, 1445]
  , [ 1440, 355, 357]
  , [ 1444, 1446, 1443, 1439]
  , [ 1446, 355, 1440, 1443]
  , [ 1443, 1440, 1434, 1438]
  , [ 1439, 1435, 1436, 1441]
  , [ 1434, 1440, 357, 359]
  , [ 1441, 1436, 1437, 1442]
  , [ 1439, 1443, 1438, 1435]
  , [ 1442, 1437, 369, 371]
  , [ 351, 353, 1449]
  , [ 347, 1450, 377, 379]
  , [ 377, 1448, 375]
  , [ 349, 351, 1450, 347]
  , [ 353, 355, 1446, 1449]
  , [ 1447, 1444, 1445, 1448]
  , [ 1448, 1445, 373, 375]
  , [ 1447, 1449, 1446, 1444]
  , [ 1450, 1447, 1448, 377]
  , [ 351, 1449, 1447, 1450]
  , [ 1461, 1457, 1452, 1454]
  , [ 1453, 1458, 341, 343]
  , [ 1457, 1460, 1455, 1452]
  , [ 1377, 1455, 1456, 1378]
  , [ 1455, 1460, 1459, 1456]
  , [ 1461, 1454, 315, 317]
  , [ 1454, 1452, 1376, 1375]
  , [ 1379, 1453, 343, 345]
  , [ 1454, 1375, 313, 315]
  , [ 1452, 1455, 1377, 1376]
  , [ 1378, 1456, 1453, 1379]
  , [ 321, 1467, 1462, 1466]
  , [ 1465, 1469, 1468, 1464]
  , [ 1463, 337, 339]
  , [ 321, 1466, 319]
  , [ 1467, 1469, 1465, 1462]
  , [ 1464, 1468, 337, 1463]
  , [ 1466, 1461, 317, 319]
  , [ 1466, 1462, 1457, 1461]
  , [ 1462, 1465, 1460, 1457]
  , [ 1460, 1465, 1464, 1459]
  , [ 1459, 1464, 1463, 1458]
  , [ 1458, 1463, 339, 341]
  , [ 323, 325, 1470]
  , [ 325, 327, 329, 1473]
  , [ 1473, 329, 331, 333]
  , [ 1471, 333, 335]
  , [ 1470, 1472, 1469, 1467]
  , [ 1469, 1472, 1471, 1468]
  , [ 1468, 1471, 335, 337]
  , [ 321, 323, 1470, 1467]
  , [ 1470, 325, 1473, 1472]
  , [ 1472, 1473, 333, 1471]
  , [ 1412, 1363, 1364, 1369]
  , [ 1474, 1476, 1361, 1362]
  , [ 1361, 1476, 1475, 1360]
  , [ 1412, 1474, 1362, 1363]
  , [ 1369, 1364, 364, 362]
  , [ 1360, 1475, 368, 366]
  , [ 1367, 1366, 1418, 1405]
  , [ 1481, 1486, 372, 370]
  , [ 1480, 1485, 1486, 1481]
  , [ 1483, 1482, 1477, 1478]
  , [ 1483, 1478, 1479, 1484]
  , [ 1484, 1479, 360, 358]
  , [ 1482, 1485, 1480, 1477]
  , [ 1477, 1480, 1476, 1474]
  , [ 1478, 1477, 1474, 1412]
  , [ 1478, 1412, 1369, 1479]
  , [ 1475, 1481, 370, 368]
  , [ 1479, 1369, 362, 360]
  , [ 1476, 1480, 1481, 1475]
  , [ 1490, 1492, 1489, 1487]
  , [ 1491, 1490, 1487, 1488]
  , [ 1491, 1488, 356, 354]
  , [ 1486, 374, 372]
  , [ 356, 1484, 358]
  , [ 1489, 1492, 376, 374]
  , [ 1487, 1489, 1485, 1482]
  , [ 1488, 1487, 1482, 1483]
  , [ 1485, 1489, 374, 1486]
  , [ 1488, 1483, 1484, 356]
  , [ 348, 380, 378, 1493]
  , [ 350, 348, 1493, 352]
  , [ 1492, 378, 376]
  , [ 352, 1491, 354]
  , [ 1493, 378, 1492, 1490]
  , [ 352, 1493, 1490, 1491]
  ]
