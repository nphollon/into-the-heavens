module SwitchTest (testSuite) where

import ElmTest exposing (..)
import Flight.Switch as Switch


testSuite : Test
testSuite =
  suite
    "Switching mechanisms"
    [ suite
        "Repeat"
        [ test "No change if switch is off and value at zero"
            <| assertEqual
                { value = 0, decay = 10 }
                (Switch.repeat 0.5 False { value = 0, decay = 10 })
        , test "Flip to unity if switch is on and value at zero"
            <| assertEqual
                { value = 1, decay = 10 }
                (Switch.repeat 0.5 True { value = 0, decay = 10 })
        , test "Decay value if switch is off and value greater than zero"
            <| assertEqual
                { value = 0.4, decay = 10 }
                (Switch.repeat 1 False { value = 0.5, decay = 10 })
        , test "Scale decay amount by time delta"
            <| assertEqual
                { value = 0.45, decay = 10 }
                (Switch.repeat 0.5 False { value = 0.5, decay = 10 })
        , test "Decay value if switch is on and value is greater than zero"
            <| assertEqual
                { value = 0.45, decay = 10 }
                (Switch.repeat 0.5 True { value = 0.5, decay = 10 })
        , test "Value bottoms out at zero if switch is off"
            <| assertEqual
                { value = 0, decay = 10 }
                (Switch.repeat 0.5 False { value = 1.0e-2, decay = 10 })
        , test "Value flips to unity if switch is on and decays to zero"
            <| assertEqual
                { value = 1, decay = 10 }
                (Switch.repeat 0.5 True { value = 1.0e-2, decay = 10 })
        ]
    , suite
        "drain"
        [ test "No change if switch is off and value is at unity"
            <| assertEqual
                { value = 1, decay = 10, recover = 20 }
                (Switch.drain 0.5 False { value = 1, decay = 10, recover = 20 })
        , test "Recover value if switch is off and value is below unity"
            <| assertEqual
                { value = 2.5e-2, decay = 10, recover = 20 }
                (Switch.drain 0.5 False { value = 0, decay = 10, recover = 20 })
        , test "Recover ceiling is unity"
            <| assertEqual
                { value = 1, decay = 10, recover = 20 }
                (Switch.drain 0.5 False { value = 0.99, decay = 10, recover = 20 })
        , test "Decay value if switch is on and value is above zero"
            <| assertEqual
                { value = 0.95, decay = 10, recover = 20 }
                (Switch.drain 0.5 True { value = 1, decay = 10, recover = 20 })
        , test "Decay floor is zero"
            <| assertEqual
                { value = 0, decay = 10, recover = 20 }
                (Switch.drain 0.5 True { value = 1.0e-2, decay = 10, recover = 20 })
        ]
    ]
