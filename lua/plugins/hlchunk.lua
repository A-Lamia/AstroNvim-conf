return {
  "shellRaining/hlchunk.nvim",
  enabled = true,
  event = { "UIEnter" },
  opts = function(_, opts)
    local get_hl = require("util").get_hl
    local fg = get_hl({ "Keyword" }).fg
    local error = get_hl({ "Error" }).fg
    local exclude = require("hlchunk.utils.filetype").exclude_filetypes
    exclude.ssr = true
    exclude.starter = true
    exclude.minifiles = true

    return {
      chunk = {
        enable = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          -- right_arrow = "→",
          -- right_arrow = "",
          right_arrow = "",
          -- right_arrow = "",
        },
        style = {
          { fg = fg },
          { fg = error },
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
