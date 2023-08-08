return {
  "AstroNvim/astroui",
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts or {}, {
      colorscheme = "astrodark",
      highlights = {},
    })
    return opts
  end,
}
