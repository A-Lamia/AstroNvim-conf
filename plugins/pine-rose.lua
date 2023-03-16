return {
  "rose-pine/neovim",
  name = "rose-pine",
  -- lazy = false,
  priority = 1000,
  opts = {
    dark_variant = "moon",
    disable_italics = "true",
    disable_float_background = "true",
    highlight_groups = {
      TSRainbowRed = { fg = "love" },
      TSRainbowBlue = { fg = "foam" },
      TSRainbowCyan = { fg = "rose" },
      TSRainbowGreen = { fg = "pine" },
      TSRainbowOrange = { fg = "#CAE7A7" },
      TSRainbowViolet = { fg = "iris" },
      TSRainbowYellow = { fg = "gold" },
      StatusReplace = { fg = "surface", bg = "love" },
    },
  },
}
