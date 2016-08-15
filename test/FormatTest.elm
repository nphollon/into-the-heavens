module FormatTest exposing (testSuite)

import ElmTest exposing (..)
import Graphics.Format as Format


testSuite : Test
testSuite =
    suite "Text formatting"
        [ suite "Tagging"
            [ test "label: value" <|
                assertEqual "key: value"
                    (Format.tag "key" "value")
            ]
        , suite "Floats"
            [ test "1.23 gets a sign added" <|
                assertEqual "+1.23"
                    (Format.float 1.23)
            , test "2.341 gets truncated to 2 decimal places" <|
                assertEqual "+2.34"
                    (Format.float 2.341)
            , test "2.345 rounds to 2.35" <|
                assertEqual "+2.35"
                    (Format.float 2.345)
            , test "number with tenths gets padded with a zero" <|
                assertEqual "+2.10"
                    (Format.float 2.1)
            , test "2.03 keeps leading zero before 3" <|
                assertEqual "+2.03"
                    (Format.float 2.03)
            , test "integer gets padded with two zeros" <|
                assertEqual "+3.00"
                    (Format.float 3)
            , test "negative number keeps sign" <|
                assertEqual "-1.23"
                    (Format.float -1.23)
            , test "zero gets plus sign" <|
                assertEqual "+0.00"
                    (Format.float 0)
            , test "negative number that rounds to zero gets plus sign" <|
                assertEqual "+0.00"
                    (Format.float -4.0e-3)
            , test "number that rounds to -0.01 gets minus sign" <|
                assertEqual "-0.01"
                    (Format.float -5.0e-3)
            , test "0.995 gets rounded to 1.00" <|
                assertEqual "+1.00"
                    (Format.float 0.995)
            ]
        , suite "Percents"
            [ test "unity is 100 percent" <|
                assertEqual 100
                    (Format.percent 1.0)
            , test "0.5 is 50 percent" <|
                assertEqual 50
                    (Format.percent 0.5)
            ]
        ]
