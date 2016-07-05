module Generate.Sphere exposing (model)

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
        , Vector.vector 0.0 -19.0 0.0
        , Vector.vector 13.748539 -8.49717 9.988781
        , Vector.vector -5.251372 -8.497177 16.162336
        , Vector.vector -16.994099 -8.497097 0.0
        , Vector.vector -5.251372 -8.497177 -16.162336
        , Vector.vector 13.748539 -8.49717 -9.988781
        , Vector.vector 5.251372 8.497177 16.162336
        , Vector.vector -13.748539 8.49717 9.988781
        , Vector.vector -13.748539 8.49717 -9.988781
        , Vector.vector 5.251372 8.497177 -16.162336
        , Vector.vector 16.994099 8.497097 0.0
        , Vector.vector 0.0 19.0 0.0
        , Vector.vector -5.090809 -9.465322 15.668164
        , Vector.vector -4.900794 -10.46302 15.083347
        , Vector.vector -4.678913 -11.477572 14.400455
        , Vector.vector -4.423609 -12.492866 13.614697
        , Vector.vector -4.134575 -13.489864 12.725127
        , Vector.vector -3.813082 -14.447659 11.735655
        , Vector.vector -3.462175 -15.345041 10.655658
        , Vector.vector -3.086656 -16.162434 9.499908
        , Vector.vector -2.692798 -16.883797 8.287719
        , Vector.vector -2.28784 -17.498142 7.041367
        , Vector.vector -1.879342 -18.000334 5.784118
        , Vector.vector -1.474526 -18.391045 4.538201
        , Vector.vector -1.07974 -18.675943 3.323154
        , Vector.vector -0.700107 -18.864435 2.154744
        , Vector.vector -0.339384 -18.968231 1.044533
        , Vector.vector 0.888536 -18.968229 0.645552
        , Vector.vector 1.832941 -18.864435 1.331694
        , Vector.vector 2.826854 -18.675941 2.053805
        , Vector.vector 3.860437 -18.391043 2.804739
        , Vector.vector 4.92028 -18.000332 3.574751
        , Vector.vector 5.989764 -17.498138 4.351768
        , Vector.vector 7.049977 -16.883793 5.122048
        , Vector.vector 8.08113 -16.16243 5.871217
        , Vector.vector 9.064271 -15.345035 6.585502
        , Vector.vector 9.982973 -14.447652 7.252971
        , Vector.vector 10.824671 -13.489858 7.864493
        , Vector.vector 11.581386 -12.492859 8.414271
        , Vector.vector 12.249792 -11.477567 8.899891
        , Vector.vector 12.830698 -10.463016 9.321939
        , Vector.vector 13.328172 -9.465317 9.683371
        , Vector.vector 12.988792 -8.786529 10.72792
        , Vector.vector 12.130598 -9.06276 11.476713
        , Vector.vector 11.170066 -9.318027 12.223093
        , Vector.vector 10.106879 -9.543732 12.952536
        , Vector.vector 8.945352 -9.731088 13.648685
        , Vector.vector 7.695161 -9.871877 14.294423
        , Vector.vector 6.371505 -9.959341 14.873314
        , Vector.vector 4.994508 -9.989017 15.371222
        , Vector.vector 3.587836 -9.959343 15.777801
        , Vector.vector 2.176715 -9.871879 16.087509
        , Vector.vector 0.785735 -9.731091 16.299953
        , Vector.vector -0.563146 -9.543736 16.419498
        , Vector.vector -1.852039 -9.318032 16.454308
        , Vector.vector -3.06784 -9.062767 16.415073
        , Vector.vector -4.202265 -8.786533 16.313728
        , Vector.vector 14.216714 -8.786523 -9.03781
        , Vector.vector 14.663653 -9.06275 -7.990232
        , Vector.vector 15.076672 -9.318012 -6.84607
        , Vector.vector 15.441855 -9.543712 -5.609516
        , Vector.vector 15.744989 -9.731062 -4.289725
        , Vector.vector 15.972781 -9.871845 -2.901191
        , Vector.vector 16.114296 -9.959307 -1.463447
        , Vector.vector 16.16231 -9.988982 0.000001
        , Vector.vector 16.114296 -9.959307 1.463449
        , Vector.vector 15.972781 -9.871845 2.901193
        , Vector.vector 15.744988 -9.73106 4.289727
        , Vector.vector 15.441855 -9.543712 5.609517
        , Vector.vector 15.076669 -9.318011 6.846071
        , Vector.vector 14.663653 -9.06275 7.990233
        , Vector.vector 14.216714 -8.786523 9.037811
        , Vector.vector 0.888536 -18.968229 -0.645552
        , Vector.vector 1.832941 -18.864435 -1.331694
        , Vector.vector 2.826854 -18.675941 -2.053805
        , Vector.vector 3.860437 -18.391043 -2.804739
        , Vector.vector 4.92028 -18.000332 -3.574751
        , Vector.vector 5.989764 -17.498138 -4.351768
        , Vector.vector 7.049977 -16.883793 -5.122048
        , Vector.vector 8.08113 -16.16243 -5.871217
        , Vector.vector 9.064271 -15.345035 -6.585502
        , Vector.vector 9.982973 -14.447652 -7.252971
        , Vector.vector 10.824671 -13.489858 -7.864493
        , Vector.vector 11.581386 -12.492859 -8.414271
        , Vector.vector 12.249792 -11.477567 -8.899891
        , Vector.vector 12.830698 -10.463016 -9.321939
        , Vector.vector 13.328172 -9.465317 -9.683371
        , Vector.vector -16.474503 -9.465238 0.0
        , Vector.vector -15.859602 -10.462935 0.0
        , Vector.vector -15.141577 -11.477488 0.0
        , Vector.vector -14.31539 -12.492781 0.0
        , Vector.vector -13.380051 -13.489784 0.0
        , Vector.vector -12.339663 -14.447584 0.0
        , Vector.vector -11.204091 -15.344979 0.0
        , Vector.vector -9.988865 -16.16238 0.0
        , Vector.vector -8.714291 -16.883753 0.0
        , Vector.vector -7.403794 -17.498108 0.0
        , Vector.vector -6.081836 -18.000315 0.0
        , Vector.vector -4.771792 -18.391031 0.0
        , Vector.vector -3.494205 -18.675934 0.0
        , Vector.vector -2.265655 -18.864433 0.0
        , Vector.vector -1.098299 -18.968227 0.0
        , Vector.vector -6.189122 -8.786534 15.668171
        , Vector.vector -7.166479 -9.062765 15.083364
        , Vector.vector -8.173162 -9.31803 14.400478
        , Vector.vector -9.195457 -9.543732 13.614725
        , Vector.vector -10.216477 -9.731082 12.725158
        , Vector.vector -11.216949 -9.871864 11.735687
        , Vector.vector -12.176543 -9.95932 10.655689
        , Vector.vector -13.0756 -9.988988 9.49994
        , Vector.vector -13.896961 -9.959303 8.287745
        , Vector.vector -14.627569 -9.871831 7.041389
        , Vector.vector -15.259448 -9.731034 5.784135
        , Vector.vector -15.789961 -9.543674 4.538213
        , Vector.vector -16.22135 -9.317964 3.323163
        , Vector.vector -16.559731 -9.062692 2.154748
        , Vector.vector -16.813898 -8.786456 1.044535
        , Vector.vector -5.090809 -9.465322 -15.668164
        , Vector.vector -4.900794 -10.46302 -15.083347
        , Vector.vector -4.678913 -11.477572 -14.400455
        , Vector.vector -4.423609 -12.492866 -13.614697
        , Vector.vector -4.134575 -13.489864 -12.725127
        , Vector.vector -3.813082 -14.447659 -11.735655
        , Vector.vector -3.462175 -15.345041 -10.655658
        , Vector.vector -3.086656 -16.162434 -9.499908
        , Vector.vector -2.692798 -16.883797 -8.287719
        , Vector.vector -2.28784 -17.498142 -7.041367
        , Vector.vector -1.879342 -18.000334 -5.784118
        , Vector.vector -1.474526 -18.391045 -4.538201
        , Vector.vector -1.07974 -18.675943 -3.323154
        , Vector.vector -0.700107 -18.864435 -2.154744
        , Vector.vector -0.339384 -18.968231 -1.044533
        , Vector.vector -16.813896 -8.786456 -1.044536
        , Vector.vector -16.559731 -9.062693 -2.154749
        , Vector.vector -16.221348 -9.317964 -3.323164
        , Vector.vector -15.789962 -9.543674 -4.538215
        , Vector.vector -15.259447 -9.731035 -5.784137
        , Vector.vector -14.627568 -9.871832 -7.041391
        , Vector.vector -13.89696 -9.959305 -8.287746
        , Vector.vector -13.075597 -9.988988 -9.499941
        , Vector.vector -12.17654 -9.95932 -10.655692
        , Vector.vector -11.216948 -9.871864 -11.73569
        , Vector.vector -10.216475 -9.731082 -12.725162
        , Vector.vector -9.195456 -9.543731 -13.614726
        , Vector.vector -8.173161 -9.318029 -14.400478
        , Vector.vector -7.166477 -9.062764 -15.083364
        , Vector.vector -6.189122 -8.786534 -15.668171
        , Vector.vector -4.202265 -8.786533 -16.313728
        , Vector.vector -3.06784 -9.062765 -16.415073
        , Vector.vector -1.852039 -9.318031 -16.454308
        , Vector.vector -0.563146 -9.543736 -16.4195
        , Vector.vector 0.785735 -9.731089 -16.299953
        , Vector.vector 2.176715 -9.871878 -16.087509
        , Vector.vector 3.587835 -9.959339 -15.777801
        , Vector.vector 4.994508 -9.989016 -15.371223
        , Vector.vector 6.371504 -9.959339 -14.873315
        , Vector.vector 7.69516 -9.871875 -14.294425
        , Vector.vector 8.945352 -9.731087 -13.648688
        , Vector.vector 10.106876 -9.543732 -12.952537
        , Vector.vector 11.170065 -9.318027 -12.223094
        , Vector.vector 12.130597 -9.06276 -11.476714
        , Vector.vector 12.988791 -8.786529 -10.727921
        , Vector.vector 17.363052 7.688149 0.645553
        , Vector.vector 17.69257 6.797019 1.331697
        , Vector.vector 17.968473 5.823729 2.053812
        , Vector.vector 18.17589 4.771839 2.804749
        , Vector.vector 18.300406 3.64914 3.574765
        , Vector.vector 18.329515 2.467959 4.351785
        , Vector.vector 18.254166 1.244913 5.122069
        , Vector.vector 18.070099 -0.000001 5.871241
        , Vector.vector 17.778667 -1.244916 6.585528
        , Vector.vector 17.386868 -2.467967 7.252997
        , Vector.vector 16.906599 -3.649157 7.864518
        , Vector.vector 16.353254 -4.771866 8.414293
        , Vector.vector 15.744058 -5.823768 8.899909
        , Vector.vector 15.096393 -6.797072 9.321951
        , Vector.vector 14.426489 -7.688213 9.683376
        , Vector.vector 14.426491 -7.688213 -9.683376
        , Vector.vector 15.096393 -6.797071 -9.32195
        , Vector.vector 15.744058 -5.823767 -8.899908
        , Vector.vector 16.353254 -4.771865 -8.414292
        , Vector.vector 16.906599 -3.649156 -7.864516
        , Vector.vector 17.386869 -2.467966 -7.252996
        , Vector.vector 17.778667 -1.244915 -6.585527
        , Vector.vector 18.070099 0.000001 -5.871239
        , Vector.vector 18.254166 1.244914 -5.122067
        , Vector.vector 18.329515 2.46796 -4.351784
        , Vector.vector 18.300406 3.649141 -3.574764
        , Vector.vector 18.17589 4.77184 -2.804748
        , Vector.vector 17.968473 5.823729 -2.053811
        , Vector.vector 17.69257 6.79702 -1.331697
        , Vector.vector 17.363052 7.68815 -0.645553
        , Vector.vector 4.751426 7.688221 16.712727
        , Vector.vector 4.20069 6.797082 17.238153
        , Vector.vector 3.599175 5.823779 17.7237
        , Vector.vector 2.949086 4.771879 18.153019
        , Vector.vector 2.255235 3.649168 18.50939
        , Vector.vector 1.525243 2.467976 18.777189
        , Vector.vector 0.769378 1.244921 18.943554
        , Vector.vector -0.0 -0.000001 18.999998
        , Vector.vector -0.769379 -1.244922 18.943554
        , Vector.vector -1.525244 -2.467977 18.777185
        , Vector.vector -2.255237 -3.649169 18.50939
        , Vector.vector -2.949087 -4.771879 18.153019
        , Vector.vector -3.599176 -5.82378 17.7237
        , Vector.vector -4.20069 -6.797082 17.238152
        , Vector.vector -4.751427 -7.688222 16.712727
        , Vector.vector 13.667581 -7.688221 10.72793
        , Vector.vector 13.530856 -6.797086 11.47674
        , Vector.vector 13.329611 -5.823787 12.223135
        , Vector.vector 13.056013 -4.771886 12.952591
        , Vector.vector 12.704132 -3.649176 13.648755
        , Vector.vector 12.270947 -2.467983 14.294507
        , Vector.vector 11.757209 -1.244925 14.873405
        , Vector.vector 11.167927 0.000001 15.371317
        , Vector.vector 10.512285 1.244926 15.777897
        , Vector.vector 9.802965 2.467984 16.087601
        , Vector.vector 9.054958 3.649178 16.300037
        , Vector.vector 8.28413 4.771889 16.419571
        , Vector.vector 7.505827 5.82379 16.454363
        , Vector.vector 6.733774 6.79709 16.41511
        , Vector.vector 5.979364 7.688227 16.313749
        , Vector.vector -14.426491 7.688213 9.683376
        , Vector.vector -15.096393 6.797071 9.32195
        , Vector.vector -15.744058 5.823767 8.899908
        , Vector.vector -16.353254 4.771865 8.414292
        , Vector.vector -16.906599 3.649156 7.864516
        , Vector.vector -17.386869 2.467966 7.252996
        , Vector.vector -17.778667 1.244915 6.585527
        , Vector.vector -18.070099 -0.000001 5.871239
        , Vector.vector -18.254166 -1.244914 5.122067
        , Vector.vector -18.329515 -2.46796 4.351784
        , Vector.vector -18.300406 -3.649141 3.574764
        , Vector.vector -18.17589 -4.77184 2.804748
        , Vector.vector -17.968473 -5.823729 2.053811
        , Vector.vector -17.69257 -6.79702 1.331697
        , Vector.vector -17.363052 -7.68815 0.645553
        , Vector.vector -5.979364 -7.688226 16.313749
        , Vector.vector -6.733775 -6.797089 16.41511
        , Vector.vector -7.505828 -5.823789 16.454363
        , Vector.vector -8.28413 -4.771888 16.419571
        , Vector.vector -9.054959 -3.649177 16.300037
        , Vector.vector -9.802967 -2.467983 16.087603
        , Vector.vector -10.512285 -1.244924 15.777897
        , Vector.vector -11.167925 0.000001 15.371316
        , Vector.vector -11.75721 1.244926 14.873405
        , Vector.vector -12.270947 2.467983 14.294506
        , Vector.vector -12.704132 3.649176 13.648756
        , Vector.vector -13.056013 4.771886 12.952591
        , Vector.vector -13.329611 5.823786 12.223134
        , Vector.vector -13.530856 6.797086 11.47674
        , Vector.vector -13.667581 7.688221 10.727931
        , Vector.vector -13.667581 7.688221 -10.72793
        , Vector.vector -13.530856 6.797086 -11.47674
        , Vector.vector -13.329611 5.823787 -12.223135
        , Vector.vector -13.056013 4.771886 -12.952591
        , Vector.vector -12.704132 3.649176 -13.648755
        , Vector.vector -12.270947 2.467983 -14.294507
        , Vector.vector -11.757209 1.244925 -14.873405
        , Vector.vector -11.167927 -0.000001 -15.371317
        , Vector.vector -10.512285 -1.244926 -15.777897
        , Vector.vector -9.802965 -2.467984 -16.087601
        , Vector.vector -9.054958 -3.649178 -16.300037
        , Vector.vector -8.28413 -4.771889 -16.419571
        , Vector.vector -7.505827 -5.82379 -16.454363
        , Vector.vector -6.733774 -6.79709 -16.41511
        , Vector.vector -5.979364 -7.688227 -16.313749
        , Vector.vector -17.363052 -7.688149 -0.645553
        , Vector.vector -17.69257 -6.797019 -1.331697
        , Vector.vector -17.968473 -5.823729 -2.053812
        , Vector.vector -18.17589 -4.771839 -2.804749
        , Vector.vector -18.300406 -3.64914 -3.574765
        , Vector.vector -18.329515 -2.467959 -4.351785
        , Vector.vector -18.254166 -1.244913 -5.122069
        , Vector.vector -18.070099 0.000001 -5.871241
        , Vector.vector -17.778667 1.244916 -6.585528
        , Vector.vector -17.386868 2.467967 -7.252997
        , Vector.vector -16.906599 3.649157 -7.864518
        , Vector.vector -16.353254 4.771866 -8.414293
        , Vector.vector -15.744058 5.823768 -8.899909
        , Vector.vector -15.096393 6.797072 -9.321951
        , Vector.vector -14.426489 7.688213 -9.683376
        , Vector.vector 5.979364 7.688226 -16.313749
        , Vector.vector 6.733775 6.797089 -16.41511
        , Vector.vector 7.505828 5.823789 -16.454363
        , Vector.vector 8.28413 4.771888 -16.419571
        , Vector.vector 9.054959 3.649177 -16.300037
        , Vector.vector 9.802967 2.467983 -16.087603
        , Vector.vector 10.512285 1.244924 -15.777897
        , Vector.vector 11.167925 -0.000001 -15.371316
        , Vector.vector 11.75721 -1.244926 -14.873405
        , Vector.vector 12.270947 -2.467983 -14.294506
        , Vector.vector 12.704132 -3.649176 -13.648756
        , Vector.vector 13.056013 -4.771886 -12.952591
        , Vector.vector 13.329611 -5.823786 -12.223134
        , Vector.vector 13.530856 -6.797086 -11.47674
        , Vector.vector 13.667581 -7.688221 -10.727931
        , Vector.vector -4.751426 -7.688221 -16.712727
        , Vector.vector -4.20069 -6.797082 -17.238153
        , Vector.vector -3.599175 -5.823779 -17.7237
        , Vector.vector -2.949086 -4.771879 -18.153019
        , Vector.vector -2.255235 -3.649168 -18.50939
        , Vector.vector -1.525243 -2.467976 -18.777189
        , Vector.vector -0.769378 -1.244921 -18.943554
        , Vector.vector 0.0 0.000001 -18.999998
        , Vector.vector 0.769379 1.244922 -18.943554
        , Vector.vector 1.525244 2.467977 -18.777185
        , Vector.vector 2.255237 3.649169 -18.50939
        , Vector.vector 2.949087 4.771879 -18.153019
        , Vector.vector 3.599176 5.82378 -17.7237
        , Vector.vector 4.20069 6.797082 -17.238152
        , Vector.vector 4.751427 7.688222 -16.712727
        , Vector.vector 16.813896 8.786456 1.044536
        , Vector.vector 16.559731 9.062693 2.154749
        , Vector.vector 16.221348 9.317964 3.323164
        , Vector.vector 15.789962 9.543674 4.538215
        , Vector.vector 15.259447 9.731035 5.784137
        , Vector.vector 14.627568 9.871832 7.041391
        , Vector.vector 13.89696 9.959305 8.287746
        , Vector.vector 13.075597 9.988988 9.499941
        , Vector.vector 12.17654 9.95932 10.655692
        , Vector.vector 11.216948 9.871864 11.73569
        , Vector.vector 10.216475 9.731082 12.725162
        , Vector.vector 9.195456 9.543731 13.614726
        , Vector.vector 8.173161 9.318029 14.400478
        , Vector.vector 7.166477 9.062764 15.083364
        , Vector.vector 6.189122 8.786534 15.668171
        , Vector.vector 4.202265 8.786533 16.313728
        , Vector.vector 3.06784 9.062765 16.415073
        , Vector.vector 1.852039 9.318031 16.454308
        , Vector.vector 0.563146 9.543736 16.4195
        , Vector.vector -0.785735 9.731089 16.299953
        , Vector.vector -2.176715 9.871878 16.087509
        , Vector.vector -3.587835 9.959339 15.777801
        , Vector.vector -4.994508 9.989016 15.371223
        , Vector.vector -6.371504 9.959339 14.873315
        , Vector.vector -7.69516 9.871875 14.294425
        , Vector.vector -8.945352 9.731087 13.648688
        , Vector.vector -10.106876 9.543732 12.952537
        , Vector.vector -11.170065 9.318027 12.223094
        , Vector.vector -12.130597 9.06276 11.476714
        , Vector.vector -12.988791 8.786529 10.727921
        , Vector.vector -14.216714 8.786523 9.03781
        , Vector.vector -14.663653 9.06275 7.990232
        , Vector.vector -15.076672 9.318012 6.84607
        , Vector.vector -15.441855 9.543712 5.609516
        , Vector.vector -15.744989 9.731062 4.289725
        , Vector.vector -15.972781 9.871845 2.901191
        , Vector.vector -16.114296 9.959307 1.463447
        , Vector.vector -16.16231 9.988982 -0.000001
        , Vector.vector -16.114296 9.959307 -1.463449
        , Vector.vector -15.972781 9.871845 -2.901193
        , Vector.vector -15.744988 9.73106 -4.289727
        , Vector.vector -15.441855 9.543712 -5.609517
        , Vector.vector -15.076669 9.318011 -6.846071
        , Vector.vector -14.663653 9.06275 -7.990233
        , Vector.vector -14.216714 8.786523 -9.037811
        , Vector.vector -12.988792 8.786529 -10.72792
        , Vector.vector -12.130598 9.06276 -11.476713
        , Vector.vector -11.170066 9.318027 -12.223093
        , Vector.vector -10.106879 9.543732 -12.952536
        , Vector.vector -8.945352 9.731088 -13.648685
        , Vector.vector -7.695161 9.871877 -14.294423
        , Vector.vector -6.371505 9.959341 -14.873314
        , Vector.vector -4.994508 9.989017 -15.371222
        , Vector.vector -3.587836 9.959343 -15.777801
        , Vector.vector -2.176715 9.871879 -16.087509
        , Vector.vector -0.785735 9.731091 -16.299953
        , Vector.vector 0.563146 9.543736 -16.419498
        , Vector.vector 1.852039 9.318032 -16.454308
        , Vector.vector 3.06784 9.062767 -16.415073
        , Vector.vector 4.202265 8.786533 -16.313728
        , Vector.vector 6.189122 8.786534 -15.668171
        , Vector.vector 7.166479 9.062765 -15.083364
        , Vector.vector 8.173162 9.31803 -14.400478
        , Vector.vector 9.195457 9.543732 -13.614725
        , Vector.vector 10.216477 9.731082 -12.725158
        , Vector.vector 11.216949 9.871864 -11.735687
        , Vector.vector 12.176543 9.95932 -10.655689
        , Vector.vector 13.0756 9.988988 -9.49994
        , Vector.vector 13.896961 9.959303 -8.287745
        , Vector.vector 14.627569 9.871831 -7.041389
        , Vector.vector 15.259448 9.731034 -5.784135
        , Vector.vector 15.789961 9.543674 -4.538213
        , Vector.vector 16.22135 9.317964 -3.323163
        , Vector.vector 16.559731 9.062692 -2.154748
        , Vector.vector 16.813898 8.786456 -1.044535
        , Vector.vector 0.339384 18.968229 1.044533
        , Vector.vector 0.700107 18.864437 2.154744
        , Vector.vector 1.07974 18.675941 3.323155
        , Vector.vector 1.474526 18.391045 4.538202
        , Vector.vector 1.879342 18.000334 5.784118
        , Vector.vector 2.28784 17.49814 7.041368
        , Vector.vector 2.692798 16.883795 8.287719
        , Vector.vector 3.086656 16.162434 9.499909
        , Vector.vector 3.462175 15.345041 10.655659
        , Vector.vector 3.813082 14.447657 11.735655
        , Vector.vector 4.134575 13.489863 12.725127
        , Vector.vector 4.423609 12.492866 13.614699
        , Vector.vector 4.678912 11.477572 14.400455
        , Vector.vector 4.900794 10.463021 15.083348
        , Vector.vector 5.090809 9.465323 15.668164
        , Vector.vector 16.474503 9.465238 0.0
        , Vector.vector 15.859602 10.462935 0.0
        , Vector.vector 15.141577 11.477488 0.0
        , Vector.vector 14.31539 12.492781 0.0
        , Vector.vector 13.380051 13.489784 0.0
        , Vector.vector 12.339663 14.447584 0.0
        , Vector.vector 11.204091 15.344979 0.0
        , Vector.vector 9.988865 16.16238 0.0
        , Vector.vector 8.714291 16.883753 0.0
        , Vector.vector 7.403794 17.498108 0.0
        , Vector.vector 6.081836 18.000315 0.0
        , Vector.vector 4.771792 18.391031 0.0
        , Vector.vector 3.494205 18.675934 0.0
        , Vector.vector 2.265655 18.864433 0.0
        , Vector.vector 1.098299 18.968227 0.0
        , Vector.vector -0.888536 18.968229 0.645552
        , Vector.vector -1.832941 18.864435 1.331694
        , Vector.vector -2.826854 18.675941 2.053805
        , Vector.vector -3.860437 18.391043 2.804739
        , Vector.vector -4.92028 18.000332 3.574751
        , Vector.vector -5.989764 17.498138 4.351768
        , Vector.vector -7.049977 16.883793 5.122048
        , Vector.vector -8.08113 16.16243 5.871217
        , Vector.vector -9.064271 15.345035 6.585502
        , Vector.vector -9.982973 14.447652 7.252971
        , Vector.vector -10.824671 13.489858 7.864493
        , Vector.vector -11.581386 12.492859 8.414271
        , Vector.vector -12.249792 11.477567 8.899891
        , Vector.vector -12.830698 10.463016 9.321939
        , Vector.vector -13.328172 9.465317 9.683371
        , Vector.vector -0.888536 18.968229 -0.645552
        , Vector.vector -1.832941 18.864435 -1.331694
        , Vector.vector -2.826854 18.675941 -2.053805
        , Vector.vector -3.860437 18.391043 -2.804739
        , Vector.vector -4.92028 18.000332 -3.574751
        , Vector.vector -5.989764 17.498138 -4.351768
        , Vector.vector -7.049977 16.883793 -5.122048
        , Vector.vector -8.08113 16.16243 -5.871217
        , Vector.vector -9.064271 15.345035 -6.585502
        , Vector.vector -9.982973 14.447652 -7.252971
        , Vector.vector -10.824671 13.489858 -7.864493
        , Vector.vector -11.581386 12.492859 -8.414271
        , Vector.vector -12.249792 11.477567 -8.899891
        , Vector.vector -12.830698 10.463016 -9.321939
        , Vector.vector -13.328172 9.465317 -9.683371
        , Vector.vector 0.339384 18.968229 -1.044533
        , Vector.vector 0.700107 18.864437 -2.154744
        , Vector.vector 1.07974 18.675941 -3.323155
        , Vector.vector 1.474526 18.391045 -4.538202
        , Vector.vector 1.879342 18.000334 -5.784118
        , Vector.vector 2.28784 17.49814 -7.041368
        , Vector.vector 2.692798 16.883795 -8.287719
        , Vector.vector 3.086656 16.162434 -9.499909
        , Vector.vector 3.462175 15.345041 -10.655659
        , Vector.vector 3.813082 14.447657 -11.735655
        , Vector.vector 4.134575 13.489863 -12.725127
        , Vector.vector 4.423609 12.492866 -13.614699
        , Vector.vector 4.678912 11.477572 -14.400455
        , Vector.vector 4.900794 10.463021 -15.083348
        , Vector.vector 5.090809 9.465323 -15.668164
        , Vector.vector -3.99414 -9.786963 15.78804
        , Vector.vector -3.756179 -10.814033 15.164029
        , Vector.vector -2.808956 -10.090418 15.85223
        , Vector.vector -3.487107 -11.852843 14.43434
        , Vector.vector -2.520998 -11.140354 15.183448
        , Vector.vector -1.540906 -10.366079 15.848345
        , Vector.vector -3.18682 -12.884906 13.594978
        , Vector.vector -2.204229 -12.195368 14.401887
        , Vector.vector -1.203007 -11.430505 15.12932
        , Vector.vector -0.200612 -10.603651 15.764591
        , Vector.vector -2.856719 -13.888922 12.64662
        , Vector.vector -1.860377 -13.234663 13.504913
        , Vector.vector -0.840528 -12.491852 14.291508
        , Vector.vector 0.184469 -11.672545 14.990585
        , Vector.vector 1.195973 -10.792953 15.591083
        , Vector.vector -2.499928 -14.842216 11.595646
        , Vector.vector -1.492847 -14.234991 12.495458
        , Vector.vector -0.457321 -13.527299 13.334278
        , Vector.vector 0.58771 -12.728972 14.093539
        , Vector.vector 1.62241 -11.85516 14.758826
        , Vector.vector 2.627887 -10.924936 15.321229
        , Vector.vector -2.121294 -15.722686 10.454534
        , Vector.vector -1.106732 -15.172484 11.38292
        , Vector.vector -0.058918 -14.512216 12.263446
        , Vector.vector 1.003017 -13.748625 13.075521
        , Vector.vector 2.058367 -12.894765 13.801746
        , Vector.vector 3.086806 -11.968927 14.429705
        , Vector.vector 4.070293 -10.992766 14.952988
        , Vector.vector -1.727138 -16.510998 9.241426
        , Vector.vector -0.708573 -16.024958 10.183254
        , Vector.vector 0.347727 -15.422361 11.091882
        , Vector.vector 1.422861 -14.706291 11.945732
        , Vector.vector 2.495661 -13.886748 12.725165
        , Vector.vector 3.544681 -12.980125 13.414603
        , Vector.vector 4.550282 -12.007584 14.004031
        , Vector.vector 5.49638 -10.992765 14.489613
        , Vector.vector -1.324757 -17.19256 7.978779
        , Vector.vector -0.305851 -16.774248 8.91802
        , Vector.vector 0.754763 -16.236435 9.839135
        , Vector.vector 1.838826 -15.578345 10.720722
        , Vector.vector 2.925185 -14.806291 11.541969
        , Vector.vector 3.991686 -13.933722 12.284863
        , Vector.vector 5.017367 -12.980123 12.93609
        , Vector.vector 5.984458 -11.968923 13.488185
        , Vector.vector 6.879752 -10.924931 13.93969
        , Vector.vector -0.921763 -17.758839 6.691336
        , Vector.vector 0.093688 -17.408068 7.61252
        , Vector.vector 1.154156 -16.93837 8.529922
        , Vector.vector 2.242392 -16.345356 9.423428
        , Vector.vector 3.337737 -15.631398 10.272243
        , Vector.vector 4.417833 -14.806285 11.056974
        , Vector.vector 5.460794 -13.886741 11.761724
        , Vector.vector 6.447371 -12.894754 12.375649
        , Vector.vector 7.362625 -11.855148 12.893688
        , Vector.vector 8.196803 -10.792944 13.316335
        , Vector.vector -0.525395 -18.207767 5.403814
        , Vector.vector 0.482767 -17.920963 6.293332
        , Vector.vector 1.538473 -17.518902 7.191743
        , Vector.vector 2.625775 -16.994156 8.08109
        , Vector.vector 3.724957 -16.345352 8.94171
        , Vector.vector 4.813987 -15.578334 9.754025
        , Vector.vector 5.870559 -14.706275 10.500571
        , Vector.vector 6.874296 -13.748609 11.167803
        , Vector.vector 7.808663 -12.728955 11.747277
        , Vector.vector 8.662159 -11.67253 12.235972
        , Vector.vector 9.428642 -10.603641 12.635804
        , Vector.vector -0.141941 -18.543198 4.138804
        , Vector.vector 0.85518 -18.314205 4.985833
        , Vector.vector 1.901534 -17.975996 5.852156
        , Vector.vector 2.982662 -17.518896 6.722498
        , Vector.vector 4.080154 -16.93836 7.579203
        , Vector.vector 5.172817 -16.236418 8.403613
        , Vector.vector 6.23847 -15.422341 9.177849
        , Vector.vector 7.256084 -14.512192 9.886634
        , Vector.vector 8.20782 -13.527277 10.518769
        , Vector.vector 9.080483 -12.491829 11.067929
        , Vector.vector 9.866188 -11.430486 11.532666
        , Vector.vector 10.562182 -10.366066 11.915746
        , Vector.vector 0.223631 -18.773691 2.915224
        , Vector.vector 1.206187 -18.594757 3.712153
        , Vector.vector 2.238826 -18.314203 4.536261
        , Vector.vector 3.308658 -17.920956 5.375145
        , Vector.vector 4.398841 -17.408052 6.213688
        , Vector.vector 5.48944 -16.774225 7.035008
        , Vector.vector 6.558942 -16.024933 7.821881
        , Vector.vector 7.586212 -15.172455 8.558388
        , Vector.vector 8.552522 -14.234961 9.231485
        , Vector.vector 9.443203 -13.234632 9.832112
        , Vector.vector 10.248611 -12.195341 10.355659
        , Vector.vector 10.964268 -11.140333 10.80175
        , Vector.vector 11.59033 -10.090405 11.17354
        , Vector.vector 0.567822 -18.910944 1.747524
        , Vector.vector 1.532653 -18.773687 2.489899
        , Vector.vector 2.547626 -18.54319 3.264914
        , Vector.vector 3.601417 -18.207754 4.062935
        , Vector.vector 4.678887 -17.758823 4.871577
        , Vector.vector 5.761666 -17.192535 5.676257
        , Vector.vector 6.829374 -16.510969 6.461236
        , Vector.vector 7.861306 -15.722651 7.21097
        , Vector.vector 8.83836 -14.842178 7.911582
        , Vector.vector 9.744758 -13.888885 8.552109
        , Vector.vector 10.569244 -12.88487 9.125305
        , Vector.vector 11.305547 -11.852812 9.62785
        , Vector.vector 11.952128 -10.814011 10.060013
        , Vector.vector 12.511422 -9.786947 10.424967
        , Vector.vector 13.781069 -9.786953 -8.677426
        , Vector.vector 14.20836 -10.090404 -7.570093
        , Vector.vector 13.261135 -10.814023 -8.258284
        , Vector.vector 14.596512 -10.366059 -6.362917
        , Vector.vector 13.661292 -11.140338 -7.089566
        , Vector.vector 12.650307 -11.852833 -7.776897
        , Vector.vector 14.931032 -10.603625 -5.062353
        , Vector.vector 14.017096 -11.430483 -5.819368
        , Vector.vector 13.015872 -12.195351 -6.546789
        , Vector.vector 11.944818 -12.884894 -7.231931
        , Vector.vector 15.197584 -10.792923 -3.680519
        , Vector.vector 14.313908 -11.672522 -4.456943
        , Vector.vector 13.332303 -12.491831 -5.215735
        , Vector.vector 12.269056 -13.234646 -5.942589
        , Vector.vector 11.144885 -13.88891 -6.62493
        , Vector.vector 15.383429 -10.924904 -2.235314
        , Vector.vector 14.537844 -11.855131 -3.017779
        , Vector.vector 13.585376 -12.728947 -3.796241
        , Vector.vector 12.540342 -13.52728 -4.555489
        , Vector.vector 11.422581 -14.234977 -5.28111
        , Vector.vector 10.255606 -14.842206 -5.960835
        , Vector.vector 15.478942 -10.992735 -0.749729
        , Vector.vector 14.677357 -11.968899 -1.523367
        , Vector.vector 13.762323 -12.894737 -2.307409
        , Vector.vector 12.745522 -13.748602 -3.086679
        , Vector.vector 11.645036 -14.512196 -3.845682
        , Vector.vector 10.48381 -15.172469 -4.570103
        , Vector.vector 9.287347 -15.722677 -5.24811
        , Vector.vector 15.478946 -10.992734 0.749735
        , Vector.vector 14.724764 -12.007554 0.000005
        , Vector.vector 13.853434 -12.980099 -0.774223
        , Vector.vector 12.873572 -13.886726 -1.55884
        , Vector.vector 11.80077 -14.706269 -2.338263
        , Vector.vector 10.656474 -15.422345 -3.096908
        , Vector.vector 9.4659 -16.024946 -3.820715
        , Vector.vector 8.255413 -16.51099 -4.498375
        , Vector.vector 15.38343 -10.924901 2.23532
        , Vector.vector 14.677361 -11.968896 1.523377
        , Vector.vector 13.853436 -12.980097 0.774238
        , Vector.vector 12.917123 -13.933697 0.000009
        , Vector.vector 11.881021 -14.806271 -0.784714
        , Vector.vector 10.76426 -15.578326 -1.56411
        , Vector.vector 9.590824 -16.236418 -2.322676
        , Vector.vector 8.387041 -16.774235 -3.046727
        , Vector.vector 7.178908 -17.192553 -3.725509
        , Vector.vector 15.197588 -10.79292 3.680525
        , Vector.vector 14.537847 -11.855124 3.017788
        , Vector.vector 13.76233 -12.89473 2.307423
        , Vector.vector 12.873578 -13.88672 1.558859
        , Vector.vector 11.881023 -14.806265 0.784736
        , Vector.vector 10.800926 -15.631377 0.000012
        , Vector.vector 9.655172 -16.345341 -0.779411
        , Vector.vector 8.46911 -16.938356 -1.538262
        , Vector.vector 7.268902 -17.408056 -2.26332
        , Vector.vector 6.07901 -17.758833 -2.944398
        , Vector.vector 14.931035 -10.603619 5.062359
        , Vector.vector 14.313913 -11.672509 4.456953
        , Vector.vector 13.585385 -12.728933 3.796256
        , Vector.vector 12.745535 -13.748588 3.086698
        , Vector.vector 11.800782 -14.706256 2.338285
        , Vector.vector 10.764272 -15.578317 1.564135
        , Vector.vector 9.655178 -16.345335 0.779438
        , Vector.vector 8.49701 -16.994141 0.000014
        , Vector.vector 7.315191 -17.518894 -0.759234
        , Vector.vector 6.134513 -17.920954 -1.485633
        , Vector.vector 4.976987 -18.207762 -2.169563
        , Vector.vector 14.596514 -10.36605 6.362921
        , Vector.vector 14.017104 -11.43047 5.819377
        , Vector.vector 13.332314 -12.491815 5.215749
        , Vector.vector 12.540358 -13.527263 4.555507
        , Vector.vector 11.645052 -14.51218 3.845704
        , Vector.vector 10.65649 -15.422328 3.096933
        , Vector.vector 9.590838 -16.236406 2.322703
        , Vector.vector 8.469119 -16.938349 1.53829
        , Vector.vector 7.315195 -17.518888 0.759262
        , Vector.vector 6.153358 -17.975988 0.000013
        , Vector.vector 5.00609 -18.314199 -0.727408
        , Vector.vector 3.892383 -18.543196 -1.413967
        , Vector.vector 14.208363 -10.090394 7.570099
        , Vector.vector 13.661301 -11.140322 7.089575
        , Vector.vector 13.015886 -12.195332 6.546803
        , Vector.vector 12.269074 -13.234622 5.942606
        , Vector.vector 11.422602 -14.234949 5.281132
        , Vector.vector 10.483837 -15.172445 4.570128
        , Vector.vector 9.465926 -16.024925 3.820743
        , Vector.vector 8.387065 -16.77422 3.046756
        , Vector.vector 7.268922 -17.408045 2.263349
        , Vector.vector 6.134528 -17.920948 1.48566
        , Vector.vector 5.006098 -18.314198 0.727432
        , Vector.vector 3.903215 -18.594755 0.000011
        , Vector.vector 2.841657 -18.773687 -0.688179
        , Vector.vector 13.781072 -9.786943 8.677431
        , Vector.vector 13.261143 -10.814003 8.258292
        , Vector.vector 12.650322 -11.852808 7.776909
        , Vector.vector 11.944839 -12.884866 7.231948
        , Vector.vector 11.144909 -13.888879 6.624951
        , Vector.vector 10.255632 -14.842175 5.960859
        , Vector.vector 9.287378 -15.72265 5.248138
        , Vector.vector 8.255446 -16.510967 4.498405
        , Vector.vector 7.178939 -17.192533 3.725539
        , Vector.vector 6.079036 -17.75882 2.944427
        , Vector.vector 4.97701 -18.207752 2.169589
        , Vector.vector 3.892399 -18.54319 1.413989
        , Vector.vector 2.841665 -18.773687 0.688197
        , Vector.vector 1.837468 -18.910944 0.000006
        , Vector.vector -16.24963 -9.786882 1.08003
        , Vector.vector -15.582635 -10.813951 1.113519
        , Vector.vector -15.944443 -10.090343 2.227037
        , Vector.vector -14.805521 -11.852762 1.14394
        , Vector.vector -15.219419 -11.140278 2.294242
        , Vector.vector -15.548905 -10.366008 3.43182
        , Vector.vector -13.914453 -12.884828 1.170158
        , Vector.vector -14.378229 -12.195292 2.353998
        , Vector.vector -14.760665 -11.430434 3.530997
        , Vector.vector -15.055086 -10.603588 4.680633
        , Vector.vector -12.910509 -13.888849 1.19105
        , Vector.vector -13.418907 -13.234594 2.403847
        , Vector.vector -13.85185 -12.491786 3.616844
        , Vector.vector -14.19997 -11.672485 4.807693
        , Vector.vector -14.458505 -10.792898 5.955248
        , Vector.vector -11.80072 -14.842152 1.205616
        , Vector.vector -12.345287 -14.234929 2.441456
        , Vector.vector -12.823058 -13.527242 3.685502
        , Vector.vector -13.222225 -12.728916 4.914003
        , Vector.vector -13.535212 -11.85511 6.103642
        , Vector.vector -13.759377 -10.924891 7.233694
        , Vector.vector -10.598454 -15.722632 1.213103
        , Vector.vector -11.167886 -15.172431 2.464889
        , Vector.vector -11.681523 -14.512163 3.73351
        , Vector.vector -12.125695 -13.748575 4.994409
        , Vector.vector -12.490256 -12.89472 6.222517
        , Vector.vector -12.769676 -11.968887 7.394668
        , Vector.vector -12.963431 -10.992732 8.491718
        , Vector.vector -9.322916 -16.510954 1.213104
        , Vector.vector -9.903895 -16.024916 2.472852
        , Vector.vector -10.441638 -15.422319 3.758229
        , Vector.vector -10.921463 -14.70625 5.044591
        , Vector.vector -11.331236 -13.886712 6.305739
        , Vector.vector -11.662764 -12.980092 7.516459
        , Vector.vector -11.912595 -12.007553 8.654982
        , Vector.vector -12.082051 -10.992741 9.704828
        , Vector.vector -7.997719 -17.192528 1.205619
        , Vector.vector -8.576132 -16.774214 2.464893
        , Vector.vector -9.124417 -16.236401 3.758232
        , Vector.vector -9.627864 -15.578314 5.061659
        , Vector.vector -10.073214 -14.80626 6.348623
        , Vector.vector -10.45018 -13.933695 7.592489
        , Vector.vector -10.752582 -12.980101 8.769208
        , Vector.vector -10.978808 -11.968904 9.859571
        , Vector.vector -11.131554 -10.924913 10.850567
        , Vector.vector -6.648747 -17.758818 1.191054
        , Vector.vector -7.211053 -17.408045 2.441464
        , Vector.vector -7.755853 -16.938349 3.733518
        , Vector.vector -8.269345 -16.345335 5.044597
        , Vector.vector -8.738135 -15.631375 6.348626
        , Vector.vector -9.150694 -14.806267 7.618352
        , Vector.vector -9.498659 -13.886724 8.828045
        , Vector.vector -9.777668 -12.894741 9.956047
        , Vector.vector -9.987524 -11.855139 10.986588
        , Vector.vector -10.131709 -10.792935 11.910542
        , Vector.vector -5.301744 -18.207752 1.170164
        , Vector.vector -5.836187 -17.92095 2.403857
        , Vector.vector -6.364397 -17.518887 3.685515
        , Vector.vector -6.874224 -16.994139 4.994421
        , Vector.vector -7.353057 -16.345339 6.305749
        , Vector.vector -7.789086 -15.578322 7.592496
        , Vector.vector -8.172596 -14.706266 8.828049
        , Vector.vector -8.497 -13.748601 9.988843
        , Vector.vector -8.759376 -12.728949 11.056544
        , Vector.vector -8.96041 -11.672527 12.019284
        , Vector.vector -9.103815 -10.603638 12.871808
        , Vector.vector -3.98014 -18.54319 1.143948
        , Vector.vector -4.477588 -18.314198 2.354011
        , Vector.vector -4.97817 -17.975988 3.616861
        , Vector.vector -5.471829 -17.518888 4.914022
        , Vector.vector -5.94746 -16.938351 6.222534
        , Vector.vector -6.393871 -16.23641 7.516474
        , Vector.vector -6.80091 -15.422335 8.76922
        , Vector.vector -7.160544 -14.512187 9.956056
        , Vector.vector -7.467639 -13.527271 11.05655
        , Vector.vector -7.720252 -12.491825 12.0562
        , Vector.vector -7.919447 -11.430485 12.94706
        , Vector.vector -8.068705 -10.366067 13.727368
        , Vector.vector -2.703465 -18.773687 1.113527
        , Vector.vector -3.157764 -18.594753 2.294257
        , Vector.vector -3.622436 -18.314199 3.531017
        , Vector.vector -4.089668 -17.920952 4.807715
        , Vector.vector -4.550285 -17.408051 6.103664
        , Vector.vector -4.994394 -16.774225 7.394686
        , Vector.vector -5.412261 -16.024931 8.654999
        , Vector.vector -5.795278 -15.172455 9.859581
        , Vector.vector -6.136827 -14.234962 10.986595
        , Vector.vector -6.432821 -13.234634 12.019287
        , Vector.vector -6.681857 -12.195344 12.94706
        , Vector.vector -6.884967 -11.140337 13.765542
        , Vector.vector -7.045096 -10.090408 14.475851
        , Vector.vector -1.486541 -18.910942 1.08004
        , Vector.vector -1.894434 -18.773687 2.227054
        , Vector.vector -2.317874 -18.54319 3.431842
        , Vector.vector -2.751199 -18.207756 4.680659
        , Vector.vector -3.187307 -17.758823 5.955276
        , Vector.vector -3.618007 -17.192535 7.23372
        , Vector.vector -4.034628 -16.510969 8.49174
        , Vector.vector -4.428783 -15.722652 9.704845
        , Vector.vector -4.793179 -14.842182 10.85058
        , Vector.vector -5.122265 -13.888888 11.91055
        , Vector.vector -5.412627 -12.884873 12.871811
        , Vector.vector -5.663044 -11.852818 13.727369
        , Vector.vector -5.874251 -10.814014 14.475852
        , Vector.vector -6.048513 -9.786955 15.12055
        , Vector.vector -6.048512 -9.786963 -15.120544
        , Vector.vector -5.874249 -10.814033 -14.475838
        , Vector.vector -7.045095 -10.090418 -14.475845
        , Vector.vector -5.66304 -11.852843 -13.727347
        , Vector.vector -6.884966 -11.140352 -13.765529
        , Vector.vector -8.068705 -10.366076 -13.727364
        , Vector.vector -5.412621 -12.884904 -12.871781
        , Vector.vector -6.681856 -12.195366 -12.94704
        , Vector.vector -7.919447 -11.430502 -12.947046
        , Vector.vector -9.103815 -10.603645 -12.871801
        , Vector.vector -5.122256 -13.888923 -11.910514
        , Vector.vector -6.432817 -13.234663 -12.019258
        , Vector.vector -7.720252 -12.491849 -12.056178
        , Vector.vector -8.960411 -11.672541 -12.01927
        , Vector.vector -10.131709 -10.792944 -11.910537
        , Vector.vector -4.793169 -14.842216 -10.850535
        , Vector.vector -6.136821 -14.234991 -10.986559
        , Vector.vector -7.467637 -13.527298 -11.056518
        , Vector.vector -8.759377 -12.728967 -11.056523
        , Vector.vector -9.987524 -11.855148 -10.986573
        , Vector.vector -11.131552 -10.924919 -10.850561
        , Vector.vector -4.428772 -15.722686 -9.704797
        , Vector.vector -5.795272 -15.172484 -9.859541
        , Vector.vector -7.160542 -14.512214 -9.956019
        , Vector.vector -8.497002 -13.748619 -9.988814
        , Vector.vector -9.777672 -12.894754 -9.956027
        , Vector.vector -10.978811 -11.968911 -9.859557
        , Vector.vector -12.082053 -10.992743 -9.704822
        , Vector.vector -4.034615 -16.510998 -8.49169
        , Vector.vector -5.412253 -16.02496 -8.654954
        , Vector.vector -6.800906 -15.422361 -8.769178
        , Vector.vector -8.172596 -14.706284 -8.828014
        , Vector.vector -9.49866 -13.88674 -8.828018
        , Vector.vector -10.752584 -12.98011 -8.769188
        , Vector.vector -11.912597 -12.00756 -8.65497
        , Vector.vector -12.963431 -10.992736 -8.491713
        , Vector.vector -3.617994 -17.192558 -7.23367
        , Vector.vector -4.994387 -16.77425 -7.394641
        , Vector.vector -6.393867 -16.236431 -7.516431
        , Vector.vector -7.789087 -15.57834 -7.59246
        , Vector.vector -9.150696 -14.80628 -7.618321
        , Vector.vector -10.450183 -13.933705 -7.592465
        , Vector.vector -11.662766 -12.980099 -7.516442
        , Vector.vector -12.769679 -11.968893 -7.394657
        , Vector.vector -13.759377 -10.924892 -7.233689
        , Vector.vector -3.187295 -17.758841 -5.955229
        , Vector.vector -4.550277 -17.408068 -6.103621
        , Vector.vector -5.947457 -16.93837 -6.222494
        , Vector.vector -7.353057 -16.345352 -6.305713
        , Vector.vector -8.738139 -15.631388 -6.348596
        , Vector.vector -10.073216 -14.806269 -6.348598
        , Vector.vector -11.331239 -13.88672 -6.305719
        , Vector.vector -12.490259 -12.894725 -6.222503
        , Vector.vector -13.535214 -11.855111 -6.103633
        , Vector.vector -14.458505 -10.792897 -5.955245
        , Vector.vector -2.751189 -18.207767 -4.680618
        , Vector.vector -4.089659 -17.920961 -4.807676
        , Vector.vector -5.471824 -17.518902 -4.913985
        , Vector.vector -6.874222 -16.99415 -4.994388
        , Vector.vector -8.269346 -16.345345 -5.044568
        , Vector.vector -9.627865 -15.578321 -5.061634
        , Vector.vector -10.921465 -14.706253 -5.04457
        , Vector.vector -12.125699 -13.748579 -4.994393
        , Vector.vector -13.222228 -12.728919 -4.913993
        , Vector.vector -14.199973 -11.672486 -4.807687
        , Vector.vector -15.055087 -10.603588 -4.68063
        , Vector.vector -2.317866 -18.543198 -3.43181
        , Vector.vector -3.62243 -18.314205 -3.530985
        , Vector.vector -4.978167 -17.975994 -3.61683
        , Vector.vector -6.364398 -17.518894 -3.685487
        , Vector.vector -7.755853 -16.938351 -3.733492
        , Vector.vector -9.12442 -16.236404 -3.75821
        , Vector.vector -10.441641 -15.422321 -3.75821
        , Vector.vector -11.681528 -14.512165 -3.733495
        , Vector.vector -12.823063 -13.527241 -3.685491
        , Vector.vector -13.851852 -12.491785 -3.616836
        , Vector.vector -14.760666 -11.430434 -3.530992
        , Vector.vector -15.548906 -10.366007 -3.431818
        , Vector.vector -1.894429 -18.773691 -2.227032
        , Vector.vector -3.157761 -18.594759 -2.294235
        , Vector.vector -4.477587 -18.314201 -2.35399
        , Vector.vector -5.836189 -17.92095 -2.403837
        , Vector.vector -7.211054 -17.408045 -2.441446
        , Vector.vector -8.576137 -16.774216 -2.464877
        , Vector.vector -9.903898 -16.024914 -2.472838
        , Vector.vector -11.167892 -15.172431 -2.464877
        , Vector.vector -12.345291 -14.234925 -2.441447
        , Vector.vector -13.418911 -13.234591 -2.40384
        , Vector.vector -14.378233 -12.195291 -2.353993
        , Vector.vector -15.219419 -11.140276 -2.294239
        , Vector.vector -15.944445 -10.090342 -2.227036
        , Vector.vector -1.486539 -18.910942 -1.080028
        , Vector.vector -2.703465 -18.773687 -1.113516
        , Vector.vector -3.980142 -18.54319 -1.143937
        , Vector.vector -5.301748 -18.207752 -1.170154
        , Vector.vector -6.648751 -17.758816 -1.191045
        , Vector.vector -7.997725 -17.192526 -1.20561
        , Vector.vector -9.322922 -16.510952 -1.213096
        , Vector.vector -10.59846 -15.722628 -1.213096
        , Vector.vector -11.800727 -14.842148 -1.20561
        , Vector.vector -12.910515 -13.888845 -1.191045
        , Vector.vector -13.914456 -12.884822 -1.170155
        , Vector.vector -14.805524 -11.852759 -1.143938
        , Vector.vector -15.582636 -10.813948 -1.113518
        , Vector.vector -16.249632 -9.78688 -1.08003
        , Vector.vector 12.511417 -9.786957 -10.424964
        , Vector.vector 11.952117 -10.814027 -10.060006
        , Vector.vector 11.590323 -10.090412 -11.173539
        , Vector.vector 11.305529 -11.852839 -9.627841
        , Vector.vector 10.964256 -11.140349 -10.801747
        , Vector.vector 10.562174 -10.366075 -11.915747
        , Vector.vector 10.56922 -12.884899 -9.125294
        , Vector.vector 10.24859 -12.195362 -10.355654
        , Vector.vector 9.866172 -11.430497 -11.532664
        , Vector.vector 9.428633 -10.603645 -12.635804
        , Vector.vector 9.744727 -13.888915 -8.552094
        , Vector.vector 9.443175 -13.234657 -9.832105
        , Vector.vector 9.080461 -12.491846 -11.067926
        , Vector.vector 8.662142 -11.672541 -12.235975
        , Vector.vector 8.196794 -10.792948 -13.316339
        , Vector.vector 8.838324 -14.842211 -7.911565
        , Vector.vector 8.552487 -14.234984 -9.231476
        , Vector.vector 8.207792 -13.527295 -10.518767
        , Vector.vector 7.80864 -12.728967 -11.747279
        , Vector.vector 7.362608 -11.855155 -12.893694
        , Vector.vector 6.879742 -10.924932 -13.939692
        , Vector.vector 7.861265 -15.722682 -7.210951
        , Vector.vector 7.586173 -15.172479 -8.558378
        , Vector.vector 7.256048 -14.512211 -9.88663
        , Vector.vector 6.874265 -13.74862 -11.167807
        , Vector.vector 6.447347 -12.894759 -12.375656
        , Vector.vector 5.98444 -11.968924 -13.488191
        , Vector.vector 5.496371 -10.992764 -14.489617
        , Vector.vector 6.829332 -16.510994 -6.461216
        , Vector.vector 6.558903 -16.024954 -7.82187
        , Vector.vector 6.238431 -15.422358 -9.177846
        , Vector.vector 5.870525 -14.706286 -10.500576
        , Vector.vector 5.460765 -13.886747 -11.761732
        , Vector.vector 5.017344 -12.980124 -12.936098
        , Vector.vector 4.550265 -12.007583 -14.004038
        , Vector.vector 4.070284 -10.992764 -14.952991
        , Vector.vector 5.761625 -17.192556 -5.676237
        , Vector.vector 5.489401 -16.774244 -7.035
        , Vector.vector 5.172778 -16.236429 -8.403613
        , Vector.vector 4.813951 -15.578341 -9.754032
        , Vector.vector 4.417799 -14.806289 -11.056983
        , Vector.vector 3.991658 -13.933721 -12.284875
        , Vector.vector 3.544658 -12.980121 -13.414615
        , Vector.vector 3.08679 -11.968923 -14.429714
        , Vector.vector 2.627879 -10.924932 -15.321233
        , Vector.vector 4.678847 -17.758837 -4.87156
        , Vector.vector 4.398801 -17.408064 -6.213682
        , Vector.vector 4.080115 -16.938368 -7.579206
        , Vector.vector 3.724919 -16.345354 -8.941719
        , Vector.vector 3.337701 -15.631395 -10.272255
        , Vector.vector 2.925153 -14.806285 -11.541985
        , Vector.vector 2.495635 -13.886741 -12.725183
        , Vector.vector 2.058346 -12.894753 -13.801759
        , Vector.vector 1.622395 -11.85515 -14.758837
        , Vector.vector 1.195966 -10.792946 -15.591085
        , Vector.vector 3.601383 -18.207766 -4.062923
        , Vector.vector 3.308622 -17.920961 -5.375144
        , Vector.vector 2.982625 -17.5189 -6.722506
        , Vector.vector 2.625739 -16.994152 -8.081106
        , Vector.vector 2.242357 -16.345352 -9.42345
        , Vector.vector 1.838794 -15.578334 -10.720746
        , Vector.vector 1.422832 -14.706275 -11.945754
        , Vector.vector 1.002993 -13.748608 -13.075541
        , Vector.vector 0.587691 -12.728955 -14.093557
        , Vector.vector 0.184456 -11.672533 -14.990598
        , Vector.vector -0.200618 -10.603643 -15.764598
        , Vector.vector 2.547598 -18.543196 -3.264906
        , Vector.vector 2.238795 -18.314205 -4.536263
        , Vector.vector 1.901503 -17.975994 -5.852168
        , Vector.vector 1.538441 -17.518896 -7.191763
        , Vector.vector 1.154124 -16.93836 -8.529945
        , Vector.vector 0.754732 -16.236418 -9.839161
        , Vector.vector 0.347699 -15.422342 -11.091909
        , Vector.vector -0.058943 -14.512194 -12.263471
        , Vector.vector -0.457342 -13.527279 -13.334299
        , Vector.vector -0.840543 -12.491831 -14.291523
        , Vector.vector -1.203017 -11.43049 -15.129333
        , Vector.vector -1.540911 -10.366071 -15.84835
        , Vector.vector 1.532633 -18.773691 -2.489898
        , Vector.vector 1.206164 -18.594759 -3.712162
        , Vector.vector 0.855154 -18.314203 -4.985852
        , Vector.vector 0.48274 -17.920954 -6.293358
        , Vector.vector 0.09366 -17.408052 -7.61255
        , Vector.vector -0.305879 -16.774227 -8.918055
        , Vector.vector -0.708599 -16.024933 -10.183288
        , Vector.vector -1.106756 -15.172457 -11.382953
        , Vector.vector -1.492867 -14.234962 -12.495487
        , Vector.vector -1.860393 -13.234636 -13.504938
        , Vector.vector -2.204241 -12.195345 -14.401906
        , Vector.vector -2.521005 -11.140337 -15.183459
        , Vector.vector -2.808959 -10.090408 -15.852237
        , Vector.vector 0.56781 -18.910944 -1.747528
        , Vector.vector 0.223616 -18.773687 -2.915239
        , Vector.vector -0.14196 -18.543192 -4.138829
        , Vector.vector -0.525415 -18.207756 -5.403848
        , Vector.vector -0.921785 -17.758821 -6.691375
        , Vector.vector -1.32478 -17.192539 -7.978823
        , Vector.vector -1.72716 -16.510971 -9.241469
        , Vector.vector -2.121315 -15.722657 -10.454576
        , Vector.vector -2.499947 -14.842184 -11.595683
        , Vector.vector -2.856735 -13.888888 -12.646651
        , Vector.vector -3.186832 -12.884873 -13.595003
        , Vector.vector -3.487116 -11.852818 -14.434361
        , Vector.vector -3.756185 -10.814016 -15.164042
        , Vector.vector -3.994143 -9.786955 -15.788046
        , Vector.vector 17.736189 6.813777 0.0
        , Vector.vector 18.062521 5.85421 0.688187
        , Vector.vector 18.062521 5.85421 -0.688187
        , Vector.vector 18.326263 4.811317 1.413977
        , Vector.vector 18.377222 4.824697 0.0
        , Vector.vector 18.326262 4.811318 -1.413976
        , Vector.vector 18.511293 3.691192 2.169576
        , Vector.vector 18.619511 3.712771 0.72742
        , Vector.vector 18.619511 3.712771 -0.727419
        , Vector.vector 18.511293 3.691192 -2.169575
        , Vector.vector 18.6026 2.504728 2.944414
        , Vector.vector 18.77243 2.527595 1.485647
        , Vector.vector 18.83008 2.535357 0.000001
        , Vector.vector 18.77243 2.527595 -1.485646
        , Vector.vector 18.6026 2.504729 -2.944413
        , Vector.vector 18.587992 1.26768 3.725529
        , Vector.vector 18.820992 1.28357 2.263337
        , Vector.vector 18.940828 1.291743 0.75925
        , Vector.vector 18.940828 1.291743 -0.759248
        , Vector.vector 18.820992 1.283571 -2.263336
        , Vector.vector 18.587992 1.267681 -3.725527
        , Vector.vector 18.459806 -0.000001 4.498397
        , Vector.vector 18.754128 -0.0 3.046746
        , Vector.vector 18.937628 -0.0 1.538279
        , Vector.vector 19.0 0.0 0.000001
        , Vector.vector 18.937628 0.0 -1.538277
        , Vector.vector 18.754128 0.0 -3.046744
        , Vector.vector 18.459806 0.000001 -4.498395
        , Vector.vector 18.216202 -1.275554 5.248132
        , Vector.vector 18.566416 -1.300076 3.820736
        , Vector.vector 18.811432 -1.317233 2.322694
        , Vector.vector 18.937634 -1.32607 0.779426
        , Vector.vector 18.937634 -1.32607 -0.779425
        , Vector.vector 18.811432 -1.317233 -2.322693
        , Vector.vector 18.566416 -1.300076 -3.820735
        , Vector.vector 18.216204 -1.275553 -5.248131
        , Vector.vector 17.861692 -2.535366 5.960857
        , Vector.vector 18.259153 -2.591783 4.570125
        , Vector.vector 18.559866 -2.634468 3.096927
        , Vector.vector 18.747587 -2.661113 1.564125
        , Vector.vector 18.811438 -2.670177 0.0
        , Vector.vector 18.747587 -2.661113 -1.564125
        , Vector.vector 18.559866 -2.634467 -3.096926
        , Vector.vector 18.259151 -2.591782 -4.570123
        , Vector.vector 17.861692 -2.535365 -5.960856
        , Vector.vector 17.406727 -3.757105 6.624953
        , Vector.vector 17.840448 -3.85072 5.281131
        , Vector.vector 18.187889 -3.925713 3.845701
        , Vector.vector 18.431122 -3.978213 2.338279
        , Vector.vector 18.556456 -4.005265 0.784727
        , Vector.vector 18.556456 -4.005265 -0.784726
        , Vector.vector 18.431122 -3.978213 -2.338277
        , Vector.vector 18.187891 -3.925713 -3.8457
        , Vector.vector 17.840448 -3.85072 -5.28113
        , Vector.vector 17.406729 -3.757105 -6.624952
        , Vector.vector 16.866436 -4.921612 7.231952
        , Vector.vector 17.32427 -5.055207 5.942609
        , Vector.vector 17.707333 -5.166985 4.555506
        , Vector.vector 17.997051 -5.251525 3.086694
        , Vector.vector 18.17786 -5.304285 1.558852
        , Vector.vector 18.239349 -5.322227 0.0
        , Vector.vector 18.17786 -5.304285 -1.558852
        , Vector.vector 17.997051 -5.251525 -3.086693
        , Vector.vector 17.707335 -5.166985 -4.555506
        , Vector.vector 17.32427 -5.055207 -5.942608
        , Vector.vector 16.866436 -4.92161 -7.231951
        , Vector.vector 16.258821 -6.01418 7.776914
        , Vector.vector 16.728668 -6.187977 6.546805
        , Vector.vector 17.135359 -6.338413 5.215749
        , Vector.vector 17.460621 -6.458729 3.796253
        , Vector.vector 17.688044 -6.542853 2.307419
        , Vector.vector 17.80514 -6.586167 0.774231
        , Vector.vector 17.80514 -6.586167 -0.774232
        , Vector.vector 17.688044 -6.542853 -2.30742
        , Vector.vector 17.460621 -6.458729 -3.796253
        , Vector.vector 17.135359 -6.338413 -5.215749
        , Vector.vector 16.728668 -6.187977 -6.546805
        , Vector.vector 16.258821 -6.01418 -7.776913
        , Vector.vector 15.602837 -7.025096 8.258296
        , Vector.vector 16.07366 -7.237082 7.089578
        , Vector.vector 16.492294 -7.425569 5.819379
        , Vector.vector 16.841515 -7.582805 4.456954
        , Vector.vector 17.104996 -7.701436 3.017788
        , Vector.vector 17.269146 -7.775343 1.523375
        , Vector.vector 17.324921 -7.800456 0.000001
        , Vector.vector 17.269146 -7.775343 -1.523373
        , Vector.vector 17.104996 -7.701436 -3.017786
        , Vector.vector 16.841515 -7.582805 -4.456952
        , Vector.vector 16.492294 -7.425569 -5.819378
        , Vector.vector 16.07366 -7.237082 -7.089578
        , Vector.vector 15.602837 -7.025096 -8.258295
        , Vector.vector 14.916708 -7.949462 8.677432
        , Vector.vector 15.37921 -8.19594 7.570099
        , Vector.vector 15.799351 -8.419843 6.362922
        , Vector.vector 16.161438 -8.612807 5.062358
        , Vector.vector 16.449955 -8.766565 3.680523
        , Vector.vector 16.651114 -8.873768 2.235318
        , Vector.vector 16.754499 -8.928864 0.749732
        , Vector.vector 16.754499 -8.928864 -0.749733
        , Vector.vector 16.651114 -8.873768 -2.235319
        , Vector.vector 16.449955 -8.766565 -3.680524
        , Vector.vector 16.161436 -8.612806 -5.062359
        , Vector.vector 15.799348 -8.419842 -6.362922
        , Vector.vector 15.37921 -8.19594 -7.5701
        , Vector.vector 14.916708 -7.949463 -8.677432
        , Vector.vector 5.480711 6.813844 16.868116
        , Vector.vector 4.927047 5.854265 17.39114
        , Vector.vector 6.236081 5.854269 16.965813
        , Vector.vector 4.318282 4.811362 17.866261
        , Vector.vector 5.678825 4.824744 17.477781
        , Vector.vector 7.007874 4.811367 16.992365
        , Vector.vector 3.656842 3.691223 18.27573
        , Vector.vector 5.061879 3.712805 17.932999
        , Vector.vector 6.445538 3.712807 17.483423
        , Vector.vector 7.783691 3.69123 16.934845
        , Vector.vector 2.948143 2.504748 18.602007
        , Vector.vector 4.388017 2.527617 18.312738
        , Vector.vector 5.818792 2.535382 17.908476
        , Vector.vector 7.213934 2.52762 17.394547
        , Vector.vector 8.548845 2.504754 16.782236
        , Vector.vector 2.200747 1.267689 18.829489
        , Vector.vector 3.663399 1.283581 18.599245
        , Vector.vector 5.130927 1.291754 18.248425
        , Vector.vector 6.57513 1.291755 17.779175
        , Vector.vector 7.968592 1.283583 17.200405
        , Vector.vector 9.287238 1.267693 16.526955
        , Vector.vector 1.426098 -0.000001 18.946404
        , Vector.vector 2.897672 -0.0 18.777739
        , Vector.vector 4.389039 -0.0 18.486111
        , Vector.vector 5.871327 0.0 18.070072
        , Vector.vector 7.315066 0.0 17.535389
        , Vector.vector 8.69302 0.0 16.894716
        , Vector.vector 9.982687 0.000001 16.166197
        , Vector.vector 0.637783 -1.275561 18.946402
        , Vector.vector 2.103561 -1.300085 18.838387
        , Vector.vector 3.60402 -1.317243 18.608492
        , Vector.vector 5.110778 -1.326081 18.251617
        , Vector.vector 6.593357 -1.326081 17.769896
        , Vector.vector 8.022114 -1.317244 17.172962
        , Vector.vector 9.37114 -1.300087 16.476999
        , Vector.vector 10.620467 -1.275563 15.702821
        , Vector.vector -0.149602 -2.535379 18.829483
        , Vector.vector 1.295905 -2.591798 18.777731
        , Vector.vector 2.789945 -2.634485 18.608482
        , Vector.vector 4.305758 -2.661133 18.313353
        , Vector.vector 5.813083 -2.670197 17.890728
        , Vector.vector 7.280944 -2.661134 17.346649
        , Vector.vector 8.680734 -2.634487 16.694439
        , Vector.vector 9.988916 -2.591802 15.953185
        , Vector.vector 11.188771 -2.535383 15.145402
        , Vector.vector -0.921779 -3.757121 18.601997
        , Vector.vector 0.490315 -3.85074 18.59923
        , Vector.vector 1.962874 -3.925736 18.486095
        , Vector.vector 3.471702 -3.978238 18.2516
        , Vector.vector 4.987969 -4.005292 17.890718
        , Vector.vector 6.480627 -4.005293 17.405722
        , Vector.vector 7.919432 -3.97824 16.806435
        , Vector.vector 9.27793 -3.92574 16.109272
        , Vector.vector 10.53575 -3.850745 15.335243
        , Vector.vector 11.679782 -3.757128 14.507471
        , Vector.vector -1.66602 -4.921629 18.275721
        , Vector.vector -0.29829 -5.055229 18.312719
        , Vector.vector 1.139313 -5.16701 18.248394
        , Vector.vector 2.625784 -5.251554 18.070044
        , Vector.vector 4.13474 -5.304316 17.769867
        , Vector.vector 5.636318 -5.32226 17.346628
        , Vector.vector 7.099891 -5.304317 16.806421
        , Vector.vector 8.497097 -5.251556 16.162319
        , Vector.vector 9.804505 -5.167015 15.432876
        , Vector.vector 11.005354 -5.055234 14.639904
        , Vector.vector 12.090119 -4.921636 13.806034
        , Vector.vector -2.372064 -6.014196 17.866245
        , Vector.vector -1.056959 -6.188 17.932974
        , Vector.vector 0.334639 -6.33844 17.90844
        , Vector.vector 1.785188 -6.45876 17.779133
        , Vector.vector 3.271449 -6.542887 17.535343
        , Vector.vector 4.7658 -6.586203 17.172918
        , Vector.vector 6.238494 -6.586204 16.694405
        , Vector.vector 7.660473 -6.542889 16.109245
        , Vector.vector 9.006173 -6.458762 15.432861
        , Vector.vector 10.255692 -6.338444 14.684854
        , Vector.vector 11.395934 -6.188004 13.886733
        , Vector.vector 12.420648 -6.014202 13.059741
        , Vector.vector -3.032587 -7.025112 17.391125
        , Vector.vector -1.775568 -7.237102 17.477751
        , Vector.vector -0.43816 -7.425594 17.483379
        , Vector.vector 0.965515 -7.582834 17.394493
        , Vector.vector 2.415679 -7.701469 17.200346
        , Vector.vector 3.887692 -7.775378 16.894653
        , Vector.vector 5.353758 -7.800491 16.47694
        , Vector.vector 6.785353 -7.775379 15.953134
        , Vector.vector 8.155912 -7.70147 15.335203
        , Vector.vector 9.44323 -7.582836 14.639876
        , Vector.vector 10.631067 -7.425597 13.88672
        , Vector.vector 11.709736 -7.237104 13.096045
        , Vector.vector 12.675762 -7.025115 12.2871
        , Vector.vector -3.643226 -7.949477 16.868099
        , Vector.vector -2.44716 -8.19596 16.965778
        , Vector.vector -1.169225 -8.419868 16.992315
        , Vector.vector 0.179588 -8.612837 16.93478
        , Vector.vector 1.582962 -8.766599 16.782162
        , Vector.vector 3.01961 -8.873802 16.526873
        , Vector.vector 4.464449 -8.928901 16.166119
        , Vector.vector 5.89054 -8.928902 15.702745
        , Vector.vector 7.271481 -8.873803 15.145335
        , Vector.vector 8.583802 -8.766598 14.507415
        , Vector.vector 9.808857 -8.612837 13.805992
        , Vector.vector 10.93388 -8.419867 13.059713
        , Vector.vector 11.952147 -8.19596 12.287086
        , Vector.vector 12.86236 -7.949475 11.505022
        , Vector.vector -14.348912 6.813837 10.424984
        , Vector.vector -15.017439 5.854257 10.060033
        , Vector.vector -14.208408 5.854262 11.173572
        , Vector.vector -15.657426 4.811352 9.627872
        , Vector.vector -14.867525 4.824736 10.801787
        , Vector.vector -13.995167 4.811362 11.915794
        , Vector.vector -16.251255 3.691213 9.125328
        , Vector.vector -15.491116 3.712798 10.3557
        , Vector.vector -14.635966 3.712802 11.532721
        , Vector.vector -13.700718 3.691226 12.635869
        , Vector.vector -16.780563 2.50474 8.552131
        , Vector.vector -16.060509 2.527611 9.832154
        , Vector.vector -15.233893 2.535377 11.067987
        , Vector.vector -14.313992 2.527617 12.236044
        , Vector.vector -13.319133 2.504752 13.316414
        , Vector.vector -17.227871 1.267684 7.911601
        , Vector.vector -16.556913 1.283577 9.231527
        , Vector.vector -15.769769 1.291752 10.518829
        , Vector.vector -14.8772 1.291753 11.747352
        , Vector.vector -13.896151 1.283582 12.893774
        , Vector.vector -12.848171 1.267692 13.939779
        , Vector.vector -17.578444 -0.000001 7.210987
        , Vector.vector -16.963293 -0.0 8.558427
        , Vector.vector -16.225082 -0.0 9.886693
        , Vector.vector -15.371351 0.0 11.167881
        , Vector.vector -14.416693 0.0 12.37574
        , Vector.vector -13.381563 0.0 13.488283
        , Vector.vector -12.290167 0.000001 14.489713
        , Vector.vector -17.822044 -1.275554 6.461248
        , Vector.vector -17.266367 -1.300079 7.821916
        , Vector.vector -16.584057 -1.317238 9.177906
        , Vector.vector -15.779035 -1.326077 10.500649
        , Vector.vector -14.862746 -1.326078 11.761816
        , Vector.vector -13.853514 -1.317242 12.936192
        , Vector.vector -12.774739 -1.300085 14.004136
        , Vector.vector -11.652385 -1.275562 14.953089
        , Vector.vector -17.954163 -2.535363 5.676266
        , Vector.vector -17.458261 -2.591785 7.035041
        , Vector.vector -16.835613 -2.634473 8.403667
        , Vector.vector -16.086514 -2.661123 9.7541
        , Vector.vector -15.218786 -2.670189 11.057064
        , Vector.vector -14.24774 -2.661128 12.284962
        , Vector.vector -13.194889 -2.634483 13.414707
        , Vector.vector -12.085659 -2.591799 14.42981
        , Vector.vector -10.94663 -2.535382 15.321328
        , Vector.vector -17.976427 -3.757097 4.871582
        , Vector.vector -17.537437 -3.850719 6.213717
        , Vector.vector -16.974794 -3.925718 7.579252
        , Vector.vector -16.285526 -3.978224 8.941779
        , Vector.vector -15.473753 -4.00528 10.272327
        , Vector.vector -14.551231 -4.005283 11.542067
        , Vector.vector -13.536659 -3.978234 12.72527
        , Vector.vector -12.453817 -3.925735 13.80185
        , Vector.vector -11.328979 -3.850743 14.758929
        , Vector.vector -10.18819 -3.757127 15.591176
        , Vector.vector -17.896101 -4.921594 4.06294
        , Vector.vector -17.508644 -5.055198 5.37517
        , Vector.vector -17.003225 -5.166983 6.722543
        , Vector.vector -16.37426 -5.25153 8.081155
        , Vector.vector -15.62248 -5.304296 9.423507
        , Vector.vector -14.755943 -5.322245 10.720815
        , Vector.vector -13.789906 -5.304306 11.945831
        , Vector.vector -12.745562 -5.251548 13.075624
        , Vector.vector -11.647804 -5.167009 14.093638
        , Vector.vector -10.522559 -5.055231 14.990679
        , Vector.vector -9.394283 -4.921635 15.764673
        , Vector.vector -17.72485 -6.014151 3.264918
        , Vector.vector -17.381926 -6.187958 4.536283
        , Vector.vector -16.928568 -6.338403 5.852197
        , Vector.vector -16.357347 -6.458728 7.191802
        , Vector.vector -15.666212 -6.54286 8.529994
        , Vector.vector -14.859743 -6.586181 9.83922
        , Vector.vector -13.949561 -6.586186 11.091975
        , Vector.vector -12.953623 -6.542876 12.263542
        , Vector.vector -11.894496 -6.458753 13.334373
        , Vector.vector -10.796968 -6.338437 14.291594
        , Vector.vector -9.685553 -6.188001 15.129401
        , Vector.vector -8.582378 -6.014202 15.848411
        , Vector.vector -17.477098 -7.025055 2.489904
        , Vector.vector -17.171045 -7.237051 3.712174
        , Vector.vector -16.763123 -7.42555 4.985871
        , Vector.vector -16.244829 -7.582795 6.293385
        , Vector.vector -15.61206 -7.701436 7.612586
        , Vector.vector -14.866453 -7.775352 8.918099
        , Vector.vector -14.016141 -7.800471 10.18334
        , Vector.vector -13.075582 -7.775362 11.383011
        , Vector.vector -12.064363 -7.701457 12.495547
        , Vector.vector -11.00526 -7.582828 13.504998
        , Vector.vector -9.921898 -7.425592 14.401964
        , Vector.vector -8.836591 -7.237103 15.183511
        , Vector.vector -7.768714 -7.025115 15.852281
        , Vector.vector -17.168371 -7.949409 1.747531
        , Vector.vector -16.891672 -8.195898 2.915246
        , Vector.vector -16.522009 -8.419812 4.13884
        , Vector.vector -16.050486 -8.612788 5.403865
        , Vector.vector -15.471674 -8.766557 6.691399
        , Vector.vector -14.784931 -8.873768 7.978853
        , Vector.vector -13.99535 -8.928873 9.241507
        , Vector.vector -13.113968 -8.928879 10.454618
        , Vector.vector -12.1571 -8.873785 11.595727
        , Vector.vector -11.144866 -8.766586 12.646697
        , Vector.vector -10.099204 -8.612827 13.595045
        , Vector.vector -9.041797 -8.419862 14.434398
        , Vector.vector -7.992316 -8.195958 15.164076
        , Vector.vector -6.967252 -7.949478 15.788071
        , Vector.vector -14.348912 6.813837 -10.424984
        , Vector.vector -14.208409 5.854264 -11.173573
        , Vector.vector -15.017437 5.854258 -10.060033
        , Vector.vector -13.995164 4.811362 -11.915794
        , Vector.vector -14.867525 4.824737 -10.801788
        , Vector.vector -15.657426 4.811353 -9.627872
        , Vector.vector -13.700718 3.691226 -12.635869
        , Vector.vector -14.635965 3.712802 -11.532722
        , Vector.vector -15.491115 3.712798 -10.3557
        , Vector.vector -16.251255 3.691214 -9.12533
        , Vector.vector -13.319133 2.504751 -13.316414
        , Vector.vector -14.313992 2.527617 -12.236044
        , Vector.vector -15.233892 2.535377 -11.067987
        , Vector.vector -16.060507 2.527611 -9.832154
        , Vector.vector -16.780563 2.504741 -8.552132
        , Vector.vector -12.848171 1.267691 -13.939781
        , Vector.vector -13.896151 1.283581 -12.893774
        , Vector.vector -14.877201 1.291753 -11.747352
        , Vector.vector -15.769769 1.291752 -10.518829
        , Vector.vector -16.556913 1.283577 -9.231527
        , Vector.vector -17.227871 1.267685 -7.911602
        , Vector.vector -12.290167 -0.000001 -14.489714
        , Vector.vector -13.381561 -0.0 -13.488283
        , Vector.vector -14.416692 -0.0 -12.37574
        , Vector.vector -15.37135 -0.0 -11.167882
        , Vector.vector -16.22508 0.0 -9.886695
        , Vector.vector -16.963293 0.0 -8.558429
        , Vector.vector -17.578444 0.000001 -7.210989
        , Vector.vector -11.652385 -1.275564 -14.953091
        , Vector.vector -12.77474 -1.300086 -14.004137
        , Vector.vector -13.853514 -1.317243 -12.936193
        , Vector.vector -14.862745 -1.326079 -11.761816
        , Vector.vector -15.779033 -1.326077 -10.50065
        , Vector.vector -16.584053 -1.317238 -9.177909
        , Vector.vector -17.266365 -1.300079 -7.821918
        , Vector.vector -17.822044 -1.275553 -6.46125
        , Vector.vector -10.94663 -2.535383 -15.321327
        , Vector.vector -12.085659 -2.591801 -14.429811
        , Vector.vector -13.194889 -2.634485 -13.414708
        , Vector.vector -14.24774 -2.661129 -12.284963
        , Vector.vector -15.218787 -2.67019 -11.057065
        , Vector.vector -16.086514 -2.661124 -9.7541
        , Vector.vector -16.835615 -2.634474 -8.403668
        , Vector.vector -17.45826 -2.591784 -7.035041
        , Vector.vector -17.954163 -2.535363 -5.676267
        , Vector.vector -10.18819 -3.757128 -15.591175
        , Vector.vector -11.328979 -3.850744 -14.758929
        , Vector.vector -12.453817 -3.925736 -13.80185
        , Vector.vector -13.53666 -3.978235 -12.725268
        , Vector.vector -14.551234 -4.005284 -11.542066
        , Vector.vector -15.473754 -4.00528 -10.272326
        , Vector.vector -16.285526 -3.978223 -8.941778
        , Vector.vector -16.974794 -3.925717 -7.579251
        , Vector.vector -17.537437 -3.850718 -6.213716
        , Vector.vector -17.976427 -3.757096 -4.871583
        , Vector.vector -9.394283 -4.921636 -15.764672
        , Vector.vector -10.522559 -5.055233 -14.990678
        , Vector.vector -11.647804 -5.16701 -14.093637
        , Vector.vector -12.745562 -5.251549 -13.075623
        , Vector.vector -13.789906 -5.304306 -11.94583
        , Vector.vector -14.755943 -5.322246 -10.720814
        , Vector.vector -15.622483 -5.304297 -9.423507
        , Vector.vector -16.37426 -5.25153 -8.081154
        , Vector.vector -17.003225 -5.166982 -6.722543
        , Vector.vector -17.50864 -5.055197 -5.37517
        , Vector.vector -17.896101 -4.921593 -4.06294
        , Vector.vector -8.582377 -6.014204 -15.848412
        , Vector.vector -9.685549 -6.188003 -15.1294
        , Vector.vector -10.796966 -6.338439 -14.291595
        , Vector.vector -11.894492 -6.458755 -13.334375
        , Vector.vector -12.953618 -6.542877 -12.263544
        , Vector.vector -13.949559 -6.586187 -11.091977
        , Vector.vector -14.859741 -6.586183 -9.839221
        , Vector.vector -15.66621 -6.542862 -8.529996
        , Vector.vector -16.357347 -6.458729 -7.191803
        , Vector.vector -16.92857 -6.338404 -5.852198
        , Vector.vector -17.381924 -6.187958 -4.536284
        , Vector.vector -17.72485 -6.014151 -3.264918
        , Vector.vector -7.768714 -7.025116 -15.85228
        , Vector.vector -8.836591 -7.237103 -15.183509
        , Vector.vector -9.921898 -7.425592 -14.401962
        , Vector.vector -11.005261 -7.582828 -13.504995
        , Vector.vector -12.064365 -7.701457 -12.495544
        , Vector.vector -13.075583 -7.775362 -11.383009
        , Vector.vector -14.016145 -7.80047 -10.18334
        , Vector.vector -14.866454 -7.77535 -8.918098
        , Vector.vector -15.612061 -7.701433 -7.612586
        , Vector.vector -16.244831 -7.582794 -6.293385
        , Vector.vector -16.763124 -7.425548 -4.985871
        , Vector.vector -17.171047 -7.23705 -3.712174
        , Vector.vector -17.477098 -7.025054 -2.489905
        , Vector.vector -6.967252 -7.949478 -15.788071
        , Vector.vector -7.992316 -8.195958 -15.164077
        , Vector.vector -9.041796 -8.419861 -14.434399
        , Vector.vector -10.099203 -8.612827 -13.595046
        , Vector.vector -11.144864 -8.766584 -12.646698
        , Vector.vector -12.157099 -8.873785 -11.59573
        , Vector.vector -13.113965 -8.928878 -10.454618
        , Vector.vector -13.99535 -8.928873 -9.241508
        , Vector.vector -14.784929 -8.873768 -7.978855
        , Vector.vector -15.471672 -8.766557 -6.691401
        , Vector.vector -16.050488 -8.612788 -5.403868
        , Vector.vector -16.522009 -8.419812 -4.138842
        , Vector.vector -16.891672 -8.195898 -2.915247
        , Vector.vector -17.168373 -7.949409 -1.747532
        , Vector.vector 5.480712 6.813843 -16.868116
        , Vector.vector 6.236082 5.854269 -16.965813
        , Vector.vector 4.927048 5.854265 -17.39114
        , Vector.vector 7.007872 4.811366 -16.992365
        , Vector.vector 5.678825 4.824743 -17.477781
        , Vector.vector 4.318282 4.811362 -17.866259
        , Vector.vector 7.783694 3.691229 -16.934845
        , Vector.vector 6.445539 3.712806 -17.483423
        , Vector.vector 5.061881 3.712805 -17.932999
        , Vector.vector 3.656843 3.691224 -18.275732
        , Vector.vector 8.548845 2.504752 -16.782234
        , Vector.vector 7.213935 2.527619 -17.394547
        , Vector.vector 5.818793 2.535381 -17.908476
        , Vector.vector 4.388019 2.527617 -18.31274
        , Vector.vector 2.948145 2.504749 -18.602007
        , Vector.vector 9.287238 1.267692 -16.526955
        , Vector.vector 7.968593 1.283582 -17.200405
        , Vector.vector 6.575129 1.291755 -17.779175
        , Vector.vector 5.130927 1.291755 -18.248423
        , Vector.vector 3.663399 1.283581 -18.599245
        , Vector.vector 2.200747 1.26769 -18.829489
        , Vector.vector 9.982687 -0.000001 -16.166199
        , Vector.vector 8.693018 -0.0 -16.894716
        , Vector.vector 7.315065 -0.0 -17.535389
        , Vector.vector 5.871327 -0.0 -18.070072
        , Vector.vector 4.389039 0.0 -18.486111
        , Vector.vector 2.897673 0.0 -18.777739
        , Vector.vector 1.426098 0.000001 -18.946404
        , Vector.vector 10.620468 -1.275564 -15.702822
        , Vector.vector 9.37114 -1.300087 -16.476999
        , Vector.vector 8.022115 -1.317244 -17.17296
        , Vector.vector 6.593358 -1.326081 -17.769896
        , Vector.vector 5.110778 -1.32608 -18.251616
        , Vector.vector 3.604021 -1.317242 -18.60849
        , Vector.vector 2.103562 -1.300084 -18.838388
        , Vector.vector 0.637784 -1.27556 -18.946404
        , Vector.vector 11.188771 -2.535383 -15.145401
        , Vector.vector 9.988916 -2.591802 -15.953185
        , Vector.vector 8.680734 -2.634487 -16.694439
        , Vector.vector 7.280943 -2.661134 -17.346649
        , Vector.vector 5.813081 -2.670197 -17.890728
        , Vector.vector 4.305757 -2.661132 -18.313351
        , Vector.vector 2.789945 -2.634484 -18.608482
        , Vector.vector 1.295905 -2.591797 -18.777733
        , Vector.vector -0.149601 -2.535378 -18.829483
        , Vector.vector 11.679782 -3.757128 -14.507471
        , Vector.vector 10.53575 -3.850745 -15.335245
        , Vector.vector 9.277929 -3.92574 -16.109272
        , Vector.vector 7.919433 -3.97824 -16.806435
        , Vector.vector 6.480628 -4.005293 -17.40572
        , Vector.vector 4.987969 -4.005292 -17.890718
        , Vector.vector 3.471703 -3.978238 -18.2516
        , Vector.vector 1.962875 -3.925736 -18.486095
        , Vector.vector 0.490315 -3.85074 -18.599232
        , Vector.vector -0.921778 -3.757121 -18.601997
        , Vector.vector 12.090117 -4.921636 -13.806033
        , Vector.vector 11.005353 -5.055234 -14.639906
        , Vector.vector 9.804503 -5.167015 -15.432875
        , Vector.vector 8.497095 -5.251556 -16.162317
        , Vector.vector 7.099889 -5.304317 -16.806421
        , Vector.vector 5.636316 -5.32226 -17.346628
        , Vector.vector 4.134738 -5.304316 -17.769867
        , Vector.vector 2.625783 -5.251554 -18.070042
        , Vector.vector 1.139313 -5.16701 -18.248394
        , Vector.vector -0.298289 -5.055228 -18.312719
        , Vector.vector -1.666019 -4.921629 -18.275721
        , Vector.vector 12.420649 -6.014202 -13.05974
        , Vector.vector 11.395934 -6.188003 -13.88673
        , Vector.vector 10.255693 -6.338443 -14.684852
        , Vector.vector 9.006175 -6.458762 -15.432861
        , Vector.vector 7.660475 -6.542888 -16.109243
        , Vector.vector 6.238495 -6.586203 -16.694405
        , Vector.vector 4.765801 -6.586202 -17.172916
        , Vector.vector 3.271449 -6.542886 -17.535341
        , Vector.vector 1.785189 -6.458759 -17.779133
        , Vector.vector 0.334639 -6.33844 -17.908442
        , Vector.vector -1.056958 -6.187998 -17.932974
        , Vector.vector -2.372063 -6.014196 -17.866247
        , Vector.vector 12.675762 -7.025115 -12.287099
        , Vector.vector 11.709737 -7.237104 -13.096045
        , Vector.vector 10.631068 -7.425597 -13.886718
        , Vector.vector 9.443232 -7.582837 -14.639876
        , Vector.vector 8.155913 -7.70147 -15.335203
        , Vector.vector 6.785354 -7.77538 -15.953135
        , Vector.vector 5.353759 -7.800492 -16.47694
        , Vector.vector 3.887693 -7.77538 -16.894655
        , Vector.vector 2.415679 -7.701469 -17.200346
        , Vector.vector 0.965515 -7.582834 -17.394493
        , Vector.vector -0.438159 -7.425594 -17.483379
        , Vector.vector -1.775567 -7.237102 -17.477749
        , Vector.vector -3.032586 -7.025112 -17.391125
        , Vector.vector 12.86236 -7.949475 -11.505022
        , Vector.vector 11.952145 -8.195958 -12.287086
        , Vector.vector 10.93388 -8.419867 -13.059715
        , Vector.vector 9.808856 -8.612836 -13.805992
        , Vector.vector 8.583803 -8.766599 -14.507416
        , Vector.vector 7.271481 -8.873802 -15.145336
        , Vector.vector 5.89054 -8.928901 -15.702748
        , Vector.vector 4.464449 -8.928901 -16.166119
        , Vector.vector 3.01961 -8.873802 -16.526875
        , Vector.vector 1.582962 -8.766597 -16.782164
        , Vector.vector 0.179588 -8.612836 -16.934782
        , Vector.vector -1.169225 -8.419867 -16.992315
        , Vector.vector -2.44716 -8.195958 -16.965778
        , Vector.vector -3.643225 -7.949476 -16.868099
        , Vector.vector 6.967261 7.949479 15.788066
        , Vector.vector 7.768724 7.025116 15.852277
        , Vector.vector 7.992332 8.195959 15.164065
        , Vector.vector 8.582387 6.014201 15.848409
        , Vector.vector 8.836608 7.237101 15.183501
        , Vector.vector 9.04182 8.419863 14.434383
        , Vector.vector 9.394291 4.921631 15.76467
        , Vector.vector 9.685567 6.187997 15.129393
        , Vector.vector 9.921921 7.425589 14.401948
        , Vector.vector 10.099234 8.612827 13.595025
        , Vector.vector 10.188198 3.757121 15.59117
        , Vector.vector 10.522574 5.055223 14.990671
        , Vector.vector 10.796991 6.338428 14.291581
        , Vector.vector 11.00529 7.582821 13.504976
        , Vector.vector 11.144897 8.766583 12.646669
        , Vector.vector 10.946638 2.535375 15.321325
        , Vector.vector 11.328996 3.85073 14.758921
        , Vector.vector 11.647826 5.166994 14.093625
        , Vector.vector 11.894522 6.45874 13.334356
        , Vector.vector 12.064398 7.701447 12.49552
        , Vector.vector 12.157133 8.87378 11.595694
        , Vector.vector 11.652391 1.275553 14.953085
        , Vector.vector 12.085671 2.591784 14.429803
        , Vector.vector 12.453836 3.925715 13.801839
        , Vector.vector 12.745586 5.251527 13.075605
        , Vector.vector 12.953652 6.542858 12.26352
        , Vector.vector 13.075615 7.775349 11.382981
        , Vector.vector 13.114001 8.92887 10.45458
        , Vector.vector 12.290172 -0.00001 14.489709
        , Vector.vector 12.774748 1.300067 14.004128
        , Vector.vector 13.194903 2.634459 13.414697
        , Vector.vector 13.536681 3.978207 12.725256
        , Vector.vector 13.78993 5.304279 11.945812
        , Vector.vector 13.949588 6.586164 11.091951
        , Vector.vector 14.016172 7.800453 10.183311
        , Vector.vector 13.99538 8.928862 9.241467
        , Vector.vector 12.848171 -1.267702 13.939777
        , Vector.vector 13.381566 -0.000021 13.488278
        , Vector.vector 13.853522 1.317214 12.936185
        , Vector.vector 14.247754 2.661097 12.284954
        , Vector.vector 14.551253 4.005251 11.542054
        , Vector.vector 14.755966 5.322215 10.720797
        , Vector.vector 14.859772 6.586156 9.839197
        , Vector.vector 14.86648 7.775331 8.918069
        , Vector.vector 14.784957 8.873756 7.978817
        , Vector.vector 13.319133 -2.504762 13.316412
        , Vector.vector 13.896152 -1.283602 12.893769
        , Vector.vector 14.416698 -0.000029 12.375734
        , Vector.vector 14.862754 1.326043 11.761806
        , Vector.vector 15.2188 2.670151 11.057053
        , Vector.vector 15.47377 4.005242 10.272313
        , Vector.vector 15.622503 5.304262 9.423491
        , Vector.vector 15.666234 6.542831 8.529972
        , Vector.vector 15.612084 7.701413 7.612559
        , Vector.vector 15.471694 8.766542 6.691366
        , Vector.vector 13.700716 -3.691237 12.635865
        , Vector.vector 14.313992 -2.527637 12.236042
        , Vector.vector 14.877201 -1.291782 11.747348
        , Vector.vector 15.371356 -0.000036 11.167875
        , Vector.vector 15.779041 1.326036 10.500642
        , Vector.vector 16.086529 2.661082 9.754092
        , Vector.vector 16.28554 3.978182 8.941769
        , Vector.vector 16.374279 5.251494 8.081141
        , Vector.vector 16.357368 6.458698 7.191784
        , Vector.vector 16.24485 7.582773 6.293362
        , Vector.vector 16.050505 8.612774 5.403837
        , Vector.vector 13.995162 -4.811372 11.915795
        , Vector.vector 14.635959 -3.712822 11.532719
        , Vector.vector 15.233888 -2.535405 11.067989
        , Vector.vector 15.769765 -1.291788 10.518831
        , Vector.vector 16.22508 -0.000041 9.886695
        , Vector.vector 16.584059 1.317194 9.177908
        , Vector.vector 16.835621 2.63443 8.403667
        , Vector.vector 16.974806 3.925677 7.579249
        , Vector.vector 17.003241 5.166947 6.722537
        , Vector.vector 16.928583 6.338373 5.852186
        , Vector.vector 16.763138 7.425527 4.985856
        , Vector.vector 16.52202 8.419798 4.138818
        , Vector.vector 14.208404 -5.854272 11.173573
        , Vector.vector 14.867517 -4.824754 10.801789
        , Vector.vector 15.491108 -3.712824 10.355702
        , Vector.vector 16.060499 -2.527644 9.83216
        , Vector.vector 16.556904 -1.283616 9.231532
        , Vector.vector 16.963289 -0.000043 8.558434
        , Vector.vector 17.266367 1.300035 7.821922
        , Vector.vector 17.458265 2.591741 7.035046
        , Vector.vector 17.537445 3.850678 6.213719
        , Vector.vector 17.508652 5.055162 5.37517
        , Vector.vector 17.381935 6.18793 4.53628
        , Vector.vector 17.171059 7.237031 3.712167
        , Vector.vector 16.89168 8.195886 2.915233
        , Vector.vector 14.348909 -6.813844 10.424986
        , Vector.vector 15.017429 -5.854272 10.060037
        , Vector.vector 15.657415 -4.811375 9.627878
        , Vector.vector 16.251244 -3.691245 9.125339
        , Vector.vector 16.780554 -2.504777 8.552143
        , Vector.vector 17.227861 -1.267726 7.911616
        , Vector.vector 17.578438 -0.000044 7.211003
        , Vector.vector 17.822041 1.27551 6.461265
        , Vector.vector 17.954165 2.535321 5.676282
        , Vector.vector 17.976431 3.757059 4.871596
        , Vector.vector 17.896109 4.921561 4.062951
        , Vector.vector 17.724857 6.014126 3.264924
        , Vector.vector 17.477106 7.025038 2.489906
        , Vector.vector 17.168377 7.9494 1.747527
        , Vector.vector -12.862361 7.949474 11.505022
        , Vector.vector -12.675764 7.025113 12.287099
        , Vector.vector -11.952147 8.195956 12.287086
        , Vector.vector -12.42065 6.014199 13.059741
        , Vector.vector -11.70974 7.2371 13.096046
        , Vector.vector -10.933882 8.419862 13.059714
        , Vector.vector -12.090119 4.92163 13.806035
        , Vector.vector -11.395936 6.187996 13.886735
        , Vector.vector -10.631069 7.425589 13.88672
        , Vector.vector -9.808859 8.612829 13.805992
        , Vector.vector -11.679782 3.757122 14.507471
        , Vector.vector -11.005356 5.055225 14.639907
        , Vector.vector -10.255695 6.338434 14.684855
        , Vector.vector -9.443234 7.582828 14.639879
        , Vector.vector -8.583805 8.766592 14.507416
        , Vector.vector -11.188773 2.535377 15.145403
        , Vector.vector -10.535752 3.850734 15.335246
        , Vector.vector -9.804508 5.167001 15.432878
        , Vector.vector -9.006179 6.458749 15.432865
        , Vector.vector -8.155918 7.70146 15.335207
        , Vector.vector -7.271486 8.873796 15.145337
        , Vector.vector -10.620467 1.275557 15.702823
        , Vector.vector -9.988915 2.59179 15.953185
        , Vector.vector -9.27793 3.925725 16.109274
        , Vector.vector -8.497099 5.25154 16.162321
        , Vector.vector -7.660478 6.542874 16.109249
        , Vector.vector -6.785357 7.775368 15.953136
        , Vector.vector -5.890546 8.928895 15.70275
        , Vector.vector -9.982687 -0.000006 16.166199
        , Vector.vector -9.37114 1.300075 16.477001
        , Vector.vector -8.680735 2.634471 16.694443
        , Vector.vector -7.919434 3.978223 16.806437
        , Vector.vector -7.099894 5.304298 16.806425
        , Vector.vector -6.238498 6.586187 16.694408
        , Vector.vector -5.353764 7.800482 16.476946
        , Vector.vector -4.464455 8.928894 16.166121
        , Vector.vector -9.287236 -1.267697 16.526951
        , Vector.vector -8.69302 -0.000011 16.894716
        , Vector.vector -8.022114 1.317228 17.172962
        , Vector.vector -7.280944 2.661115 17.346651
        , Vector.vector -6.48063 4.005274 17.405724
        , Vector.vector -5.636321 5.322242 17.346632
        , Vector.vector -4.765804 6.586186 17.17292
        , Vector.vector -3.887697 7.775368 16.894659
        , Vector.vector -3.019615 8.873796 16.526876
        , Vector.vector -8.548845 -2.504758 16.782236
        , Vector.vector -7.968593 -1.283593 17.200405
        , Vector.vector -7.315065 -0.000014 17.535387
        , Vector.vector -6.593358 1.326064 17.769896
        , Vector.vector -5.813084 2.670178 17.89073
        , Vector.vector -4.987972 4.005274 17.890722
        , Vector.vector -4.134743 5.304298 17.769871
        , Vector.vector -3.271453 6.542873 17.535349
        , Vector.vector -2.415683 7.701458 17.200348
        , Vector.vector -1.582966 8.766593 16.782166
        , Vector.vector -7.783692 -3.691233 16.934845
        , Vector.vector -7.213934 -2.527627 17.394547
        , Vector.vector -6.575128 -1.291767 17.779175
        , Vector.vector -5.871326 -0.000015 18.070072
        , Vector.vector -5.110778 1.326064 18.251617
        , Vector.vector -4.305758 2.661115 18.313354
        , Vector.vector -3.471704 3.978222 18.251604
        , Vector.vector -2.625785 5.251538 18.070047
        , Vector.vector -1.785191 6.458747 17.779137
        , Vector.vector -0.965518 7.582827 17.394497
        , Vector.vector -0.179591 8.612831 16.934782
        , Vector.vector -7.007873 -4.811369 16.992365
        , Vector.vector -6.445539 -3.712813 17.483423
        , Vector.vector -5.818791 -2.53539 17.908474
        , Vector.vector -5.130927 -1.291766 18.248423
        , Vector.vector -4.389039 -0.000013 18.486113
        , Vector.vector -3.60402 1.317229 18.60849
        , Vector.vector -2.789946 2.634471 18.608486
        , Vector.vector -1.962876 3.925723 18.486099
        , Vector.vector -1.139315 5.167 18.2484
        , Vector.vector -0.334641 6.338431 17.908442
        , Vector.vector 0.438157 7.425589 17.483381
        , Vector.vector 1.169223 8.419863 16.992317
        , Vector.vector -6.236081 -5.85427 16.965813
        , Vector.vector -5.678824 -4.824747 17.477779
        , Vector.vector -5.061879 -3.71281 17.932999
        , Vector.vector -4.388017 -2.527624 18.312738
        , Vector.vector -3.663398 -1.283589 18.599245
        , Vector.vector -2.897672 -0.000009 18.77774
        , Vector.vector -2.10356 1.300075 18.838387
        , Vector.vector -1.295905 2.591788 18.777735
        , Vector.vector -0.490315 3.850731 18.599234
        , Vector.vector 0.298289 5.055221 18.312723
        , Vector.vector 1.056957 6.187994 17.932976
        , Vector.vector 1.775566 7.237098 17.477753
        , Vector.vector 2.447158 8.195956 16.96578
        , Vector.vector -5.480711 -6.813844 16.868114
        , Vector.vector -4.927048 -5.854268 17.39114
        , Vector.vector -4.318281 -4.811365 17.866259
        , Vector.vector -3.656842 -3.691228 18.27573
        , Vector.vector -2.948143 -2.504754 18.602007
        , Vector.vector -2.200747 -1.267695 18.829489
        , Vector.vector -1.426098 -0.000006 18.946405
        , Vector.vector -0.637784 1.275554 18.946404
        , Vector.vector 0.149601 2.535372 18.829485
        , Vector.vector 0.921778 3.757115 18.601999
        , Vector.vector 1.666019 4.921624 18.275723
        , Vector.vector 2.372063 6.014193 17.866247
        , Vector.vector 3.032586 7.025109 17.391127
        , Vector.vector 3.643224 7.949474 16.868099
        , Vector.vector -14.916708 7.949461 -8.677433
        , Vector.vector -15.602839 7.025095 -8.258297
        , Vector.vector -15.379212 8.195939 -7.570101
        , Vector.vector -16.258821 6.014179 -7.776916
        , Vector.vector -16.07366 7.237078 -7.089579
        , Vector.vector -15.799351 8.419841 -6.362924
        , Vector.vector -16.866434 4.921609 -7.231953
        , Vector.vector -16.728668 6.187974 -6.546808
        , Vector.vector -16.492294 7.425566 -5.819382
        , Vector.vector -16.161438 8.612806 -5.062361
        , Vector.vector -17.406727 3.757103 -6.624954
        , Vector.vector -17.32427 5.055204 -5.94261
        , Vector.vector -17.135357 6.338409 -5.215752
        , Vector.vector -16.841515 7.582801 -4.456955
        , Vector.vector -16.449959 8.766565 -3.680526
        , Vector.vector -17.861692 2.535364 -5.960858
        , Vector.vector -17.840448 3.850717 -5.281133
        , Vector.vector -17.707335 5.16698 -4.555508
        , Vector.vector -17.460623 6.458725 -3.796257
        , Vector.vector -17.104996 7.701431 -3.017789
        , Vector.vector -16.651114 8.873765 -2.23532
        , Vector.vector -18.216204 1.275553 -5.248134
        , Vector.vector -18.259151 2.591781 -4.570125
        , Vector.vector -18.187891 3.925711 -3.845702
        , Vector.vector -17.997051 5.251522 -3.086695
        , Vector.vector -17.688044 6.542851 -2.307422
        , Vector.vector -17.269146 7.775342 -1.523376
        , Vector.vector -16.754501 8.928864 -0.749734
        , Vector.vector -18.459806 0.0 -4.498397
        , Vector.vector -18.566416 1.300076 -3.820736
        , Vector.vector -18.559866 2.634467 -3.096928
        , Vector.vector -18.43112 3.978212 -2.338279
        , Vector.vector -18.177858 5.304283 -1.558853
        , Vector.vector -17.80514 6.586167 -0.774233
        , Vector.vector -17.324923 7.800456 -0.000001
        , Vector.vector -16.754499 8.928864 0.749731
        , Vector.vector -18.587994 -1.267678 -3.725528
        , Vector.vector -18.754128 0.000003 -3.046745
        , Vector.vector -18.811432 1.317236 -2.322693
        , Vector.vector -18.747585 2.661116 -1.564124
        , Vector.vector -18.556456 4.005268 -0.784726
        , Vector.vector -18.239349 5.32223 0.0
        , Vector.vector -17.805136 6.586169 0.774232
        , Vector.vector -17.269144 7.775345 1.523373
        , Vector.vector -16.651114 8.873769 2.235318
        , Vector.vector -18.6026 -2.504726 -2.944412
        , Vector.vector -18.820993 -1.283566 -2.263335
        , Vector.vector -18.937628 0.000006 -1.538275
        , Vector.vector -18.937635 1.326078 -0.779422
        , Vector.vector -18.811436 2.670184 0.000004
        , Vector.vector -18.556454 4.005273 0.78473
        , Vector.vector -18.177858 5.304291 1.558856
        , Vector.vector -17.688042 6.54286 2.307422
        , Vector.vector -17.104992 7.701439 3.017788
        , Vector.vector -16.449955 8.766568 3.680524
        , Vector.vector -18.511295 -3.691188 -2.169574
        , Vector.vector -18.772432 -2.527588 -1.485643
        , Vector.vector -18.94083 -1.291733 -0.759244
        , Vector.vector -18.999998 0.000013 0.000007
        , Vector.vector -18.937634 1.326084 0.779433
        , Vector.vector -18.747583 2.661127 1.564132
        , Vector.vector -18.431118 3.978226 2.338285
        , Vector.vector -17.997047 5.251536 3.086699
        , Vector.vector -17.460617 6.458738 3.796258
        , Vector.vector -16.841511 7.582811 4.456955
        , Vector.vector -16.161436 8.612811 5.062359
        , Vector.vector -18.326265 -4.811313 -1.413974
        , Vector.vector -18.619513 -3.71276 -0.727414
        , Vector.vector -18.830082 -2.535343 0.000008
        , Vector.vector -18.940828 -1.291725 0.759259
        , Vector.vector -18.937626 0.00002 1.53829
        , Vector.vector -18.811428 1.317254 2.322706
        , Vector.vector -18.55986 2.634488 3.096938
        , Vector.vector -18.187885 3.925733 3.845711
        , Vector.vector -17.707325 5.167001 4.555514
        , Vector.vector -17.135351 6.338426 5.215755
        , Vector.vector -16.492289 7.425578 5.819383
        , Vector.vector -15.799348 8.419848 6.362924
        , Vector.vector -18.062521 -5.854204 -0.688183
        , Vector.vector -18.377226 -4.824685 0.000008
        , Vector.vector -18.619514 -3.712753 0.727431
        , Vector.vector -18.77243 -2.527572 1.485661
        , Vector.vector -18.820992 -1.283544 2.263352
        , Vector.vector -18.754126 0.000029 3.046762
        , Vector.vector -18.566412 1.300106 3.820752
        , Vector.vector -18.259144 2.591811 4.570139
        , Vector.vector -17.840439 3.850746 5.281144
        , Vector.vector -17.324259 5.055228 5.942619
        , Vector.vector -16.728657 6.187994 6.546813
        , Vector.vector -16.073652 7.237092 7.089582
        , Vector.vector -15.379208 8.195946 7.570102
        , Vector.vector -17.736193 -6.813771 0.000005
        , Vector.vector -18.062523 -5.854197 0.688196
        , Vector.vector -18.326267 -4.811299 1.41399
        , Vector.vector -18.511299 -3.691167 2.169593
        , Vector.vector -18.602602 -2.504699 2.944433
        , Vector.vector -18.58799 -1.267646 3.725549
        , Vector.vector -18.459801 0.000036 4.498418
        , Vector.vector -18.216194 1.275589 5.248153
        , Vector.vector -17.861681 2.535399 5.960876
        , Vector.vector -17.406715 3.757136 6.624969
        , Vector.vector -16.866421 4.921637 7.231964
        , Vector.vector -16.25881 6.014199 7.776923
        , Vector.vector -15.60283 7.025109 8.258302
        , Vector.vector -14.916705 7.94947 8.677436
        , Vector.vector 3.643225 7.949475 -16.868097
        , Vector.vector 3.032588 7.025111 -17.391125
        , Vector.vector 2.44716 8.195957 -16.965778
        , Vector.vector 2.372067 6.014195 -17.866245
        , Vector.vector 1.77557 7.2371 -17.477751
        , Vector.vector 1.169226 8.419865 -16.992315
        , Vector.vector 1.666023 4.921626 -18.275721
        , Vector.vector 1.056963 6.187995 -17.932974
        , Vector.vector 0.438163 7.425592 -17.483381
        , Vector.vector -0.179587 8.612834 -16.93478
        , Vector.vector 0.921783 3.757118 -18.601997
        , Vector.vector 0.298296 5.055224 -18.312721
        , Vector.vector -0.334632 6.338435 -17.908442
        , Vector.vector -0.965511 7.582831 -17.394497
        , Vector.vector -1.582961 8.766596 -16.782164
        , Vector.vector 0.149607 2.535375 -18.829483
        , Vector.vector -0.490307 3.850734 -18.599232
        , Vector.vector -1.139304 5.167004 -18.2484
        , Vector.vector -1.78518 6.458753 -17.779135
        , Vector.vector -2.415673 7.701464 -17.200348
        , Vector.vector -3.019609 8.8738 -16.526876
        , Vector.vector -0.637778 1.275558 -18.946404
        , Vector.vector -1.295895 2.591792 -18.777733
        , Vector.vector -1.962864 3.925728 -18.486099
        , Vector.vector -2.625772 5.251545 -18.070047
        , Vector.vector -3.27144 6.54288 -17.535347
        , Vector.vector -3.887686 7.775374 -16.894657
        , Vector.vector -4.464449 8.928899 -16.166121
        , Vector.vector -1.426092 -0.000003 -18.946405
        , Vector.vector -2.103551 1.300079 -18.83839
        , Vector.vector -2.789932 2.634477 -18.608488
        , Vector.vector -3.471689 3.978229 -18.251606
        , Vector.vector -4.134727 5.304307 -17.769873
        , Vector.vector -4.765791 6.586196 -17.172922
        , Vector.vector -5.353754 7.800488 -16.476946
        , Vector.vector -5.89054 8.928899 -15.702749
        , Vector.vector -2.200741 -1.267692 -18.829491
        , Vector.vector -2.897662 -0.000006 -18.77774
        , Vector.vector -3.604007 1.317234 -18.608494
        , Vector.vector -4.305742 2.661122 -18.313356
        , Vector.vector -4.987955 4.005281 -17.890724
        , Vector.vector -5.636304 5.322251 -17.346636
        , Vector.vector -6.238484 6.586196 -16.694412
        , Vector.vector -6.785347 7.775374 -15.953137
        , Vector.vector -7.271481 8.8738 -15.145337
        , Vector.vector -2.948138 -2.504751 -18.602009
        , Vector.vector -3.663389 -1.283587 -18.599247
        , Vector.vector -4.389026 -0.000008 -18.486115
        , Vector.vector -5.110764 1.326071 -18.251623
        , Vector.vector -5.813066 2.670186 -17.890734
        , Vector.vector -6.480614 4.005283 -17.405727
        , Vector.vector -7.099879 5.304309 -16.806429
        , Vector.vector -7.660465 6.542883 -16.109251
        , Vector.vector -8.155908 7.701466 -15.335207
        , Vector.vector -8.583803 8.766597 -14.507417
        , Vector.vector -3.656838 -3.691226 -18.275734
        , Vector.vector -4.388009 -2.527622 -18.312742
        , Vector.vector -5.130915 -1.291762 -18.248426
        , Vector.vector -5.871313 -0.000009 -18.070076
        , Vector.vector -6.593343 1.326071 -17.769901
        , Vector.vector -7.280929 2.661123 -17.346655
        , Vector.vector -7.919421 3.978231 -16.806442
        , Vector.vector -8.497087 5.251548 -16.162327
        , Vector.vector -9.006168 6.458757 -15.432868
        , Vector.vector -9.443228 7.582833 -14.639882
        , Vector.vector -9.808857 8.612833 -13.805993
        , Vector.vector -4.318278 -4.811363 -17.866262
        , Vector.vector -5.061873 -3.712808 -17.933001
        , Vector.vector -5.818783 -2.535386 -17.908478
        , Vector.vector -6.575118 -1.291762 -17.779179
        , Vector.vector -7.315053 -0.000008 -17.535393
        , Vector.vector -8.022102 1.317235 -17.172966
        , Vector.vector -8.680723 2.634479 -16.694447
        , Vector.vector -9.27792 3.925732 -16.109278
        , Vector.vector -9.804498 5.167008 -15.432883
        , Vector.vector -10.255688 6.338439 -14.684857
        , Vector.vector -10.631064 7.425593 -13.88672
        , Vector.vector -10.933881 8.419866 -13.059716
        , Vector.vector -4.927045 -5.854266 -17.39114
        , Vector.vector -5.67882 -4.824747 -17.477781
        , Vector.vector -6.445531 -3.712811 -17.483425
        , Vector.vector -7.213926 -2.527625 -17.39455
        , Vector.vector -7.968583 -1.283589 -17.200411
        , Vector.vector -8.693008 -0.000007 -16.89472
        , Vector.vector -9.37113 1.30008 -16.477007
        , Vector.vector -9.988908 2.591795 -15.953192
        , Vector.vector -10.535743 3.850739 -15.335251
        , Vector.vector -11.005346 5.055229 -14.63991
        , Vector.vector -11.395929 6.188 -13.886736
        , Vector.vector -11.709734 7.237103 -13.096046
        , Vector.vector -11.952145 8.195958 -12.287086
        , Vector.vector -5.48071 -6.813845 -16.868116
        , Vector.vector -6.236078 -5.85427 -16.965815
        , Vector.vector -7.007868 -4.811369 -16.992365
        , Vector.vector -7.783688 -3.691233 -16.934847
        , Vector.vector -8.548841 -2.504758 -16.782238
        , Vector.vector -9.287231 -1.267697 -16.526957
        , Vector.vector -9.98268 -0.000005 -16.166203
        , Vector.vector -10.620461 1.275558 -15.702827
        , Vector.vector -11.188766 2.535378 -15.145407
        , Vector.vector -11.679775 3.757123 -14.507475
        , Vector.vector -12.090114 4.921631 -13.806039
        , Vector.vector -12.420648 6.0142 -13.059746
        , Vector.vector -12.675761 7.025113 -12.287101
        , Vector.vector -12.86236 7.949475 -11.505024
        , Vector.vector 17.168375 7.949407 -1.747521
        , Vector.vector 17.477102 7.025054 -2.489893
        , Vector.vector 16.891678 8.195894 -2.915225
        , Vector.vector 17.724854 6.01415 -3.264906
        , Vector.vector 17.171055 7.237047 -3.712152
        , Vector.vector 16.52202 8.419806 -4.138809
        , Vector.vector 17.896105 4.921591 -4.062927
        , Vector.vector 17.381933 6.187954 -4.53626
        , Vector.vector 16.763136 7.425544 -4.985839
        , Vector.vector 16.050503 8.612782 -5.403827
        , Vector.vector 17.976431 3.757095 -4.871569
        , Vector.vector 17.50865 5.055194 -5.375145
        , Vector.vector 16.928581 6.338398 -5.852164
        , Vector.vector 16.244848 7.58279 -6.293345
        , Vector.vector 15.471694 8.766551 -6.691354
        , Vector.vector 17.954166 2.535362 -5.676252
        , Vector.vector 17.537447 3.850716 -6.213691
        , Vector.vector 17.003241 5.166979 -6.722508
        , Vector.vector 16.357367 6.458724 -7.19176
        , Vector.vector 15.612084 7.701431 -7.612541
        , Vector.vector 14.784957 8.873763 -7.978805
        , Vector.vector 17.822048 1.275554 -6.461237
        , Vector.vector 17.458271 2.591784 -7.035018
        , Vector.vector 16.974812 3.925716 -7.57922
        , Vector.vector 16.374281 5.251528 -8.081115
        , Vector.vector 15.666235 6.542858 -8.529949
        , Vector.vector 14.866484 7.77535 -8.918053
        , Vector.vector 13.995382 8.928871 -9.241458
        , Vector.vector 17.578447 0.0 -7.210976
        , Vector.vector 17.266376 1.300078 -7.821897
        , Vector.vector 16.83563 2.634473 -8.403639
        , Vector.vector 16.285545 3.978221 -8.941743
        , Vector.vector 15.622507 5.304295 -9.423466
        , Vector.vector 14.859773 6.58618 -9.839176
        , Vector.vector 14.016176 7.80047 -10.183293
        , Vector.vector 13.114002 8.928879 -10.45457
        , Vector.vector 17.227875 -1.267684 -7.911592
        , Vector.vector 16.963303 -0.0 -8.558409
        , Vector.vector 16.58407 1.317237 -9.17788
        , Vector.vector 16.086536 2.661122 -9.754066
        , Vector.vector 15.473778 4.005279 -10.272288
        , Vector.vector 14.755972 5.322244 -10.720772
        , Vector.vector 13.949595 6.586187 -11.091933
        , Vector.vector 13.075618 7.775363 -11.382967
        , Vector.vector 12.157137 8.873789 -11.595687
        , Vector.vector 16.780567 -2.50474 -8.552123
        , Vector.vector 16.556921 -1.283577 -9.231512
        , Vector.vector 16.225096 0.0 -9.886671
        , Vector.vector 15.779053 1.326077 -10.500622
        , Vector.vector 15.21881 2.670189 -11.05703
        , Vector.vector 14.551262 4.005284 -11.542029
        , Vector.vector 13.789938 5.304307 -11.945794
        , Vector.vector 12.953654 6.542878 -12.263505
        , Vector.vector 12.064401 7.701461 -12.495508
        , Vector.vector 11.144903 8.766591 -12.646663
        , Vector.vector 16.251259 -3.691214 -9.125324
        , Vector.vector 16.060516 -2.52761 -9.832144
        , Vector.vector 15.769779 -1.29175 -10.518812
        , Vector.vector 15.371367 0.000001 -11.167857
        , Vector.vector 14.862766 1.326079 -11.761788
        , Vector.vector 14.247765 2.66113 -12.284933
        , Vector.vector 13.53669 3.978236 -12.725241
        , Vector.vector 12.745592 5.251551 -13.07559
        , Vector.vector 11.894526 6.458758 -13.334343
        , Vector.vector 11.005293 7.582834 -13.504968
        , Vector.vector 10.099236 8.612834 -13.595019
        , Vector.vector 15.657428 -4.811351 -9.627867
        , Vector.vector 15.49112 -3.712797 -10.355691
        , Vector.vector 15.233901 -2.535375 -11.067975
        , Vector.vector 14.877213 -1.291752 -11.747337
        , Vector.vector 14.416709 0.000001 -12.375721
        , Vector.vector 13.853533 1.317244 -12.936169
        , Vector.vector 13.194913 2.634486 -13.414684
        , Vector.vector 12.453842 3.925738 -13.801826
        , Vector.vector 11.647831 5.167013 -14.093615
        , Vector.vector 10.796996 6.338443 -14.291573
        , Vector.vector 9.921926 7.425597 -14.401941
        , Vector.vector 9.041821 8.419867 -14.434378
        , Vector.vector 15.017439 -5.854257 -10.06003
        , Vector.vector 14.86753 -4.824736 -10.801783
        , Vector.vector 14.635971 -3.712801 -11.532711
        , Vector.vector 14.314001 -2.527615 -12.236035
        , Vector.vector 13.896163 -1.28358 -12.893763
        , Vector.vector 13.381577 0.000002 -13.488268
        , Vector.vector 12.774757 1.300088 -14.004121
        , Vector.vector 12.085678 2.591803 -14.429796
        , Vector.vector 11.329001 3.850747 -14.758913
        , Vector.vector 10.522578 5.055235 -14.990662
        , Vector.vector 9.685571 6.188006 -15.129385
        , Vector.vector 8.836611 7.237108 -15.183497
        , Vector.vector 7.992334 8.195963 -15.164062
        , Vector.vector 14.348915 -6.813837 -10.424984
        , Vector.vector 14.208411 -5.854263 -11.173572
        , Vector.vector 13.995168 -4.811362 -11.915792
        , Vector.vector 13.700722 -3.691225 -12.635865
        , Vector.vector 13.319138 -2.50475 -13.316411
        , Vector.vector 12.848175 -1.267689 -13.939775
        , Vector.vector 12.290173 0.000003 -14.489707
        , Vector.vector 11.652392 1.275566 -14.953083
        , Vector.vector 10.946639 2.535386 -15.321322
        , Vector.vector 10.1882 3.757131 -15.59117
        , Vector.vector 9.394292 4.921639 -15.764667
        , Vector.vector 8.582387 6.014207 -15.848405
        , Vector.vector 7.768724 7.025121 -15.852276
        , Vector.vector 6.967261 7.949481 -15.788066
        , Vector.vector 1.486537 18.910942 1.080028
        , Vector.vector 1.894426 18.773691 2.227032
        , Vector.vector 2.70346 18.773687 1.113516
        , Vector.vector 2.317862 18.543196 3.431811
        , Vector.vector 3.157755 18.594761 2.294236
        , Vector.vector 3.980135 18.54319 1.143937
        , Vector.vector 2.751184 18.207767 4.68062
        , Vector.vector 3.622423 18.314207 3.530987
        , Vector.vector 4.477578 18.314201 2.353991
        , Vector.vector 5.301738 18.207752 1.170155
        , Vector.vector 3.18729 17.758839 5.955231
        , Vector.vector 4.089651 17.920963 4.807679
        , Vector.vector 4.978156 17.975998 3.616833
        , Vector.vector 5.836177 17.920952 2.403839
        , Vector.vector 6.64874 17.75882 1.191046
        , Vector.vector 3.617989 17.192562 7.233673
        , Vector.vector 4.550266 17.408068 6.103623
        , Vector.vector 5.471811 17.518904 4.91399
        , Vector.vector 6.364384 17.518898 3.685492
        , Vector.vector 7.211041 17.408051 2.441449
        , Vector.vector 7.997713 17.192532 1.205612
        , Vector.vector 4.034608 16.510998 8.491693
        , Vector.vector 4.994375 16.77425 7.394647
        , Vector.vector 5.94744 16.938372 6.2225
        , Vector.vector 6.874206 16.994154 4.994396
        , Vector.vector 7.755836 16.938358 3.7335
        , Vector.vector 8.57612 16.774221 2.464882
        , Vector.vector 9.322908 16.510958 1.213099
        , Vector.vector 4.428765 15.722686 9.704802
        , Vector.vector 5.41224 16.024958 8.65496
        , Vector.vector 6.39385 16.236435 7.51644
        , Vector.vector 7.353036 16.34536 6.305724
        , Vector.vector 8.269326 16.34535 5.044579
        , Vector.vector 9.124401 16.236412 3.75822
        , Vector.vector 9.903881 16.024923 2.472846
        , Vector.vector 10.598448 15.722637 1.2131
        , Vector.vector 4.793161 14.842216 10.85054
        , Vector.vector 5.795257 15.172484 9.859548
        , Vector.vector 6.800887 15.422361 8.769191
        , Vector.vector 7.789064 15.578344 7.592474
        , Vector.vector 8.738114 15.631394 6.348611
        , Vector.vector 9.627844 15.578329 5.06165
        , Vector.vector 10.441621 15.42233 3.758224
        , Vector.vector 11.167874 15.172438 2.464887
        , Vector.vector 11.800715 14.842155 1.205616
        , Vector.vector 5.122249 13.888922 11.910519
        , Vector.vector 6.136806 14.234991 10.986567
        , Vector.vector 7.16052 14.512216 9.95603
        , Vector.vector 8.172572 14.706288 8.828032
        , Vector.vector 9.150669 14.806288 7.618341
        , Vector.vector 10.073191 14.80628 6.348618
        , Vector.vector 10.921443 14.706264 5.044589
        , Vector.vector 11.681509 14.512177 3.733511
        , Vector.vector 12.345277 14.234938 2.441459
        , Vector.vector 12.910504 13.888854 1.191051
        , Vector.vector 5.412611 12.884903 12.871785
        , Vector.vector 6.432801 13.234662 12.019269
        , Vector.vector 7.467615 13.527299 11.056535
        , Vector.vector 8.496973 13.748623 9.988835
        , Vector.vector 9.498631 13.886744 8.828041
        , Vector.vector 10.450153 13.933715 7.592491
        , Vector.vector 11.33121 13.886729 6.305744
        , Vector.vector 12.125676 13.748592 4.994417
        , Vector.vector 12.823045 13.527253 3.685511
        , Vector.vector 13.418898 13.234603 2.403853
        , Vector.vector 13.914446 12.884831 1.170162
        , Vector.vector 5.663031 11.852841 13.727353
        , Vector.vector 6.681838 12.195365 12.94705
        , Vector.vector 7.72023 12.491847 12.056194
        , Vector.vector 8.759349 12.728965 11.056545
        , Vector.vector 9.777641 12.894757 9.956054
        , Vector.vector 10.752555 12.980115 8.769218
        , Vector.vector 11.662737 12.980107 7.516473
        , Vector.vector 12.490233 12.894735 6.222533
        , Vector.vector 13.222207 12.728929 4.91402
        , Vector.vector 13.851836 12.491796 3.616858
        , Vector.vector 14.378222 12.195302 2.354009
        , Vector.vector 14.805515 11.852767 1.143946
        , Vector.vector 5.87424 10.814033 14.475843
        , Vector.vector 6.884948 11.140351 13.765537
        , Vector.vector 7.919422 11.430501 12.947062
        , Vector.vector 8.960382 11.67254 12.019293
        , Vector.vector 9.987492 11.85515 10.986602
        , Vector.vector 10.978777 11.968916 9.85959
        , Vector.vector 11.912564 12.007566 8.655005
        , Vector.vector 12.769649 11.968901 7.394691
        , Vector.vector 13.53519 11.855122 6.103667
        , Vector.vector 14.199953 11.672498 4.807716
        , Vector.vector 14.760653 11.430447 3.531016
        , Vector.vector 15.219409 11.140285 2.294256
        , Vector.vector 15.582633 10.813956 1.113526
        , Vector.vector 6.048503 9.786962 15.120549
        , Vector.vector 7.045079 10.090414 14.475856
        , Vector.vector 8.068681 10.366073 13.727381
        , Vector.vector 9.103786 10.603641 12.871826
        , Vector.vector 10.131675 10.792939 11.910567
        , Vector.vector 11.131518 10.924918 10.850597
        , Vector.vector 12.082019 10.992745 9.704863
        , Vector.vector 12.963402 10.992739 8.491755
        , Vector.vector 13.759351 10.924898 7.233732
        , Vector.vector 14.458482 10.792907 5.955284
        , Vector.vector 15.055071 10.603598 4.680664
        , Vector.vector 15.548896 10.366016 3.431845
        , Vector.vector 15.944438 10.090349 2.227055
        , Vector.vector 16.249626 9.786885 1.080039
        , Vector.vector -0.567813 18.910944 1.747517
        , Vector.vector -1.532636 18.773691 2.489886
        , Vector.vector -0.223622 18.773691 2.915217
        , Vector.vector -2.5476 18.543196 3.264894
        , Vector.vector -1.20617 18.594761 3.712139
        , Vector.vector 0.14195 18.543198 4.138797
        , Vector.vector -3.601385 18.207767 4.062912
        , Vector.vector -2.238801 18.314211 4.536242
        , Vector.vector -0.855163 18.314209 4.98582
        , Vector.vector 0.525403 18.207767 5.403808
        , Vector.vector -4.678849 17.758841 4.871549
        , Vector.vector -3.308626 17.920967 5.375122
        , Vector.vector -1.901511 17.976004 5.852138
        , Vector.vector -0.482751 17.920967 6.293319
        , Vector.vector 0.921771 17.758841 6.69133
        , Vector.vector -5.761627 17.19256 5.676229
        , Vector.vector -4.398806 17.40807 6.213662
        , Vector.vector -2.982632 17.518909 6.722476
        , Vector.vector -1.538451 17.518909 7.191726
        , Vector.vector -0.093673 17.408073 7.612507
        , Vector.vector 1.324765 17.192562 7.978774
        , Vector.vector -6.829332 16.510998 6.461207
        , Vector.vector -5.489402 16.77425 7.034981
        , Vector.vector -4.080121 16.938379 7.579179
        , Vector.vector -2.625747 16.994169 8.08107
        , Vector.vector -1.154134 16.938379 8.529903
        , Vector.vector 0.305866 16.774254 8.918009
        , Vector.vector 1.727145 16.511 9.241421
        , Vector.vector -7.861266 15.722686 7.210945
        , Vector.vector -6.558904 16.02496 7.821856
        , Vector.vector -5.172781 16.236443 8.40359
        , Vector.vector -3.724925 16.345371 8.941689
        , Vector.vector -2.242366 16.345371 9.423409
        , Vector.vector -0.754743 16.236441 9.839121
        , Vector.vector 0.708585 16.024963 10.183244
        , Vector.vector 2.1213 15.722688 10.454529
        , Vector.vector -8.838324 14.842215 7.911558
        , Vector.vector -7.586175 15.172485 8.558366
        , Vector.vector -6.238435 15.422369 9.177828
        , Vector.vector -4.813956 15.578357 9.754007
        , Vector.vector -3.337709 15.631413 10.272224
        , Vector.vector -1.838804 15.578358 10.720708
        , Vector.vector -0.347711 15.422371 11.091871
        , Vector.vector 1.106743 15.172489 11.382912
        , Vector.vector 2.499934 14.842217 11.595642
        , Vector.vector -9.744727 13.888919 8.55209
        , Vector.vector -8.552488 14.23499 9.231466
        , Vector.vector -7.256052 14.51222 9.886617
        , Vector.vector -5.870529 14.706301 10.500556
        , Vector.vector -4.417805 14.806307 11.056958
        , Vector.vector -2.925161 14.806307 11.541956
        , Vector.vector -1.422841 14.706303 11.945721
        , Vector.vector 0.058933 14.512223 12.263438
        , Vector.vector 1.492856 14.234995 12.495451
        , Vector.vector 2.856724 13.888923 12.646618
        , Vector.vector -10.569221 12.884901 9.125292
        , Vector.vector -9.443175 13.234661 9.832098
        , Vector.vector -8.207793 13.527304 10.518756
        , Vector.vector -6.874269 13.748632 11.167791
        , Vector.vector -5.460768 13.886759 11.761711
        , Vector.vector -3.991663 13.933738 12.284853
        , Vector.vector -2.495641 13.886761 12.725157
        , Vector.vector -1.003001 13.748634 13.075514
        , Vector.vector 0.457333 13.527305 13.334274
        , Vector.vector 1.860384 13.234665 13.50491
        , Vector.vector 3.186823 12.884907 13.594976
        , Vector.vector -11.305529 11.852839 9.627837
        , Vector.vector -10.248592 12.195366 10.355648
        , Vector.vector -9.080464 12.491852 11.067919
        , Vector.vector -7.808643 12.728975 11.747268
        , Vector.vector -6.447352 12.894773 12.375641
        , Vector.vector -5.017349 12.980139 12.936083
        , Vector.vector -3.544664 12.980139 13.414595
        , Vector.vector -2.058353 12.894775 13.80174
        , Vector.vector -0.587698 12.72898 14.093534
        , Vector.vector 0.840535 12.491857 14.291502
        , Vector.vector 2.204233 12.195371 14.401886
        , Vector.vector 3.487109 11.852844 14.43434
        , Vector.vector -11.952117 10.81403 10.060006
        , Vector.vector -10.964256 11.140351 10.801745
        , Vector.vector -9.866172 11.430502 11.532659
        , Vector.vector -8.662145 11.672546 12.23597
        , Vector.vector -7.36261 11.855163 12.893684
        , Vector.vector -5.984442 11.968935 13.488182
        , Vector.vector -4.550267 12.007594 14.004027
        , Vector.vector -3.086793 11.968937 14.429702
        , Vector.vector -1.622398 11.855165 14.758823
        , Vector.vector -0.18446 11.672549 14.990582
        , Vector.vector 1.203013 11.430507 15.129316
        , Vector.vector 2.521002 11.140356 15.183446
        , Vector.vector 3.756181 10.814034 15.164029
        , Vector.vector -12.511417 9.786958 10.424964
        , Vector.vector -11.590323 10.090415 11.173538
        , Vector.vector -10.562173 10.366077 11.915744
        , Vector.vector -9.428633 10.603651 12.635801
        , Vector.vector -8.196794 10.792953 13.316334
        , Vector.vector -6.879741 10.924937 13.939688
        , Vector.vector -5.496371 10.992772 14.489613
        , Vector.vector -4.070283 10.992772 14.952984
        , Vector.vector -2.627878 10.924938 15.321226
        , Vector.vector -1.195965 10.792955 15.591079
        , Vector.vector 0.200618 10.603653 15.764591
        , Vector.vector 1.54091 10.36608 15.848343
        , Vector.vector 2.808959 10.090418 15.852228
        , Vector.vector 3.994141 9.786964 15.78804
        , Vector.vector -1.83746 18.910942 0.0
        , Vector.vector -2.841649 18.773689 -0.688185
        , Vector.vector -2.841649 18.773689 0.688185
        , Vector.vector -3.892376 18.543196 -1.413972
        , Vector.vector -3.903199 18.594759 0.0
        , Vector.vector -3.892376 18.543196 1.413972
        , Vector.vector -4.97698 18.207764 -2.169568
        , Vector.vector -5.006075 18.314203 -0.727417
        , Vector.vector -5.006075 18.314203 0.727417
        , Vector.vector -4.97698 18.207764 2.169568
        , Vector.vector -6.079003 17.758837 -2.944402
        , Vector.vector -6.134499 17.920959 -1.485641
        , Vector.vector -6.153338 17.975994 0.0
        , Vector.vector -6.134499 17.920959 1.485641
        , Vector.vector -6.079003 17.758837 2.944402
        , Vector.vector -7.178903 17.192553 -3.725512
        , Vector.vector -7.268889 17.40806 -2.263327
        , Vector.vector -7.315171 17.518898 -0.759246
        , Vector.vector -7.315171 17.518898 0.759246
        , Vector.vector -7.268889 17.40806 2.263327
        , Vector.vector -7.178903 17.192553 3.725513
        , Vector.vector -8.255408 16.510992 -4.498377
        , Vector.vector -8.387032 16.774239 -3.046732
        , Vector.vector -8.469093 16.938364 -1.538271
        , Vector.vector -8.496986 16.994152 0.0
        , Vector.vector -8.469093 16.938364 1.538272
        , Vector.vector -8.387032 16.774239 3.046732
        , Vector.vector -8.255408 16.510992 4.498377
        , Vector.vector -9.287344 15.722679 -5.248111
        , Vector.vector -9.465894 16.024948 -3.820719
        , Vector.vector -9.590812 16.236423 -2.322684
        , Vector.vector -9.655155 16.345352 -0.779422
        , Vector.vector -9.655155 16.345352 0.779422
        , Vector.vector -9.590812 16.236423 2.322684
        , Vector.vector -9.465894 16.024948 3.82072
        , Vector.vector -9.287344 15.722679 5.248111
        , Vector.vector -10.255601 14.842205 -5.960835
        , Vector.vector -10.483808 15.172473 -4.570107
        , Vector.vector -10.656465 15.422348 -3.096914
        , Vector.vector -10.764248 15.578335 -1.564119
        , Vector.vector -10.800908 15.631392 0.0
        , Vector.vector -10.764248 15.578335 1.564119
        , Vector.vector -10.656465 15.422348 3.096914
        , Vector.vector -10.483808 15.172473 4.570107
        , Vector.vector -10.255601 14.842205 5.960835
        , Vector.vector -11.144884 13.888912 -6.624931
        , Vector.vector -11.422577 14.234978 -5.281113
        , Vector.vector -11.64503 14.512201 -3.845687
        , Vector.vector -11.800761 14.706276 -2.338269
        , Vector.vector -11.881005 14.806278 -0.784723
        , Vector.vector -11.881005 14.806278 0.784724
        , Vector.vector -11.800759 14.706274 2.33827
        , Vector.vector -11.645029 14.5122 3.845687
        , Vector.vector -11.422577 14.234978 5.281113
        , Vector.vector -11.144882 13.88891 6.624931
        , Vector.vector -11.944818 12.884894 -7.231931
        , Vector.vector -12.269053 13.234648 -5.942591
        , Vector.vector -12.540338 13.527283 -4.555492
        , Vector.vector -12.745517 13.748608 -3.086684
        , Vector.vector -12.873564 13.886733 -1.558847
        , Vector.vector -12.917112 13.933708 0.0
        , Vector.vector -12.873564 13.886733 1.558847
        , Vector.vector -12.745517 13.748608 3.086684
        , Vector.vector -12.540338 13.527283 4.555491
        , Vector.vector -12.269053 13.234648 5.942591
        , Vector.vector -11.944818 12.884894 7.231931
        , Vector.vector -12.650307 11.852834 -7.776897
        , Vector.vector -13.015872 12.195353 -6.54679
        , Vector.vector -13.332298 12.491833 -5.215737
        , Vector.vector -13.585371 12.728951 -3.796244
        , Vector.vector -13.762319 12.894743 -2.307414
        , Vector.vector -13.853425 12.980107 -0.77423
        , Vector.vector -13.853425 12.980107 0.77423
        , Vector.vector -13.762319 12.894743 2.307414
        , Vector.vector -13.585371 12.728951 3.796244
        , Vector.vector -13.332298 12.491833 5.215737
        , Vector.vector -13.015872 12.195353 6.54679
        , Vector.vector -12.650307 11.852834 7.776897
        , Vector.vector -13.261134 10.814023 -8.258285
        , Vector.vector -13.661292 11.140339 -7.089567
        , Vector.vector -14.017095 11.430484 -5.81937
        , Vector.vector -14.313905 11.672523 -4.456945
        , Vector.vector -14.53784 11.855135 -3.017782
        , Vector.vector -14.677354 11.968904 -1.523371
        , Vector.vector -14.724758 12.007561 -0.0
        , Vector.vector -14.677354 11.968904 1.523371
        , Vector.vector -14.53784 11.855135 3.017781
        , Vector.vector -14.313905 11.672523 4.456945
        , Vector.vector -14.017095 11.430484 5.819369
        , Vector.vector -13.661292 11.140339 7.089566
        , Vector.vector -13.261134 10.814023 8.258284
        , Vector.vector -13.781067 9.786952 -8.677426
        , Vector.vector -14.208359 10.090403 -7.570095
        , Vector.vector -14.596511 10.366058 -6.362917
        , Vector.vector -14.931029 10.603624 -5.062355
        , Vector.vector -15.197583 10.792925 -3.680521
        , Vector.vector -15.383426 10.924905 -2.235317
        , Vector.vector -15.478941 10.992736 -0.749732
        , Vector.vector -15.478941 10.992736 0.749732
        , Vector.vector -15.383426 10.924905 2.235317
        , Vector.vector -15.197583 10.792925 3.680521
        , Vector.vector -14.931029 10.603624 5.062354
        , Vector.vector -14.596511 10.366058 6.362917
        , Vector.vector -14.208359 10.090403 7.570095
        , Vector.vector -13.781067 9.786952 8.677426
        , Vector.vector -0.567813 18.910944 -1.747517
        , Vector.vector -0.223622 18.773691 -2.915217
        , Vector.vector -1.532636 18.773691 -2.489886
        , Vector.vector 0.14195 18.543198 -4.138797
        , Vector.vector -1.20617 18.594761 -3.71214
        , Vector.vector -2.5476 18.543196 -3.264894
        , Vector.vector 0.525403 18.207767 -5.403808
        , Vector.vector -0.855163 18.314211 -4.985821
        , Vector.vector -2.238801 18.314209 -4.536242
        , Vector.vector -3.601385 18.207767 -4.062912
        , Vector.vector 0.921771 17.758842 -6.69133
        , Vector.vector -0.482751 17.920967 -6.293319
        , Vector.vector -1.901511 17.976004 -5.852138
        , Vector.vector -3.308626 17.920967 -5.375122
        , Vector.vector -4.678849 17.758841 -4.871549
        , Vector.vector 1.324765 17.192564 -7.978774
        , Vector.vector -0.093673 17.408073 -7.612507
        , Vector.vector -1.538451 17.518911 -7.191726
        , Vector.vector -2.982632 17.518911 -6.722475
        , Vector.vector -4.398805 17.40807 -6.213661
        , Vector.vector -5.761627 17.192558 -5.676228
        , Vector.vector 1.727145 16.511 -9.241421
        , Vector.vector 0.305865 16.774254 -8.91801
        , Vector.vector -1.154135 16.938379 -8.529905
        , Vector.vector -2.625748 16.994169 -8.081071
        , Vector.vector -4.080121 16.938377 -7.579179
        , Vector.vector -5.489402 16.77425 -7.034983
        , Vector.vector -6.829332 16.510998 -6.461207
        , Vector.vector 2.1213 15.722688 -10.454529
        , Vector.vector 0.708585 16.024963 -10.183244
        , Vector.vector -0.754743 16.236443 -9.839121
        , Vector.vector -2.242367 16.345371 -9.423411
        , Vector.vector -3.724926 16.345367 -8.941689
        , Vector.vector -5.172781 16.236441 -8.403589
        , Vector.vector -6.558905 16.024961 -7.821856
        , Vector.vector -7.861266 15.722684 -7.210945
        , Vector.vector 2.499933 14.842216 -11.595641
        , Vector.vector 1.106743 15.17249 -11.382913
        , Vector.vector -0.347711 15.422371 -11.091872
        , Vector.vector -1.838804 15.578358 -10.720708
        , Vector.vector -3.337709 15.631414 -10.272224
        , Vector.vector -4.813957 15.578357 -9.754007
        , Vector.vector -6.238434 15.422366 -9.177828
        , Vector.vector -7.586176 15.172486 -8.558366
        , Vector.vector -8.838324 14.842214 -7.911558
        , Vector.vector 2.856724 13.888925 -12.646619
        , Vector.vector 1.492856 14.234995 -12.495452
        , Vector.vector 0.058932 14.512223 -12.263438
        , Vector.vector -1.422842 14.706303 -11.945721
        , Vector.vector -2.925161 14.806307 -11.541956
        , Vector.vector -4.417805 14.806304 -11.056958
        , Vector.vector -5.870529 14.706301 -10.500556
        , Vector.vector -7.256052 14.51222 -9.886615
        , Vector.vector -8.552489 14.234991 -9.231466
        , Vector.vector -9.744727 13.888919 -8.55209
        , Vector.vector 3.186823 12.884907 -13.594976
        , Vector.vector 1.860384 13.234665 -13.504909
        , Vector.vector 0.457333 13.527308 -13.334273
        , Vector.vector -1.003001 13.748635 -13.075512
        , Vector.vector -2.495642 13.886764 -12.725156
        , Vector.vector -3.991663 13.933739 -12.284851
        , Vector.vector -5.46077 13.886763 -11.76171
        , Vector.vector -6.874269 13.748632 -11.167789
        , Vector.vector -8.207793 13.527304 -10.518755
        , Vector.vector -9.443176 13.234662 -9.832098
        , Vector.vector -10.569221 12.884901 -9.125292
        , Vector.vector 3.487109 11.852845 -14.43434
        , Vector.vector 2.204233 12.195371 -14.401885
        , Vector.vector 0.840536 12.491857 -14.291502
        , Vector.vector -0.587698 12.728979 -14.093534
        , Vector.vector -2.058352 12.894775 -13.801738
        , Vector.vector -3.544663 12.980139 -13.414594
        , Vector.vector -5.017348 12.980139 -12.936083
        , Vector.vector -6.44735 12.894773 -12.375641
        , Vector.vector -7.80864 12.728975 -11.747267
        , Vector.vector -9.080462 12.491853 -11.06792
        , Vector.vector -10.24859 12.195366 -10.355648
        , Vector.vector -11.305529 11.852839 -9.627839
        , Vector.vector 3.756181 10.814035 -15.164029
        , Vector.vector 2.521001 11.140357 -15.183446
        , Vector.vector 1.203012 11.430508 -15.129316
        , Vector.vector -0.184461 11.672551 -14.99058
        , Vector.vector -1.622399 11.855165 -14.758822
        , Vector.vector -3.086793 11.968938 -14.4297
        , Vector.vector -4.550267 12.007595 -14.004025
        , Vector.vector -5.984442 11.968937 -13.488181
        , Vector.vector -7.36261 11.855164 -12.893683
        , Vector.vector -8.662143 11.672546 -12.235967
        , Vector.vector -9.866172 11.430504 -11.532659
        , Vector.vector -10.964254 11.140351 -10.801744
        , Vector.vector -11.952117 10.81403 -10.060006
        , Vector.vector 3.994141 9.786963 -15.78804
        , Vector.vector 2.808959 10.090418 -15.85223
        , Vector.vector 1.54091 10.366079 -15.848345
        , Vector.vector 0.200618 10.603651 -15.764589
        , Vector.vector -1.195966 10.792953 -15.59108
        , Vector.vector -2.627879 10.924936 -15.321226
        , Vector.vector -4.070283 10.992771 -14.952988
        , Vector.vector -5.496371 10.99277 -14.489614
        , Vector.vector -6.879742 10.924936 -13.93969
        , Vector.vector -8.196793 10.792952 -13.316335
        , Vector.vector -9.428633 10.603647 -12.635802
        , Vector.vector -10.562173 10.366076 -11.915745
        , Vector.vector -11.590323 10.090415 -11.173539
        , Vector.vector -12.511417 9.786958 -10.424966
        , Vector.vector 1.486537 18.910942 -1.080028
        , Vector.vector 2.70346 18.773687 -1.113516
        , Vector.vector 1.894426 18.773691 -2.227032
        , Vector.vector 3.980135 18.54319 -1.143937
        , Vector.vector 3.157755 18.594759 -2.294236
        , Vector.vector 2.317862 18.543196 -3.431811
        , Vector.vector 5.301738 18.207752 -1.170155
        , Vector.vector 4.477578 18.314203 -2.353991
        , Vector.vector 3.622423 18.314207 -3.530987
        , Vector.vector 2.751184 18.207767 -4.68062
        , Vector.vector 6.64874 17.75882 -1.191046
        , Vector.vector 5.836177 17.920956 -2.40384
        , Vector.vector 4.978156 17.975998 -3.616833
        , Vector.vector 4.089651 17.920965 -4.807679
        , Vector.vector 3.18729 17.758839 -5.955231
        , Vector.vector 7.997713 17.19253 -1.205612
        , Vector.vector 7.211042 17.408049 -2.44145
        , Vector.vector 6.364384 17.518896 -3.685493
        , Vector.vector 5.471812 17.518902 -4.91399
        , Vector.vector 4.550267 17.40807 -6.103625
        , Vector.vector 3.617989 17.19256 -7.233674
        , Vector.vector 9.322908 16.510958 -1.213099
        , Vector.vector 8.57612 16.774221 -2.464882
        , Vector.vector 7.755836 16.938358 -3.7335
        , Vector.vector 6.874206 16.994156 -4.994396
        , Vector.vector 5.947441 16.938372 -6.2225
        , Vector.vector 4.994375 16.774248 -7.394646
        , Vector.vector 4.034608 16.511 -8.491693
        , Vector.vector 10.598448 15.722635 -1.2131
        , Vector.vector 9.903881 16.024921 -2.472846
        , Vector.vector 9.1244 16.236412 -3.75822
        , Vector.vector 8.269326 16.34535 -5.04458
        , Vector.vector 7.353036 16.345356 -6.305724
        , Vector.vector 6.39385 16.236435 -7.516442
        , Vector.vector 5.41224 16.02496 -8.654961
        , Vector.vector 4.428765 15.722686 -9.704802
        , Vector.vector 11.800715 14.842156 -1.205616
        , Vector.vector 11.167874 15.172438 -2.464887
        , Vector.vector 10.441621 15.422332 -3.758224
        , Vector.vector 9.627843 15.578328 -5.06165
        , Vector.vector 8.738114 15.631394 -6.348612
        , Vector.vector 7.789064 15.578344 -7.592475
        , Vector.vector 6.800886 15.422361 -8.769191
        , Vector.vector 5.795258 15.172484 -9.85955
        , Vector.vector 4.793161 14.842216 -10.850541
        , Vector.vector 12.910504 13.888853 -1.191052
        , Vector.vector 12.345278 14.234937 -2.441459
        , Vector.vector 11.68151 14.512176 -3.733512
        , Vector.vector 10.921444 14.706264 -5.04459
        , Vector.vector 10.073192 14.806278 -6.348618
        , Vector.vector 9.150671 14.806285 -7.618342
        , Vector.vector 8.172574 14.706287 -8.828032
        , Vector.vector 7.160521 14.512214 -9.956032
        , Vector.vector 6.136806 14.23499 -10.986568
        , Vector.vector 5.122249 13.888921 -11.910519
        , Vector.vector 13.914446 12.88483 -1.170163
        , Vector.vector 13.418897 13.234602 -2.403854
        , Vector.vector 12.823043 13.527253 -3.685512
        , Vector.vector 12.125676 13.74859 -4.994418
        , Vector.vector 11.331211 13.886727 -6.305745
        , Vector.vector 10.450154 13.933712 -7.592492
        , Vector.vector 9.498632 13.886744 -8.828043
        , Vector.vector 8.496974 13.74862 -9.988836
        , Vector.vector 7.467615 13.527297 -11.056536
        , Vector.vector 6.432802 13.23466 -12.01927
        , Vector.vector 5.412612 12.884903 -12.871785
        , Vector.vector 14.805515 11.852767 -1.143946
        , Vector.vector 14.378221 12.195303 -2.354009
        , Vector.vector 13.851835 12.491798 -3.616858
        , Vector.vector 13.222206 12.72893 -4.91402
        , Vector.vector 12.49023 12.894735 -6.222533
        , Vector.vector 11.662735 12.980109 -7.516473
        , Vector.vector 10.752552 12.980117 -8.769218
        , Vector.vector 9.777638 12.894758 -9.956053
        , Vector.vector 8.759348 12.728967 -11.056545
        , Vector.vector 7.720228 12.491847 -12.056194
        , Vector.vector 6.681838 12.195366 -12.947051
        , Vector.vector 5.663031 11.852841 -13.727352
        , Vector.vector 15.582633 10.813956 -1.113526
        , Vector.vector 15.219409 11.140285 -2.294257
        , Vector.vector 14.760653 11.430447 -3.531018
        , Vector.vector 14.199954 11.672498 -4.807718
        , Vector.vector 13.535188 11.855121 -6.103668
        , Vector.vector 12.769649 11.968901 -7.394693
        , Vector.vector 11.912564 12.007565 -8.655007
        , Vector.vector 10.978777 11.968915 -9.859591
        , Vector.vector 9.987492 11.855148 -10.986602
        , Vector.vector 8.960382 11.672537 -12.019294
        , Vector.vector 7.919422 11.430498 -12.947062
        , Vector.vector 6.884948 11.14035 -13.765538
        , Vector.vector 5.87424 10.814032 -14.475842
        , Vector.vector 16.249626 9.786885 -1.080039
        , Vector.vector 15.944439 10.090349 -2.227055
        , Vector.vector 15.548895 10.366017 -3.431845
        , Vector.vector 15.055068 10.603596 -4.680664
        , Vector.vector 14.458483 10.792909 -5.955285
        , Vector.vector 13.759348 10.924899 -7.233732
        , Vector.vector 12.963401 10.992741 -8.491756
        , Vector.vector 12.082017 10.992745 -9.704864
        , Vector.vector 11.131517 10.924917 -10.850597
        , Vector.vector 10.131676 10.792939 -11.910568
        , Vector.vector 9.103786 10.603641 -12.871825
        , Vector.vector 8.068681 10.366072 -13.727381
        , Vector.vector 7.045079 10.090414 -14.475856
        , Vector.vector 6.048503 9.786962 -15.120549
        ]


vertexIndexes : List (List Int)
vertexIndexes =
    [ []
    , [ 1, 28, 27 ]
    , [ 2, 42, 72 ]
    , [ 1, 27, 102 ]
    , [ 1, 102, 132 ]
    , [ 1, 132, 73 ]
    , [ 2, 72, 177 ]
    , [ 3, 57, 207 ]
    , [ 4, 117, 237 ]
    , [ 5, 147, 267 ]
    , [ 6, 162, 297 ]
    , [ 2, 177, 208 ]
    , [ 3, 207, 238 ]
    , [ 4, 237, 268 ]
    , [ 5, 267, 298 ]
    , [ 6, 297, 178 ]
    , [ 7, 327, 402 ]
    , [ 8, 342, 432 ]
    , [ 9, 357, 447 ]
    , [ 10, 372, 462 ]
    , [ 11, 387, 403 ]
    , [ 13, 57, 3 ]
    , [ 14, 463, 13 ]
    , [ 15, 464, 14 ]
    , [ 16, 466, 15 ]
    , [ 17, 469, 16 ]
    , [ 18, 473, 17 ]
    , [ 19, 478, 18 ]
    , [ 20, 484, 19 ]
    , [ 21, 491, 20 ]
    , [ 22, 499, 21 ]
    , [ 23, 508, 22 ]
    , [ 24, 518, 23 ]
    , [ 25, 529, 24 ]
    , [ 26, 541, 25 ]
    , [ 27, 554, 26 ]
    , [ 13, 463, 57 ]
    , [ 463, 56, 57 ]
    , [ 14, 464, 463 ]
    , [ 464, 465, 463 ]
    , [ 463, 465, 56 ]
    , [ 465, 55, 56 ]
    , [ 15, 466, 464 ]
    , [ 466, 467, 464 ]
    , [ 464, 467, 465 ]
    , [ 467, 468, 465 ]
    , [ 465, 468, 55 ]
    , [ 468, 54, 55 ]
    , [ 16, 469, 466 ]
    , [ 469, 470, 466 ]
    , [ 466, 470, 467 ]
    , [ 470, 471, 467 ]
    , [ 467, 471, 468 ]
    , [ 471, 472, 468 ]
    , [ 468, 472, 54 ]
    , [ 472, 53, 54 ]
    , [ 17, 473, 469 ]
    , [ 473, 474, 469 ]
    , [ 469, 474, 470 ]
    , [ 474, 475, 470 ]
    , [ 470, 475, 471 ]
    , [ 475, 476, 471 ]
    , [ 471, 476, 472 ]
    , [ 476, 477, 472 ]
    , [ 472, 477, 53 ]
    , [ 477, 52, 53 ]
    , [ 18, 478, 473 ]
    , [ 478, 479, 473 ]
    , [ 473, 479, 474 ]
    , [ 479, 480, 474 ]
    , [ 474, 480, 475 ]
    , [ 480, 481, 475 ]
    , [ 475, 481, 476 ]
    , [ 481, 482, 476 ]
    , [ 476, 482, 477 ]
    , [ 482, 483, 477 ]
    , [ 477, 483, 52 ]
    , [ 483, 51, 52 ]
    , [ 19, 484, 478 ]
    , [ 484, 485, 478 ]
    , [ 478, 485, 479 ]
    , [ 485, 486, 479 ]
    , [ 479, 486, 480 ]
    , [ 486, 487, 480 ]
    , [ 480, 487, 481 ]
    , [ 487, 488, 481 ]
    , [ 481, 488, 482 ]
    , [ 488, 489, 482 ]
    , [ 482, 489, 483 ]
    , [ 489, 490, 483 ]
    , [ 483, 490, 51 ]
    , [ 490, 50, 51 ]
    , [ 20, 491, 484 ]
    , [ 491, 492, 484 ]
    , [ 484, 492, 485 ]
    , [ 492, 493, 485 ]
    , [ 485, 493, 486 ]
    , [ 493, 494, 486 ]
    , [ 486, 494, 487 ]
    , [ 494, 495, 487 ]
    , [ 487, 495, 488 ]
    , [ 495, 496, 488 ]
    , [ 488, 496, 489 ]
    , [ 496, 497, 489 ]
    , [ 489, 497, 490 ]
    , [ 497, 498, 490 ]
    , [ 490, 498, 50 ]
    , [ 498, 49, 50 ]
    , [ 21, 499, 491 ]
    , [ 499, 500, 491 ]
    , [ 491, 500, 492 ]
    , [ 500, 501, 492 ]
    , [ 492, 501, 493 ]
    , [ 501, 502, 493 ]
    , [ 493, 502, 494 ]
    , [ 502, 503, 494 ]
    , [ 494, 503, 495 ]
    , [ 503, 504, 495 ]
    , [ 495, 504, 496 ]
    , [ 504, 505, 496 ]
    , [ 496, 505, 497 ]
    , [ 505, 506, 497 ]
    , [ 497, 506, 498 ]
    , [ 506, 507, 498 ]
    , [ 498, 507, 49 ]
    , [ 507, 48, 49 ]
    , [ 22, 508, 499 ]
    , [ 508, 509, 499 ]
    , [ 499, 509, 500 ]
    , [ 509, 510, 500 ]
    , [ 500, 510, 501 ]
    , [ 510, 511, 501 ]
    , [ 501, 511, 502 ]
    , [ 511, 512, 502 ]
    , [ 502, 512, 503 ]
    , [ 512, 513, 503 ]
    , [ 503, 513, 504 ]
    , [ 513, 514, 504 ]
    , [ 504, 514, 505 ]
    , [ 514, 515, 505 ]
    , [ 505, 515, 506 ]
    , [ 515, 516, 506 ]
    , [ 506, 516, 507 ]
    , [ 516, 517, 507 ]
    , [ 507, 517, 48 ]
    , [ 517, 47, 48 ]
    , [ 23, 518, 508 ]
    , [ 518, 519, 508 ]
    , [ 508, 519, 509 ]
    , [ 519, 520, 509 ]
    , [ 509, 520, 510 ]
    , [ 520, 521, 510 ]
    , [ 510, 521, 511 ]
    , [ 521, 522, 511 ]
    , [ 511, 522, 512 ]
    , [ 522, 523, 512 ]
    , [ 512, 523, 513 ]
    , [ 523, 524, 513 ]
    , [ 513, 524, 514 ]
    , [ 524, 525, 514 ]
    , [ 514, 525, 515 ]
    , [ 525, 526, 515 ]
    , [ 515, 526, 516 ]
    , [ 526, 527, 516 ]
    , [ 516, 527, 517 ]
    , [ 527, 528, 517 ]
    , [ 517, 528, 47 ]
    , [ 528, 46, 47 ]
    , [ 24, 529, 518 ]
    , [ 529, 530, 518 ]
    , [ 518, 530, 519 ]
    , [ 530, 531, 519 ]
    , [ 519, 531, 520 ]
    , [ 531, 532, 520 ]
    , [ 520, 532, 521 ]
    , [ 532, 533, 521 ]
    , [ 521, 533, 522 ]
    , [ 533, 534, 522 ]
    , [ 522, 534, 523 ]
    , [ 534, 535, 523 ]
    , [ 523, 535, 524 ]
    , [ 535, 536, 524 ]
    , [ 524, 536, 525 ]
    , [ 536, 537, 525 ]
    , [ 525, 537, 526 ]
    , [ 537, 538, 526 ]
    , [ 526, 538, 527 ]
    , [ 538, 539, 527 ]
    , [ 527, 539, 528 ]
    , [ 539, 540, 528 ]
    , [ 528, 540, 46 ]
    , [ 540, 45, 46 ]
    , [ 25, 541, 529 ]
    , [ 541, 542, 529 ]
    , [ 529, 542, 530 ]
    , [ 542, 543, 530 ]
    , [ 530, 543, 531 ]
    , [ 543, 544, 531 ]
    , [ 531, 544, 532 ]
    , [ 544, 545, 532 ]
    , [ 532, 545, 533 ]
    , [ 545, 546, 533 ]
    , [ 533, 546, 534 ]
    , [ 546, 547, 534 ]
    , [ 534, 547, 535 ]
    , [ 547, 548, 535 ]
    , [ 535, 548, 536 ]
    , [ 548, 549, 536 ]
    , [ 536, 549, 537 ]
    , [ 549, 550, 537 ]
    , [ 537, 550, 538 ]
    , [ 550, 551, 538 ]
    , [ 538, 551, 539 ]
    , [ 551, 552, 539 ]
    , [ 539, 552, 540 ]
    , [ 552, 553, 540 ]
    , [ 540, 553, 45 ]
    , [ 553, 44, 45 ]
    , [ 26, 554, 541 ]
    , [ 554, 555, 541 ]
    , [ 541, 555, 542 ]
    , [ 555, 556, 542 ]
    , [ 542, 556, 543 ]
    , [ 556, 557, 543 ]
    , [ 543, 557, 544 ]
    , [ 557, 558, 544 ]
    , [ 544, 558, 545 ]
    , [ 558, 559, 545 ]
    , [ 545, 559, 546 ]
    , [ 559, 560, 546 ]
    , [ 546, 560, 547 ]
    , [ 560, 561, 547 ]
    , [ 547, 561, 548 ]
    , [ 561, 562, 548 ]
    , [ 548, 562, 549 ]
    , [ 562, 563, 549 ]
    , [ 549, 563, 550 ]
    , [ 563, 564, 550 ]
    , [ 550, 564, 551 ]
    , [ 564, 565, 551 ]
    , [ 551, 565, 552 ]
    , [ 565, 566, 552 ]
    , [ 552, 566, 553 ]
    , [ 566, 567, 553 ]
    , [ 553, 567, 44 ]
    , [ 567, 43, 44 ]
    , [ 27, 28, 554 ]
    , [ 28, 29, 554 ]
    , [ 554, 29, 555 ]
    , [ 29, 30, 555 ]
    , [ 555, 30, 556 ]
    , [ 30, 31, 556 ]
    , [ 556, 31, 557 ]
    , [ 31, 32, 557 ]
    , [ 557, 32, 558 ]
    , [ 32, 33, 558 ]
    , [ 558, 33, 559 ]
    , [ 33, 34, 559 ]
    , [ 559, 34, 560 ]
    , [ 34, 35, 560 ]
    , [ 560, 35, 561 ]
    , [ 35, 36, 561 ]
    , [ 561, 36, 562 ]
    , [ 36, 37, 562 ]
    , [ 562, 37, 563 ]
    , [ 37, 38, 563 ]
    , [ 563, 38, 564 ]
    , [ 38, 39, 564 ]
    , [ 564, 39, 565 ]
    , [ 39, 40, 565 ]
    , [ 565, 40, 566 ]
    , [ 40, 41, 566 ]
    , [ 566, 41, 567 ]
    , [ 41, 42, 567 ]
    , [ 567, 42, 43 ]
    , [ 42, 2, 43 ]
    , [ 58, 87, 6 ]
    , [ 59, 568, 58 ]
    , [ 60, 569, 59 ]
    , [ 61, 571, 60 ]
    , [ 62, 574, 61 ]
    , [ 63, 578, 62 ]
    , [ 64, 583, 63 ]
    , [ 65, 589, 64 ]
    , [ 66, 596, 65 ]
    , [ 67, 604, 66 ]
    , [ 68, 613, 67 ]
    , [ 69, 623, 68 ]
    , [ 70, 634, 69 ]
    , [ 71, 646, 70 ]
    , [ 72, 659, 71 ]
    , [ 58, 568, 87 ]
    , [ 568, 86, 87 ]
    , [ 59, 569, 568 ]
    , [ 569, 570, 568 ]
    , [ 568, 570, 86 ]
    , [ 570, 85, 86 ]
    , [ 60, 571, 569 ]
    , [ 571, 572, 569 ]
    , [ 569, 572, 570 ]
    , [ 572, 573, 570 ]
    , [ 570, 573, 85 ]
    , [ 573, 84, 85 ]
    , [ 61, 574, 571 ]
    , [ 574, 575, 571 ]
    , [ 571, 575, 572 ]
    , [ 575, 576, 572 ]
    , [ 572, 576, 573 ]
    , [ 576, 577, 573 ]
    , [ 573, 577, 84 ]
    , [ 577, 83, 84 ]
    , [ 62, 578, 574 ]
    , [ 578, 579, 574 ]
    , [ 574, 579, 575 ]
    , [ 579, 580, 575 ]
    , [ 575, 580, 576 ]
    , [ 580, 581, 576 ]
    , [ 576, 581, 577 ]
    , [ 581, 582, 577 ]
    , [ 577, 582, 83 ]
    , [ 582, 82, 83 ]
    , [ 63, 583, 578 ]
    , [ 583, 584, 578 ]
    , [ 578, 584, 579 ]
    , [ 584, 585, 579 ]
    , [ 579, 585, 580 ]
    , [ 585, 586, 580 ]
    , [ 580, 586, 581 ]
    , [ 586, 587, 581 ]
    , [ 581, 587, 582 ]
    , [ 587, 588, 582 ]
    , [ 582, 588, 82 ]
    , [ 588, 81, 82 ]
    , [ 64, 589, 583 ]
    , [ 589, 590, 583 ]
    , [ 583, 590, 584 ]
    , [ 590, 591, 584 ]
    , [ 584, 591, 585 ]
    , [ 591, 592, 585 ]
    , [ 585, 592, 586 ]
    , [ 592, 593, 586 ]
    , [ 586, 593, 587 ]
    , [ 593, 594, 587 ]
    , [ 587, 594, 588 ]
    , [ 594, 595, 588 ]
    , [ 588, 595, 81 ]
    , [ 595, 80, 81 ]
    , [ 65, 596, 589 ]
    , [ 596, 597, 589 ]
    , [ 589, 597, 590 ]
    , [ 597, 598, 590 ]
    , [ 590, 598, 591 ]
    , [ 598, 599, 591 ]
    , [ 591, 599, 592 ]
    , [ 599, 600, 592 ]
    , [ 592, 600, 593 ]
    , [ 600, 601, 593 ]
    , [ 593, 601, 594 ]
    , [ 601, 602, 594 ]
    , [ 594, 602, 595 ]
    , [ 602, 603, 595 ]
    , [ 595, 603, 80 ]
    , [ 603, 79, 80 ]
    , [ 66, 604, 596 ]
    , [ 604, 605, 596 ]
    , [ 596, 605, 597 ]
    , [ 605, 606, 597 ]
    , [ 597, 606, 598 ]
    , [ 606, 607, 598 ]
    , [ 598, 607, 599 ]
    , [ 607, 608, 599 ]
    , [ 599, 608, 600 ]
    , [ 608, 609, 600 ]
    , [ 600, 609, 601 ]
    , [ 609, 610, 601 ]
    , [ 601, 610, 602 ]
    , [ 610, 611, 602 ]
    , [ 602, 611, 603 ]
    , [ 611, 612, 603 ]
    , [ 603, 612, 79 ]
    , [ 612, 78, 79 ]
    , [ 67, 613, 604 ]
    , [ 613, 614, 604 ]
    , [ 604, 614, 605 ]
    , [ 614, 615, 605 ]
    , [ 605, 615, 606 ]
    , [ 615, 616, 606 ]
    , [ 606, 616, 607 ]
    , [ 616, 617, 607 ]
    , [ 607, 617, 608 ]
    , [ 617, 618, 608 ]
    , [ 608, 618, 609 ]
    , [ 618, 619, 609 ]
    , [ 609, 619, 610 ]
    , [ 619, 620, 610 ]
    , [ 610, 620, 611 ]
    , [ 620, 621, 611 ]
    , [ 611, 621, 612 ]
    , [ 621, 622, 612 ]
    , [ 612, 622, 78 ]
    , [ 622, 77, 78 ]
    , [ 68, 623, 613 ]
    , [ 623, 624, 613 ]
    , [ 613, 624, 614 ]
    , [ 624, 625, 614 ]
    , [ 614, 625, 615 ]
    , [ 625, 626, 615 ]
    , [ 615, 626, 616 ]
    , [ 626, 627, 616 ]
    , [ 616, 627, 617 ]
    , [ 627, 628, 617 ]
    , [ 617, 628, 618 ]
    , [ 628, 629, 618 ]
    , [ 618, 629, 619 ]
    , [ 629, 630, 619 ]
    , [ 619, 630, 620 ]
    , [ 630, 631, 620 ]
    , [ 620, 631, 621 ]
    , [ 631, 632, 621 ]
    , [ 621, 632, 622 ]
    , [ 632, 633, 622 ]
    , [ 622, 633, 77 ]
    , [ 633, 76, 77 ]
    , [ 69, 634, 623 ]
    , [ 634, 635, 623 ]
    , [ 623, 635, 624 ]
    , [ 635, 636, 624 ]
    , [ 624, 636, 625 ]
    , [ 636, 637, 625 ]
    , [ 625, 637, 626 ]
    , [ 637, 638, 626 ]
    , [ 626, 638, 627 ]
    , [ 638, 639, 627 ]
    , [ 627, 639, 628 ]
    , [ 639, 640, 628 ]
    , [ 628, 640, 629 ]
    , [ 640, 641, 629 ]
    , [ 629, 641, 630 ]
    , [ 641, 642, 630 ]
    , [ 630, 642, 631 ]
    , [ 642, 643, 631 ]
    , [ 631, 643, 632 ]
    , [ 643, 644, 632 ]
    , [ 632, 644, 633 ]
    , [ 644, 645, 633 ]
    , [ 633, 645, 76 ]
    , [ 645, 75, 76 ]
    , [ 70, 646, 634 ]
    , [ 646, 647, 634 ]
    , [ 634, 647, 635 ]
    , [ 647, 648, 635 ]
    , [ 635, 648, 636 ]
    , [ 648, 649, 636 ]
    , [ 636, 649, 637 ]
    , [ 649, 650, 637 ]
    , [ 637, 650, 638 ]
    , [ 650, 651, 638 ]
    , [ 638, 651, 639 ]
    , [ 651, 652, 639 ]
    , [ 639, 652, 640 ]
    , [ 652, 653, 640 ]
    , [ 640, 653, 641 ]
    , [ 653, 654, 641 ]
    , [ 641, 654, 642 ]
    , [ 654, 655, 642 ]
    , [ 642, 655, 643 ]
    , [ 655, 656, 643 ]
    , [ 643, 656, 644 ]
    , [ 656, 657, 644 ]
    , [ 644, 657, 645 ]
    , [ 657, 658, 645 ]
    , [ 645, 658, 75 ]
    , [ 658, 74, 75 ]
    , [ 71, 659, 646 ]
    , [ 659, 660, 646 ]
    , [ 646, 660, 647 ]
    , [ 660, 661, 647 ]
    , [ 647, 661, 648 ]
    , [ 661, 662, 648 ]
    , [ 648, 662, 649 ]
    , [ 662, 663, 649 ]
    , [ 649, 663, 650 ]
    , [ 663, 664, 650 ]
    , [ 650, 664, 651 ]
    , [ 664, 665, 651 ]
    , [ 651, 665, 652 ]
    , [ 665, 666, 652 ]
    , [ 652, 666, 653 ]
    , [ 666, 667, 653 ]
    , [ 653, 667, 654 ]
    , [ 667, 668, 654 ]
    , [ 654, 668, 655 ]
    , [ 668, 669, 655 ]
    , [ 655, 669, 656 ]
    , [ 669, 670, 656 ]
    , [ 656, 670, 657 ]
    , [ 670, 671, 657 ]
    , [ 657, 671, 658 ]
    , [ 671, 672, 658 ]
    , [ 658, 672, 74 ]
    , [ 672, 73, 74 ]
    , [ 72, 42, 659 ]
    , [ 42, 41, 659 ]
    , [ 659, 41, 660 ]
    , [ 41, 40, 660 ]
    , [ 660, 40, 661 ]
    , [ 40, 39, 661 ]
    , [ 661, 39, 662 ]
    , [ 39, 38, 662 ]
    , [ 662, 38, 663 ]
    , [ 38, 37, 663 ]
    , [ 663, 37, 664 ]
    , [ 37, 36, 664 ]
    , [ 664, 36, 665 ]
    , [ 36, 35, 665 ]
    , [ 665, 35, 666 ]
    , [ 35, 34, 666 ]
    , [ 666, 34, 667 ]
    , [ 34, 33, 667 ]
    , [ 667, 33, 668 ]
    , [ 33, 32, 668 ]
    , [ 668, 32, 669 ]
    , [ 32, 31, 669 ]
    , [ 669, 31, 670 ]
    , [ 31, 30, 670 ]
    , [ 670, 30, 671 ]
    , [ 30, 29, 671 ]
    , [ 671, 29, 672 ]
    , [ 29, 28, 672 ]
    , [ 672, 28, 73 ]
    , [ 28, 1, 73 ]
    , [ 88, 117, 4 ]
    , [ 89, 673, 88 ]
    , [ 90, 674, 89 ]
    , [ 91, 676, 90 ]
    , [ 92, 679, 91 ]
    , [ 93, 683, 92 ]
    , [ 94, 688, 93 ]
    , [ 95, 694, 94 ]
    , [ 96, 701, 95 ]
    , [ 97, 709, 96 ]
    , [ 98, 718, 97 ]
    , [ 99, 728, 98 ]
    , [ 100, 739, 99 ]
    , [ 101, 751, 100 ]
    , [ 102, 764, 101 ]
    , [ 88, 673, 117 ]
    , [ 673, 116, 117 ]
    , [ 89, 674, 673 ]
    , [ 674, 675, 673 ]
    , [ 673, 675, 116 ]
    , [ 675, 115, 116 ]
    , [ 90, 676, 674 ]
    , [ 676, 677, 674 ]
    , [ 674, 677, 675 ]
    , [ 677, 678, 675 ]
    , [ 675, 678, 115 ]
    , [ 678, 114, 115 ]
    , [ 91, 679, 676 ]
    , [ 679, 680, 676 ]
    , [ 676, 680, 677 ]
    , [ 680, 681, 677 ]
    , [ 677, 681, 678 ]
    , [ 681, 682, 678 ]
    , [ 678, 682, 114 ]
    , [ 682, 113, 114 ]
    , [ 92, 683, 679 ]
    , [ 683, 684, 679 ]
    , [ 679, 684, 680 ]
    , [ 684, 685, 680 ]
    , [ 680, 685, 681 ]
    , [ 685, 686, 681 ]
    , [ 681, 686, 682 ]
    , [ 686, 687, 682 ]
    , [ 682, 687, 113 ]
    , [ 687, 112, 113 ]
    , [ 93, 688, 683 ]
    , [ 688, 689, 683 ]
    , [ 683, 689, 684 ]
    , [ 689, 690, 684 ]
    , [ 684, 690, 685 ]
    , [ 690, 691, 685 ]
    , [ 685, 691, 686 ]
    , [ 691, 692, 686 ]
    , [ 686, 692, 687 ]
    , [ 692, 693, 687 ]
    , [ 687, 693, 112 ]
    , [ 693, 111, 112 ]
    , [ 94, 694, 688 ]
    , [ 694, 695, 688 ]
    , [ 688, 695, 689 ]
    , [ 695, 696, 689 ]
    , [ 689, 696, 690 ]
    , [ 696, 697, 690 ]
    , [ 690, 697, 691 ]
    , [ 697, 698, 691 ]
    , [ 691, 698, 692 ]
    , [ 698, 699, 692 ]
    , [ 692, 699, 693 ]
    , [ 699, 700, 693 ]
    , [ 693, 700, 111 ]
    , [ 700, 110, 111 ]
    , [ 95, 701, 694 ]
    , [ 701, 702, 694 ]
    , [ 694, 702, 695 ]
    , [ 702, 703, 695 ]
    , [ 695, 703, 696 ]
    , [ 703, 704, 696 ]
    , [ 696, 704, 697 ]
    , [ 704, 705, 697 ]
    , [ 697, 705, 698 ]
    , [ 705, 706, 698 ]
    , [ 698, 706, 699 ]
    , [ 706, 707, 699 ]
    , [ 699, 707, 700 ]
    , [ 707, 708, 700 ]
    , [ 700, 708, 110 ]
    , [ 708, 109, 110 ]
    , [ 96, 709, 701 ]
    , [ 709, 710, 701 ]
    , [ 701, 710, 702 ]
    , [ 710, 711, 702 ]
    , [ 702, 711, 703 ]
    , [ 711, 712, 703 ]
    , [ 703, 712, 704 ]
    , [ 712, 713, 704 ]
    , [ 704, 713, 705 ]
    , [ 713, 714, 705 ]
    , [ 705, 714, 706 ]
    , [ 714, 715, 706 ]
    , [ 706, 715, 707 ]
    , [ 715, 716, 707 ]
    , [ 707, 716, 708 ]
    , [ 716, 717, 708 ]
    , [ 708, 717, 109 ]
    , [ 717, 108, 109 ]
    , [ 97, 718, 709 ]
    , [ 718, 719, 709 ]
    , [ 709, 719, 710 ]
    , [ 719, 720, 710 ]
    , [ 710, 720, 711 ]
    , [ 720, 721, 711 ]
    , [ 711, 721, 712 ]
    , [ 721, 722, 712 ]
    , [ 712, 722, 713 ]
    , [ 722, 723, 713 ]
    , [ 713, 723, 714 ]
    , [ 723, 724, 714 ]
    , [ 714, 724, 715 ]
    , [ 724, 725, 715 ]
    , [ 715, 725, 716 ]
    , [ 725, 726, 716 ]
    , [ 716, 726, 717 ]
    , [ 726, 727, 717 ]
    , [ 717, 727, 108 ]
    , [ 727, 107, 108 ]
    , [ 98, 728, 718 ]
    , [ 728, 729, 718 ]
    , [ 718, 729, 719 ]
    , [ 729, 730, 719 ]
    , [ 719, 730, 720 ]
    , [ 730, 731, 720 ]
    , [ 720, 731, 721 ]
    , [ 731, 732, 721 ]
    , [ 721, 732, 722 ]
    , [ 732, 733, 722 ]
    , [ 722, 733, 723 ]
    , [ 733, 734, 723 ]
    , [ 723, 734, 724 ]
    , [ 734, 735, 724 ]
    , [ 724, 735, 725 ]
    , [ 735, 736, 725 ]
    , [ 725, 736, 726 ]
    , [ 736, 737, 726 ]
    , [ 726, 737, 727 ]
    , [ 737, 738, 727 ]
    , [ 727, 738, 107 ]
    , [ 738, 106, 107 ]
    , [ 99, 739, 728 ]
    , [ 739, 740, 728 ]
    , [ 728, 740, 729 ]
    , [ 740, 741, 729 ]
    , [ 729, 741, 730 ]
    , [ 741, 742, 730 ]
    , [ 730, 742, 731 ]
    , [ 742, 743, 731 ]
    , [ 731, 743, 732 ]
    , [ 743, 744, 732 ]
    , [ 732, 744, 733 ]
    , [ 744, 745, 733 ]
    , [ 733, 745, 734 ]
    , [ 745, 746, 734 ]
    , [ 734, 746, 735 ]
    , [ 746, 747, 735 ]
    , [ 735, 747, 736 ]
    , [ 747, 748, 736 ]
    , [ 736, 748, 737 ]
    , [ 748, 749, 737 ]
    , [ 737, 749, 738 ]
    , [ 749, 750, 738 ]
    , [ 738, 750, 106 ]
    , [ 750, 105, 106 ]
    , [ 100, 751, 739 ]
    , [ 751, 752, 739 ]
    , [ 739, 752, 740 ]
    , [ 752, 753, 740 ]
    , [ 740, 753, 741 ]
    , [ 753, 754, 741 ]
    , [ 741, 754, 742 ]
    , [ 754, 755, 742 ]
    , [ 742, 755, 743 ]
    , [ 755, 756, 743 ]
    , [ 743, 756, 744 ]
    , [ 756, 757, 744 ]
    , [ 744, 757, 745 ]
    , [ 757, 758, 745 ]
    , [ 745, 758, 746 ]
    , [ 758, 759, 746 ]
    , [ 746, 759, 747 ]
    , [ 759, 760, 747 ]
    , [ 747, 760, 748 ]
    , [ 760, 761, 748 ]
    , [ 748, 761, 749 ]
    , [ 761, 762, 749 ]
    , [ 749, 762, 750 ]
    , [ 762, 763, 750 ]
    , [ 750, 763, 105 ]
    , [ 763, 104, 105 ]
    , [ 101, 764, 751 ]
    , [ 764, 765, 751 ]
    , [ 751, 765, 752 ]
    , [ 765, 766, 752 ]
    , [ 752, 766, 753 ]
    , [ 766, 767, 753 ]
    , [ 753, 767, 754 ]
    , [ 767, 768, 754 ]
    , [ 754, 768, 755 ]
    , [ 768, 769, 755 ]
    , [ 755, 769, 756 ]
    , [ 769, 770, 756 ]
    , [ 756, 770, 757 ]
    , [ 770, 771, 757 ]
    , [ 757, 771, 758 ]
    , [ 771, 772, 758 ]
    , [ 758, 772, 759 ]
    , [ 772, 773, 759 ]
    , [ 759, 773, 760 ]
    , [ 773, 774, 760 ]
    , [ 760, 774, 761 ]
    , [ 774, 775, 761 ]
    , [ 761, 775, 762 ]
    , [ 775, 776, 762 ]
    , [ 762, 776, 763 ]
    , [ 776, 777, 763 ]
    , [ 763, 777, 104 ]
    , [ 777, 103, 104 ]
    , [ 102, 27, 764 ]
    , [ 27, 26, 764 ]
    , [ 764, 26, 765 ]
    , [ 26, 25, 765 ]
    , [ 765, 25, 766 ]
    , [ 25, 24, 766 ]
    , [ 766, 24, 767 ]
    , [ 24, 23, 767 ]
    , [ 767, 23, 768 ]
    , [ 23, 22, 768 ]
    , [ 768, 22, 769 ]
    , [ 22, 21, 769 ]
    , [ 769, 21, 770 ]
    , [ 21, 20, 770 ]
    , [ 770, 20, 771 ]
    , [ 20, 19, 771 ]
    , [ 771, 19, 772 ]
    , [ 19, 18, 772 ]
    , [ 772, 18, 773 ]
    , [ 18, 17, 773 ]
    , [ 773, 17, 774 ]
    , [ 17, 16, 774 ]
    , [ 774, 16, 775 ]
    , [ 16, 15, 775 ]
    , [ 775, 15, 776 ]
    , [ 15, 14, 776 ]
    , [ 776, 14, 777 ]
    , [ 14, 13, 777 ]
    , [ 777, 13, 103 ]
    , [ 13, 3, 103 ]
    , [ 118, 147, 5 ]
    , [ 119, 778, 118 ]
    , [ 120, 779, 119 ]
    , [ 121, 781, 120 ]
    , [ 122, 784, 121 ]
    , [ 123, 788, 122 ]
    , [ 124, 793, 123 ]
    , [ 125, 799, 124 ]
    , [ 126, 806, 125 ]
    , [ 127, 814, 126 ]
    , [ 128, 823, 127 ]
    , [ 129, 833, 128 ]
    , [ 130, 844, 129 ]
    , [ 131, 856, 130 ]
    , [ 132, 869, 131 ]
    , [ 118, 778, 147 ]
    , [ 778, 146, 147 ]
    , [ 119, 779, 778 ]
    , [ 779, 780, 778 ]
    , [ 778, 780, 146 ]
    , [ 780, 145, 146 ]
    , [ 120, 781, 779 ]
    , [ 781, 782, 779 ]
    , [ 779, 782, 780 ]
    , [ 782, 783, 780 ]
    , [ 780, 783, 145 ]
    , [ 783, 144, 145 ]
    , [ 121, 784, 781 ]
    , [ 784, 785, 781 ]
    , [ 781, 785, 782 ]
    , [ 785, 786, 782 ]
    , [ 782, 786, 783 ]
    , [ 786, 787, 783 ]
    , [ 783, 787, 144 ]
    , [ 787, 143, 144 ]
    , [ 122, 788, 784 ]
    , [ 788, 789, 784 ]
    , [ 784, 789, 785 ]
    , [ 789, 790, 785 ]
    , [ 785, 790, 786 ]
    , [ 790, 791, 786 ]
    , [ 786, 791, 787 ]
    , [ 791, 792, 787 ]
    , [ 787, 792, 143 ]
    , [ 792, 142, 143 ]
    , [ 123, 793, 788 ]
    , [ 793, 794, 788 ]
    , [ 788, 794, 789 ]
    , [ 794, 795, 789 ]
    , [ 789, 795, 790 ]
    , [ 795, 796, 790 ]
    , [ 790, 796, 791 ]
    , [ 796, 797, 791 ]
    , [ 791, 797, 792 ]
    , [ 797, 798, 792 ]
    , [ 792, 798, 142 ]
    , [ 798, 141, 142 ]
    , [ 124, 799, 793 ]
    , [ 799, 800, 793 ]
    , [ 793, 800, 794 ]
    , [ 800, 801, 794 ]
    , [ 794, 801, 795 ]
    , [ 801, 802, 795 ]
    , [ 795, 802, 796 ]
    , [ 802, 803, 796 ]
    , [ 796, 803, 797 ]
    , [ 803, 804, 797 ]
    , [ 797, 804, 798 ]
    , [ 804, 805, 798 ]
    , [ 798, 805, 141 ]
    , [ 805, 140, 141 ]
    , [ 125, 806, 799 ]
    , [ 806, 807, 799 ]
    , [ 799, 807, 800 ]
    , [ 807, 808, 800 ]
    , [ 800, 808, 801 ]
    , [ 808, 809, 801 ]
    , [ 801, 809, 802 ]
    , [ 809, 810, 802 ]
    , [ 802, 810, 803 ]
    , [ 810, 811, 803 ]
    , [ 803, 811, 804 ]
    , [ 811, 812, 804 ]
    , [ 804, 812, 805 ]
    , [ 812, 813, 805 ]
    , [ 805, 813, 140 ]
    , [ 813, 139, 140 ]
    , [ 126, 814, 806 ]
    , [ 814, 815, 806 ]
    , [ 806, 815, 807 ]
    , [ 815, 816, 807 ]
    , [ 807, 816, 808 ]
    , [ 816, 817, 808 ]
    , [ 808, 817, 809 ]
    , [ 817, 818, 809 ]
    , [ 809, 818, 810 ]
    , [ 818, 819, 810 ]
    , [ 810, 819, 811 ]
    , [ 819, 820, 811 ]
    , [ 811, 820, 812 ]
    , [ 820, 821, 812 ]
    , [ 812, 821, 813 ]
    , [ 821, 822, 813 ]
    , [ 813, 822, 139 ]
    , [ 822, 138, 139 ]
    , [ 127, 823, 814 ]
    , [ 823, 824, 814 ]
    , [ 814, 824, 815 ]
    , [ 824, 825, 815 ]
    , [ 815, 825, 816 ]
    , [ 825, 826, 816 ]
    , [ 816, 826, 817 ]
    , [ 826, 827, 817 ]
    , [ 817, 827, 818 ]
    , [ 827, 828, 818 ]
    , [ 818, 828, 819 ]
    , [ 828, 829, 819 ]
    , [ 819, 829, 820 ]
    , [ 829, 830, 820 ]
    , [ 820, 830, 821 ]
    , [ 830, 831, 821 ]
    , [ 821, 831, 822 ]
    , [ 831, 832, 822 ]
    , [ 822, 832, 138 ]
    , [ 832, 137, 138 ]
    , [ 128, 833, 823 ]
    , [ 833, 834, 823 ]
    , [ 823, 834, 824 ]
    , [ 834, 835, 824 ]
    , [ 824, 835, 825 ]
    , [ 835, 836, 825 ]
    , [ 825, 836, 826 ]
    , [ 836, 837, 826 ]
    , [ 826, 837, 827 ]
    , [ 837, 838, 827 ]
    , [ 827, 838, 828 ]
    , [ 838, 839, 828 ]
    , [ 828, 839, 829 ]
    , [ 839, 840, 829 ]
    , [ 829, 840, 830 ]
    , [ 840, 841, 830 ]
    , [ 830, 841, 831 ]
    , [ 841, 842, 831 ]
    , [ 831, 842, 832 ]
    , [ 842, 843, 832 ]
    , [ 832, 843, 137 ]
    , [ 843, 136, 137 ]
    , [ 129, 844, 833 ]
    , [ 844, 845, 833 ]
    , [ 833, 845, 834 ]
    , [ 845, 846, 834 ]
    , [ 834, 846, 835 ]
    , [ 846, 847, 835 ]
    , [ 835, 847, 836 ]
    , [ 847, 848, 836 ]
    , [ 836, 848, 837 ]
    , [ 848, 849, 837 ]
    , [ 837, 849, 838 ]
    , [ 849, 850, 838 ]
    , [ 838, 850, 839 ]
    , [ 850, 851, 839 ]
    , [ 839, 851, 840 ]
    , [ 851, 852, 840 ]
    , [ 840, 852, 841 ]
    , [ 852, 853, 841 ]
    , [ 841, 853, 842 ]
    , [ 853, 854, 842 ]
    , [ 842, 854, 843 ]
    , [ 854, 855, 843 ]
    , [ 843, 855, 136 ]
    , [ 855, 135, 136 ]
    , [ 130, 856, 844 ]
    , [ 856, 857, 844 ]
    , [ 844, 857, 845 ]
    , [ 857, 858, 845 ]
    , [ 845, 858, 846 ]
    , [ 858, 859, 846 ]
    , [ 846, 859, 847 ]
    , [ 859, 860, 847 ]
    , [ 847, 860, 848 ]
    , [ 860, 861, 848 ]
    , [ 848, 861, 849 ]
    , [ 861, 862, 849 ]
    , [ 849, 862, 850 ]
    , [ 862, 863, 850 ]
    , [ 850, 863, 851 ]
    , [ 863, 864, 851 ]
    , [ 851, 864, 852 ]
    , [ 864, 865, 852 ]
    , [ 852, 865, 853 ]
    , [ 865, 866, 853 ]
    , [ 853, 866, 854 ]
    , [ 866, 867, 854 ]
    , [ 854, 867, 855 ]
    , [ 867, 868, 855 ]
    , [ 855, 868, 135 ]
    , [ 868, 134, 135 ]
    , [ 131, 869, 856 ]
    , [ 869, 870, 856 ]
    , [ 856, 870, 857 ]
    , [ 870, 871, 857 ]
    , [ 857, 871, 858 ]
    , [ 871, 872, 858 ]
    , [ 858, 872, 859 ]
    , [ 872, 873, 859 ]
    , [ 859, 873, 860 ]
    , [ 873, 874, 860 ]
    , [ 860, 874, 861 ]
    , [ 874, 875, 861 ]
    , [ 861, 875, 862 ]
    , [ 875, 876, 862 ]
    , [ 862, 876, 863 ]
    , [ 876, 877, 863 ]
    , [ 863, 877, 864 ]
    , [ 877, 878, 864 ]
    , [ 864, 878, 865 ]
    , [ 878, 879, 865 ]
    , [ 865, 879, 866 ]
    , [ 879, 880, 866 ]
    , [ 866, 880, 867 ]
    , [ 880, 881, 867 ]
    , [ 867, 881, 868 ]
    , [ 881, 882, 868 ]
    , [ 868, 882, 134 ]
    , [ 882, 133, 134 ]
    , [ 132, 102, 869 ]
    , [ 102, 101, 869 ]
    , [ 869, 101, 870 ]
    , [ 101, 100, 870 ]
    , [ 870, 100, 871 ]
    , [ 100, 99, 871 ]
    , [ 871, 99, 872 ]
    , [ 99, 98, 872 ]
    , [ 872, 98, 873 ]
    , [ 98, 97, 873 ]
    , [ 873, 97, 874 ]
    , [ 97, 96, 874 ]
    , [ 874, 96, 875 ]
    , [ 96, 95, 875 ]
    , [ 875, 95, 876 ]
    , [ 95, 94, 876 ]
    , [ 876, 94, 877 ]
    , [ 94, 93, 877 ]
    , [ 877, 93, 878 ]
    , [ 93, 92, 878 ]
    , [ 878, 92, 879 ]
    , [ 92, 91, 879 ]
    , [ 879, 91, 880 ]
    , [ 91, 90, 880 ]
    , [ 880, 90, 881 ]
    , [ 90, 89, 881 ]
    , [ 881, 89, 882 ]
    , [ 89, 88, 882 ]
    , [ 882, 88, 133 ]
    , [ 88, 4, 133 ]
    , [ 87, 162, 6 ]
    , [ 86, 883, 87 ]
    , [ 85, 884, 86 ]
    , [ 84, 886, 85 ]
    , [ 83, 889, 84 ]
    , [ 82, 893, 83 ]
    , [ 81, 898, 82 ]
    , [ 80, 904, 81 ]
    , [ 79, 911, 80 ]
    , [ 78, 919, 79 ]
    , [ 77, 928, 78 ]
    , [ 76, 938, 77 ]
    , [ 75, 949, 76 ]
    , [ 74, 961, 75 ]
    , [ 73, 974, 74 ]
    , [ 87, 883, 162 ]
    , [ 883, 161, 162 ]
    , [ 86, 884, 883 ]
    , [ 884, 885, 883 ]
    , [ 883, 885, 161 ]
    , [ 885, 160, 161 ]
    , [ 85, 886, 884 ]
    , [ 886, 887, 884 ]
    , [ 884, 887, 885 ]
    , [ 887, 888, 885 ]
    , [ 885, 888, 160 ]
    , [ 888, 159, 160 ]
    , [ 84, 889, 886 ]
    , [ 889, 890, 886 ]
    , [ 886, 890, 887 ]
    , [ 890, 891, 887 ]
    , [ 887, 891, 888 ]
    , [ 891, 892, 888 ]
    , [ 888, 892, 159 ]
    , [ 892, 158, 159 ]
    , [ 83, 893, 889 ]
    , [ 893, 894, 889 ]
    , [ 889, 894, 890 ]
    , [ 894, 895, 890 ]
    , [ 890, 895, 891 ]
    , [ 895, 896, 891 ]
    , [ 891, 896, 892 ]
    , [ 896, 897, 892 ]
    , [ 892, 897, 158 ]
    , [ 897, 157, 158 ]
    , [ 82, 898, 893 ]
    , [ 898, 899, 893 ]
    , [ 893, 899, 894 ]
    , [ 899, 900, 894 ]
    , [ 894, 900, 895 ]
    , [ 900, 901, 895 ]
    , [ 895, 901, 896 ]
    , [ 901, 902, 896 ]
    , [ 896, 902, 897 ]
    , [ 902, 903, 897 ]
    , [ 897, 903, 157 ]
    , [ 903, 156, 157 ]
    , [ 81, 904, 898 ]
    , [ 904, 905, 898 ]
    , [ 898, 905, 899 ]
    , [ 905, 906, 899 ]
    , [ 899, 906, 900 ]
    , [ 906, 907, 900 ]
    , [ 900, 907, 901 ]
    , [ 907, 908, 901 ]
    , [ 901, 908, 902 ]
    , [ 908, 909, 902 ]
    , [ 902, 909, 903 ]
    , [ 909, 910, 903 ]
    , [ 903, 910, 156 ]
    , [ 910, 155, 156 ]
    , [ 80, 911, 904 ]
    , [ 911, 912, 904 ]
    , [ 904, 912, 905 ]
    , [ 912, 913, 905 ]
    , [ 905, 913, 906 ]
    , [ 913, 914, 906 ]
    , [ 906, 914, 907 ]
    , [ 914, 915, 907 ]
    , [ 907, 915, 908 ]
    , [ 915, 916, 908 ]
    , [ 908, 916, 909 ]
    , [ 916, 917, 909 ]
    , [ 909, 917, 910 ]
    , [ 917, 918, 910 ]
    , [ 910, 918, 155 ]
    , [ 918, 154, 155 ]
    , [ 79, 919, 911 ]
    , [ 919, 920, 911 ]
    , [ 911, 920, 912 ]
    , [ 920, 921, 912 ]
    , [ 912, 921, 913 ]
    , [ 921, 922, 913 ]
    , [ 913, 922, 914 ]
    , [ 922, 923, 914 ]
    , [ 914, 923, 915 ]
    , [ 923, 924, 915 ]
    , [ 915, 924, 916 ]
    , [ 924, 925, 916 ]
    , [ 916, 925, 917 ]
    , [ 925, 926, 917 ]
    , [ 917, 926, 918 ]
    , [ 926, 927, 918 ]
    , [ 918, 927, 154 ]
    , [ 927, 153, 154 ]
    , [ 78, 928, 919 ]
    , [ 928, 929, 919 ]
    , [ 919, 929, 920 ]
    , [ 929, 930, 920 ]
    , [ 920, 930, 921 ]
    , [ 930, 931, 921 ]
    , [ 921, 931, 922 ]
    , [ 931, 932, 922 ]
    , [ 922, 932, 923 ]
    , [ 932, 933, 923 ]
    , [ 923, 933, 924 ]
    , [ 933, 934, 924 ]
    , [ 924, 934, 925 ]
    , [ 934, 935, 925 ]
    , [ 925, 935, 926 ]
    , [ 935, 936, 926 ]
    , [ 926, 936, 927 ]
    , [ 936, 937, 927 ]
    , [ 927, 937, 153 ]
    , [ 937, 152, 153 ]
    , [ 77, 938, 928 ]
    , [ 938, 939, 928 ]
    , [ 928, 939, 929 ]
    , [ 939, 940, 929 ]
    , [ 929, 940, 930 ]
    , [ 940, 941, 930 ]
    , [ 930, 941, 931 ]
    , [ 941, 942, 931 ]
    , [ 931, 942, 932 ]
    , [ 942, 943, 932 ]
    , [ 932, 943, 933 ]
    , [ 943, 944, 933 ]
    , [ 933, 944, 934 ]
    , [ 944, 945, 934 ]
    , [ 934, 945, 935 ]
    , [ 945, 946, 935 ]
    , [ 935, 946, 936 ]
    , [ 946, 947, 936 ]
    , [ 936, 947, 937 ]
    , [ 947, 948, 937 ]
    , [ 937, 948, 152 ]
    , [ 948, 151, 152 ]
    , [ 76, 949, 938 ]
    , [ 949, 950, 938 ]
    , [ 938, 950, 939 ]
    , [ 950, 951, 939 ]
    , [ 939, 951, 940 ]
    , [ 951, 952, 940 ]
    , [ 940, 952, 941 ]
    , [ 952, 953, 941 ]
    , [ 941, 953, 942 ]
    , [ 953, 954, 942 ]
    , [ 942, 954, 943 ]
    , [ 954, 955, 943 ]
    , [ 943, 955, 944 ]
    , [ 955, 956, 944 ]
    , [ 944, 956, 945 ]
    , [ 956, 957, 945 ]
    , [ 945, 957, 946 ]
    , [ 957, 958, 946 ]
    , [ 946, 958, 947 ]
    , [ 958, 959, 947 ]
    , [ 947, 959, 948 ]
    , [ 959, 960, 948 ]
    , [ 948, 960, 151 ]
    , [ 960, 150, 151 ]
    , [ 75, 961, 949 ]
    , [ 961, 962, 949 ]
    , [ 949, 962, 950 ]
    , [ 962, 963, 950 ]
    , [ 950, 963, 951 ]
    , [ 963, 964, 951 ]
    , [ 951, 964, 952 ]
    , [ 964, 965, 952 ]
    , [ 952, 965, 953 ]
    , [ 965, 966, 953 ]
    , [ 953, 966, 954 ]
    , [ 966, 967, 954 ]
    , [ 954, 967, 955 ]
    , [ 967, 968, 955 ]
    , [ 955, 968, 956 ]
    , [ 968, 969, 956 ]
    , [ 956, 969, 957 ]
    , [ 969, 970, 957 ]
    , [ 957, 970, 958 ]
    , [ 970, 971, 958 ]
    , [ 958, 971, 959 ]
    , [ 971, 972, 959 ]
    , [ 959, 972, 960 ]
    , [ 972, 973, 960 ]
    , [ 960, 973, 150 ]
    , [ 973, 149, 150 ]
    , [ 74, 974, 961 ]
    , [ 974, 975, 961 ]
    , [ 961, 975, 962 ]
    , [ 975, 976, 962 ]
    , [ 962, 976, 963 ]
    , [ 976, 977, 963 ]
    , [ 963, 977, 964 ]
    , [ 977, 978, 964 ]
    , [ 964, 978, 965 ]
    , [ 978, 979, 965 ]
    , [ 965, 979, 966 ]
    , [ 979, 980, 966 ]
    , [ 966, 980, 967 ]
    , [ 980, 981, 967 ]
    , [ 967, 981, 968 ]
    , [ 981, 982, 968 ]
    , [ 968, 982, 969 ]
    , [ 982, 983, 969 ]
    , [ 969, 983, 970 ]
    , [ 983, 984, 970 ]
    , [ 970, 984, 971 ]
    , [ 984, 985, 971 ]
    , [ 971, 985, 972 ]
    , [ 985, 986, 972 ]
    , [ 972, 986, 973 ]
    , [ 986, 987, 973 ]
    , [ 973, 987, 149 ]
    , [ 987, 148, 149 ]
    , [ 73, 132, 974 ]
    , [ 132, 131, 974 ]
    , [ 974, 131, 975 ]
    , [ 131, 130, 975 ]
    , [ 975, 130, 976 ]
    , [ 130, 129, 976 ]
    , [ 976, 129, 977 ]
    , [ 129, 128, 977 ]
    , [ 977, 128, 978 ]
    , [ 128, 127, 978 ]
    , [ 978, 127, 979 ]
    , [ 127, 126, 979 ]
    , [ 979, 126, 980 ]
    , [ 126, 125, 980 ]
    , [ 980, 125, 981 ]
    , [ 125, 124, 981 ]
    , [ 981, 124, 982 ]
    , [ 124, 123, 982 ]
    , [ 982, 123, 983 ]
    , [ 123, 122, 983 ]
    , [ 983, 122, 984 ]
    , [ 122, 121, 984 ]
    , [ 984, 121, 985 ]
    , [ 121, 120, 985 ]
    , [ 985, 120, 986 ]
    , [ 120, 119, 986 ]
    , [ 986, 119, 987 ]
    , [ 119, 118, 987 ]
    , [ 987, 118, 148 ]
    , [ 118, 5, 148 ]
    , [ 163, 192, 11 ]
    , [ 164, 988, 163 ]
    , [ 165, 989, 164 ]
    , [ 166, 991, 165 ]
    , [ 167, 994, 166 ]
    , [ 168, 998, 167 ]
    , [ 169, 1003, 168 ]
    , [ 170, 1009, 169 ]
    , [ 171, 1016, 170 ]
    , [ 172, 1024, 171 ]
    , [ 173, 1033, 172 ]
    , [ 174, 1043, 173 ]
    , [ 175, 1054, 174 ]
    , [ 176, 1066, 175 ]
    , [ 177, 1079, 176 ]
    , [ 163, 988, 192 ]
    , [ 988, 191, 192 ]
    , [ 164, 989, 988 ]
    , [ 989, 990, 988 ]
    , [ 988, 990, 191 ]
    , [ 990, 190, 191 ]
    , [ 165, 991, 989 ]
    , [ 991, 992, 989 ]
    , [ 989, 992, 990 ]
    , [ 992, 993, 990 ]
    , [ 990, 993, 190 ]
    , [ 993, 189, 190 ]
    , [ 166, 994, 991 ]
    , [ 994, 995, 991 ]
    , [ 991, 995, 992 ]
    , [ 995, 996, 992 ]
    , [ 992, 996, 993 ]
    , [ 996, 997, 993 ]
    , [ 993, 997, 189 ]
    , [ 997, 188, 189 ]
    , [ 167, 998, 994 ]
    , [ 998, 999, 994 ]
    , [ 994, 999, 995 ]
    , [ 999, 1000, 995 ]
    , [ 995, 1000, 996 ]
    , [ 1000, 1001, 996 ]
    , [ 996, 1001, 997 ]
    , [ 1001, 1002, 997 ]
    , [ 997, 1002, 188 ]
    , [ 1002, 187, 188 ]
    , [ 168, 1003, 998 ]
    , [ 1003, 1004, 998 ]
    , [ 998, 1004, 999 ]
    , [ 1004, 1005, 999 ]
    , [ 999, 1005, 1000 ]
    , [ 1005, 1006, 1000 ]
    , [ 1000, 1006, 1001 ]
    , [ 1006, 1007, 1001 ]
    , [ 1001, 1007, 1002 ]
    , [ 1007, 1008, 1002 ]
    , [ 1002, 1008, 187 ]
    , [ 1008, 186, 187 ]
    , [ 169, 1009, 1003 ]
    , [ 1009, 1010, 1003 ]
    , [ 1003, 1010, 1004 ]
    , [ 1010, 1011, 1004 ]
    , [ 1004, 1011, 1005 ]
    , [ 1011, 1012, 1005 ]
    , [ 1005, 1012, 1006 ]
    , [ 1012, 1013, 1006 ]
    , [ 1006, 1013, 1007 ]
    , [ 1013, 1014, 1007 ]
    , [ 1007, 1014, 1008 ]
    , [ 1014, 1015, 1008 ]
    , [ 1008, 1015, 186 ]
    , [ 1015, 185, 186 ]
    , [ 170, 1016, 1009 ]
    , [ 1016, 1017, 1009 ]
    , [ 1009, 1017, 1010 ]
    , [ 1017, 1018, 1010 ]
    , [ 1010, 1018, 1011 ]
    , [ 1018, 1019, 1011 ]
    , [ 1011, 1019, 1012 ]
    , [ 1019, 1020, 1012 ]
    , [ 1012, 1020, 1013 ]
    , [ 1020, 1021, 1013 ]
    , [ 1013, 1021, 1014 ]
    , [ 1021, 1022, 1014 ]
    , [ 1014, 1022, 1015 ]
    , [ 1022, 1023, 1015 ]
    , [ 1015, 1023, 185 ]
    , [ 1023, 184, 185 ]
    , [ 171, 1024, 1016 ]
    , [ 1024, 1025, 1016 ]
    , [ 1016, 1025, 1017 ]
    , [ 1025, 1026, 1017 ]
    , [ 1017, 1026, 1018 ]
    , [ 1026, 1027, 1018 ]
    , [ 1018, 1027, 1019 ]
    , [ 1027, 1028, 1019 ]
    , [ 1019, 1028, 1020 ]
    , [ 1028, 1029, 1020 ]
    , [ 1020, 1029, 1021 ]
    , [ 1029, 1030, 1021 ]
    , [ 1021, 1030, 1022 ]
    , [ 1030, 1031, 1022 ]
    , [ 1022, 1031, 1023 ]
    , [ 1031, 1032, 1023 ]
    , [ 1023, 1032, 184 ]
    , [ 1032, 183, 184 ]
    , [ 172, 1033, 1024 ]
    , [ 1033, 1034, 1024 ]
    , [ 1024, 1034, 1025 ]
    , [ 1034, 1035, 1025 ]
    , [ 1025, 1035, 1026 ]
    , [ 1035, 1036, 1026 ]
    , [ 1026, 1036, 1027 ]
    , [ 1036, 1037, 1027 ]
    , [ 1027, 1037, 1028 ]
    , [ 1037, 1038, 1028 ]
    , [ 1028, 1038, 1029 ]
    , [ 1038, 1039, 1029 ]
    , [ 1029, 1039, 1030 ]
    , [ 1039, 1040, 1030 ]
    , [ 1030, 1040, 1031 ]
    , [ 1040, 1041, 1031 ]
    , [ 1031, 1041, 1032 ]
    , [ 1041, 1042, 1032 ]
    , [ 1032, 1042, 183 ]
    , [ 1042, 182, 183 ]
    , [ 173, 1043, 1033 ]
    , [ 1043, 1044, 1033 ]
    , [ 1033, 1044, 1034 ]
    , [ 1044, 1045, 1034 ]
    , [ 1034, 1045, 1035 ]
    , [ 1045, 1046, 1035 ]
    , [ 1035, 1046, 1036 ]
    , [ 1046, 1047, 1036 ]
    , [ 1036, 1047, 1037 ]
    , [ 1047, 1048, 1037 ]
    , [ 1037, 1048, 1038 ]
    , [ 1048, 1049, 1038 ]
    , [ 1038, 1049, 1039 ]
    , [ 1049, 1050, 1039 ]
    , [ 1039, 1050, 1040 ]
    , [ 1050, 1051, 1040 ]
    , [ 1040, 1051, 1041 ]
    , [ 1051, 1052, 1041 ]
    , [ 1041, 1052, 1042 ]
    , [ 1052, 1053, 1042 ]
    , [ 1042, 1053, 182 ]
    , [ 1053, 181, 182 ]
    , [ 174, 1054, 1043 ]
    , [ 1054, 1055, 1043 ]
    , [ 1043, 1055, 1044 ]
    , [ 1055, 1056, 1044 ]
    , [ 1044, 1056, 1045 ]
    , [ 1056, 1057, 1045 ]
    , [ 1045, 1057, 1046 ]
    , [ 1057, 1058, 1046 ]
    , [ 1046, 1058, 1047 ]
    , [ 1058, 1059, 1047 ]
    , [ 1047, 1059, 1048 ]
    , [ 1059, 1060, 1048 ]
    , [ 1048, 1060, 1049 ]
    , [ 1060, 1061, 1049 ]
    , [ 1049, 1061, 1050 ]
    , [ 1061, 1062, 1050 ]
    , [ 1050, 1062, 1051 ]
    , [ 1062, 1063, 1051 ]
    , [ 1051, 1063, 1052 ]
    , [ 1063, 1064, 1052 ]
    , [ 1052, 1064, 1053 ]
    , [ 1064, 1065, 1053 ]
    , [ 1053, 1065, 181 ]
    , [ 1065, 180, 181 ]
    , [ 175, 1066, 1054 ]
    , [ 1066, 1067, 1054 ]
    , [ 1054, 1067, 1055 ]
    , [ 1067, 1068, 1055 ]
    , [ 1055, 1068, 1056 ]
    , [ 1068, 1069, 1056 ]
    , [ 1056, 1069, 1057 ]
    , [ 1069, 1070, 1057 ]
    , [ 1057, 1070, 1058 ]
    , [ 1070, 1071, 1058 ]
    , [ 1058, 1071, 1059 ]
    , [ 1071, 1072, 1059 ]
    , [ 1059, 1072, 1060 ]
    , [ 1072, 1073, 1060 ]
    , [ 1060, 1073, 1061 ]
    , [ 1073, 1074, 1061 ]
    , [ 1061, 1074, 1062 ]
    , [ 1074, 1075, 1062 ]
    , [ 1062, 1075, 1063 ]
    , [ 1075, 1076, 1063 ]
    , [ 1063, 1076, 1064 ]
    , [ 1076, 1077, 1064 ]
    , [ 1064, 1077, 1065 ]
    , [ 1077, 1078, 1065 ]
    , [ 1065, 1078, 180 ]
    , [ 1078, 179, 180 ]
    , [ 176, 1079, 1066 ]
    , [ 1079, 1080, 1066 ]
    , [ 1066, 1080, 1067 ]
    , [ 1080, 1081, 1067 ]
    , [ 1067, 1081, 1068 ]
    , [ 1081, 1082, 1068 ]
    , [ 1068, 1082, 1069 ]
    , [ 1082, 1083, 1069 ]
    , [ 1069, 1083, 1070 ]
    , [ 1083, 1084, 1070 ]
    , [ 1070, 1084, 1071 ]
    , [ 1084, 1085, 1071 ]
    , [ 1071, 1085, 1072 ]
    , [ 1085, 1086, 1072 ]
    , [ 1072, 1086, 1073 ]
    , [ 1086, 1087, 1073 ]
    , [ 1073, 1087, 1074 ]
    , [ 1087, 1088, 1074 ]
    , [ 1074, 1088, 1075 ]
    , [ 1088, 1089, 1075 ]
    , [ 1075, 1089, 1076 ]
    , [ 1089, 1090, 1076 ]
    , [ 1076, 1090, 1077 ]
    , [ 1090, 1091, 1077 ]
    , [ 1077, 1091, 1078 ]
    , [ 1091, 1092, 1078 ]
    , [ 1078, 1092, 179 ]
    , [ 1092, 178, 179 ]
    , [ 177, 72, 1079 ]
    , [ 72, 71, 1079 ]
    , [ 1079, 71, 1080 ]
    , [ 71, 70, 1080 ]
    , [ 1080, 70, 1081 ]
    , [ 70, 69, 1081 ]
    , [ 1081, 69, 1082 ]
    , [ 69, 68, 1082 ]
    , [ 1082, 68, 1083 ]
    , [ 68, 67, 1083 ]
    , [ 1083, 67, 1084 ]
    , [ 67, 66, 1084 ]
    , [ 1084, 66, 1085 ]
    , [ 66, 65, 1085 ]
    , [ 1085, 65, 1086 ]
    , [ 65, 64, 1086 ]
    , [ 1086, 64, 1087 ]
    , [ 64, 63, 1087 ]
    , [ 1087, 63, 1088 ]
    , [ 63, 62, 1088 ]
    , [ 1088, 62, 1089 ]
    , [ 62, 61, 1089 ]
    , [ 1089, 61, 1090 ]
    , [ 61, 60, 1090 ]
    , [ 1090, 60, 1091 ]
    , [ 60, 59, 1091 ]
    , [ 1091, 59, 1092 ]
    , [ 59, 58, 1092 ]
    , [ 1092, 58, 178 ]
    , [ 58, 6, 178 ]
    , [ 193, 222, 7 ]
    , [ 194, 1093, 193 ]
    , [ 195, 1094, 194 ]
    , [ 196, 1096, 195 ]
    , [ 197, 1099, 196 ]
    , [ 198, 1103, 197 ]
    , [ 199, 1108, 198 ]
    , [ 200, 1114, 199 ]
    , [ 201, 1121, 200 ]
    , [ 202, 1129, 201 ]
    , [ 203, 1138, 202 ]
    , [ 204, 1148, 203 ]
    , [ 205, 1159, 204 ]
    , [ 206, 1171, 205 ]
    , [ 207, 1184, 206 ]
    , [ 193, 1093, 222 ]
    , [ 1093, 221, 222 ]
    , [ 194, 1094, 1093 ]
    , [ 1094, 1095, 1093 ]
    , [ 1093, 1095, 221 ]
    , [ 1095, 220, 221 ]
    , [ 195, 1096, 1094 ]
    , [ 1096, 1097, 1094 ]
    , [ 1094, 1097, 1095 ]
    , [ 1097, 1098, 1095 ]
    , [ 1095, 1098, 220 ]
    , [ 1098, 219, 220 ]
    , [ 196, 1099, 1096 ]
    , [ 1099, 1100, 1096 ]
    , [ 1096, 1100, 1097 ]
    , [ 1100, 1101, 1097 ]
    , [ 1097, 1101, 1098 ]
    , [ 1101, 1102, 1098 ]
    , [ 1098, 1102, 219 ]
    , [ 1102, 218, 219 ]
    , [ 197, 1103, 1099 ]
    , [ 1103, 1104, 1099 ]
    , [ 1099, 1104, 1100 ]
    , [ 1104, 1105, 1100 ]
    , [ 1100, 1105, 1101 ]
    , [ 1105, 1106, 1101 ]
    , [ 1101, 1106, 1102 ]
    , [ 1106, 1107, 1102 ]
    , [ 1102, 1107, 218 ]
    , [ 1107, 217, 218 ]
    , [ 198, 1108, 1103 ]
    , [ 1108, 1109, 1103 ]
    , [ 1103, 1109, 1104 ]
    , [ 1109, 1110, 1104 ]
    , [ 1104, 1110, 1105 ]
    , [ 1110, 1111, 1105 ]
    , [ 1105, 1111, 1106 ]
    , [ 1111, 1112, 1106 ]
    , [ 1106, 1112, 1107 ]
    , [ 1112, 1113, 1107 ]
    , [ 1107, 1113, 217 ]
    , [ 1113, 216, 217 ]
    , [ 199, 1114, 1108 ]
    , [ 1114, 1115, 1108 ]
    , [ 1108, 1115, 1109 ]
    , [ 1115, 1116, 1109 ]
    , [ 1109, 1116, 1110 ]
    , [ 1116, 1117, 1110 ]
    , [ 1110, 1117, 1111 ]
    , [ 1117, 1118, 1111 ]
    , [ 1111, 1118, 1112 ]
    , [ 1118, 1119, 1112 ]
    , [ 1112, 1119, 1113 ]
    , [ 1119, 1120, 1113 ]
    , [ 1113, 1120, 216 ]
    , [ 1120, 215, 216 ]
    , [ 200, 1121, 1114 ]
    , [ 1121, 1122, 1114 ]
    , [ 1114, 1122, 1115 ]
    , [ 1122, 1123, 1115 ]
    , [ 1115, 1123, 1116 ]
    , [ 1123, 1124, 1116 ]
    , [ 1116, 1124, 1117 ]
    , [ 1124, 1125, 1117 ]
    , [ 1117, 1125, 1118 ]
    , [ 1125, 1126, 1118 ]
    , [ 1118, 1126, 1119 ]
    , [ 1126, 1127, 1119 ]
    , [ 1119, 1127, 1120 ]
    , [ 1127, 1128, 1120 ]
    , [ 1120, 1128, 215 ]
    , [ 1128, 214, 215 ]
    , [ 201, 1129, 1121 ]
    , [ 1129, 1130, 1121 ]
    , [ 1121, 1130, 1122 ]
    , [ 1130, 1131, 1122 ]
    , [ 1122, 1131, 1123 ]
    , [ 1131, 1132, 1123 ]
    , [ 1123, 1132, 1124 ]
    , [ 1132, 1133, 1124 ]
    , [ 1124, 1133, 1125 ]
    , [ 1133, 1134, 1125 ]
    , [ 1125, 1134, 1126 ]
    , [ 1134, 1135, 1126 ]
    , [ 1126, 1135, 1127 ]
    , [ 1135, 1136, 1127 ]
    , [ 1127, 1136, 1128 ]
    , [ 1136, 1137, 1128 ]
    , [ 1128, 1137, 214 ]
    , [ 1137, 213, 214 ]
    , [ 202, 1138, 1129 ]
    , [ 1138, 1139, 1129 ]
    , [ 1129, 1139, 1130 ]
    , [ 1139, 1140, 1130 ]
    , [ 1130, 1140, 1131 ]
    , [ 1140, 1141, 1131 ]
    , [ 1131, 1141, 1132 ]
    , [ 1141, 1142, 1132 ]
    , [ 1132, 1142, 1133 ]
    , [ 1142, 1143, 1133 ]
    , [ 1133, 1143, 1134 ]
    , [ 1143, 1144, 1134 ]
    , [ 1134, 1144, 1135 ]
    , [ 1144, 1145, 1135 ]
    , [ 1135, 1145, 1136 ]
    , [ 1145, 1146, 1136 ]
    , [ 1136, 1146, 1137 ]
    , [ 1146, 1147, 1137 ]
    , [ 1137, 1147, 213 ]
    , [ 1147, 212, 213 ]
    , [ 203, 1148, 1138 ]
    , [ 1148, 1149, 1138 ]
    , [ 1138, 1149, 1139 ]
    , [ 1149, 1150, 1139 ]
    , [ 1139, 1150, 1140 ]
    , [ 1150, 1151, 1140 ]
    , [ 1140, 1151, 1141 ]
    , [ 1151, 1152, 1141 ]
    , [ 1141, 1152, 1142 ]
    , [ 1152, 1153, 1142 ]
    , [ 1142, 1153, 1143 ]
    , [ 1153, 1154, 1143 ]
    , [ 1143, 1154, 1144 ]
    , [ 1154, 1155, 1144 ]
    , [ 1144, 1155, 1145 ]
    , [ 1155, 1156, 1145 ]
    , [ 1145, 1156, 1146 ]
    , [ 1156, 1157, 1146 ]
    , [ 1146, 1157, 1147 ]
    , [ 1157, 1158, 1147 ]
    , [ 1147, 1158, 212 ]
    , [ 1158, 211, 212 ]
    , [ 204, 1159, 1148 ]
    , [ 1159, 1160, 1148 ]
    , [ 1148, 1160, 1149 ]
    , [ 1160, 1161, 1149 ]
    , [ 1149, 1161, 1150 ]
    , [ 1161, 1162, 1150 ]
    , [ 1150, 1162, 1151 ]
    , [ 1162, 1163, 1151 ]
    , [ 1151, 1163, 1152 ]
    , [ 1163, 1164, 1152 ]
    , [ 1152, 1164, 1153 ]
    , [ 1164, 1165, 1153 ]
    , [ 1153, 1165, 1154 ]
    , [ 1165, 1166, 1154 ]
    , [ 1154, 1166, 1155 ]
    , [ 1166, 1167, 1155 ]
    , [ 1155, 1167, 1156 ]
    , [ 1167, 1168, 1156 ]
    , [ 1156, 1168, 1157 ]
    , [ 1168, 1169, 1157 ]
    , [ 1157, 1169, 1158 ]
    , [ 1169, 1170, 1158 ]
    , [ 1158, 1170, 211 ]
    , [ 1170, 210, 211 ]
    , [ 205, 1171, 1159 ]
    , [ 1171, 1172, 1159 ]
    , [ 1159, 1172, 1160 ]
    , [ 1172, 1173, 1160 ]
    , [ 1160, 1173, 1161 ]
    , [ 1173, 1174, 1161 ]
    , [ 1161, 1174, 1162 ]
    , [ 1174, 1175, 1162 ]
    , [ 1162, 1175, 1163 ]
    , [ 1175, 1176, 1163 ]
    , [ 1163, 1176, 1164 ]
    , [ 1176, 1177, 1164 ]
    , [ 1164, 1177, 1165 ]
    , [ 1177, 1178, 1165 ]
    , [ 1165, 1178, 1166 ]
    , [ 1178, 1179, 1166 ]
    , [ 1166, 1179, 1167 ]
    , [ 1179, 1180, 1167 ]
    , [ 1167, 1180, 1168 ]
    , [ 1180, 1181, 1168 ]
    , [ 1168, 1181, 1169 ]
    , [ 1181, 1182, 1169 ]
    , [ 1169, 1182, 1170 ]
    , [ 1182, 1183, 1170 ]
    , [ 1170, 1183, 210 ]
    , [ 1183, 209, 210 ]
    , [ 206, 1184, 1171 ]
    , [ 1184, 1185, 1171 ]
    , [ 1171, 1185, 1172 ]
    , [ 1185, 1186, 1172 ]
    , [ 1172, 1186, 1173 ]
    , [ 1186, 1187, 1173 ]
    , [ 1173, 1187, 1174 ]
    , [ 1187, 1188, 1174 ]
    , [ 1174, 1188, 1175 ]
    , [ 1188, 1189, 1175 ]
    , [ 1175, 1189, 1176 ]
    , [ 1189, 1190, 1176 ]
    , [ 1176, 1190, 1177 ]
    , [ 1190, 1191, 1177 ]
    , [ 1177, 1191, 1178 ]
    , [ 1191, 1192, 1178 ]
    , [ 1178, 1192, 1179 ]
    , [ 1192, 1193, 1179 ]
    , [ 1179, 1193, 1180 ]
    , [ 1193, 1194, 1180 ]
    , [ 1180, 1194, 1181 ]
    , [ 1194, 1195, 1181 ]
    , [ 1181, 1195, 1182 ]
    , [ 1195, 1196, 1182 ]
    , [ 1182, 1196, 1183 ]
    , [ 1196, 1197, 1183 ]
    , [ 1183, 1197, 209 ]
    , [ 1197, 208, 209 ]
    , [ 207, 57, 1184 ]
    , [ 57, 56, 1184 ]
    , [ 1184, 56, 1185 ]
    , [ 56, 55, 1185 ]
    , [ 1185, 55, 1186 ]
    , [ 55, 54, 1186 ]
    , [ 1186, 54, 1187 ]
    , [ 54, 53, 1187 ]
    , [ 1187, 53, 1188 ]
    , [ 53, 52, 1188 ]
    , [ 1188, 52, 1189 ]
    , [ 52, 51, 1189 ]
    , [ 1189, 51, 1190 ]
    , [ 51, 50, 1190 ]
    , [ 1190, 50, 1191 ]
    , [ 50, 49, 1191 ]
    , [ 1191, 49, 1192 ]
    , [ 49, 48, 1192 ]
    , [ 1192, 48, 1193 ]
    , [ 48, 47, 1193 ]
    , [ 1193, 47, 1194 ]
    , [ 47, 46, 1194 ]
    , [ 1194, 46, 1195 ]
    , [ 46, 45, 1195 ]
    , [ 1195, 45, 1196 ]
    , [ 45, 44, 1196 ]
    , [ 1196, 44, 1197 ]
    , [ 44, 43, 1197 ]
    , [ 1197, 43, 208 ]
    , [ 43, 2, 208 ]
    , [ 223, 252, 8 ]
    , [ 224, 1198, 223 ]
    , [ 225, 1199, 224 ]
    , [ 226, 1201, 225 ]
    , [ 227, 1204, 226 ]
    , [ 228, 1208, 227 ]
    , [ 229, 1213, 228 ]
    , [ 230, 1219, 229 ]
    , [ 231, 1226, 230 ]
    , [ 232, 1234, 231 ]
    , [ 233, 1243, 232 ]
    , [ 234, 1253, 233 ]
    , [ 235, 1264, 234 ]
    , [ 236, 1276, 235 ]
    , [ 237, 1289, 236 ]
    , [ 223, 1198, 252 ]
    , [ 1198, 251, 252 ]
    , [ 224, 1199, 1198 ]
    , [ 1199, 1200, 1198 ]
    , [ 1198, 1200, 251 ]
    , [ 1200, 250, 251 ]
    , [ 225, 1201, 1199 ]
    , [ 1201, 1202, 1199 ]
    , [ 1199, 1202, 1200 ]
    , [ 1202, 1203, 1200 ]
    , [ 1200, 1203, 250 ]
    , [ 1203, 249, 250 ]
    , [ 226, 1204, 1201 ]
    , [ 1204, 1205, 1201 ]
    , [ 1201, 1205, 1202 ]
    , [ 1205, 1206, 1202 ]
    , [ 1202, 1206, 1203 ]
    , [ 1206, 1207, 1203 ]
    , [ 1203, 1207, 249 ]
    , [ 1207, 248, 249 ]
    , [ 227, 1208, 1204 ]
    , [ 1208, 1209, 1204 ]
    , [ 1204, 1209, 1205 ]
    , [ 1209, 1210, 1205 ]
    , [ 1205, 1210, 1206 ]
    , [ 1210, 1211, 1206 ]
    , [ 1206, 1211, 1207 ]
    , [ 1211, 1212, 1207 ]
    , [ 1207, 1212, 248 ]
    , [ 1212, 247, 248 ]
    , [ 228, 1213, 1208 ]
    , [ 1213, 1214, 1208 ]
    , [ 1208, 1214, 1209 ]
    , [ 1214, 1215, 1209 ]
    , [ 1209, 1215, 1210 ]
    , [ 1215, 1216, 1210 ]
    , [ 1210, 1216, 1211 ]
    , [ 1216, 1217, 1211 ]
    , [ 1211, 1217, 1212 ]
    , [ 1217, 1218, 1212 ]
    , [ 1212, 1218, 247 ]
    , [ 1218, 246, 247 ]
    , [ 229, 1219, 1213 ]
    , [ 1219, 1220, 1213 ]
    , [ 1213, 1220, 1214 ]
    , [ 1220, 1221, 1214 ]
    , [ 1214, 1221, 1215 ]
    , [ 1221, 1222, 1215 ]
    , [ 1215, 1222, 1216 ]
    , [ 1222, 1223, 1216 ]
    , [ 1216, 1223, 1217 ]
    , [ 1223, 1224, 1217 ]
    , [ 1217, 1224, 1218 ]
    , [ 1224, 1225, 1218 ]
    , [ 1218, 1225, 246 ]
    , [ 1225, 245, 246 ]
    , [ 230, 1226, 1219 ]
    , [ 1226, 1227, 1219 ]
    , [ 1219, 1227, 1220 ]
    , [ 1227, 1228, 1220 ]
    , [ 1220, 1228, 1221 ]
    , [ 1228, 1229, 1221 ]
    , [ 1221, 1229, 1222 ]
    , [ 1229, 1230, 1222 ]
    , [ 1222, 1230, 1223 ]
    , [ 1230, 1231, 1223 ]
    , [ 1223, 1231, 1224 ]
    , [ 1231, 1232, 1224 ]
    , [ 1224, 1232, 1225 ]
    , [ 1232, 1233, 1225 ]
    , [ 1225, 1233, 245 ]
    , [ 1233, 244, 245 ]
    , [ 231, 1234, 1226 ]
    , [ 1234, 1235, 1226 ]
    , [ 1226, 1235, 1227 ]
    , [ 1235, 1236, 1227 ]
    , [ 1227, 1236, 1228 ]
    , [ 1236, 1237, 1228 ]
    , [ 1228, 1237, 1229 ]
    , [ 1237, 1238, 1229 ]
    , [ 1229, 1238, 1230 ]
    , [ 1238, 1239, 1230 ]
    , [ 1230, 1239, 1231 ]
    , [ 1239, 1240, 1231 ]
    , [ 1231, 1240, 1232 ]
    , [ 1240, 1241, 1232 ]
    , [ 1232, 1241, 1233 ]
    , [ 1241, 1242, 1233 ]
    , [ 1233, 1242, 244 ]
    , [ 1242, 243, 244 ]
    , [ 232, 1243, 1234 ]
    , [ 1243, 1244, 1234 ]
    , [ 1234, 1244, 1235 ]
    , [ 1244, 1245, 1235 ]
    , [ 1235, 1245, 1236 ]
    , [ 1245, 1246, 1236 ]
    , [ 1236, 1246, 1237 ]
    , [ 1246, 1247, 1237 ]
    , [ 1237, 1247, 1238 ]
    , [ 1247, 1248, 1238 ]
    , [ 1238, 1248, 1239 ]
    , [ 1248, 1249, 1239 ]
    , [ 1239, 1249, 1240 ]
    , [ 1249, 1250, 1240 ]
    , [ 1240, 1250, 1241 ]
    , [ 1250, 1251, 1241 ]
    , [ 1241, 1251, 1242 ]
    , [ 1251, 1252, 1242 ]
    , [ 1242, 1252, 243 ]
    , [ 1252, 242, 243 ]
    , [ 233, 1253, 1243 ]
    , [ 1253, 1254, 1243 ]
    , [ 1243, 1254, 1244 ]
    , [ 1254, 1255, 1244 ]
    , [ 1244, 1255, 1245 ]
    , [ 1255, 1256, 1245 ]
    , [ 1245, 1256, 1246 ]
    , [ 1256, 1257, 1246 ]
    , [ 1246, 1257, 1247 ]
    , [ 1257, 1258, 1247 ]
    , [ 1247, 1258, 1248 ]
    , [ 1258, 1259, 1248 ]
    , [ 1248, 1259, 1249 ]
    , [ 1259, 1260, 1249 ]
    , [ 1249, 1260, 1250 ]
    , [ 1260, 1261, 1250 ]
    , [ 1250, 1261, 1251 ]
    , [ 1261, 1262, 1251 ]
    , [ 1251, 1262, 1252 ]
    , [ 1262, 1263, 1252 ]
    , [ 1252, 1263, 242 ]
    , [ 1263, 241, 242 ]
    , [ 234, 1264, 1253 ]
    , [ 1264, 1265, 1253 ]
    , [ 1253, 1265, 1254 ]
    , [ 1265, 1266, 1254 ]
    , [ 1254, 1266, 1255 ]
    , [ 1266, 1267, 1255 ]
    , [ 1255, 1267, 1256 ]
    , [ 1267, 1268, 1256 ]
    , [ 1256, 1268, 1257 ]
    , [ 1268, 1269, 1257 ]
    , [ 1257, 1269, 1258 ]
    , [ 1269, 1270, 1258 ]
    , [ 1258, 1270, 1259 ]
    , [ 1270, 1271, 1259 ]
    , [ 1259, 1271, 1260 ]
    , [ 1271, 1272, 1260 ]
    , [ 1260, 1272, 1261 ]
    , [ 1272, 1273, 1261 ]
    , [ 1261, 1273, 1262 ]
    , [ 1273, 1274, 1262 ]
    , [ 1262, 1274, 1263 ]
    , [ 1274, 1275, 1263 ]
    , [ 1263, 1275, 241 ]
    , [ 1275, 240, 241 ]
    , [ 235, 1276, 1264 ]
    , [ 1276, 1277, 1264 ]
    , [ 1264, 1277, 1265 ]
    , [ 1277, 1278, 1265 ]
    , [ 1265, 1278, 1266 ]
    , [ 1278, 1279, 1266 ]
    , [ 1266, 1279, 1267 ]
    , [ 1279, 1280, 1267 ]
    , [ 1267, 1280, 1268 ]
    , [ 1280, 1281, 1268 ]
    , [ 1268, 1281, 1269 ]
    , [ 1281, 1282, 1269 ]
    , [ 1269, 1282, 1270 ]
    , [ 1282, 1283, 1270 ]
    , [ 1270, 1283, 1271 ]
    , [ 1283, 1284, 1271 ]
    , [ 1271, 1284, 1272 ]
    , [ 1284, 1285, 1272 ]
    , [ 1272, 1285, 1273 ]
    , [ 1285, 1286, 1273 ]
    , [ 1273, 1286, 1274 ]
    , [ 1286, 1287, 1274 ]
    , [ 1274, 1287, 1275 ]
    , [ 1287, 1288, 1275 ]
    , [ 1275, 1288, 240 ]
    , [ 1288, 239, 240 ]
    , [ 236, 1289, 1276 ]
    , [ 1289, 1290, 1276 ]
    , [ 1276, 1290, 1277 ]
    , [ 1290, 1291, 1277 ]
    , [ 1277, 1291, 1278 ]
    , [ 1291, 1292, 1278 ]
    , [ 1278, 1292, 1279 ]
    , [ 1292, 1293, 1279 ]
    , [ 1279, 1293, 1280 ]
    , [ 1293, 1294, 1280 ]
    , [ 1280, 1294, 1281 ]
    , [ 1294, 1295, 1281 ]
    , [ 1281, 1295, 1282 ]
    , [ 1295, 1296, 1282 ]
    , [ 1282, 1296, 1283 ]
    , [ 1296, 1297, 1283 ]
    , [ 1283, 1297, 1284 ]
    , [ 1297, 1298, 1284 ]
    , [ 1284, 1298, 1285 ]
    , [ 1298, 1299, 1285 ]
    , [ 1285, 1299, 1286 ]
    , [ 1299, 1300, 1286 ]
    , [ 1286, 1300, 1287 ]
    , [ 1300, 1301, 1287 ]
    , [ 1287, 1301, 1288 ]
    , [ 1301, 1302, 1288 ]
    , [ 1288, 1302, 239 ]
    , [ 1302, 238, 239 ]
    , [ 237, 117, 1289 ]
    , [ 117, 116, 1289 ]
    , [ 1289, 116, 1290 ]
    , [ 116, 115, 1290 ]
    , [ 1290, 115, 1291 ]
    , [ 115, 114, 1291 ]
    , [ 1291, 114, 1292 ]
    , [ 114, 113, 1292 ]
    , [ 1292, 113, 1293 ]
    , [ 113, 112, 1293 ]
    , [ 1293, 112, 1294 ]
    , [ 112, 111, 1294 ]
    , [ 1294, 111, 1295 ]
    , [ 111, 110, 1295 ]
    , [ 1295, 110, 1296 ]
    , [ 110, 109, 1296 ]
    , [ 1296, 109, 1297 ]
    , [ 109, 108, 1297 ]
    , [ 1297, 108, 1298 ]
    , [ 108, 107, 1298 ]
    , [ 1298, 107, 1299 ]
    , [ 107, 106, 1299 ]
    , [ 1299, 106, 1300 ]
    , [ 106, 105, 1300 ]
    , [ 1300, 105, 1301 ]
    , [ 105, 104, 1301 ]
    , [ 1301, 104, 1302 ]
    , [ 104, 103, 1302 ]
    , [ 1302, 103, 238 ]
    , [ 103, 3, 238 ]
    , [ 253, 282, 9 ]
    , [ 254, 1303, 253 ]
    , [ 255, 1304, 254 ]
    , [ 256, 1306, 255 ]
    , [ 257, 1309, 256 ]
    , [ 258, 1313, 257 ]
    , [ 259, 1318, 258 ]
    , [ 260, 1324, 259 ]
    , [ 261, 1331, 260 ]
    , [ 262, 1339, 261 ]
    , [ 263, 1348, 262 ]
    , [ 264, 1358, 263 ]
    , [ 265, 1369, 264 ]
    , [ 266, 1381, 265 ]
    , [ 267, 1394, 266 ]
    , [ 253, 1303, 282 ]
    , [ 1303, 281, 282 ]
    , [ 254, 1304, 1303 ]
    , [ 1304, 1305, 1303 ]
    , [ 1303, 1305, 281 ]
    , [ 1305, 280, 281 ]
    , [ 255, 1306, 1304 ]
    , [ 1306, 1307, 1304 ]
    , [ 1304, 1307, 1305 ]
    , [ 1307, 1308, 1305 ]
    , [ 1305, 1308, 280 ]
    , [ 1308, 279, 280 ]
    , [ 256, 1309, 1306 ]
    , [ 1309, 1310, 1306 ]
    , [ 1306, 1310, 1307 ]
    , [ 1310, 1311, 1307 ]
    , [ 1307, 1311, 1308 ]
    , [ 1311, 1312, 1308 ]
    , [ 1308, 1312, 279 ]
    , [ 1312, 278, 279 ]
    , [ 257, 1313, 1309 ]
    , [ 1313, 1314, 1309 ]
    , [ 1309, 1314, 1310 ]
    , [ 1314, 1315, 1310 ]
    , [ 1310, 1315, 1311 ]
    , [ 1315, 1316, 1311 ]
    , [ 1311, 1316, 1312 ]
    , [ 1316, 1317, 1312 ]
    , [ 1312, 1317, 278 ]
    , [ 1317, 277, 278 ]
    , [ 258, 1318, 1313 ]
    , [ 1318, 1319, 1313 ]
    , [ 1313, 1319, 1314 ]
    , [ 1319, 1320, 1314 ]
    , [ 1314, 1320, 1315 ]
    , [ 1320, 1321, 1315 ]
    , [ 1315, 1321, 1316 ]
    , [ 1321, 1322, 1316 ]
    , [ 1316, 1322, 1317 ]
    , [ 1322, 1323, 1317 ]
    , [ 1317, 1323, 277 ]
    , [ 1323, 276, 277 ]
    , [ 259, 1324, 1318 ]
    , [ 1324, 1325, 1318 ]
    , [ 1318, 1325, 1319 ]
    , [ 1325, 1326, 1319 ]
    , [ 1319, 1326, 1320 ]
    , [ 1326, 1327, 1320 ]
    , [ 1320, 1327, 1321 ]
    , [ 1327, 1328, 1321 ]
    , [ 1321, 1328, 1322 ]
    , [ 1328, 1329, 1322 ]
    , [ 1322, 1329, 1323 ]
    , [ 1329, 1330, 1323 ]
    , [ 1323, 1330, 276 ]
    , [ 1330, 275, 276 ]
    , [ 260, 1331, 1324 ]
    , [ 1331, 1332, 1324 ]
    , [ 1324, 1332, 1325 ]
    , [ 1332, 1333, 1325 ]
    , [ 1325, 1333, 1326 ]
    , [ 1333, 1334, 1326 ]
    , [ 1326, 1334, 1327 ]
    , [ 1334, 1335, 1327 ]
    , [ 1327, 1335, 1328 ]
    , [ 1335, 1336, 1328 ]
    , [ 1328, 1336, 1329 ]
    , [ 1336, 1337, 1329 ]
    , [ 1329, 1337, 1330 ]
    , [ 1337, 1338, 1330 ]
    , [ 1330, 1338, 275 ]
    , [ 1338, 274, 275 ]
    , [ 261, 1339, 1331 ]
    , [ 1339, 1340, 1331 ]
    , [ 1331, 1340, 1332 ]
    , [ 1340, 1341, 1332 ]
    , [ 1332, 1341, 1333 ]
    , [ 1341, 1342, 1333 ]
    , [ 1333, 1342, 1334 ]
    , [ 1342, 1343, 1334 ]
    , [ 1334, 1343, 1335 ]
    , [ 1343, 1344, 1335 ]
    , [ 1335, 1344, 1336 ]
    , [ 1344, 1345, 1336 ]
    , [ 1336, 1345, 1337 ]
    , [ 1345, 1346, 1337 ]
    , [ 1337, 1346, 1338 ]
    , [ 1346, 1347, 1338 ]
    , [ 1338, 1347, 274 ]
    , [ 1347, 273, 274 ]
    , [ 262, 1348, 1339 ]
    , [ 1348, 1349, 1339 ]
    , [ 1339, 1349, 1340 ]
    , [ 1349, 1350, 1340 ]
    , [ 1340, 1350, 1341 ]
    , [ 1350, 1351, 1341 ]
    , [ 1341, 1351, 1342 ]
    , [ 1351, 1352, 1342 ]
    , [ 1342, 1352, 1343 ]
    , [ 1352, 1353, 1343 ]
    , [ 1343, 1353, 1344 ]
    , [ 1353, 1354, 1344 ]
    , [ 1344, 1354, 1345 ]
    , [ 1354, 1355, 1345 ]
    , [ 1345, 1355, 1346 ]
    , [ 1355, 1356, 1346 ]
    , [ 1346, 1356, 1347 ]
    , [ 1356, 1357, 1347 ]
    , [ 1347, 1357, 273 ]
    , [ 1357, 272, 273 ]
    , [ 263, 1358, 1348 ]
    , [ 1358, 1359, 1348 ]
    , [ 1348, 1359, 1349 ]
    , [ 1359, 1360, 1349 ]
    , [ 1349, 1360, 1350 ]
    , [ 1360, 1361, 1350 ]
    , [ 1350, 1361, 1351 ]
    , [ 1361, 1362, 1351 ]
    , [ 1351, 1362, 1352 ]
    , [ 1362, 1363, 1352 ]
    , [ 1352, 1363, 1353 ]
    , [ 1363, 1364, 1353 ]
    , [ 1353, 1364, 1354 ]
    , [ 1364, 1365, 1354 ]
    , [ 1354, 1365, 1355 ]
    , [ 1365, 1366, 1355 ]
    , [ 1355, 1366, 1356 ]
    , [ 1366, 1367, 1356 ]
    , [ 1356, 1367, 1357 ]
    , [ 1367, 1368, 1357 ]
    , [ 1357, 1368, 272 ]
    , [ 1368, 271, 272 ]
    , [ 264, 1369, 1358 ]
    , [ 1369, 1370, 1358 ]
    , [ 1358, 1370, 1359 ]
    , [ 1370, 1371, 1359 ]
    , [ 1359, 1371, 1360 ]
    , [ 1371, 1372, 1360 ]
    , [ 1360, 1372, 1361 ]
    , [ 1372, 1373, 1361 ]
    , [ 1361, 1373, 1362 ]
    , [ 1373, 1374, 1362 ]
    , [ 1362, 1374, 1363 ]
    , [ 1374, 1375, 1363 ]
    , [ 1363, 1375, 1364 ]
    , [ 1375, 1376, 1364 ]
    , [ 1364, 1376, 1365 ]
    , [ 1376, 1377, 1365 ]
    , [ 1365, 1377, 1366 ]
    , [ 1377, 1378, 1366 ]
    , [ 1366, 1378, 1367 ]
    , [ 1378, 1379, 1367 ]
    , [ 1367, 1379, 1368 ]
    , [ 1379, 1380, 1368 ]
    , [ 1368, 1380, 271 ]
    , [ 1380, 270, 271 ]
    , [ 265, 1381, 1369 ]
    , [ 1381, 1382, 1369 ]
    , [ 1369, 1382, 1370 ]
    , [ 1382, 1383, 1370 ]
    , [ 1370, 1383, 1371 ]
    , [ 1383, 1384, 1371 ]
    , [ 1371, 1384, 1372 ]
    , [ 1384, 1385, 1372 ]
    , [ 1372, 1385, 1373 ]
    , [ 1385, 1386, 1373 ]
    , [ 1373, 1386, 1374 ]
    , [ 1386, 1387, 1374 ]
    , [ 1374, 1387, 1375 ]
    , [ 1387, 1388, 1375 ]
    , [ 1375, 1388, 1376 ]
    , [ 1388, 1389, 1376 ]
    , [ 1376, 1389, 1377 ]
    , [ 1389, 1390, 1377 ]
    , [ 1377, 1390, 1378 ]
    , [ 1390, 1391, 1378 ]
    , [ 1378, 1391, 1379 ]
    , [ 1391, 1392, 1379 ]
    , [ 1379, 1392, 1380 ]
    , [ 1392, 1393, 1380 ]
    , [ 1380, 1393, 270 ]
    , [ 1393, 269, 270 ]
    , [ 266, 1394, 1381 ]
    , [ 1394, 1395, 1381 ]
    , [ 1381, 1395, 1382 ]
    , [ 1395, 1396, 1382 ]
    , [ 1382, 1396, 1383 ]
    , [ 1396, 1397, 1383 ]
    , [ 1383, 1397, 1384 ]
    , [ 1397, 1398, 1384 ]
    , [ 1384, 1398, 1385 ]
    , [ 1398, 1399, 1385 ]
    , [ 1385, 1399, 1386 ]
    , [ 1399, 1400, 1386 ]
    , [ 1386, 1400, 1387 ]
    , [ 1400, 1401, 1387 ]
    , [ 1387, 1401, 1388 ]
    , [ 1401, 1402, 1388 ]
    , [ 1388, 1402, 1389 ]
    , [ 1402, 1403, 1389 ]
    , [ 1389, 1403, 1390 ]
    , [ 1403, 1404, 1390 ]
    , [ 1390, 1404, 1391 ]
    , [ 1404, 1405, 1391 ]
    , [ 1391, 1405, 1392 ]
    , [ 1405, 1406, 1392 ]
    , [ 1392, 1406, 1393 ]
    , [ 1406, 1407, 1393 ]
    , [ 1393, 1407, 269 ]
    , [ 1407, 268, 269 ]
    , [ 267, 147, 1394 ]
    , [ 147, 146, 1394 ]
    , [ 1394, 146, 1395 ]
    , [ 146, 145, 1395 ]
    , [ 1395, 145, 1396 ]
    , [ 145, 144, 1396 ]
    , [ 1396, 144, 1397 ]
    , [ 144, 143, 1397 ]
    , [ 1397, 143, 1398 ]
    , [ 143, 142, 1398 ]
    , [ 1398, 142, 1399 ]
    , [ 142, 141, 1399 ]
    , [ 1399, 141, 1400 ]
    , [ 141, 140, 1400 ]
    , [ 1400, 140, 1401 ]
    , [ 140, 139, 1401 ]
    , [ 1401, 139, 1402 ]
    , [ 139, 138, 1402 ]
    , [ 1402, 138, 1403 ]
    , [ 138, 137, 1403 ]
    , [ 1403, 137, 1404 ]
    , [ 137, 136, 1404 ]
    , [ 1404, 136, 1405 ]
    , [ 136, 135, 1405 ]
    , [ 1405, 135, 1406 ]
    , [ 135, 134, 1406 ]
    , [ 1406, 134, 1407 ]
    , [ 134, 133, 1407 ]
    , [ 1407, 133, 268 ]
    , [ 133, 4, 268 ]
    , [ 283, 312, 10 ]
    , [ 284, 1408, 283 ]
    , [ 285, 1409, 284 ]
    , [ 286, 1411, 285 ]
    , [ 287, 1414, 286 ]
    , [ 288, 1418, 287 ]
    , [ 289, 1423, 288 ]
    , [ 290, 1429, 289 ]
    , [ 291, 1436, 290 ]
    , [ 292, 1444, 291 ]
    , [ 293, 1453, 292 ]
    , [ 294, 1463, 293 ]
    , [ 295, 1474, 294 ]
    , [ 296, 1486, 295 ]
    , [ 297, 1499, 296 ]
    , [ 283, 1408, 312 ]
    , [ 1408, 311, 312 ]
    , [ 284, 1409, 1408 ]
    , [ 1409, 1410, 1408 ]
    , [ 1408, 1410, 311 ]
    , [ 1410, 310, 311 ]
    , [ 285, 1411, 1409 ]
    , [ 1411, 1412, 1409 ]
    , [ 1409, 1412, 1410 ]
    , [ 1412, 1413, 1410 ]
    , [ 1410, 1413, 310 ]
    , [ 1413, 309, 310 ]
    , [ 286, 1414, 1411 ]
    , [ 1414, 1415, 1411 ]
    , [ 1411, 1415, 1412 ]
    , [ 1415, 1416, 1412 ]
    , [ 1412, 1416, 1413 ]
    , [ 1416, 1417, 1413 ]
    , [ 1413, 1417, 309 ]
    , [ 1417, 308, 309 ]
    , [ 287, 1418, 1414 ]
    , [ 1418, 1419, 1414 ]
    , [ 1414, 1419, 1415 ]
    , [ 1419, 1420, 1415 ]
    , [ 1415, 1420, 1416 ]
    , [ 1420, 1421, 1416 ]
    , [ 1416, 1421, 1417 ]
    , [ 1421, 1422, 1417 ]
    , [ 1417, 1422, 308 ]
    , [ 1422, 307, 308 ]
    , [ 288, 1423, 1418 ]
    , [ 1423, 1424, 1418 ]
    , [ 1418, 1424, 1419 ]
    , [ 1424, 1425, 1419 ]
    , [ 1419, 1425, 1420 ]
    , [ 1425, 1426, 1420 ]
    , [ 1420, 1426, 1421 ]
    , [ 1426, 1427, 1421 ]
    , [ 1421, 1427, 1422 ]
    , [ 1427, 1428, 1422 ]
    , [ 1422, 1428, 307 ]
    , [ 1428, 306, 307 ]
    , [ 289, 1429, 1423 ]
    , [ 1429, 1430, 1423 ]
    , [ 1423, 1430, 1424 ]
    , [ 1430, 1431, 1424 ]
    , [ 1424, 1431, 1425 ]
    , [ 1431, 1432, 1425 ]
    , [ 1425, 1432, 1426 ]
    , [ 1432, 1433, 1426 ]
    , [ 1426, 1433, 1427 ]
    , [ 1433, 1434, 1427 ]
    , [ 1427, 1434, 1428 ]
    , [ 1434, 1435, 1428 ]
    , [ 1428, 1435, 306 ]
    , [ 1435, 305, 306 ]
    , [ 290, 1436, 1429 ]
    , [ 1436, 1437, 1429 ]
    , [ 1429, 1437, 1430 ]
    , [ 1437, 1438, 1430 ]
    , [ 1430, 1438, 1431 ]
    , [ 1438, 1439, 1431 ]
    , [ 1431, 1439, 1432 ]
    , [ 1439, 1440, 1432 ]
    , [ 1432, 1440, 1433 ]
    , [ 1440, 1441, 1433 ]
    , [ 1433, 1441, 1434 ]
    , [ 1441, 1442, 1434 ]
    , [ 1434, 1442, 1435 ]
    , [ 1442, 1443, 1435 ]
    , [ 1435, 1443, 305 ]
    , [ 1443, 304, 305 ]
    , [ 291, 1444, 1436 ]
    , [ 1444, 1445, 1436 ]
    , [ 1436, 1445, 1437 ]
    , [ 1445, 1446, 1437 ]
    , [ 1437, 1446, 1438 ]
    , [ 1446, 1447, 1438 ]
    , [ 1438, 1447, 1439 ]
    , [ 1447, 1448, 1439 ]
    , [ 1439, 1448, 1440 ]
    , [ 1448, 1449, 1440 ]
    , [ 1440, 1449, 1441 ]
    , [ 1449, 1450, 1441 ]
    , [ 1441, 1450, 1442 ]
    , [ 1450, 1451, 1442 ]
    , [ 1442, 1451, 1443 ]
    , [ 1451, 1452, 1443 ]
    , [ 1443, 1452, 304 ]
    , [ 1452, 303, 304 ]
    , [ 292, 1453, 1444 ]
    , [ 1453, 1454, 1444 ]
    , [ 1444, 1454, 1445 ]
    , [ 1454, 1455, 1445 ]
    , [ 1445, 1455, 1446 ]
    , [ 1455, 1456, 1446 ]
    , [ 1446, 1456, 1447 ]
    , [ 1456, 1457, 1447 ]
    , [ 1447, 1457, 1448 ]
    , [ 1457, 1458, 1448 ]
    , [ 1448, 1458, 1449 ]
    , [ 1458, 1459, 1449 ]
    , [ 1449, 1459, 1450 ]
    , [ 1459, 1460, 1450 ]
    , [ 1450, 1460, 1451 ]
    , [ 1460, 1461, 1451 ]
    , [ 1451, 1461, 1452 ]
    , [ 1461, 1462, 1452 ]
    , [ 1452, 1462, 303 ]
    , [ 1462, 302, 303 ]
    , [ 293, 1463, 1453 ]
    , [ 1463, 1464, 1453 ]
    , [ 1453, 1464, 1454 ]
    , [ 1464, 1465, 1454 ]
    , [ 1454, 1465, 1455 ]
    , [ 1465, 1466, 1455 ]
    , [ 1455, 1466, 1456 ]
    , [ 1466, 1467, 1456 ]
    , [ 1456, 1467, 1457 ]
    , [ 1467, 1468, 1457 ]
    , [ 1457, 1468, 1458 ]
    , [ 1468, 1469, 1458 ]
    , [ 1458, 1469, 1459 ]
    , [ 1469, 1470, 1459 ]
    , [ 1459, 1470, 1460 ]
    , [ 1470, 1471, 1460 ]
    , [ 1460, 1471, 1461 ]
    , [ 1471, 1472, 1461 ]
    , [ 1461, 1472, 1462 ]
    , [ 1472, 1473, 1462 ]
    , [ 1462, 1473, 302 ]
    , [ 1473, 301, 302 ]
    , [ 294, 1474, 1463 ]
    , [ 1474, 1475, 1463 ]
    , [ 1463, 1475, 1464 ]
    , [ 1475, 1476, 1464 ]
    , [ 1464, 1476, 1465 ]
    , [ 1476, 1477, 1465 ]
    , [ 1465, 1477, 1466 ]
    , [ 1477, 1478, 1466 ]
    , [ 1466, 1478, 1467 ]
    , [ 1478, 1479, 1467 ]
    , [ 1467, 1479, 1468 ]
    , [ 1479, 1480, 1468 ]
    , [ 1468, 1480, 1469 ]
    , [ 1480, 1481, 1469 ]
    , [ 1469, 1481, 1470 ]
    , [ 1481, 1482, 1470 ]
    , [ 1470, 1482, 1471 ]
    , [ 1482, 1483, 1471 ]
    , [ 1471, 1483, 1472 ]
    , [ 1483, 1484, 1472 ]
    , [ 1472, 1484, 1473 ]
    , [ 1484, 1485, 1473 ]
    , [ 1473, 1485, 301 ]
    , [ 1485, 300, 301 ]
    , [ 295, 1486, 1474 ]
    , [ 1486, 1487, 1474 ]
    , [ 1474, 1487, 1475 ]
    , [ 1487, 1488, 1475 ]
    , [ 1475, 1488, 1476 ]
    , [ 1488, 1489, 1476 ]
    , [ 1476, 1489, 1477 ]
    , [ 1489, 1490, 1477 ]
    , [ 1477, 1490, 1478 ]
    , [ 1490, 1491, 1478 ]
    , [ 1478, 1491, 1479 ]
    , [ 1491, 1492, 1479 ]
    , [ 1479, 1492, 1480 ]
    , [ 1492, 1493, 1480 ]
    , [ 1480, 1493, 1481 ]
    , [ 1493, 1494, 1481 ]
    , [ 1481, 1494, 1482 ]
    , [ 1494, 1495, 1482 ]
    , [ 1482, 1495, 1483 ]
    , [ 1495, 1496, 1483 ]
    , [ 1483, 1496, 1484 ]
    , [ 1496, 1497, 1484 ]
    , [ 1484, 1497, 1485 ]
    , [ 1497, 1498, 1485 ]
    , [ 1485, 1498, 300 ]
    , [ 1498, 299, 300 ]
    , [ 296, 1499, 1486 ]
    , [ 1499, 1500, 1486 ]
    , [ 1486, 1500, 1487 ]
    , [ 1500, 1501, 1487 ]
    , [ 1487, 1501, 1488 ]
    , [ 1501, 1502, 1488 ]
    , [ 1488, 1502, 1489 ]
    , [ 1502, 1503, 1489 ]
    , [ 1489, 1503, 1490 ]
    , [ 1503, 1504, 1490 ]
    , [ 1490, 1504, 1491 ]
    , [ 1504, 1505, 1491 ]
    , [ 1491, 1505, 1492 ]
    , [ 1505, 1506, 1492 ]
    , [ 1492, 1506, 1493 ]
    , [ 1506, 1507, 1493 ]
    , [ 1493, 1507, 1494 ]
    , [ 1507, 1508, 1494 ]
    , [ 1494, 1508, 1495 ]
    , [ 1508, 1509, 1495 ]
    , [ 1495, 1509, 1496 ]
    , [ 1509, 1510, 1496 ]
    , [ 1496, 1510, 1497 ]
    , [ 1510, 1511, 1497 ]
    , [ 1497, 1511, 1498 ]
    , [ 1511, 1512, 1498 ]
    , [ 1498, 1512, 299 ]
    , [ 1512, 298, 299 ]
    , [ 297, 162, 1499 ]
    , [ 162, 161, 1499 ]
    , [ 1499, 161, 1500 ]
    , [ 161, 160, 1500 ]
    , [ 1500, 160, 1501 ]
    , [ 160, 159, 1501 ]
    , [ 1501, 159, 1502 ]
    , [ 159, 158, 1502 ]
    , [ 1502, 158, 1503 ]
    , [ 158, 157, 1503 ]
    , [ 1503, 157, 1504 ]
    , [ 157, 156, 1504 ]
    , [ 1504, 156, 1505 ]
    , [ 156, 155, 1505 ]
    , [ 1505, 155, 1506 ]
    , [ 155, 154, 1506 ]
    , [ 1506, 154, 1507 ]
    , [ 154, 153, 1507 ]
    , [ 1507, 153, 1508 ]
    , [ 153, 152, 1508 ]
    , [ 1508, 152, 1509 ]
    , [ 152, 151, 1509 ]
    , [ 1509, 151, 1510 ]
    , [ 151, 150, 1510 ]
    , [ 1510, 150, 1511 ]
    , [ 150, 149, 1511 ]
    , [ 1511, 149, 1512 ]
    , [ 149, 148, 1512 ]
    , [ 1512, 148, 298 ]
    , [ 148, 5, 298 ]
    , [ 222, 327, 7 ]
    , [ 221, 1513, 222 ]
    , [ 220, 1514, 221 ]
    , [ 219, 1516, 220 ]
    , [ 218, 1519, 219 ]
    , [ 217, 1523, 218 ]
    , [ 216, 1528, 217 ]
    , [ 215, 1534, 216 ]
    , [ 214, 1541, 215 ]
    , [ 213, 1549, 214 ]
    , [ 212, 1558, 213 ]
    , [ 211, 1568, 212 ]
    , [ 210, 1579, 211 ]
    , [ 209, 1591, 210 ]
    , [ 208, 1604, 209 ]
    , [ 222, 1513, 327 ]
    , [ 1513, 326, 327 ]
    , [ 221, 1514, 1513 ]
    , [ 1514, 1515, 1513 ]
    , [ 1513, 1515, 326 ]
    , [ 1515, 325, 326 ]
    , [ 220, 1516, 1514 ]
    , [ 1516, 1517, 1514 ]
    , [ 1514, 1517, 1515 ]
    , [ 1517, 1518, 1515 ]
    , [ 1515, 1518, 325 ]
    , [ 1518, 324, 325 ]
    , [ 219, 1519, 1516 ]
    , [ 1519, 1520, 1516 ]
    , [ 1516, 1520, 1517 ]
    , [ 1520, 1521, 1517 ]
    , [ 1517, 1521, 1518 ]
    , [ 1521, 1522, 1518 ]
    , [ 1518, 1522, 324 ]
    , [ 1522, 323, 324 ]
    , [ 218, 1523, 1519 ]
    , [ 1523, 1524, 1519 ]
    , [ 1519, 1524, 1520 ]
    , [ 1524, 1525, 1520 ]
    , [ 1520, 1525, 1521 ]
    , [ 1525, 1526, 1521 ]
    , [ 1521, 1526, 1522 ]
    , [ 1526, 1527, 1522 ]
    , [ 1522, 1527, 323 ]
    , [ 1527, 322, 323 ]
    , [ 217, 1528, 1523 ]
    , [ 1528, 1529, 1523 ]
    , [ 1523, 1529, 1524 ]
    , [ 1529, 1530, 1524 ]
    , [ 1524, 1530, 1525 ]
    , [ 1530, 1531, 1525 ]
    , [ 1525, 1531, 1526 ]
    , [ 1531, 1532, 1526 ]
    , [ 1526, 1532, 1527 ]
    , [ 1532, 1533, 1527 ]
    , [ 1527, 1533, 322 ]
    , [ 1533, 321, 322 ]
    , [ 216, 1534, 1528 ]
    , [ 1534, 1535, 1528 ]
    , [ 1528, 1535, 1529 ]
    , [ 1535, 1536, 1529 ]
    , [ 1529, 1536, 1530 ]
    , [ 1536, 1537, 1530 ]
    , [ 1530, 1537, 1531 ]
    , [ 1537, 1538, 1531 ]
    , [ 1531, 1538, 1532 ]
    , [ 1538, 1539, 1532 ]
    , [ 1532, 1539, 1533 ]
    , [ 1539, 1540, 1533 ]
    , [ 1533, 1540, 321 ]
    , [ 1540, 320, 321 ]
    , [ 215, 1541, 1534 ]
    , [ 1541, 1542, 1534 ]
    , [ 1534, 1542, 1535 ]
    , [ 1542, 1543, 1535 ]
    , [ 1535, 1543, 1536 ]
    , [ 1543, 1544, 1536 ]
    , [ 1536, 1544, 1537 ]
    , [ 1544, 1545, 1537 ]
    , [ 1537, 1545, 1538 ]
    , [ 1545, 1546, 1538 ]
    , [ 1538, 1546, 1539 ]
    , [ 1546, 1547, 1539 ]
    , [ 1539, 1547, 1540 ]
    , [ 1547, 1548, 1540 ]
    , [ 1540, 1548, 320 ]
    , [ 1548, 319, 320 ]
    , [ 214, 1549, 1541 ]
    , [ 1549, 1550, 1541 ]
    , [ 1541, 1550, 1542 ]
    , [ 1550, 1551, 1542 ]
    , [ 1542, 1551, 1543 ]
    , [ 1551, 1552, 1543 ]
    , [ 1543, 1552, 1544 ]
    , [ 1552, 1553, 1544 ]
    , [ 1544, 1553, 1545 ]
    , [ 1553, 1554, 1545 ]
    , [ 1545, 1554, 1546 ]
    , [ 1554, 1555, 1546 ]
    , [ 1546, 1555, 1547 ]
    , [ 1555, 1556, 1547 ]
    , [ 1547, 1556, 1548 ]
    , [ 1556, 1557, 1548 ]
    , [ 1548, 1557, 319 ]
    , [ 1557, 318, 319 ]
    , [ 213, 1558, 1549 ]
    , [ 1558, 1559, 1549 ]
    , [ 1549, 1559, 1550 ]
    , [ 1559, 1560, 1550 ]
    , [ 1550, 1560, 1551 ]
    , [ 1560, 1561, 1551 ]
    , [ 1551, 1561, 1552 ]
    , [ 1561, 1562, 1552 ]
    , [ 1552, 1562, 1553 ]
    , [ 1562, 1563, 1553 ]
    , [ 1553, 1563, 1554 ]
    , [ 1563, 1564, 1554 ]
    , [ 1554, 1564, 1555 ]
    , [ 1564, 1565, 1555 ]
    , [ 1555, 1565, 1556 ]
    , [ 1565, 1566, 1556 ]
    , [ 1556, 1566, 1557 ]
    , [ 1566, 1567, 1557 ]
    , [ 1557, 1567, 318 ]
    , [ 1567, 317, 318 ]
    , [ 212, 1568, 1558 ]
    , [ 1568, 1569, 1558 ]
    , [ 1558, 1569, 1559 ]
    , [ 1569, 1570, 1559 ]
    , [ 1559, 1570, 1560 ]
    , [ 1570, 1571, 1560 ]
    , [ 1560, 1571, 1561 ]
    , [ 1571, 1572, 1561 ]
    , [ 1561, 1572, 1562 ]
    , [ 1572, 1573, 1562 ]
    , [ 1562, 1573, 1563 ]
    , [ 1573, 1574, 1563 ]
    , [ 1563, 1574, 1564 ]
    , [ 1574, 1575, 1564 ]
    , [ 1564, 1575, 1565 ]
    , [ 1575, 1576, 1565 ]
    , [ 1565, 1576, 1566 ]
    , [ 1576, 1577, 1566 ]
    , [ 1566, 1577, 1567 ]
    , [ 1577, 1578, 1567 ]
    , [ 1567, 1578, 317 ]
    , [ 1578, 316, 317 ]
    , [ 211, 1579, 1568 ]
    , [ 1579, 1580, 1568 ]
    , [ 1568, 1580, 1569 ]
    , [ 1580, 1581, 1569 ]
    , [ 1569, 1581, 1570 ]
    , [ 1581, 1582, 1570 ]
    , [ 1570, 1582, 1571 ]
    , [ 1582, 1583, 1571 ]
    , [ 1571, 1583, 1572 ]
    , [ 1583, 1584, 1572 ]
    , [ 1572, 1584, 1573 ]
    , [ 1584, 1585, 1573 ]
    , [ 1573, 1585, 1574 ]
    , [ 1585, 1586, 1574 ]
    , [ 1574, 1586, 1575 ]
    , [ 1586, 1587, 1575 ]
    , [ 1575, 1587, 1576 ]
    , [ 1587, 1588, 1576 ]
    , [ 1576, 1588, 1577 ]
    , [ 1588, 1589, 1577 ]
    , [ 1577, 1589, 1578 ]
    , [ 1589, 1590, 1578 ]
    , [ 1578, 1590, 316 ]
    , [ 1590, 315, 316 ]
    , [ 210, 1591, 1579 ]
    , [ 1591, 1592, 1579 ]
    , [ 1579, 1592, 1580 ]
    , [ 1592, 1593, 1580 ]
    , [ 1580, 1593, 1581 ]
    , [ 1593, 1594, 1581 ]
    , [ 1581, 1594, 1582 ]
    , [ 1594, 1595, 1582 ]
    , [ 1582, 1595, 1583 ]
    , [ 1595, 1596, 1583 ]
    , [ 1583, 1596, 1584 ]
    , [ 1596, 1597, 1584 ]
    , [ 1584, 1597, 1585 ]
    , [ 1597, 1598, 1585 ]
    , [ 1585, 1598, 1586 ]
    , [ 1598, 1599, 1586 ]
    , [ 1586, 1599, 1587 ]
    , [ 1599, 1600, 1587 ]
    , [ 1587, 1600, 1588 ]
    , [ 1600, 1601, 1588 ]
    , [ 1588, 1601, 1589 ]
    , [ 1601, 1602, 1589 ]
    , [ 1589, 1602, 1590 ]
    , [ 1602, 1603, 1590 ]
    , [ 1590, 1603, 315 ]
    , [ 1603, 314, 315 ]
    , [ 209, 1604, 1591 ]
    , [ 1604, 1605, 1591 ]
    , [ 1591, 1605, 1592 ]
    , [ 1605, 1606, 1592 ]
    , [ 1592, 1606, 1593 ]
    , [ 1606, 1607, 1593 ]
    , [ 1593, 1607, 1594 ]
    , [ 1607, 1608, 1594 ]
    , [ 1594, 1608, 1595 ]
    , [ 1608, 1609, 1595 ]
    , [ 1595, 1609, 1596 ]
    , [ 1609, 1610, 1596 ]
    , [ 1596, 1610, 1597 ]
    , [ 1610, 1611, 1597 ]
    , [ 1597, 1611, 1598 ]
    , [ 1611, 1612, 1598 ]
    , [ 1598, 1612, 1599 ]
    , [ 1612, 1613, 1599 ]
    , [ 1599, 1613, 1600 ]
    , [ 1613, 1614, 1600 ]
    , [ 1600, 1614, 1601 ]
    , [ 1614, 1615, 1601 ]
    , [ 1601, 1615, 1602 ]
    , [ 1615, 1616, 1602 ]
    , [ 1602, 1616, 1603 ]
    , [ 1616, 1617, 1603 ]
    , [ 1603, 1617, 314 ]
    , [ 1617, 313, 314 ]
    , [ 208, 177, 1604 ]
    , [ 177, 176, 1604 ]
    , [ 1604, 176, 1605 ]
    , [ 176, 175, 1605 ]
    , [ 1605, 175, 1606 ]
    , [ 175, 174, 1606 ]
    , [ 1606, 174, 1607 ]
    , [ 174, 173, 1607 ]
    , [ 1607, 173, 1608 ]
    , [ 173, 172, 1608 ]
    , [ 1608, 172, 1609 ]
    , [ 172, 171, 1609 ]
    , [ 1609, 171, 1610 ]
    , [ 171, 170, 1610 ]
    , [ 1610, 170, 1611 ]
    , [ 170, 169, 1611 ]
    , [ 1611, 169, 1612 ]
    , [ 169, 168, 1612 ]
    , [ 1612, 168, 1613 ]
    , [ 168, 167, 1613 ]
    , [ 1613, 167, 1614 ]
    , [ 167, 166, 1614 ]
    , [ 1614, 166, 1615 ]
    , [ 166, 165, 1615 ]
    , [ 1615, 165, 1616 ]
    , [ 165, 164, 1616 ]
    , [ 1616, 164, 1617 ]
    , [ 164, 163, 1617 ]
    , [ 1617, 163, 313 ]
    , [ 163, 11, 313 ]
    , [ 252, 342, 8 ]
    , [ 251, 1618, 252 ]
    , [ 250, 1619, 251 ]
    , [ 249, 1621, 250 ]
    , [ 248, 1624, 249 ]
    , [ 247, 1628, 248 ]
    , [ 246, 1633, 247 ]
    , [ 245, 1639, 246 ]
    , [ 244, 1646, 245 ]
    , [ 243, 1654, 244 ]
    , [ 242, 1663, 243 ]
    , [ 241, 1673, 242 ]
    , [ 240, 1684, 241 ]
    , [ 239, 1696, 240 ]
    , [ 238, 1709, 239 ]
    , [ 252, 1618, 342 ]
    , [ 1618, 341, 342 ]
    , [ 251, 1619, 1618 ]
    , [ 1619, 1620, 1618 ]
    , [ 1618, 1620, 341 ]
    , [ 1620, 340, 341 ]
    , [ 250, 1621, 1619 ]
    , [ 1621, 1622, 1619 ]
    , [ 1619, 1622, 1620 ]
    , [ 1622, 1623, 1620 ]
    , [ 1620, 1623, 340 ]
    , [ 1623, 339, 340 ]
    , [ 249, 1624, 1621 ]
    , [ 1624, 1625, 1621 ]
    , [ 1621, 1625, 1622 ]
    , [ 1625, 1626, 1622 ]
    , [ 1622, 1626, 1623 ]
    , [ 1626, 1627, 1623 ]
    , [ 1623, 1627, 339 ]
    , [ 1627, 338, 339 ]
    , [ 248, 1628, 1624 ]
    , [ 1628, 1629, 1624 ]
    , [ 1624, 1629, 1625 ]
    , [ 1629, 1630, 1625 ]
    , [ 1625, 1630, 1626 ]
    , [ 1630, 1631, 1626 ]
    , [ 1626, 1631, 1627 ]
    , [ 1631, 1632, 1627 ]
    , [ 1627, 1632, 338 ]
    , [ 1632, 337, 338 ]
    , [ 247, 1633, 1628 ]
    , [ 1633, 1634, 1628 ]
    , [ 1628, 1634, 1629 ]
    , [ 1634, 1635, 1629 ]
    , [ 1629, 1635, 1630 ]
    , [ 1635, 1636, 1630 ]
    , [ 1630, 1636, 1631 ]
    , [ 1636, 1637, 1631 ]
    , [ 1631, 1637, 1632 ]
    , [ 1637, 1638, 1632 ]
    , [ 1632, 1638, 337 ]
    , [ 1638, 336, 337 ]
    , [ 246, 1639, 1633 ]
    , [ 1639, 1640, 1633 ]
    , [ 1633, 1640, 1634 ]
    , [ 1640, 1641, 1634 ]
    , [ 1634, 1641, 1635 ]
    , [ 1641, 1642, 1635 ]
    , [ 1635, 1642, 1636 ]
    , [ 1642, 1643, 1636 ]
    , [ 1636, 1643, 1637 ]
    , [ 1643, 1644, 1637 ]
    , [ 1637, 1644, 1638 ]
    , [ 1644, 1645, 1638 ]
    , [ 1638, 1645, 336 ]
    , [ 1645, 335, 336 ]
    , [ 245, 1646, 1639 ]
    , [ 1646, 1647, 1639 ]
    , [ 1639, 1647, 1640 ]
    , [ 1647, 1648, 1640 ]
    , [ 1640, 1648, 1641 ]
    , [ 1648, 1649, 1641 ]
    , [ 1641, 1649, 1642 ]
    , [ 1649, 1650, 1642 ]
    , [ 1642, 1650, 1643 ]
    , [ 1650, 1651, 1643 ]
    , [ 1643, 1651, 1644 ]
    , [ 1651, 1652, 1644 ]
    , [ 1644, 1652, 1645 ]
    , [ 1652, 1653, 1645 ]
    , [ 1645, 1653, 335 ]
    , [ 1653, 334, 335 ]
    , [ 244, 1654, 1646 ]
    , [ 1654, 1655, 1646 ]
    , [ 1646, 1655, 1647 ]
    , [ 1655, 1656, 1647 ]
    , [ 1647, 1656, 1648 ]
    , [ 1656, 1657, 1648 ]
    , [ 1648, 1657, 1649 ]
    , [ 1657, 1658, 1649 ]
    , [ 1649, 1658, 1650 ]
    , [ 1658, 1659, 1650 ]
    , [ 1650, 1659, 1651 ]
    , [ 1659, 1660, 1651 ]
    , [ 1651, 1660, 1652 ]
    , [ 1660, 1661, 1652 ]
    , [ 1652, 1661, 1653 ]
    , [ 1661, 1662, 1653 ]
    , [ 1653, 1662, 334 ]
    , [ 1662, 333, 334 ]
    , [ 243, 1663, 1654 ]
    , [ 1663, 1664, 1654 ]
    , [ 1654, 1664, 1655 ]
    , [ 1664, 1665, 1655 ]
    , [ 1655, 1665, 1656 ]
    , [ 1665, 1666, 1656 ]
    , [ 1656, 1666, 1657 ]
    , [ 1666, 1667, 1657 ]
    , [ 1657, 1667, 1658 ]
    , [ 1667, 1668, 1658 ]
    , [ 1658, 1668, 1659 ]
    , [ 1668, 1669, 1659 ]
    , [ 1659, 1669, 1660 ]
    , [ 1669, 1670, 1660 ]
    , [ 1660, 1670, 1661 ]
    , [ 1670, 1671, 1661 ]
    , [ 1661, 1671, 1662 ]
    , [ 1671, 1672, 1662 ]
    , [ 1662, 1672, 333 ]
    , [ 1672, 332, 333 ]
    , [ 242, 1673, 1663 ]
    , [ 1673, 1674, 1663 ]
    , [ 1663, 1674, 1664 ]
    , [ 1674, 1675, 1664 ]
    , [ 1664, 1675, 1665 ]
    , [ 1675, 1676, 1665 ]
    , [ 1665, 1676, 1666 ]
    , [ 1676, 1677, 1666 ]
    , [ 1666, 1677, 1667 ]
    , [ 1677, 1678, 1667 ]
    , [ 1667, 1678, 1668 ]
    , [ 1678, 1679, 1668 ]
    , [ 1668, 1679, 1669 ]
    , [ 1679, 1680, 1669 ]
    , [ 1669, 1680, 1670 ]
    , [ 1680, 1681, 1670 ]
    , [ 1670, 1681, 1671 ]
    , [ 1681, 1682, 1671 ]
    , [ 1671, 1682, 1672 ]
    , [ 1682, 1683, 1672 ]
    , [ 1672, 1683, 332 ]
    , [ 1683, 331, 332 ]
    , [ 241, 1684, 1673 ]
    , [ 1684, 1685, 1673 ]
    , [ 1673, 1685, 1674 ]
    , [ 1685, 1686, 1674 ]
    , [ 1674, 1686, 1675 ]
    , [ 1686, 1687, 1675 ]
    , [ 1675, 1687, 1676 ]
    , [ 1687, 1688, 1676 ]
    , [ 1676, 1688, 1677 ]
    , [ 1688, 1689, 1677 ]
    , [ 1677, 1689, 1678 ]
    , [ 1689, 1690, 1678 ]
    , [ 1678, 1690, 1679 ]
    , [ 1690, 1691, 1679 ]
    , [ 1679, 1691, 1680 ]
    , [ 1691, 1692, 1680 ]
    , [ 1680, 1692, 1681 ]
    , [ 1692, 1693, 1681 ]
    , [ 1681, 1693, 1682 ]
    , [ 1693, 1694, 1682 ]
    , [ 1682, 1694, 1683 ]
    , [ 1694, 1695, 1683 ]
    , [ 1683, 1695, 331 ]
    , [ 1695, 330, 331 ]
    , [ 240, 1696, 1684 ]
    , [ 1696, 1697, 1684 ]
    , [ 1684, 1697, 1685 ]
    , [ 1697, 1698, 1685 ]
    , [ 1685, 1698, 1686 ]
    , [ 1698, 1699, 1686 ]
    , [ 1686, 1699, 1687 ]
    , [ 1699, 1700, 1687 ]
    , [ 1687, 1700, 1688 ]
    , [ 1700, 1701, 1688 ]
    , [ 1688, 1701, 1689 ]
    , [ 1701, 1702, 1689 ]
    , [ 1689, 1702, 1690 ]
    , [ 1702, 1703, 1690 ]
    , [ 1690, 1703, 1691 ]
    , [ 1703, 1704, 1691 ]
    , [ 1691, 1704, 1692 ]
    , [ 1704, 1705, 1692 ]
    , [ 1692, 1705, 1693 ]
    , [ 1705, 1706, 1693 ]
    , [ 1693, 1706, 1694 ]
    , [ 1706, 1707, 1694 ]
    , [ 1694, 1707, 1695 ]
    , [ 1707, 1708, 1695 ]
    , [ 1695, 1708, 330 ]
    , [ 1708, 329, 330 ]
    , [ 239, 1709, 1696 ]
    , [ 1709, 1710, 1696 ]
    , [ 1696, 1710, 1697 ]
    , [ 1710, 1711, 1697 ]
    , [ 1697, 1711, 1698 ]
    , [ 1711, 1712, 1698 ]
    , [ 1698, 1712, 1699 ]
    , [ 1712, 1713, 1699 ]
    , [ 1699, 1713, 1700 ]
    , [ 1713, 1714, 1700 ]
    , [ 1700, 1714, 1701 ]
    , [ 1714, 1715, 1701 ]
    , [ 1701, 1715, 1702 ]
    , [ 1715, 1716, 1702 ]
    , [ 1702, 1716, 1703 ]
    , [ 1716, 1717, 1703 ]
    , [ 1703, 1717, 1704 ]
    , [ 1717, 1718, 1704 ]
    , [ 1704, 1718, 1705 ]
    , [ 1718, 1719, 1705 ]
    , [ 1705, 1719, 1706 ]
    , [ 1719, 1720, 1706 ]
    , [ 1706, 1720, 1707 ]
    , [ 1720, 1721, 1707 ]
    , [ 1707, 1721, 1708 ]
    , [ 1721, 1722, 1708 ]
    , [ 1708, 1722, 329 ]
    , [ 1722, 328, 329 ]
    , [ 238, 207, 1709 ]
    , [ 207, 206, 1709 ]
    , [ 1709, 206, 1710 ]
    , [ 206, 205, 1710 ]
    , [ 1710, 205, 1711 ]
    , [ 205, 204, 1711 ]
    , [ 1711, 204, 1712 ]
    , [ 204, 203, 1712 ]
    , [ 1712, 203, 1713 ]
    , [ 203, 202, 1713 ]
    , [ 1713, 202, 1714 ]
    , [ 202, 201, 1714 ]
    , [ 1714, 201, 1715 ]
    , [ 201, 200, 1715 ]
    , [ 1715, 200, 1716 ]
    , [ 200, 199, 1716 ]
    , [ 1716, 199, 1717 ]
    , [ 199, 198, 1717 ]
    , [ 1717, 198, 1718 ]
    , [ 198, 197, 1718 ]
    , [ 1718, 197, 1719 ]
    , [ 197, 196, 1719 ]
    , [ 1719, 196, 1720 ]
    , [ 196, 195, 1720 ]
    , [ 1720, 195, 1721 ]
    , [ 195, 194, 1721 ]
    , [ 1721, 194, 1722 ]
    , [ 194, 193, 1722 ]
    , [ 1722, 193, 328 ]
    , [ 193, 7, 328 ]
    , [ 282, 357, 9 ]
    , [ 281, 1723, 282 ]
    , [ 280, 1724, 281 ]
    , [ 279, 1726, 280 ]
    , [ 278, 1729, 279 ]
    , [ 277, 1733, 278 ]
    , [ 276, 1738, 277 ]
    , [ 275, 1744, 276 ]
    , [ 274, 1751, 275 ]
    , [ 273, 1759, 274 ]
    , [ 272, 1768, 273 ]
    , [ 271, 1778, 272 ]
    , [ 270, 1789, 271 ]
    , [ 269, 1801, 270 ]
    , [ 268, 1814, 269 ]
    , [ 282, 1723, 357 ]
    , [ 1723, 356, 357 ]
    , [ 281, 1724, 1723 ]
    , [ 1724, 1725, 1723 ]
    , [ 1723, 1725, 356 ]
    , [ 1725, 355, 356 ]
    , [ 280, 1726, 1724 ]
    , [ 1726, 1727, 1724 ]
    , [ 1724, 1727, 1725 ]
    , [ 1727, 1728, 1725 ]
    , [ 1725, 1728, 355 ]
    , [ 1728, 354, 355 ]
    , [ 279, 1729, 1726 ]
    , [ 1729, 1730, 1726 ]
    , [ 1726, 1730, 1727 ]
    , [ 1730, 1731, 1727 ]
    , [ 1727, 1731, 1728 ]
    , [ 1731, 1732, 1728 ]
    , [ 1728, 1732, 354 ]
    , [ 1732, 353, 354 ]
    , [ 278, 1733, 1729 ]
    , [ 1733, 1734, 1729 ]
    , [ 1729, 1734, 1730 ]
    , [ 1734, 1735, 1730 ]
    , [ 1730, 1735, 1731 ]
    , [ 1735, 1736, 1731 ]
    , [ 1731, 1736, 1732 ]
    , [ 1736, 1737, 1732 ]
    , [ 1732, 1737, 353 ]
    , [ 1737, 352, 353 ]
    , [ 277, 1738, 1733 ]
    , [ 1738, 1739, 1733 ]
    , [ 1733, 1739, 1734 ]
    , [ 1739, 1740, 1734 ]
    , [ 1734, 1740, 1735 ]
    , [ 1740, 1741, 1735 ]
    , [ 1735, 1741, 1736 ]
    , [ 1741, 1742, 1736 ]
    , [ 1736, 1742, 1737 ]
    , [ 1742, 1743, 1737 ]
    , [ 1737, 1743, 352 ]
    , [ 1743, 351, 352 ]
    , [ 276, 1744, 1738 ]
    , [ 1744, 1745, 1738 ]
    , [ 1738, 1745, 1739 ]
    , [ 1745, 1746, 1739 ]
    , [ 1739, 1746, 1740 ]
    , [ 1746, 1747, 1740 ]
    , [ 1740, 1747, 1741 ]
    , [ 1747, 1748, 1741 ]
    , [ 1741, 1748, 1742 ]
    , [ 1748, 1749, 1742 ]
    , [ 1742, 1749, 1743 ]
    , [ 1749, 1750, 1743 ]
    , [ 1743, 1750, 351 ]
    , [ 1750, 350, 351 ]
    , [ 275, 1751, 1744 ]
    , [ 1751, 1752, 1744 ]
    , [ 1744, 1752, 1745 ]
    , [ 1752, 1753, 1745 ]
    , [ 1745, 1753, 1746 ]
    , [ 1753, 1754, 1746 ]
    , [ 1746, 1754, 1747 ]
    , [ 1754, 1755, 1747 ]
    , [ 1747, 1755, 1748 ]
    , [ 1755, 1756, 1748 ]
    , [ 1748, 1756, 1749 ]
    , [ 1756, 1757, 1749 ]
    , [ 1749, 1757, 1750 ]
    , [ 1757, 1758, 1750 ]
    , [ 1750, 1758, 350 ]
    , [ 1758, 349, 350 ]
    , [ 274, 1759, 1751 ]
    , [ 1759, 1760, 1751 ]
    , [ 1751, 1760, 1752 ]
    , [ 1760, 1761, 1752 ]
    , [ 1752, 1761, 1753 ]
    , [ 1761, 1762, 1753 ]
    , [ 1753, 1762, 1754 ]
    , [ 1762, 1763, 1754 ]
    , [ 1754, 1763, 1755 ]
    , [ 1763, 1764, 1755 ]
    , [ 1755, 1764, 1756 ]
    , [ 1764, 1765, 1756 ]
    , [ 1756, 1765, 1757 ]
    , [ 1765, 1766, 1757 ]
    , [ 1757, 1766, 1758 ]
    , [ 1766, 1767, 1758 ]
    , [ 1758, 1767, 349 ]
    , [ 1767, 348, 349 ]
    , [ 273, 1768, 1759 ]
    , [ 1768, 1769, 1759 ]
    , [ 1759, 1769, 1760 ]
    , [ 1769, 1770, 1760 ]
    , [ 1760, 1770, 1761 ]
    , [ 1770, 1771, 1761 ]
    , [ 1761, 1771, 1762 ]
    , [ 1771, 1772, 1762 ]
    , [ 1762, 1772, 1763 ]
    , [ 1772, 1773, 1763 ]
    , [ 1763, 1773, 1764 ]
    , [ 1773, 1774, 1764 ]
    , [ 1764, 1774, 1765 ]
    , [ 1774, 1775, 1765 ]
    , [ 1765, 1775, 1766 ]
    , [ 1775, 1776, 1766 ]
    , [ 1766, 1776, 1767 ]
    , [ 1776, 1777, 1767 ]
    , [ 1767, 1777, 348 ]
    , [ 1777, 347, 348 ]
    , [ 272, 1778, 1768 ]
    , [ 1778, 1779, 1768 ]
    , [ 1768, 1779, 1769 ]
    , [ 1779, 1780, 1769 ]
    , [ 1769, 1780, 1770 ]
    , [ 1780, 1781, 1770 ]
    , [ 1770, 1781, 1771 ]
    , [ 1781, 1782, 1771 ]
    , [ 1771, 1782, 1772 ]
    , [ 1782, 1783, 1772 ]
    , [ 1772, 1783, 1773 ]
    , [ 1783, 1784, 1773 ]
    , [ 1773, 1784, 1774 ]
    , [ 1784, 1785, 1774 ]
    , [ 1774, 1785, 1775 ]
    , [ 1785, 1786, 1775 ]
    , [ 1775, 1786, 1776 ]
    , [ 1786, 1787, 1776 ]
    , [ 1776, 1787, 1777 ]
    , [ 1787, 1788, 1777 ]
    , [ 1777, 1788, 347 ]
    , [ 1788, 346, 347 ]
    , [ 271, 1789, 1778 ]
    , [ 1789, 1790, 1778 ]
    , [ 1778, 1790, 1779 ]
    , [ 1790, 1791, 1779 ]
    , [ 1779, 1791, 1780 ]
    , [ 1791, 1792, 1780 ]
    , [ 1780, 1792, 1781 ]
    , [ 1792, 1793, 1781 ]
    , [ 1781, 1793, 1782 ]
    , [ 1793, 1794, 1782 ]
    , [ 1782, 1794, 1783 ]
    , [ 1794, 1795, 1783 ]
    , [ 1783, 1795, 1784 ]
    , [ 1795, 1796, 1784 ]
    , [ 1784, 1796, 1785 ]
    , [ 1796, 1797, 1785 ]
    , [ 1785, 1797, 1786 ]
    , [ 1797, 1798, 1786 ]
    , [ 1786, 1798, 1787 ]
    , [ 1798, 1799, 1787 ]
    , [ 1787, 1799, 1788 ]
    , [ 1799, 1800, 1788 ]
    , [ 1788, 1800, 346 ]
    , [ 1800, 345, 346 ]
    , [ 270, 1801, 1789 ]
    , [ 1801, 1802, 1789 ]
    , [ 1789, 1802, 1790 ]
    , [ 1802, 1803, 1790 ]
    , [ 1790, 1803, 1791 ]
    , [ 1803, 1804, 1791 ]
    , [ 1791, 1804, 1792 ]
    , [ 1804, 1805, 1792 ]
    , [ 1792, 1805, 1793 ]
    , [ 1805, 1806, 1793 ]
    , [ 1793, 1806, 1794 ]
    , [ 1806, 1807, 1794 ]
    , [ 1794, 1807, 1795 ]
    , [ 1807, 1808, 1795 ]
    , [ 1795, 1808, 1796 ]
    , [ 1808, 1809, 1796 ]
    , [ 1796, 1809, 1797 ]
    , [ 1809, 1810, 1797 ]
    , [ 1797, 1810, 1798 ]
    , [ 1810, 1811, 1798 ]
    , [ 1798, 1811, 1799 ]
    , [ 1811, 1812, 1799 ]
    , [ 1799, 1812, 1800 ]
    , [ 1812, 1813, 1800 ]
    , [ 1800, 1813, 345 ]
    , [ 1813, 344, 345 ]
    , [ 269, 1814, 1801 ]
    , [ 1814, 1815, 1801 ]
    , [ 1801, 1815, 1802 ]
    , [ 1815, 1816, 1802 ]
    , [ 1802, 1816, 1803 ]
    , [ 1816, 1817, 1803 ]
    , [ 1803, 1817, 1804 ]
    , [ 1817, 1818, 1804 ]
    , [ 1804, 1818, 1805 ]
    , [ 1818, 1819, 1805 ]
    , [ 1805, 1819, 1806 ]
    , [ 1819, 1820, 1806 ]
    , [ 1806, 1820, 1807 ]
    , [ 1820, 1821, 1807 ]
    , [ 1807, 1821, 1808 ]
    , [ 1821, 1822, 1808 ]
    , [ 1808, 1822, 1809 ]
    , [ 1822, 1823, 1809 ]
    , [ 1809, 1823, 1810 ]
    , [ 1823, 1824, 1810 ]
    , [ 1810, 1824, 1811 ]
    , [ 1824, 1825, 1811 ]
    , [ 1811, 1825, 1812 ]
    , [ 1825, 1826, 1812 ]
    , [ 1812, 1826, 1813 ]
    , [ 1826, 1827, 1813 ]
    , [ 1813, 1827, 344 ]
    , [ 1827, 343, 344 ]
    , [ 268, 237, 1814 ]
    , [ 237, 236, 1814 ]
    , [ 1814, 236, 1815 ]
    , [ 236, 235, 1815 ]
    , [ 1815, 235, 1816 ]
    , [ 235, 234, 1816 ]
    , [ 1816, 234, 1817 ]
    , [ 234, 233, 1817 ]
    , [ 1817, 233, 1818 ]
    , [ 233, 232, 1818 ]
    , [ 1818, 232, 1819 ]
    , [ 232, 231, 1819 ]
    , [ 1819, 231, 1820 ]
    , [ 231, 230, 1820 ]
    , [ 1820, 230, 1821 ]
    , [ 230, 229, 1821 ]
    , [ 1821, 229, 1822 ]
    , [ 229, 228, 1822 ]
    , [ 1822, 228, 1823 ]
    , [ 228, 227, 1823 ]
    , [ 1823, 227, 1824 ]
    , [ 227, 226, 1824 ]
    , [ 1824, 226, 1825 ]
    , [ 226, 225, 1825 ]
    , [ 1825, 225, 1826 ]
    , [ 225, 224, 1826 ]
    , [ 1826, 224, 1827 ]
    , [ 224, 223, 1827 ]
    , [ 1827, 223, 343 ]
    , [ 223, 8, 343 ]
    , [ 312, 372, 10 ]
    , [ 311, 1828, 312 ]
    , [ 310, 1829, 311 ]
    , [ 309, 1831, 310 ]
    , [ 308, 1834, 309 ]
    , [ 307, 1838, 308 ]
    , [ 306, 1843, 307 ]
    , [ 305, 1849, 306 ]
    , [ 304, 1856, 305 ]
    , [ 303, 1864, 304 ]
    , [ 302, 1873, 303 ]
    , [ 301, 1883, 302 ]
    , [ 300, 1894, 301 ]
    , [ 299, 1906, 300 ]
    , [ 298, 1919, 299 ]
    , [ 312, 1828, 372 ]
    , [ 1828, 371, 372 ]
    , [ 311, 1829, 1828 ]
    , [ 1829, 1830, 1828 ]
    , [ 1828, 1830, 371 ]
    , [ 1830, 370, 371 ]
    , [ 310, 1831, 1829 ]
    , [ 1831, 1832, 1829 ]
    , [ 1829, 1832, 1830 ]
    , [ 1832, 1833, 1830 ]
    , [ 1830, 1833, 370 ]
    , [ 1833, 369, 370 ]
    , [ 309, 1834, 1831 ]
    , [ 1834, 1835, 1831 ]
    , [ 1831, 1835, 1832 ]
    , [ 1835, 1836, 1832 ]
    , [ 1832, 1836, 1833 ]
    , [ 1836, 1837, 1833 ]
    , [ 1833, 1837, 369 ]
    , [ 1837, 368, 369 ]
    , [ 308, 1838, 1834 ]
    , [ 1838, 1839, 1834 ]
    , [ 1834, 1839, 1835 ]
    , [ 1839, 1840, 1835 ]
    , [ 1835, 1840, 1836 ]
    , [ 1840, 1841, 1836 ]
    , [ 1836, 1841, 1837 ]
    , [ 1841, 1842, 1837 ]
    , [ 1837, 1842, 368 ]
    , [ 1842, 367, 368 ]
    , [ 307, 1843, 1838 ]
    , [ 1843, 1844, 1838 ]
    , [ 1838, 1844, 1839 ]
    , [ 1844, 1845, 1839 ]
    , [ 1839, 1845, 1840 ]
    , [ 1845, 1846, 1840 ]
    , [ 1840, 1846, 1841 ]
    , [ 1846, 1847, 1841 ]
    , [ 1841, 1847, 1842 ]
    , [ 1847, 1848, 1842 ]
    , [ 1842, 1848, 367 ]
    , [ 1848, 366, 367 ]
    , [ 306, 1849, 1843 ]
    , [ 1849, 1850, 1843 ]
    , [ 1843, 1850, 1844 ]
    , [ 1850, 1851, 1844 ]
    , [ 1844, 1851, 1845 ]
    , [ 1851, 1852, 1845 ]
    , [ 1845, 1852, 1846 ]
    , [ 1852, 1853, 1846 ]
    , [ 1846, 1853, 1847 ]
    , [ 1853, 1854, 1847 ]
    , [ 1847, 1854, 1848 ]
    , [ 1854, 1855, 1848 ]
    , [ 1848, 1855, 366 ]
    , [ 1855, 365, 366 ]
    , [ 305, 1856, 1849 ]
    , [ 1856, 1857, 1849 ]
    , [ 1849, 1857, 1850 ]
    , [ 1857, 1858, 1850 ]
    , [ 1850, 1858, 1851 ]
    , [ 1858, 1859, 1851 ]
    , [ 1851, 1859, 1852 ]
    , [ 1859, 1860, 1852 ]
    , [ 1852, 1860, 1853 ]
    , [ 1860, 1861, 1853 ]
    , [ 1853, 1861, 1854 ]
    , [ 1861, 1862, 1854 ]
    , [ 1854, 1862, 1855 ]
    , [ 1862, 1863, 1855 ]
    , [ 1855, 1863, 365 ]
    , [ 1863, 364, 365 ]
    , [ 304, 1864, 1856 ]
    , [ 1864, 1865, 1856 ]
    , [ 1856, 1865, 1857 ]
    , [ 1865, 1866, 1857 ]
    , [ 1857, 1866, 1858 ]
    , [ 1866, 1867, 1858 ]
    , [ 1858, 1867, 1859 ]
    , [ 1867, 1868, 1859 ]
    , [ 1859, 1868, 1860 ]
    , [ 1868, 1869, 1860 ]
    , [ 1860, 1869, 1861 ]
    , [ 1869, 1870, 1861 ]
    , [ 1861, 1870, 1862 ]
    , [ 1870, 1871, 1862 ]
    , [ 1862, 1871, 1863 ]
    , [ 1871, 1872, 1863 ]
    , [ 1863, 1872, 364 ]
    , [ 1872, 363, 364 ]
    , [ 303, 1873, 1864 ]
    , [ 1873, 1874, 1864 ]
    , [ 1864, 1874, 1865 ]
    , [ 1874, 1875, 1865 ]
    , [ 1865, 1875, 1866 ]
    , [ 1875, 1876, 1866 ]
    , [ 1866, 1876, 1867 ]
    , [ 1876, 1877, 1867 ]
    , [ 1867, 1877, 1868 ]
    , [ 1877, 1878, 1868 ]
    , [ 1868, 1878, 1869 ]
    , [ 1878, 1879, 1869 ]
    , [ 1869, 1879, 1870 ]
    , [ 1879, 1880, 1870 ]
    , [ 1870, 1880, 1871 ]
    , [ 1880, 1881, 1871 ]
    , [ 1871, 1881, 1872 ]
    , [ 1881, 1882, 1872 ]
    , [ 1872, 1882, 363 ]
    , [ 1882, 362, 363 ]
    , [ 302, 1883, 1873 ]
    , [ 1883, 1884, 1873 ]
    , [ 1873, 1884, 1874 ]
    , [ 1884, 1885, 1874 ]
    , [ 1874, 1885, 1875 ]
    , [ 1885, 1886, 1875 ]
    , [ 1875, 1886, 1876 ]
    , [ 1886, 1887, 1876 ]
    , [ 1876, 1887, 1877 ]
    , [ 1887, 1888, 1877 ]
    , [ 1877, 1888, 1878 ]
    , [ 1888, 1889, 1878 ]
    , [ 1878, 1889, 1879 ]
    , [ 1889, 1890, 1879 ]
    , [ 1879, 1890, 1880 ]
    , [ 1890, 1891, 1880 ]
    , [ 1880, 1891, 1881 ]
    , [ 1891, 1892, 1881 ]
    , [ 1881, 1892, 1882 ]
    , [ 1892, 1893, 1882 ]
    , [ 1882, 1893, 362 ]
    , [ 1893, 361, 362 ]
    , [ 301, 1894, 1883 ]
    , [ 1894, 1895, 1883 ]
    , [ 1883, 1895, 1884 ]
    , [ 1895, 1896, 1884 ]
    , [ 1884, 1896, 1885 ]
    , [ 1896, 1897, 1885 ]
    , [ 1885, 1897, 1886 ]
    , [ 1897, 1898, 1886 ]
    , [ 1886, 1898, 1887 ]
    , [ 1898, 1899, 1887 ]
    , [ 1887, 1899, 1888 ]
    , [ 1899, 1900, 1888 ]
    , [ 1888, 1900, 1889 ]
    , [ 1900, 1901, 1889 ]
    , [ 1889, 1901, 1890 ]
    , [ 1901, 1902, 1890 ]
    , [ 1890, 1902, 1891 ]
    , [ 1902, 1903, 1891 ]
    , [ 1891, 1903, 1892 ]
    , [ 1903, 1904, 1892 ]
    , [ 1892, 1904, 1893 ]
    , [ 1904, 1905, 1893 ]
    , [ 1893, 1905, 361 ]
    , [ 1905, 360, 361 ]
    , [ 300, 1906, 1894 ]
    , [ 1906, 1907, 1894 ]
    , [ 1894, 1907, 1895 ]
    , [ 1907, 1908, 1895 ]
    , [ 1895, 1908, 1896 ]
    , [ 1908, 1909, 1896 ]
    , [ 1896, 1909, 1897 ]
    , [ 1909, 1910, 1897 ]
    , [ 1897, 1910, 1898 ]
    , [ 1910, 1911, 1898 ]
    , [ 1898, 1911, 1899 ]
    , [ 1911, 1912, 1899 ]
    , [ 1899, 1912, 1900 ]
    , [ 1912, 1913, 1900 ]
    , [ 1900, 1913, 1901 ]
    , [ 1913, 1914, 1901 ]
    , [ 1901, 1914, 1902 ]
    , [ 1914, 1915, 1902 ]
    , [ 1902, 1915, 1903 ]
    , [ 1915, 1916, 1903 ]
    , [ 1903, 1916, 1904 ]
    , [ 1916, 1917, 1904 ]
    , [ 1904, 1917, 1905 ]
    , [ 1917, 1918, 1905 ]
    , [ 1905, 1918, 360 ]
    , [ 1918, 359, 360 ]
    , [ 299, 1919, 1906 ]
    , [ 1919, 1920, 1906 ]
    , [ 1906, 1920, 1907 ]
    , [ 1920, 1921, 1907 ]
    , [ 1907, 1921, 1908 ]
    , [ 1921, 1922, 1908 ]
    , [ 1908, 1922, 1909 ]
    , [ 1922, 1923, 1909 ]
    , [ 1909, 1923, 1910 ]
    , [ 1923, 1924, 1910 ]
    , [ 1910, 1924, 1911 ]
    , [ 1924, 1925, 1911 ]
    , [ 1911, 1925, 1912 ]
    , [ 1925, 1926, 1912 ]
    , [ 1912, 1926, 1913 ]
    , [ 1926, 1927, 1913 ]
    , [ 1913, 1927, 1914 ]
    , [ 1927, 1928, 1914 ]
    , [ 1914, 1928, 1915 ]
    , [ 1928, 1929, 1915 ]
    , [ 1915, 1929, 1916 ]
    , [ 1929, 1930, 1916 ]
    , [ 1916, 1930, 1917 ]
    , [ 1930, 1931, 1917 ]
    , [ 1917, 1931, 1918 ]
    , [ 1931, 1932, 1918 ]
    , [ 1918, 1932, 359 ]
    , [ 1932, 358, 359 ]
    , [ 298, 267, 1919 ]
    , [ 267, 266, 1919 ]
    , [ 1919, 266, 1920 ]
    , [ 266, 265, 1920 ]
    , [ 1920, 265, 1921 ]
    , [ 265, 264, 1921 ]
    , [ 1921, 264, 1922 ]
    , [ 264, 263, 1922 ]
    , [ 1922, 263, 1923 ]
    , [ 263, 262, 1923 ]
    , [ 1923, 262, 1924 ]
    , [ 262, 261, 1924 ]
    , [ 1924, 261, 1925 ]
    , [ 261, 260, 1925 ]
    , [ 1925, 260, 1926 ]
    , [ 260, 259, 1926 ]
    , [ 1926, 259, 1927 ]
    , [ 259, 258, 1927 ]
    , [ 1927, 258, 1928 ]
    , [ 258, 257, 1928 ]
    , [ 1928, 257, 1929 ]
    , [ 257, 256, 1929 ]
    , [ 1929, 256, 1930 ]
    , [ 256, 255, 1930 ]
    , [ 1930, 255, 1931 ]
    , [ 255, 254, 1931 ]
    , [ 1931, 254, 1932 ]
    , [ 254, 253, 1932 ]
    , [ 1932, 253, 358 ]
    , [ 253, 9, 358 ]
    , [ 192, 387, 11 ]
    , [ 191, 1933, 192 ]
    , [ 190, 1934, 191 ]
    , [ 189, 1936, 190 ]
    , [ 188, 1939, 189 ]
    , [ 187, 1943, 188 ]
    , [ 186, 1948, 187 ]
    , [ 185, 1954, 186 ]
    , [ 184, 1961, 185 ]
    , [ 183, 1969, 184 ]
    , [ 182, 1978, 183 ]
    , [ 181, 1988, 182 ]
    , [ 180, 1999, 181 ]
    , [ 179, 2011, 180 ]
    , [ 178, 2024, 179 ]
    , [ 192, 1933, 387 ]
    , [ 1933, 386, 387 ]
    , [ 191, 1934, 1933 ]
    , [ 1934, 1935, 1933 ]
    , [ 1933, 1935, 386 ]
    , [ 1935, 385, 386 ]
    , [ 190, 1936, 1934 ]
    , [ 1936, 1937, 1934 ]
    , [ 1934, 1937, 1935 ]
    , [ 1937, 1938, 1935 ]
    , [ 1935, 1938, 385 ]
    , [ 1938, 384, 385 ]
    , [ 189, 1939, 1936 ]
    , [ 1939, 1940, 1936 ]
    , [ 1936, 1940, 1937 ]
    , [ 1940, 1941, 1937 ]
    , [ 1937, 1941, 1938 ]
    , [ 1941, 1942, 1938 ]
    , [ 1938, 1942, 384 ]
    , [ 1942, 383, 384 ]
    , [ 188, 1943, 1939 ]
    , [ 1943, 1944, 1939 ]
    , [ 1939, 1944, 1940 ]
    , [ 1944, 1945, 1940 ]
    , [ 1940, 1945, 1941 ]
    , [ 1945, 1946, 1941 ]
    , [ 1941, 1946, 1942 ]
    , [ 1946, 1947, 1942 ]
    , [ 1942, 1947, 383 ]
    , [ 1947, 382, 383 ]
    , [ 187, 1948, 1943 ]
    , [ 1948, 1949, 1943 ]
    , [ 1943, 1949, 1944 ]
    , [ 1949, 1950, 1944 ]
    , [ 1944, 1950, 1945 ]
    , [ 1950, 1951, 1945 ]
    , [ 1945, 1951, 1946 ]
    , [ 1951, 1952, 1946 ]
    , [ 1946, 1952, 1947 ]
    , [ 1952, 1953, 1947 ]
    , [ 1947, 1953, 382 ]
    , [ 1953, 381, 382 ]
    , [ 186, 1954, 1948 ]
    , [ 1954, 1955, 1948 ]
    , [ 1948, 1955, 1949 ]
    , [ 1955, 1956, 1949 ]
    , [ 1949, 1956, 1950 ]
    , [ 1956, 1957, 1950 ]
    , [ 1950, 1957, 1951 ]
    , [ 1957, 1958, 1951 ]
    , [ 1951, 1958, 1952 ]
    , [ 1958, 1959, 1952 ]
    , [ 1952, 1959, 1953 ]
    , [ 1959, 1960, 1953 ]
    , [ 1953, 1960, 381 ]
    , [ 1960, 380, 381 ]
    , [ 185, 1961, 1954 ]
    , [ 1961, 1962, 1954 ]
    , [ 1954, 1962, 1955 ]
    , [ 1962, 1963, 1955 ]
    , [ 1955, 1963, 1956 ]
    , [ 1963, 1964, 1956 ]
    , [ 1956, 1964, 1957 ]
    , [ 1964, 1965, 1957 ]
    , [ 1957, 1965, 1958 ]
    , [ 1965, 1966, 1958 ]
    , [ 1958, 1966, 1959 ]
    , [ 1966, 1967, 1959 ]
    , [ 1959, 1967, 1960 ]
    , [ 1967, 1968, 1960 ]
    , [ 1960, 1968, 380 ]
    , [ 1968, 379, 380 ]
    , [ 184, 1969, 1961 ]
    , [ 1969, 1970, 1961 ]
    , [ 1961, 1970, 1962 ]
    , [ 1970, 1971, 1962 ]
    , [ 1962, 1971, 1963 ]
    , [ 1971, 1972, 1963 ]
    , [ 1963, 1972, 1964 ]
    , [ 1972, 1973, 1964 ]
    , [ 1964, 1973, 1965 ]
    , [ 1973, 1974, 1965 ]
    , [ 1965, 1974, 1966 ]
    , [ 1974, 1975, 1966 ]
    , [ 1966, 1975, 1967 ]
    , [ 1975, 1976, 1967 ]
    , [ 1967, 1976, 1968 ]
    , [ 1976, 1977, 1968 ]
    , [ 1968, 1977, 379 ]
    , [ 1977, 378, 379 ]
    , [ 183, 1978, 1969 ]
    , [ 1978, 1979, 1969 ]
    , [ 1969, 1979, 1970 ]
    , [ 1979, 1980, 1970 ]
    , [ 1970, 1980, 1971 ]
    , [ 1980, 1981, 1971 ]
    , [ 1971, 1981, 1972 ]
    , [ 1981, 1982, 1972 ]
    , [ 1972, 1982, 1973 ]
    , [ 1982, 1983, 1973 ]
    , [ 1973, 1983, 1974 ]
    , [ 1983, 1984, 1974 ]
    , [ 1974, 1984, 1975 ]
    , [ 1984, 1985, 1975 ]
    , [ 1975, 1985, 1976 ]
    , [ 1985, 1986, 1976 ]
    , [ 1976, 1986, 1977 ]
    , [ 1986, 1987, 1977 ]
    , [ 1977, 1987, 378 ]
    , [ 1987, 377, 378 ]
    , [ 182, 1988, 1978 ]
    , [ 1988, 1989, 1978 ]
    , [ 1978, 1989, 1979 ]
    , [ 1989, 1990, 1979 ]
    , [ 1979, 1990, 1980 ]
    , [ 1990, 1991, 1980 ]
    , [ 1980, 1991, 1981 ]
    , [ 1991, 1992, 1981 ]
    , [ 1981, 1992, 1982 ]
    , [ 1992, 1993, 1982 ]
    , [ 1982, 1993, 1983 ]
    , [ 1993, 1994, 1983 ]
    , [ 1983, 1994, 1984 ]
    , [ 1994, 1995, 1984 ]
    , [ 1984, 1995, 1985 ]
    , [ 1995, 1996, 1985 ]
    , [ 1985, 1996, 1986 ]
    , [ 1996, 1997, 1986 ]
    , [ 1986, 1997, 1987 ]
    , [ 1997, 1998, 1987 ]
    , [ 1987, 1998, 377 ]
    , [ 1998, 376, 377 ]
    , [ 181, 1999, 1988 ]
    , [ 1999, 2000, 1988 ]
    , [ 1988, 2000, 1989 ]
    , [ 2000, 2001, 1989 ]
    , [ 1989, 2001, 1990 ]
    , [ 2001, 2002, 1990 ]
    , [ 1990, 2002, 1991 ]
    , [ 2002, 2003, 1991 ]
    , [ 1991, 2003, 1992 ]
    , [ 2003, 2004, 1992 ]
    , [ 1992, 2004, 1993 ]
    , [ 2004, 2005, 1993 ]
    , [ 1993, 2005, 1994 ]
    , [ 2005, 2006, 1994 ]
    , [ 1994, 2006, 1995 ]
    , [ 2006, 2007, 1995 ]
    , [ 1995, 2007, 1996 ]
    , [ 2007, 2008, 1996 ]
    , [ 1996, 2008, 1997 ]
    , [ 2008, 2009, 1997 ]
    , [ 1997, 2009, 1998 ]
    , [ 2009, 2010, 1998 ]
    , [ 1998, 2010, 376 ]
    , [ 2010, 375, 376 ]
    , [ 180, 2011, 1999 ]
    , [ 2011, 2012, 1999 ]
    , [ 1999, 2012, 2000 ]
    , [ 2012, 2013, 2000 ]
    , [ 2000, 2013, 2001 ]
    , [ 2013, 2014, 2001 ]
    , [ 2001, 2014, 2002 ]
    , [ 2014, 2015, 2002 ]
    , [ 2002, 2015, 2003 ]
    , [ 2015, 2016, 2003 ]
    , [ 2003, 2016, 2004 ]
    , [ 2016, 2017, 2004 ]
    , [ 2004, 2017, 2005 ]
    , [ 2017, 2018, 2005 ]
    , [ 2005, 2018, 2006 ]
    , [ 2018, 2019, 2006 ]
    , [ 2006, 2019, 2007 ]
    , [ 2019, 2020, 2007 ]
    , [ 2007, 2020, 2008 ]
    , [ 2020, 2021, 2008 ]
    , [ 2008, 2021, 2009 ]
    , [ 2021, 2022, 2009 ]
    , [ 2009, 2022, 2010 ]
    , [ 2022, 2023, 2010 ]
    , [ 2010, 2023, 375 ]
    , [ 2023, 374, 375 ]
    , [ 179, 2024, 2011 ]
    , [ 2024, 2025, 2011 ]
    , [ 2011, 2025, 2012 ]
    , [ 2025, 2026, 2012 ]
    , [ 2012, 2026, 2013 ]
    , [ 2026, 2027, 2013 ]
    , [ 2013, 2027, 2014 ]
    , [ 2027, 2028, 2014 ]
    , [ 2014, 2028, 2015 ]
    , [ 2028, 2029, 2015 ]
    , [ 2015, 2029, 2016 ]
    , [ 2029, 2030, 2016 ]
    , [ 2016, 2030, 2017 ]
    , [ 2030, 2031, 2017 ]
    , [ 2017, 2031, 2018 ]
    , [ 2031, 2032, 2018 ]
    , [ 2018, 2032, 2019 ]
    , [ 2032, 2033, 2019 ]
    , [ 2019, 2033, 2020 ]
    , [ 2033, 2034, 2020 ]
    , [ 2020, 2034, 2021 ]
    , [ 2034, 2035, 2021 ]
    , [ 2021, 2035, 2022 ]
    , [ 2035, 2036, 2022 ]
    , [ 2022, 2036, 2023 ]
    , [ 2036, 2037, 2023 ]
    , [ 2023, 2037, 374 ]
    , [ 2037, 373, 374 ]
    , [ 178, 297, 2024 ]
    , [ 297, 296, 2024 ]
    , [ 2024, 296, 2025 ]
    , [ 296, 295, 2025 ]
    , [ 2025, 295, 2026 ]
    , [ 295, 294, 2026 ]
    , [ 2026, 294, 2027 ]
    , [ 294, 293, 2027 ]
    , [ 2027, 293, 2028 ]
    , [ 293, 292, 2028 ]
    , [ 2028, 292, 2029 ]
    , [ 292, 291, 2029 ]
    , [ 2029, 291, 2030 ]
    , [ 291, 290, 2030 ]
    , [ 2030, 290, 2031 ]
    , [ 290, 289, 2031 ]
    , [ 2031, 289, 2032 ]
    , [ 289, 288, 2032 ]
    , [ 2032, 288, 2033 ]
    , [ 288, 287, 2033 ]
    , [ 2033, 287, 2034 ]
    , [ 287, 286, 2034 ]
    , [ 2034, 286, 2035 ]
    , [ 286, 285, 2035 ]
    , [ 2035, 285, 2036 ]
    , [ 285, 284, 2036 ]
    , [ 2036, 284, 2037 ]
    , [ 284, 283, 2037 ]
    , [ 2037, 283, 373 ]
    , [ 283, 10, 373 ]
    , [ 388, 417, 12 ]
    , [ 389, 2038, 388 ]
    , [ 390, 2039, 389 ]
    , [ 391, 2041, 390 ]
    , [ 392, 2044, 391 ]
    , [ 393, 2048, 392 ]
    , [ 394, 2053, 393 ]
    , [ 395, 2059, 394 ]
    , [ 396, 2066, 395 ]
    , [ 397, 2074, 396 ]
    , [ 398, 2083, 397 ]
    , [ 399, 2093, 398 ]
    , [ 400, 2104, 399 ]
    , [ 401, 2116, 400 ]
    , [ 402, 2129, 401 ]
    , [ 388, 2038, 417 ]
    , [ 2038, 416, 417 ]
    , [ 389, 2039, 2038 ]
    , [ 2039, 2040, 2038 ]
    , [ 2038, 2040, 416 ]
    , [ 2040, 415, 416 ]
    , [ 390, 2041, 2039 ]
    , [ 2041, 2042, 2039 ]
    , [ 2039, 2042, 2040 ]
    , [ 2042, 2043, 2040 ]
    , [ 2040, 2043, 415 ]
    , [ 2043, 414, 415 ]
    , [ 391, 2044, 2041 ]
    , [ 2044, 2045, 2041 ]
    , [ 2041, 2045, 2042 ]
    , [ 2045, 2046, 2042 ]
    , [ 2042, 2046, 2043 ]
    , [ 2046, 2047, 2043 ]
    , [ 2043, 2047, 414 ]
    , [ 2047, 413, 414 ]
    , [ 392, 2048, 2044 ]
    , [ 2048, 2049, 2044 ]
    , [ 2044, 2049, 2045 ]
    , [ 2049, 2050, 2045 ]
    , [ 2045, 2050, 2046 ]
    , [ 2050, 2051, 2046 ]
    , [ 2046, 2051, 2047 ]
    , [ 2051, 2052, 2047 ]
    , [ 2047, 2052, 413 ]
    , [ 2052, 412, 413 ]
    , [ 393, 2053, 2048 ]
    , [ 2053, 2054, 2048 ]
    , [ 2048, 2054, 2049 ]
    , [ 2054, 2055, 2049 ]
    , [ 2049, 2055, 2050 ]
    , [ 2055, 2056, 2050 ]
    , [ 2050, 2056, 2051 ]
    , [ 2056, 2057, 2051 ]
    , [ 2051, 2057, 2052 ]
    , [ 2057, 2058, 2052 ]
    , [ 2052, 2058, 412 ]
    , [ 2058, 411, 412 ]
    , [ 394, 2059, 2053 ]
    , [ 2059, 2060, 2053 ]
    , [ 2053, 2060, 2054 ]
    , [ 2060, 2061, 2054 ]
    , [ 2054, 2061, 2055 ]
    , [ 2061, 2062, 2055 ]
    , [ 2055, 2062, 2056 ]
    , [ 2062, 2063, 2056 ]
    , [ 2056, 2063, 2057 ]
    , [ 2063, 2064, 2057 ]
    , [ 2057, 2064, 2058 ]
    , [ 2064, 2065, 2058 ]
    , [ 2058, 2065, 411 ]
    , [ 2065, 410, 411 ]
    , [ 395, 2066, 2059 ]
    , [ 2066, 2067, 2059 ]
    , [ 2059, 2067, 2060 ]
    , [ 2067, 2068, 2060 ]
    , [ 2060, 2068, 2061 ]
    , [ 2068, 2069, 2061 ]
    , [ 2061, 2069, 2062 ]
    , [ 2069, 2070, 2062 ]
    , [ 2062, 2070, 2063 ]
    , [ 2070, 2071, 2063 ]
    , [ 2063, 2071, 2064 ]
    , [ 2071, 2072, 2064 ]
    , [ 2064, 2072, 2065 ]
    , [ 2072, 2073, 2065 ]
    , [ 2065, 2073, 410 ]
    , [ 2073, 409, 410 ]
    , [ 396, 2074, 2066 ]
    , [ 2074, 2075, 2066 ]
    , [ 2066, 2075, 2067 ]
    , [ 2075, 2076, 2067 ]
    , [ 2067, 2076, 2068 ]
    , [ 2076, 2077, 2068 ]
    , [ 2068, 2077, 2069 ]
    , [ 2077, 2078, 2069 ]
    , [ 2069, 2078, 2070 ]
    , [ 2078, 2079, 2070 ]
    , [ 2070, 2079, 2071 ]
    , [ 2079, 2080, 2071 ]
    , [ 2071, 2080, 2072 ]
    , [ 2080, 2081, 2072 ]
    , [ 2072, 2081, 2073 ]
    , [ 2081, 2082, 2073 ]
    , [ 2073, 2082, 409 ]
    , [ 2082, 408, 409 ]
    , [ 397, 2083, 2074 ]
    , [ 2083, 2084, 2074 ]
    , [ 2074, 2084, 2075 ]
    , [ 2084, 2085, 2075 ]
    , [ 2075, 2085, 2076 ]
    , [ 2085, 2086, 2076 ]
    , [ 2076, 2086, 2077 ]
    , [ 2086, 2087, 2077 ]
    , [ 2077, 2087, 2078 ]
    , [ 2087, 2088, 2078 ]
    , [ 2078, 2088, 2079 ]
    , [ 2088, 2089, 2079 ]
    , [ 2079, 2089, 2080 ]
    , [ 2089, 2090, 2080 ]
    , [ 2080, 2090, 2081 ]
    , [ 2090, 2091, 2081 ]
    , [ 2081, 2091, 2082 ]
    , [ 2091, 2092, 2082 ]
    , [ 2082, 2092, 408 ]
    , [ 2092, 407, 408 ]
    , [ 398, 2093, 2083 ]
    , [ 2093, 2094, 2083 ]
    , [ 2083, 2094, 2084 ]
    , [ 2094, 2095, 2084 ]
    , [ 2084, 2095, 2085 ]
    , [ 2095, 2096, 2085 ]
    , [ 2085, 2096, 2086 ]
    , [ 2096, 2097, 2086 ]
    , [ 2086, 2097, 2087 ]
    , [ 2097, 2098, 2087 ]
    , [ 2087, 2098, 2088 ]
    , [ 2098, 2099, 2088 ]
    , [ 2088, 2099, 2089 ]
    , [ 2099, 2100, 2089 ]
    , [ 2089, 2100, 2090 ]
    , [ 2100, 2101, 2090 ]
    , [ 2090, 2101, 2091 ]
    , [ 2101, 2102, 2091 ]
    , [ 2091, 2102, 2092 ]
    , [ 2102, 2103, 2092 ]
    , [ 2092, 2103, 407 ]
    , [ 2103, 406, 407 ]
    , [ 399, 2104, 2093 ]
    , [ 2104, 2105, 2093 ]
    , [ 2093, 2105, 2094 ]
    , [ 2105, 2106, 2094 ]
    , [ 2094, 2106, 2095 ]
    , [ 2106, 2107, 2095 ]
    , [ 2095, 2107, 2096 ]
    , [ 2107, 2108, 2096 ]
    , [ 2096, 2108, 2097 ]
    , [ 2108, 2109, 2097 ]
    , [ 2097, 2109, 2098 ]
    , [ 2109, 2110, 2098 ]
    , [ 2098, 2110, 2099 ]
    , [ 2110, 2111, 2099 ]
    , [ 2099, 2111, 2100 ]
    , [ 2111, 2112, 2100 ]
    , [ 2100, 2112, 2101 ]
    , [ 2112, 2113, 2101 ]
    , [ 2101, 2113, 2102 ]
    , [ 2113, 2114, 2102 ]
    , [ 2102, 2114, 2103 ]
    , [ 2114, 2115, 2103 ]
    , [ 2103, 2115, 406 ]
    , [ 2115, 405, 406 ]
    , [ 400, 2116, 2104 ]
    , [ 2116, 2117, 2104 ]
    , [ 2104, 2117, 2105 ]
    , [ 2117, 2118, 2105 ]
    , [ 2105, 2118, 2106 ]
    , [ 2118, 2119, 2106 ]
    , [ 2106, 2119, 2107 ]
    , [ 2119, 2120, 2107 ]
    , [ 2107, 2120, 2108 ]
    , [ 2120, 2121, 2108 ]
    , [ 2108, 2121, 2109 ]
    , [ 2121, 2122, 2109 ]
    , [ 2109, 2122, 2110 ]
    , [ 2122, 2123, 2110 ]
    , [ 2110, 2123, 2111 ]
    , [ 2123, 2124, 2111 ]
    , [ 2111, 2124, 2112 ]
    , [ 2124, 2125, 2112 ]
    , [ 2112, 2125, 2113 ]
    , [ 2125, 2126, 2113 ]
    , [ 2113, 2126, 2114 ]
    , [ 2126, 2127, 2114 ]
    , [ 2114, 2127, 2115 ]
    , [ 2127, 2128, 2115 ]
    , [ 2115, 2128, 405 ]
    , [ 2128, 404, 405 ]
    , [ 401, 2129, 2116 ]
    , [ 2129, 2130, 2116 ]
    , [ 2116, 2130, 2117 ]
    , [ 2130, 2131, 2117 ]
    , [ 2117, 2131, 2118 ]
    , [ 2131, 2132, 2118 ]
    , [ 2118, 2132, 2119 ]
    , [ 2132, 2133, 2119 ]
    , [ 2119, 2133, 2120 ]
    , [ 2133, 2134, 2120 ]
    , [ 2120, 2134, 2121 ]
    , [ 2134, 2135, 2121 ]
    , [ 2121, 2135, 2122 ]
    , [ 2135, 2136, 2122 ]
    , [ 2122, 2136, 2123 ]
    , [ 2136, 2137, 2123 ]
    , [ 2123, 2137, 2124 ]
    , [ 2137, 2138, 2124 ]
    , [ 2124, 2138, 2125 ]
    , [ 2138, 2139, 2125 ]
    , [ 2125, 2139, 2126 ]
    , [ 2139, 2140, 2126 ]
    , [ 2126, 2140, 2127 ]
    , [ 2140, 2141, 2127 ]
    , [ 2127, 2141, 2128 ]
    , [ 2141, 2142, 2128 ]
    , [ 2128, 2142, 404 ]
    , [ 2142, 403, 404 ]
    , [ 402, 327, 2129 ]
    , [ 327, 326, 2129 ]
    , [ 2129, 326, 2130 ]
    , [ 326, 325, 2130 ]
    , [ 2130, 325, 2131 ]
    , [ 325, 324, 2131 ]
    , [ 2131, 324, 2132 ]
    , [ 324, 323, 2132 ]
    , [ 2132, 323, 2133 ]
    , [ 323, 322, 2133 ]
    , [ 2133, 322, 2134 ]
    , [ 322, 321, 2134 ]
    , [ 2134, 321, 2135 ]
    , [ 321, 320, 2135 ]
    , [ 2135, 320, 2136 ]
    , [ 320, 319, 2136 ]
    , [ 2136, 319, 2137 ]
    , [ 319, 318, 2137 ]
    , [ 2137, 318, 2138 ]
    , [ 318, 317, 2138 ]
    , [ 2138, 317, 2139 ]
    , [ 317, 316, 2139 ]
    , [ 2139, 316, 2140 ]
    , [ 316, 315, 2140 ]
    , [ 2140, 315, 2141 ]
    , [ 315, 314, 2141 ]
    , [ 2141, 314, 2142 ]
    , [ 314, 313, 2142 ]
    , [ 2142, 313, 403 ]
    , [ 313, 11, 403 ]
    , [ 418, 388, 12 ]
    , [ 419, 2143, 418 ]
    , [ 420, 2144, 419 ]
    , [ 421, 2146, 420 ]
    , [ 422, 2149, 421 ]
    , [ 423, 2153, 422 ]
    , [ 424, 2158, 423 ]
    , [ 425, 2164, 424 ]
    , [ 426, 2171, 425 ]
    , [ 427, 2179, 426 ]
    , [ 428, 2188, 427 ]
    , [ 429, 2198, 428 ]
    , [ 430, 2209, 429 ]
    , [ 431, 2221, 430 ]
    , [ 432, 2234, 431 ]
    , [ 418, 2143, 388 ]
    , [ 2143, 389, 388 ]
    , [ 419, 2144, 2143 ]
    , [ 2144, 2145, 2143 ]
    , [ 2143, 2145, 389 ]
    , [ 2145, 390, 389 ]
    , [ 420, 2146, 2144 ]
    , [ 2146, 2147, 2144 ]
    , [ 2144, 2147, 2145 ]
    , [ 2147, 2148, 2145 ]
    , [ 2145, 2148, 390 ]
    , [ 2148, 391, 390 ]
    , [ 421, 2149, 2146 ]
    , [ 2149, 2150, 2146 ]
    , [ 2146, 2150, 2147 ]
    , [ 2150, 2151, 2147 ]
    , [ 2147, 2151, 2148 ]
    , [ 2151, 2152, 2148 ]
    , [ 2148, 2152, 391 ]
    , [ 2152, 392, 391 ]
    , [ 422, 2153, 2149 ]
    , [ 2153, 2154, 2149 ]
    , [ 2149, 2154, 2150 ]
    , [ 2154, 2155, 2150 ]
    , [ 2150, 2155, 2151 ]
    , [ 2155, 2156, 2151 ]
    , [ 2151, 2156, 2152 ]
    , [ 2156, 2157, 2152 ]
    , [ 2152, 2157, 392 ]
    , [ 2157, 393, 392 ]
    , [ 423, 2158, 2153 ]
    , [ 2158, 2159, 2153 ]
    , [ 2153, 2159, 2154 ]
    , [ 2159, 2160, 2154 ]
    , [ 2154, 2160, 2155 ]
    , [ 2160, 2161, 2155 ]
    , [ 2155, 2161, 2156 ]
    , [ 2161, 2162, 2156 ]
    , [ 2156, 2162, 2157 ]
    , [ 2162, 2163, 2157 ]
    , [ 2157, 2163, 393 ]
    , [ 2163, 394, 393 ]
    , [ 424, 2164, 2158 ]
    , [ 2164, 2165, 2158 ]
    , [ 2158, 2165, 2159 ]
    , [ 2165, 2166, 2159 ]
    , [ 2159, 2166, 2160 ]
    , [ 2166, 2167, 2160 ]
    , [ 2160, 2167, 2161 ]
    , [ 2167, 2168, 2161 ]
    , [ 2161, 2168, 2162 ]
    , [ 2168, 2169, 2162 ]
    , [ 2162, 2169, 2163 ]
    , [ 2169, 2170, 2163 ]
    , [ 2163, 2170, 394 ]
    , [ 2170, 395, 394 ]
    , [ 425, 2171, 2164 ]
    , [ 2171, 2172, 2164 ]
    , [ 2164, 2172, 2165 ]
    , [ 2172, 2173, 2165 ]
    , [ 2165, 2173, 2166 ]
    , [ 2173, 2174, 2166 ]
    , [ 2166, 2174, 2167 ]
    , [ 2174, 2175, 2167 ]
    , [ 2167, 2175, 2168 ]
    , [ 2175, 2176, 2168 ]
    , [ 2168, 2176, 2169 ]
    , [ 2176, 2177, 2169 ]
    , [ 2169, 2177, 2170 ]
    , [ 2177, 2178, 2170 ]
    , [ 2170, 2178, 395 ]
    , [ 2178, 396, 395 ]
    , [ 426, 2179, 2171 ]
    , [ 2179, 2180, 2171 ]
    , [ 2171, 2180, 2172 ]
    , [ 2180, 2181, 2172 ]
    , [ 2172, 2181, 2173 ]
    , [ 2181, 2182, 2173 ]
    , [ 2173, 2182, 2174 ]
    , [ 2182, 2183, 2174 ]
    , [ 2174, 2183, 2175 ]
    , [ 2183, 2184, 2175 ]
    , [ 2175, 2184, 2176 ]
    , [ 2184, 2185, 2176 ]
    , [ 2176, 2185, 2177 ]
    , [ 2185, 2186, 2177 ]
    , [ 2177, 2186, 2178 ]
    , [ 2186, 2187, 2178 ]
    , [ 2178, 2187, 396 ]
    , [ 2187, 397, 396 ]
    , [ 427, 2188, 2179 ]
    , [ 2188, 2189, 2179 ]
    , [ 2179, 2189, 2180 ]
    , [ 2189, 2190, 2180 ]
    , [ 2180, 2190, 2181 ]
    , [ 2190, 2191, 2181 ]
    , [ 2181, 2191, 2182 ]
    , [ 2191, 2192, 2182 ]
    , [ 2182, 2192, 2183 ]
    , [ 2192, 2193, 2183 ]
    , [ 2183, 2193, 2184 ]
    , [ 2193, 2194, 2184 ]
    , [ 2184, 2194, 2185 ]
    , [ 2194, 2195, 2185 ]
    , [ 2185, 2195, 2186 ]
    , [ 2195, 2196, 2186 ]
    , [ 2186, 2196, 2187 ]
    , [ 2196, 2197, 2187 ]
    , [ 2187, 2197, 397 ]
    , [ 2197, 398, 397 ]
    , [ 428, 2198, 2188 ]
    , [ 2198, 2199, 2188 ]
    , [ 2188, 2199, 2189 ]
    , [ 2199, 2200, 2189 ]
    , [ 2189, 2200, 2190 ]
    , [ 2200, 2201, 2190 ]
    , [ 2190, 2201, 2191 ]
    , [ 2201, 2202, 2191 ]
    , [ 2191, 2202, 2192 ]
    , [ 2202, 2203, 2192 ]
    , [ 2192, 2203, 2193 ]
    , [ 2203, 2204, 2193 ]
    , [ 2193, 2204, 2194 ]
    , [ 2204, 2205, 2194 ]
    , [ 2194, 2205, 2195 ]
    , [ 2205, 2206, 2195 ]
    , [ 2195, 2206, 2196 ]
    , [ 2206, 2207, 2196 ]
    , [ 2196, 2207, 2197 ]
    , [ 2207, 2208, 2197 ]
    , [ 2197, 2208, 398 ]
    , [ 2208, 399, 398 ]
    , [ 429, 2209, 2198 ]
    , [ 2209, 2210, 2198 ]
    , [ 2198, 2210, 2199 ]
    , [ 2210, 2211, 2199 ]
    , [ 2199, 2211, 2200 ]
    , [ 2211, 2212, 2200 ]
    , [ 2200, 2212, 2201 ]
    , [ 2212, 2213, 2201 ]
    , [ 2201, 2213, 2202 ]
    , [ 2213, 2214, 2202 ]
    , [ 2202, 2214, 2203 ]
    , [ 2214, 2215, 2203 ]
    , [ 2203, 2215, 2204 ]
    , [ 2215, 2216, 2204 ]
    , [ 2204, 2216, 2205 ]
    , [ 2216, 2217, 2205 ]
    , [ 2205, 2217, 2206 ]
    , [ 2217, 2218, 2206 ]
    , [ 2206, 2218, 2207 ]
    , [ 2218, 2219, 2207 ]
    , [ 2207, 2219, 2208 ]
    , [ 2219, 2220, 2208 ]
    , [ 2208, 2220, 399 ]
    , [ 2220, 400, 399 ]
    , [ 430, 2221, 2209 ]
    , [ 2221, 2222, 2209 ]
    , [ 2209, 2222, 2210 ]
    , [ 2222, 2223, 2210 ]
    , [ 2210, 2223, 2211 ]
    , [ 2223, 2224, 2211 ]
    , [ 2211, 2224, 2212 ]
    , [ 2224, 2225, 2212 ]
    , [ 2212, 2225, 2213 ]
    , [ 2225, 2226, 2213 ]
    , [ 2213, 2226, 2214 ]
    , [ 2226, 2227, 2214 ]
    , [ 2214, 2227, 2215 ]
    , [ 2227, 2228, 2215 ]
    , [ 2215, 2228, 2216 ]
    , [ 2228, 2229, 2216 ]
    , [ 2216, 2229, 2217 ]
    , [ 2229, 2230, 2217 ]
    , [ 2217, 2230, 2218 ]
    , [ 2230, 2231, 2218 ]
    , [ 2218, 2231, 2219 ]
    , [ 2231, 2232, 2219 ]
    , [ 2219, 2232, 2220 ]
    , [ 2232, 2233, 2220 ]
    , [ 2220, 2233, 400 ]
    , [ 2233, 401, 400 ]
    , [ 431, 2234, 2221 ]
    , [ 2234, 2235, 2221 ]
    , [ 2221, 2235, 2222 ]
    , [ 2235, 2236, 2222 ]
    , [ 2222, 2236, 2223 ]
    , [ 2236, 2237, 2223 ]
    , [ 2223, 2237, 2224 ]
    , [ 2237, 2238, 2224 ]
    , [ 2224, 2238, 2225 ]
    , [ 2238, 2239, 2225 ]
    , [ 2225, 2239, 2226 ]
    , [ 2239, 2240, 2226 ]
    , [ 2226, 2240, 2227 ]
    , [ 2240, 2241, 2227 ]
    , [ 2227, 2241, 2228 ]
    , [ 2241, 2242, 2228 ]
    , [ 2228, 2242, 2229 ]
    , [ 2242, 2243, 2229 ]
    , [ 2229, 2243, 2230 ]
    , [ 2243, 2244, 2230 ]
    , [ 2230, 2244, 2231 ]
    , [ 2244, 2245, 2231 ]
    , [ 2231, 2245, 2232 ]
    , [ 2245, 2246, 2232 ]
    , [ 2232, 2246, 2233 ]
    , [ 2246, 2247, 2233 ]
    , [ 2233, 2247, 401 ]
    , [ 2247, 402, 401 ]
    , [ 432, 342, 2234 ]
    , [ 342, 341, 2234 ]
    , [ 2234, 341, 2235 ]
    , [ 341, 340, 2235 ]
    , [ 2235, 340, 2236 ]
    , [ 340, 339, 2236 ]
    , [ 2236, 339, 2237 ]
    , [ 339, 338, 2237 ]
    , [ 2237, 338, 2238 ]
    , [ 338, 337, 2238 ]
    , [ 2238, 337, 2239 ]
    , [ 337, 336, 2239 ]
    , [ 2239, 336, 2240 ]
    , [ 336, 335, 2240 ]
    , [ 2240, 335, 2241 ]
    , [ 335, 334, 2241 ]
    , [ 2241, 334, 2242 ]
    , [ 334, 333, 2242 ]
    , [ 2242, 333, 2243 ]
    , [ 333, 332, 2243 ]
    , [ 2243, 332, 2244 ]
    , [ 332, 331, 2244 ]
    , [ 2244, 331, 2245 ]
    , [ 331, 330, 2245 ]
    , [ 2245, 330, 2246 ]
    , [ 330, 329, 2246 ]
    , [ 2246, 329, 2247 ]
    , [ 329, 328, 2247 ]
    , [ 2247, 328, 402 ]
    , [ 328, 7, 402 ]
    , [ 433, 418, 12 ]
    , [ 434, 2248, 433 ]
    , [ 435, 2249, 434 ]
    , [ 436, 2251, 435 ]
    , [ 437, 2254, 436 ]
    , [ 438, 2258, 437 ]
    , [ 439, 2263, 438 ]
    , [ 440, 2269, 439 ]
    , [ 441, 2276, 440 ]
    , [ 442, 2284, 441 ]
    , [ 443, 2293, 442 ]
    , [ 444, 2303, 443 ]
    , [ 445, 2314, 444 ]
    , [ 446, 2326, 445 ]
    , [ 447, 2339, 446 ]
    , [ 433, 2248, 418 ]
    , [ 2248, 419, 418 ]
    , [ 434, 2249, 2248 ]
    , [ 2249, 2250, 2248 ]
    , [ 2248, 2250, 419 ]
    , [ 2250, 420, 419 ]
    , [ 435, 2251, 2249 ]
    , [ 2251, 2252, 2249 ]
    , [ 2249, 2252, 2250 ]
    , [ 2252, 2253, 2250 ]
    , [ 2250, 2253, 420 ]
    , [ 2253, 421, 420 ]
    , [ 436, 2254, 2251 ]
    , [ 2254, 2255, 2251 ]
    , [ 2251, 2255, 2252 ]
    , [ 2255, 2256, 2252 ]
    , [ 2252, 2256, 2253 ]
    , [ 2256, 2257, 2253 ]
    , [ 2253, 2257, 421 ]
    , [ 2257, 422, 421 ]
    , [ 437, 2258, 2254 ]
    , [ 2258, 2259, 2254 ]
    , [ 2254, 2259, 2255 ]
    , [ 2259, 2260, 2255 ]
    , [ 2255, 2260, 2256 ]
    , [ 2260, 2261, 2256 ]
    , [ 2256, 2261, 2257 ]
    , [ 2261, 2262, 2257 ]
    , [ 2257, 2262, 422 ]
    , [ 2262, 423, 422 ]
    , [ 438, 2263, 2258 ]
    , [ 2263, 2264, 2258 ]
    , [ 2258, 2264, 2259 ]
    , [ 2264, 2265, 2259 ]
    , [ 2259, 2265, 2260 ]
    , [ 2265, 2266, 2260 ]
    , [ 2260, 2266, 2261 ]
    , [ 2266, 2267, 2261 ]
    , [ 2261, 2267, 2262 ]
    , [ 2267, 2268, 2262 ]
    , [ 2262, 2268, 423 ]
    , [ 2268, 424, 423 ]
    , [ 439, 2269, 2263 ]
    , [ 2269, 2270, 2263 ]
    , [ 2263, 2270, 2264 ]
    , [ 2270, 2271, 2264 ]
    , [ 2264, 2271, 2265 ]
    , [ 2271, 2272, 2265 ]
    , [ 2265, 2272, 2266 ]
    , [ 2272, 2273, 2266 ]
    , [ 2266, 2273, 2267 ]
    , [ 2273, 2274, 2267 ]
    , [ 2267, 2274, 2268 ]
    , [ 2274, 2275, 2268 ]
    , [ 2268, 2275, 424 ]
    , [ 2275, 425, 424 ]
    , [ 440, 2276, 2269 ]
    , [ 2276, 2277, 2269 ]
    , [ 2269, 2277, 2270 ]
    , [ 2277, 2278, 2270 ]
    , [ 2270, 2278, 2271 ]
    , [ 2278, 2279, 2271 ]
    , [ 2271, 2279, 2272 ]
    , [ 2279, 2280, 2272 ]
    , [ 2272, 2280, 2273 ]
    , [ 2280, 2281, 2273 ]
    , [ 2273, 2281, 2274 ]
    , [ 2281, 2282, 2274 ]
    , [ 2274, 2282, 2275 ]
    , [ 2282, 2283, 2275 ]
    , [ 2275, 2283, 425 ]
    , [ 2283, 426, 425 ]
    , [ 441, 2284, 2276 ]
    , [ 2284, 2285, 2276 ]
    , [ 2276, 2285, 2277 ]
    , [ 2285, 2286, 2277 ]
    , [ 2277, 2286, 2278 ]
    , [ 2286, 2287, 2278 ]
    , [ 2278, 2287, 2279 ]
    , [ 2287, 2288, 2279 ]
    , [ 2279, 2288, 2280 ]
    , [ 2288, 2289, 2280 ]
    , [ 2280, 2289, 2281 ]
    , [ 2289, 2290, 2281 ]
    , [ 2281, 2290, 2282 ]
    , [ 2290, 2291, 2282 ]
    , [ 2282, 2291, 2283 ]
    , [ 2291, 2292, 2283 ]
    , [ 2283, 2292, 426 ]
    , [ 2292, 427, 426 ]
    , [ 442, 2293, 2284 ]
    , [ 2293, 2294, 2284 ]
    , [ 2284, 2294, 2285 ]
    , [ 2294, 2295, 2285 ]
    , [ 2285, 2295, 2286 ]
    , [ 2295, 2296, 2286 ]
    , [ 2286, 2296, 2287 ]
    , [ 2296, 2297, 2287 ]
    , [ 2287, 2297, 2288 ]
    , [ 2297, 2298, 2288 ]
    , [ 2288, 2298, 2289 ]
    , [ 2298, 2299, 2289 ]
    , [ 2289, 2299, 2290 ]
    , [ 2299, 2300, 2290 ]
    , [ 2290, 2300, 2291 ]
    , [ 2300, 2301, 2291 ]
    , [ 2291, 2301, 2292 ]
    , [ 2301, 2302, 2292 ]
    , [ 2292, 2302, 427 ]
    , [ 2302, 428, 427 ]
    , [ 443, 2303, 2293 ]
    , [ 2303, 2304, 2293 ]
    , [ 2293, 2304, 2294 ]
    , [ 2304, 2305, 2294 ]
    , [ 2294, 2305, 2295 ]
    , [ 2305, 2306, 2295 ]
    , [ 2295, 2306, 2296 ]
    , [ 2306, 2307, 2296 ]
    , [ 2296, 2307, 2297 ]
    , [ 2307, 2308, 2297 ]
    , [ 2297, 2308, 2298 ]
    , [ 2308, 2309, 2298 ]
    , [ 2298, 2309, 2299 ]
    , [ 2309, 2310, 2299 ]
    , [ 2299, 2310, 2300 ]
    , [ 2310, 2311, 2300 ]
    , [ 2300, 2311, 2301 ]
    , [ 2311, 2312, 2301 ]
    , [ 2301, 2312, 2302 ]
    , [ 2312, 2313, 2302 ]
    , [ 2302, 2313, 428 ]
    , [ 2313, 429, 428 ]
    , [ 444, 2314, 2303 ]
    , [ 2314, 2315, 2303 ]
    , [ 2303, 2315, 2304 ]
    , [ 2315, 2316, 2304 ]
    , [ 2304, 2316, 2305 ]
    , [ 2316, 2317, 2305 ]
    , [ 2305, 2317, 2306 ]
    , [ 2317, 2318, 2306 ]
    , [ 2306, 2318, 2307 ]
    , [ 2318, 2319, 2307 ]
    , [ 2307, 2319, 2308 ]
    , [ 2319, 2320, 2308 ]
    , [ 2308, 2320, 2309 ]
    , [ 2320, 2321, 2309 ]
    , [ 2309, 2321, 2310 ]
    , [ 2321, 2322, 2310 ]
    , [ 2310, 2322, 2311 ]
    , [ 2322, 2323, 2311 ]
    , [ 2311, 2323, 2312 ]
    , [ 2323, 2324, 2312 ]
    , [ 2312, 2324, 2313 ]
    , [ 2324, 2325, 2313 ]
    , [ 2313, 2325, 429 ]
    , [ 2325, 430, 429 ]
    , [ 445, 2326, 2314 ]
    , [ 2326, 2327, 2314 ]
    , [ 2314, 2327, 2315 ]
    , [ 2327, 2328, 2315 ]
    , [ 2315, 2328, 2316 ]
    , [ 2328, 2329, 2316 ]
    , [ 2316, 2329, 2317 ]
    , [ 2329, 2330, 2317 ]
    , [ 2317, 2330, 2318 ]
    , [ 2330, 2331, 2318 ]
    , [ 2318, 2331, 2319 ]
    , [ 2331, 2332, 2319 ]
    , [ 2319, 2332, 2320 ]
    , [ 2332, 2333, 2320 ]
    , [ 2320, 2333, 2321 ]
    , [ 2333, 2334, 2321 ]
    , [ 2321, 2334, 2322 ]
    , [ 2334, 2335, 2322 ]
    , [ 2322, 2335, 2323 ]
    , [ 2335, 2336, 2323 ]
    , [ 2323, 2336, 2324 ]
    , [ 2336, 2337, 2324 ]
    , [ 2324, 2337, 2325 ]
    , [ 2337, 2338, 2325 ]
    , [ 2325, 2338, 430 ]
    , [ 2338, 431, 430 ]
    , [ 446, 2339, 2326 ]
    , [ 2339, 2340, 2326 ]
    , [ 2326, 2340, 2327 ]
    , [ 2340, 2341, 2327 ]
    , [ 2327, 2341, 2328 ]
    , [ 2341, 2342, 2328 ]
    , [ 2328, 2342, 2329 ]
    , [ 2342, 2343, 2329 ]
    , [ 2329, 2343, 2330 ]
    , [ 2343, 2344, 2330 ]
    , [ 2330, 2344, 2331 ]
    , [ 2344, 2345, 2331 ]
    , [ 2331, 2345, 2332 ]
    , [ 2345, 2346, 2332 ]
    , [ 2332, 2346, 2333 ]
    , [ 2346, 2347, 2333 ]
    , [ 2333, 2347, 2334 ]
    , [ 2347, 2348, 2334 ]
    , [ 2334, 2348, 2335 ]
    , [ 2348, 2349, 2335 ]
    , [ 2335, 2349, 2336 ]
    , [ 2349, 2350, 2336 ]
    , [ 2336, 2350, 2337 ]
    , [ 2350, 2351, 2337 ]
    , [ 2337, 2351, 2338 ]
    , [ 2351, 2352, 2338 ]
    , [ 2338, 2352, 431 ]
    , [ 2352, 432, 431 ]
    , [ 447, 357, 2339 ]
    , [ 357, 356, 2339 ]
    , [ 2339, 356, 2340 ]
    , [ 356, 355, 2340 ]
    , [ 2340, 355, 2341 ]
    , [ 355, 354, 2341 ]
    , [ 2341, 354, 2342 ]
    , [ 354, 353, 2342 ]
    , [ 2342, 353, 2343 ]
    , [ 353, 352, 2343 ]
    , [ 2343, 352, 2344 ]
    , [ 352, 351, 2344 ]
    , [ 2344, 351, 2345 ]
    , [ 351, 350, 2345 ]
    , [ 2345, 350, 2346 ]
    , [ 350, 349, 2346 ]
    , [ 2346, 349, 2347 ]
    , [ 349, 348, 2347 ]
    , [ 2347, 348, 2348 ]
    , [ 348, 347, 2348 ]
    , [ 2348, 347, 2349 ]
    , [ 347, 346, 2349 ]
    , [ 2349, 346, 2350 ]
    , [ 346, 345, 2350 ]
    , [ 2350, 345, 2351 ]
    , [ 345, 344, 2351 ]
    , [ 2351, 344, 2352 ]
    , [ 344, 343, 2352 ]
    , [ 2352, 343, 432 ]
    , [ 343, 8, 432 ]
    , [ 448, 433, 12 ]
    , [ 449, 2353, 448 ]
    , [ 450, 2354, 449 ]
    , [ 451, 2356, 450 ]
    , [ 452, 2359, 451 ]
    , [ 453, 2363, 452 ]
    , [ 454, 2368, 453 ]
    , [ 455, 2374, 454 ]
    , [ 456, 2381, 455 ]
    , [ 457, 2389, 456 ]
    , [ 458, 2398, 457 ]
    , [ 459, 2408, 458 ]
    , [ 460, 2419, 459 ]
    , [ 461, 2431, 460 ]
    , [ 462, 2444, 461 ]
    , [ 448, 2353, 433 ]
    , [ 2353, 434, 433 ]
    , [ 449, 2354, 2353 ]
    , [ 2354, 2355, 2353 ]
    , [ 2353, 2355, 434 ]
    , [ 2355, 435, 434 ]
    , [ 450, 2356, 2354 ]
    , [ 2356, 2357, 2354 ]
    , [ 2354, 2357, 2355 ]
    , [ 2357, 2358, 2355 ]
    , [ 2355, 2358, 435 ]
    , [ 2358, 436, 435 ]
    , [ 451, 2359, 2356 ]
    , [ 2359, 2360, 2356 ]
    , [ 2356, 2360, 2357 ]
    , [ 2360, 2361, 2357 ]
    , [ 2357, 2361, 2358 ]
    , [ 2361, 2362, 2358 ]
    , [ 2358, 2362, 436 ]
    , [ 2362, 437, 436 ]
    , [ 452, 2363, 2359 ]
    , [ 2363, 2364, 2359 ]
    , [ 2359, 2364, 2360 ]
    , [ 2364, 2365, 2360 ]
    , [ 2360, 2365, 2361 ]
    , [ 2365, 2366, 2361 ]
    , [ 2361, 2366, 2362 ]
    , [ 2366, 2367, 2362 ]
    , [ 2362, 2367, 437 ]
    , [ 2367, 438, 437 ]
    , [ 453, 2368, 2363 ]
    , [ 2368, 2369, 2363 ]
    , [ 2363, 2369, 2364 ]
    , [ 2369, 2370, 2364 ]
    , [ 2364, 2370, 2365 ]
    , [ 2370, 2371, 2365 ]
    , [ 2365, 2371, 2366 ]
    , [ 2371, 2372, 2366 ]
    , [ 2366, 2372, 2367 ]
    , [ 2372, 2373, 2367 ]
    , [ 2367, 2373, 438 ]
    , [ 2373, 439, 438 ]
    , [ 454, 2374, 2368 ]
    , [ 2374, 2375, 2368 ]
    , [ 2368, 2375, 2369 ]
    , [ 2375, 2376, 2369 ]
    , [ 2369, 2376, 2370 ]
    , [ 2376, 2377, 2370 ]
    , [ 2370, 2377, 2371 ]
    , [ 2377, 2378, 2371 ]
    , [ 2371, 2378, 2372 ]
    , [ 2378, 2379, 2372 ]
    , [ 2372, 2379, 2373 ]
    , [ 2379, 2380, 2373 ]
    , [ 2373, 2380, 439 ]
    , [ 2380, 440, 439 ]
    , [ 455, 2381, 2374 ]
    , [ 2381, 2382, 2374 ]
    , [ 2374, 2382, 2375 ]
    , [ 2382, 2383, 2375 ]
    , [ 2375, 2383, 2376 ]
    , [ 2383, 2384, 2376 ]
    , [ 2376, 2384, 2377 ]
    , [ 2384, 2385, 2377 ]
    , [ 2377, 2385, 2378 ]
    , [ 2385, 2386, 2378 ]
    , [ 2378, 2386, 2379 ]
    , [ 2386, 2387, 2379 ]
    , [ 2379, 2387, 2380 ]
    , [ 2387, 2388, 2380 ]
    , [ 2380, 2388, 440 ]
    , [ 2388, 441, 440 ]
    , [ 456, 2389, 2381 ]
    , [ 2389, 2390, 2381 ]
    , [ 2381, 2390, 2382 ]
    , [ 2390, 2391, 2382 ]
    , [ 2382, 2391, 2383 ]
    , [ 2391, 2392, 2383 ]
    , [ 2383, 2392, 2384 ]
    , [ 2392, 2393, 2384 ]
    , [ 2384, 2393, 2385 ]
    , [ 2393, 2394, 2385 ]
    , [ 2385, 2394, 2386 ]
    , [ 2394, 2395, 2386 ]
    , [ 2386, 2395, 2387 ]
    , [ 2395, 2396, 2387 ]
    , [ 2387, 2396, 2388 ]
    , [ 2396, 2397, 2388 ]
    , [ 2388, 2397, 441 ]
    , [ 2397, 442, 441 ]
    , [ 457, 2398, 2389 ]
    , [ 2398, 2399, 2389 ]
    , [ 2389, 2399, 2390 ]
    , [ 2399, 2400, 2390 ]
    , [ 2390, 2400, 2391 ]
    , [ 2400, 2401, 2391 ]
    , [ 2391, 2401, 2392 ]
    , [ 2401, 2402, 2392 ]
    , [ 2392, 2402, 2393 ]
    , [ 2402, 2403, 2393 ]
    , [ 2393, 2403, 2394 ]
    , [ 2403, 2404, 2394 ]
    , [ 2394, 2404, 2395 ]
    , [ 2404, 2405, 2395 ]
    , [ 2395, 2405, 2396 ]
    , [ 2405, 2406, 2396 ]
    , [ 2396, 2406, 2397 ]
    , [ 2406, 2407, 2397 ]
    , [ 2397, 2407, 442 ]
    , [ 2407, 443, 442 ]
    , [ 458, 2408, 2398 ]
    , [ 2408, 2409, 2398 ]
    , [ 2398, 2409, 2399 ]
    , [ 2409, 2410, 2399 ]
    , [ 2399, 2410, 2400 ]
    , [ 2410, 2411, 2400 ]
    , [ 2400, 2411, 2401 ]
    , [ 2411, 2412, 2401 ]
    , [ 2401, 2412, 2402 ]
    , [ 2412, 2413, 2402 ]
    , [ 2402, 2413, 2403 ]
    , [ 2413, 2414, 2403 ]
    , [ 2403, 2414, 2404 ]
    , [ 2414, 2415, 2404 ]
    , [ 2404, 2415, 2405 ]
    , [ 2415, 2416, 2405 ]
    , [ 2405, 2416, 2406 ]
    , [ 2416, 2417, 2406 ]
    , [ 2406, 2417, 2407 ]
    , [ 2417, 2418, 2407 ]
    , [ 2407, 2418, 443 ]
    , [ 2418, 444, 443 ]
    , [ 459, 2419, 2408 ]
    , [ 2419, 2420, 2408 ]
    , [ 2408, 2420, 2409 ]
    , [ 2420, 2421, 2409 ]
    , [ 2409, 2421, 2410 ]
    , [ 2421, 2422, 2410 ]
    , [ 2410, 2422, 2411 ]
    , [ 2422, 2423, 2411 ]
    , [ 2411, 2423, 2412 ]
    , [ 2423, 2424, 2412 ]
    , [ 2412, 2424, 2413 ]
    , [ 2424, 2425, 2413 ]
    , [ 2413, 2425, 2414 ]
    , [ 2425, 2426, 2414 ]
    , [ 2414, 2426, 2415 ]
    , [ 2426, 2427, 2415 ]
    , [ 2415, 2427, 2416 ]
    , [ 2427, 2428, 2416 ]
    , [ 2416, 2428, 2417 ]
    , [ 2428, 2429, 2417 ]
    , [ 2417, 2429, 2418 ]
    , [ 2429, 2430, 2418 ]
    , [ 2418, 2430, 444 ]
    , [ 2430, 445, 444 ]
    , [ 460, 2431, 2419 ]
    , [ 2431, 2432, 2419 ]
    , [ 2419, 2432, 2420 ]
    , [ 2432, 2433, 2420 ]
    , [ 2420, 2433, 2421 ]
    , [ 2433, 2434, 2421 ]
    , [ 2421, 2434, 2422 ]
    , [ 2434, 2435, 2422 ]
    , [ 2422, 2435, 2423 ]
    , [ 2435, 2436, 2423 ]
    , [ 2423, 2436, 2424 ]
    , [ 2436, 2437, 2424 ]
    , [ 2424, 2437, 2425 ]
    , [ 2437, 2438, 2425 ]
    , [ 2425, 2438, 2426 ]
    , [ 2438, 2439, 2426 ]
    , [ 2426, 2439, 2427 ]
    , [ 2439, 2440, 2427 ]
    , [ 2427, 2440, 2428 ]
    , [ 2440, 2441, 2428 ]
    , [ 2428, 2441, 2429 ]
    , [ 2441, 2442, 2429 ]
    , [ 2429, 2442, 2430 ]
    , [ 2442, 2443, 2430 ]
    , [ 2430, 2443, 445 ]
    , [ 2443, 446, 445 ]
    , [ 461, 2444, 2431 ]
    , [ 2444, 2445, 2431 ]
    , [ 2431, 2445, 2432 ]
    , [ 2445, 2446, 2432 ]
    , [ 2432, 2446, 2433 ]
    , [ 2446, 2447, 2433 ]
    , [ 2433, 2447, 2434 ]
    , [ 2447, 2448, 2434 ]
    , [ 2434, 2448, 2435 ]
    , [ 2448, 2449, 2435 ]
    , [ 2435, 2449, 2436 ]
    , [ 2449, 2450, 2436 ]
    , [ 2436, 2450, 2437 ]
    , [ 2450, 2451, 2437 ]
    , [ 2437, 2451, 2438 ]
    , [ 2451, 2452, 2438 ]
    , [ 2438, 2452, 2439 ]
    , [ 2452, 2453, 2439 ]
    , [ 2439, 2453, 2440 ]
    , [ 2453, 2454, 2440 ]
    , [ 2440, 2454, 2441 ]
    , [ 2454, 2455, 2441 ]
    , [ 2441, 2455, 2442 ]
    , [ 2455, 2456, 2442 ]
    , [ 2442, 2456, 2443 ]
    , [ 2456, 2457, 2443 ]
    , [ 2443, 2457, 446 ]
    , [ 2457, 447, 446 ]
    , [ 462, 372, 2444 ]
    , [ 372, 371, 2444 ]
    , [ 2444, 371, 2445 ]
    , [ 371, 370, 2445 ]
    , [ 2445, 370, 2446 ]
    , [ 370, 369, 2446 ]
    , [ 2446, 369, 2447 ]
    , [ 369, 368, 2447 ]
    , [ 2447, 368, 2448 ]
    , [ 368, 367, 2448 ]
    , [ 2448, 367, 2449 ]
    , [ 367, 366, 2449 ]
    , [ 2449, 366, 2450 ]
    , [ 366, 365, 2450 ]
    , [ 2450, 365, 2451 ]
    , [ 365, 364, 2451 ]
    , [ 2451, 364, 2452 ]
    , [ 364, 363, 2452 ]
    , [ 2452, 363, 2453 ]
    , [ 363, 362, 2453 ]
    , [ 2453, 362, 2454 ]
    , [ 362, 361, 2454 ]
    , [ 2454, 361, 2455 ]
    , [ 361, 360, 2455 ]
    , [ 2455, 360, 2456 ]
    , [ 360, 359, 2456 ]
    , [ 2456, 359, 2457 ]
    , [ 359, 358, 2457 ]
    , [ 2457, 358, 447 ]
    , [ 358, 9, 447 ]
    , [ 417, 448, 12 ]
    , [ 416, 2458, 417 ]
    , [ 415, 2459, 416 ]
    , [ 414, 2461, 415 ]
    , [ 413, 2464, 414 ]
    , [ 412, 2468, 413 ]
    , [ 411, 2473, 412 ]
    , [ 410, 2479, 411 ]
    , [ 409, 2486, 410 ]
    , [ 408, 2494, 409 ]
    , [ 407, 2503, 408 ]
    , [ 406, 2513, 407 ]
    , [ 405, 2524, 406 ]
    , [ 404, 2536, 405 ]
    , [ 403, 2549, 404 ]
    , [ 417, 2458, 448 ]
    , [ 2458, 449, 448 ]
    , [ 416, 2459, 2458 ]
    , [ 2459, 2460, 2458 ]
    , [ 2458, 2460, 449 ]
    , [ 2460, 450, 449 ]
    , [ 415, 2461, 2459 ]
    , [ 2461, 2462, 2459 ]
    , [ 2459, 2462, 2460 ]
    , [ 2462, 2463, 2460 ]
    , [ 2460, 2463, 450 ]
    , [ 2463, 451, 450 ]
    , [ 414, 2464, 2461 ]
    , [ 2464, 2465, 2461 ]
    , [ 2461, 2465, 2462 ]
    , [ 2465, 2466, 2462 ]
    , [ 2462, 2466, 2463 ]
    , [ 2466, 2467, 2463 ]
    , [ 2463, 2467, 451 ]
    , [ 2467, 452, 451 ]
    , [ 413, 2468, 2464 ]
    , [ 2468, 2469, 2464 ]
    , [ 2464, 2469, 2465 ]
    , [ 2469, 2470, 2465 ]
    , [ 2465, 2470, 2466 ]
    , [ 2470, 2471, 2466 ]
    , [ 2466, 2471, 2467 ]
    , [ 2471, 2472, 2467 ]
    , [ 2467, 2472, 452 ]
    , [ 2472, 453, 452 ]
    , [ 412, 2473, 2468 ]
    , [ 2473, 2474, 2468 ]
    , [ 2468, 2474, 2469 ]
    , [ 2474, 2475, 2469 ]
    , [ 2469, 2475, 2470 ]
    , [ 2475, 2476, 2470 ]
    , [ 2470, 2476, 2471 ]
    , [ 2476, 2477, 2471 ]
    , [ 2471, 2477, 2472 ]
    , [ 2477, 2478, 2472 ]
    , [ 2472, 2478, 453 ]
    , [ 2478, 454, 453 ]
    , [ 411, 2479, 2473 ]
    , [ 2479, 2480, 2473 ]
    , [ 2473, 2480, 2474 ]
    , [ 2480, 2481, 2474 ]
    , [ 2474, 2481, 2475 ]
    , [ 2481, 2482, 2475 ]
    , [ 2475, 2482, 2476 ]
    , [ 2482, 2483, 2476 ]
    , [ 2476, 2483, 2477 ]
    , [ 2483, 2484, 2477 ]
    , [ 2477, 2484, 2478 ]
    , [ 2484, 2485, 2478 ]
    , [ 2478, 2485, 454 ]
    , [ 2485, 455, 454 ]
    , [ 410, 2486, 2479 ]
    , [ 2486, 2487, 2479 ]
    , [ 2479, 2487, 2480 ]
    , [ 2487, 2488, 2480 ]
    , [ 2480, 2488, 2481 ]
    , [ 2488, 2489, 2481 ]
    , [ 2481, 2489, 2482 ]
    , [ 2489, 2490, 2482 ]
    , [ 2482, 2490, 2483 ]
    , [ 2490, 2491, 2483 ]
    , [ 2483, 2491, 2484 ]
    , [ 2491, 2492, 2484 ]
    , [ 2484, 2492, 2485 ]
    , [ 2492, 2493, 2485 ]
    , [ 2485, 2493, 455 ]
    , [ 2493, 456, 455 ]
    , [ 409, 2494, 2486 ]
    , [ 2494, 2495, 2486 ]
    , [ 2486, 2495, 2487 ]
    , [ 2495, 2496, 2487 ]
    , [ 2487, 2496, 2488 ]
    , [ 2496, 2497, 2488 ]
    , [ 2488, 2497, 2489 ]
    , [ 2497, 2498, 2489 ]
    , [ 2489, 2498, 2490 ]
    , [ 2498, 2499, 2490 ]
    , [ 2490, 2499, 2491 ]
    , [ 2499, 2500, 2491 ]
    , [ 2491, 2500, 2492 ]
    , [ 2500, 2501, 2492 ]
    , [ 2492, 2501, 2493 ]
    , [ 2501, 2502, 2493 ]
    , [ 2493, 2502, 456 ]
    , [ 2502, 457, 456 ]
    , [ 408, 2503, 2494 ]
    , [ 2503, 2504, 2494 ]
    , [ 2494, 2504, 2495 ]
    , [ 2504, 2505, 2495 ]
    , [ 2495, 2505, 2496 ]
    , [ 2505, 2506, 2496 ]
    , [ 2496, 2506, 2497 ]
    , [ 2506, 2507, 2497 ]
    , [ 2497, 2507, 2498 ]
    , [ 2507, 2508, 2498 ]
    , [ 2498, 2508, 2499 ]
    , [ 2508, 2509, 2499 ]
    , [ 2499, 2509, 2500 ]
    , [ 2509, 2510, 2500 ]
    , [ 2500, 2510, 2501 ]
    , [ 2510, 2511, 2501 ]
    , [ 2501, 2511, 2502 ]
    , [ 2511, 2512, 2502 ]
    , [ 2502, 2512, 457 ]
    , [ 2512, 458, 457 ]
    , [ 407, 2513, 2503 ]
    , [ 2513, 2514, 2503 ]
    , [ 2503, 2514, 2504 ]
    , [ 2514, 2515, 2504 ]
    , [ 2504, 2515, 2505 ]
    , [ 2515, 2516, 2505 ]
    , [ 2505, 2516, 2506 ]
    , [ 2516, 2517, 2506 ]
    , [ 2506, 2517, 2507 ]
    , [ 2517, 2518, 2507 ]
    , [ 2507, 2518, 2508 ]
    , [ 2518, 2519, 2508 ]
    , [ 2508, 2519, 2509 ]
    , [ 2519, 2520, 2509 ]
    , [ 2509, 2520, 2510 ]
    , [ 2520, 2521, 2510 ]
    , [ 2510, 2521, 2511 ]
    , [ 2521, 2522, 2511 ]
    , [ 2511, 2522, 2512 ]
    , [ 2522, 2523, 2512 ]
    , [ 2512, 2523, 458 ]
    , [ 2523, 459, 458 ]
    , [ 406, 2524, 2513 ]
    , [ 2524, 2525, 2513 ]
    , [ 2513, 2525, 2514 ]
    , [ 2525, 2526, 2514 ]
    , [ 2514, 2526, 2515 ]
    , [ 2526, 2527, 2515 ]
    , [ 2515, 2527, 2516 ]
    , [ 2527, 2528, 2516 ]
    , [ 2516, 2528, 2517 ]
    , [ 2528, 2529, 2517 ]
    , [ 2517, 2529, 2518 ]
    , [ 2529, 2530, 2518 ]
    , [ 2518, 2530, 2519 ]
    , [ 2530, 2531, 2519 ]
    , [ 2519, 2531, 2520 ]
    , [ 2531, 2532, 2520 ]
    , [ 2520, 2532, 2521 ]
    , [ 2532, 2533, 2521 ]
    , [ 2521, 2533, 2522 ]
    , [ 2533, 2534, 2522 ]
    , [ 2522, 2534, 2523 ]
    , [ 2534, 2535, 2523 ]
    , [ 2523, 2535, 459 ]
    , [ 2535, 460, 459 ]
    , [ 405, 2536, 2524 ]
    , [ 2536, 2537, 2524 ]
    , [ 2524, 2537, 2525 ]
    , [ 2537, 2538, 2525 ]
    , [ 2525, 2538, 2526 ]
    , [ 2538, 2539, 2526 ]
    , [ 2526, 2539, 2527 ]
    , [ 2539, 2540, 2527 ]
    , [ 2527, 2540, 2528 ]
    , [ 2540, 2541, 2528 ]
    , [ 2528, 2541, 2529 ]
    , [ 2541, 2542, 2529 ]
    , [ 2529, 2542, 2530 ]
    , [ 2542, 2543, 2530 ]
    , [ 2530, 2543, 2531 ]
    , [ 2543, 2544, 2531 ]
    , [ 2531, 2544, 2532 ]
    , [ 2544, 2545, 2532 ]
    , [ 2532, 2545, 2533 ]
    , [ 2545, 2546, 2533 ]
    , [ 2533, 2546, 2534 ]
    , [ 2546, 2547, 2534 ]
    , [ 2534, 2547, 2535 ]
    , [ 2547, 2548, 2535 ]
    , [ 2535, 2548, 460 ]
    , [ 2548, 461, 460 ]
    , [ 404, 2549, 2536 ]
    , [ 2549, 2550, 2536 ]
    , [ 2536, 2550, 2537 ]
    , [ 2550, 2551, 2537 ]
    , [ 2537, 2551, 2538 ]
    , [ 2551, 2552, 2538 ]
    , [ 2538, 2552, 2539 ]
    , [ 2552, 2553, 2539 ]
    , [ 2539, 2553, 2540 ]
    , [ 2553, 2554, 2540 ]
    , [ 2540, 2554, 2541 ]
    , [ 2554, 2555, 2541 ]
    , [ 2541, 2555, 2542 ]
    , [ 2555, 2556, 2542 ]
    , [ 2542, 2556, 2543 ]
    , [ 2556, 2557, 2543 ]
    , [ 2543, 2557, 2544 ]
    , [ 2557, 2558, 2544 ]
    , [ 2544, 2558, 2545 ]
    , [ 2558, 2559, 2545 ]
    , [ 2545, 2559, 2546 ]
    , [ 2559, 2560, 2546 ]
    , [ 2546, 2560, 2547 ]
    , [ 2560, 2561, 2547 ]
    , [ 2547, 2561, 2548 ]
    , [ 2561, 2562, 2548 ]
    , [ 2548, 2562, 461 ]
    , [ 2562, 462, 461 ]
    , [ 403, 387, 2549 ]
    , [ 387, 386, 2549 ]
    , [ 2549, 386, 2550 ]
    , [ 386, 385, 2550 ]
    , [ 2550, 385, 2551 ]
    , [ 385, 384, 2551 ]
    , [ 2551, 384, 2552 ]
    , [ 384, 383, 2552 ]
    , [ 2552, 383, 2553 ]
    , [ 383, 382, 2553 ]
    , [ 2553, 382, 2554 ]
    , [ 382, 381, 2554 ]
    , [ 2554, 381, 2555 ]
    , [ 381, 380, 2555 ]
    , [ 2555, 380, 2556 ]
    , [ 380, 379, 2556 ]
    , [ 2556, 379, 2557 ]
    , [ 379, 378, 2557 ]
    , [ 2557, 378, 2558 ]
    , [ 378, 377, 2558 ]
    , [ 2558, 377, 2559 ]
    , [ 377, 376, 2559 ]
    , [ 2559, 376, 2560 ]
    , [ 376, 375, 2560 ]
    , [ 2560, 375, 2561 ]
    , [ 375, 374, 2561 ]
    , [ 2561, 374, 2562 ]
    , [ 374, 373, 2562 ]
    , [ 2562, 373, 462 ]
    , [ 373, 10, 462 ]
    ]
