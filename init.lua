vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    _G.THEME = require("user.util.theme").setup()
  end
})

return {}
