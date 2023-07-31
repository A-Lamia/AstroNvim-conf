return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      window = {
        border = require("user.util.border").default[vim.g.border],
        winblend = vim.g.winblend,
      },
    })
  end,
}
