return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "help",
      "rust",
      "cpp",
      "python",
      "gdscript",
      -- "gdresource"
    },
  },
  dependencies = {
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        require("nvim-treesitter.configs").setup {
          rainbow = {
            enable = true,
            query = "rainbow-parens",
            strategy = require "ts-rainbow.strategy.global",
          },
        }
      end,
    },
    {
      "Wansmer/treesj",
      keys = "sj",
      config = function()
        require("astronvim.utils").set_mappings {
          n = {
            ["sj"] = { ":TSJToggle<CR>", desc = "Treesj toggle" },
          },
        }
        require("treesj").setup {
          use_default_keymaps = false,
        }
      end,
    },
    {
      "Wansmer/sibling-swap.nvim",
      keys = { "sl", "sh" },
      opts = {
        keymaps = {
          ["sl"] = "swap_with_right",
          ["sh"] = "swap_with_left",
          -- ['sL'] = 'swap_with_right_with_opp',
          -- ['sH'] = 'swap_with_left_with_opp',
        },
      },
    },
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
  },
}
