local lsp = require "astronvim.utils.lsp"

return {
  "folke/zen-mode.nvim",
  ft = "<leader>n",
  dependencies = {
    "folke/twilight.nvim",
    opts = {
      -- context = 5,
      expand = {
        "constructor_definition",
        "function_definition",
        "function_declaration",
        "table_constructor",
        "for_statement",
        "if_statement",
      },
    },
  },
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 1,
      width = function() return math.min(80, vim.o.columns * 0.75) end,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
        -- signcolumn = "no"
      },
    },
    plugins = {
      options = {
        cmdheight = 1,
        laststatus = 0,
      },
      gitsigns = { enabled = true },
    },
    on_open = function() -- disable diagnostics and indent blankline
      vim.g.diagnostics_enabled_old = vim.g.diagnostics_enabled
      vim.g.status_diagnostics_enabled_old = vim.g.status_diagnostics_enabled
      vim.g.diagnostics_enabled = false
      vim.g.status_diagnostics_enabled = false
      vim.diagnostic.config(lsp.diagnostics["off"])
      -- vim.g.indent_blankline_enabled_old = vim.g.indent_blankline_enabled
      -- vim.g.indent_blankline_enabled = false
      pcall(vim.cmd.IndentBlanklineDisable)
    end,
    on_close = function() -- restore diagnostics and indent blankline
      vim.g.diagnostics_enabled = vim.g.diagnostics_enabled_old
      vim.g.status_diagnostics_enabled = vim.g.status_diagnostics_enabled_old
      vim.diagnostic.config(lsp.diagnostics[vim.g.diagnostics_enabled and "on" or "off"])
      -- vim.g.indent_blankline_enabled = vim.g.indent_blankline_enabled_old
      pcall(vim.cmd.IndentBlanklineEnable)
    end,
  },
}
