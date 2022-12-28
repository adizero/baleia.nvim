local ansi = {}

ansi.PATTERN = "\x1b[[0-9][:;0-9]*m"

ansi.foreground = {
  [30] =  0,
  [31] =  1,
  [32] =  2,
  [33] =  3,
  [34] =  4,
  [35] =  5,
  [36] =  6,
  [37] =  7,
  [39] =  'none',
  [90] =  8,
  [91] =  9,
  [92] = 10,
  [93] = 11,
  [94] = 12,
  [95] = 13,
  [96] = 14,
  [97] = 15,
}

ansi.background = {
   [40] =  0,
   [41] =  1,
   [42] =  2,
   [43] =  3,
   [44] =  4,
   [45] =  5,
   [46] =  6,
   [47] =  7,
   [49] =  'none',
  [100] =  8,
  [101] =  9,
  [102] = 10,
  [103] = 11,
  [104] = 12,
  [105] = 13,
  [106] = 14,
  [107] = 15,
}

ansi.modes = {
  [1] = "bold",
  [2] = "faint",  -- not supported by Baleia
  [3] = "italic",
  [4] = "underline",
  [5] = "blink",  -- not supported by Baleia
  [6] = "rapidblink",  -- not supported by Baleia
  [7] = "reverse",
  [8] = "conceal",  -- not supported by Baleia
  [9] = "strikethrough",
  [20] = "fraktur",  -- not supported by Baleia (Gothic)
  [21] = "doubleunderline",  -- not supported by Baleia (or not bold on older consoles and terminals)
  [26] = "proportional",  -- not supported by Baleia
}

-- [ 10 ] primary font
-- [ 11 .. 19 ] alternative fonts

ansi.disable_modes = {
  [22] = "bold",  -- (normal intensity, should disable faint as well)
  [23] = "italic",
  [24] = "underline",
  [25] = "blink",  -- not supported by Baleia
  [27] = "reverse",
  [28] = "conceal",  -- not supported by Baleia
  [29] = "strikethrough",
  [50] = "proportional",  -- not supported by Baleia
}

return ansi
