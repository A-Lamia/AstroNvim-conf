return {
  "stevearc/conform.nvim",
  enabled = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },

    format_after_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { lsp_fallback = true, timeout_ms = 500 }
    end,
  },

  init = function()
    local notify = require "notify"

    vim.api.nvim_create_user_command("FormatToggle", function()
      if not vim.b.disable_autoformat then
        vim.b.disable_autoformat = true
        notify "Auto format buffer disabled"
      elseif vim.b.disable_autoformat and not vim.g.disable_autoformat then
        vim.g.disable_autoformat = true
        notify "Auto format disabled"
      else
        vim.g.disable_autoformat = false
        vim.b.disable_autoformat = false
        notify "Auto format enabled"
      end
    end, { desc = "Toggle autoformat on save", bang = true })
  end,
}
