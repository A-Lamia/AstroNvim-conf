return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  opts = function(_, opts)
    local get_hl = require("util").get_hl
    local fg = get_hl({ "Keyword" }).fg

    return {
      chunk = {
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "→",
          -- right_arrow = "",
          -- right_arrow = "",
          -- right_arrow = "",
        },
        style = {
          { fg = fg },
        },
      },
      ident = {
        use_treesitter = false,
      },
      line_num = {
        enable = false,
        style = fg,
      },
      blank = {
        enable = false,
      },
    }
  end,
}
