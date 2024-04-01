vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    _G.THEME = require("util.theme").setup()
  end,
})

require "config.lazy"
require "config.options"
require "config.keymaps"
require "config.autocmd"
require "config.polish"
