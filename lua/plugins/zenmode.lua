-- local lsp = require "astronvim.utils.lsp"

return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    {
      "<leader>z",
      function()
        require("zen-mode").toggle()
      end,
      desc = "ZenMode",
    },
  },
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
  opts = {
    window = {
      backdrop = 1,
      width = function()
        return math.min(80, vim.o.columns * 0.75)
      end,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
      },
    },

    plugins = {
      options = {
        cmdheight = 0,
        laststatus = 0,
      },
      gitsigns = { enabled = true },
    },

    on_open = function() -- disable diagnostics and indent blankline
      pcall(vim.cmd.IndentBlanklineDisable)
      pcall(vim.cmd "DisableHL")
      pcall(vim.cmd "w")
    end,

    on_close = function() -- restore diagnostics and indent blankline
      pcall(vim.cmd "EnableHL")
    end,
  },
}
