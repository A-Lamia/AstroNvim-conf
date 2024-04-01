local border = require "util.border"

return {
  "cbochs/grapple.nvim",
  enabled = true,
  lazy = false,
  config = function()
    require("grapple").setup {
      -- popup_options = {
      --   border = border.default[vim.g.border],
      -- },
      scope = (function()
        local lsp_ok, _ = pcall(vim.lsp.get_clients)
        local git_ok = #vim.fs.find(".git", {}) == 1
        if git_ok then
          return "git_branch"
        elseif lsp_ok then
          return "lsp"
        else
          return "static"
        end
      end)(),
    }

    require("util.map").set_keymaps {
      n = {
        ["gt"] = { ":Grapple toggle<cr>", desc = "Tags current buffer" },
        ["gp"] = { ":Grapple open_tags<cr>", desc = "Grapple tag popup menu" },
      },
    }
  end,
}
