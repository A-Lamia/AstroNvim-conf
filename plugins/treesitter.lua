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
      keys = {
        {
          "sj",
          desc = "Split Join Blocks Toggle",
          function() require("treesj").toggle() end,
        },
      },
      opts = {
        use_default_keymaps = false,
      },
    },
    {
      "Wansmer/sibling-swap.nvim",
      keys = {
        { "sl", desc = "Swap With Right" },
        { "sh", desc = "Swap With Left" },
      },
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
