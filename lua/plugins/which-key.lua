return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      window = {
        border = require("util.border").default[vim.g.border],
        winblend = vim.o.winblend,
      },
    })
  end,
}
