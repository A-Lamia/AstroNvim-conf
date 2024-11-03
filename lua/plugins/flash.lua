local util = require "util"

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        multi_line = false,
        jump_labels = true,
        jump = {
          autojump = true,
        },
      },
      search = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "s;",
      mode = { "n", "x", "o" },
      function()
        util.clear_extmark "vim_lsp_references"
        require("flash").jump()
      end,
      desc = "Flash",
    },
    -- {
    --   "S",
    --   mode = { "n", "o", "x" },
    --   function()
    --     util.clear_extmark "vim_lsp_references"
    --     require("flash").treesitter()
    --   end,
    --   desc = "Flash Treesitter",
    -- },
    {
      "r",
      mode = "o",
      function()
        util.clear_extmark "vim_lsp_references"
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        util.clear_extmark "vim_lsp_references"
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
  },
}
