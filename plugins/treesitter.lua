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
            -- list of languages you want to disable the plugin for
            -- disable = { "jsx", "cpp" },
            -- Which query to use for finding delimiters
            query = "rainbow-parens",
            -- Highlight the entire buffer all at once
            strategy = require "ts-rainbow.strategy.global",
          },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
          callback = function()
            vim.cmd "TSDisable rainbow"
            vim.cmd "TSEnable rainbow"
          end,
        })
      end,
    },
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
      },
    },
    {
      "Wansmer/sibling-swap.nvim",
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
