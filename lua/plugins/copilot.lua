return {
  { "github/copilot.vim", enabled = false },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = true,
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false,
    },
    keys = {
      {
        "<leader>v",
        desc = "Toggle Copilot Chat",
        function()
          local chat = require "CopilotChat"
          chat.toggle {
            window = {
              layout = "horizontal",
              height = 0.3,
            },
          }
        end,
      },
    },
  },

  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
    init = function()
      local lspkind = require "lspkind"
      lspkind.init {
        symbol_map = {
          Copilot = "",
        },
      }
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
    end,
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      opts = {
        sources = { { name = "copilot", priority = 1000 } },
      },
    },
  },
}
