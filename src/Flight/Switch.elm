module Flight.Switch (repeat, drain) where


type alias RepeatSwitch =
  { value : Float
  , decay : Float
  }


type alias DrainSwitch =
  { value : Float
  , decay : Float
  , recover : Float
  }


repeat : Float -> Bool -> RepeatSwitch -> RepeatSwitch
repeat dt isOn switch =
  let
    dv =
      dt / switch.decay
  in
    if switch.value > dv then
      { switch | value = switch.value - dv }
    else if isOn then
      { switch | value = 1 }
    else
      { switch | value = 0 }


drain : Float -> Bool -> DrainSwitch -> DrainSwitch
drain dt isOn switch =
  if isOn then
    { switch | value = max 0 (switch.value - dt / switch.decay) }
  else
    { switch | value = min 1 (switch.value + dt / switch.recover) }
