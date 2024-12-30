return {
  {
    "AstroNvim/astroui",
    opts = function(_, opts)
      local get_hl = require("util").get_hl

      return vim.tbl_deep_extend("force", opts or {}, {
        colorscheme = "astrodark",
        status = {
          foldcolumn = false,
          colors = function(hl)
            if not vim.g.default_heirline then
              hl.tabline_bg = "none"
              hl.scrollbar = get_hl({ "HeirlineYellow", "TypeDef" }).fg
              hl.treesitter_bg = get_hl({ "HeirlineGreen", "String" }).fg
              hl.buffer_fg = get_hl({ "HeirlineTextInactive", "NonText" }).fg

              if vim.version().minor >= 11 then
                local norm = get_hl { "Normal" }
                vim.api.nvim_set_hl(0, "TabLineFill", { fg = norm.fg, bg = norm.bg })
              end
            end
          end,
        },
      })
    end,
  },
}
