vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    _G.THEME = require("util.theme").setup()
  end,
})
-- vim.api.nvim_command "<cmd>colors astrodark<cr>"

require "config.lazy"

require "config.keymaps"
require "config.autocmd"
require "config.polish"
