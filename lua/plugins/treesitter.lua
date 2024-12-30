return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    init = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.asm = {
        install_info = {
          url = "https://github.com/rush-rs/tree-sitter-asm.git",
          files = { "src/parser.c" },
          branch = "main",
        },
      }
    end,
    opts = {
      compilers = { "gcc" },
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "rust",
        "cpp",
        "python",
      },
    },
    dependencies = {
      {
        "rush-rs/tree-sitter-asm",
        ft = "asm",
      },
    },
  },

  {
    "Wansmer/treesj",
    keys = {
      {
        "sj",
        desc = "Split Join Blocks Toggle",
        function()
          require("treesj").toggle()
        end,
      },
    },
    opts = {
      compilers = { "clang" },
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
        -- ["sl"] = "swap_with_right",
        -- ["sh"] = "swap_with_left",
        -- ['sL'] = 'swap_with_right_with_opp',
        -- ['sH'] = 'swap_with_left_with_opp',
      },
    },
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}
