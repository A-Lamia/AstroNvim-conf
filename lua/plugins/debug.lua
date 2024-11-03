return {
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  -- {
  --   "rebelot/heirline.nvim",
  --   optional = true,
  --   opts = function(_, opts) opts.tabline = nil end,
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   enabled = false,
  --   lazy = false,
  --   config = function()
  --     local astrotheme = require "astrotheme.lib.util"
  --     require("lualine").setup {
  --       options = {
  --         theme = function() return astrotheme.reload_module("lualine.themes.astrotheme", true) end,
  --       },
  --     }
  --   end,
  -- },

  {
    "yorickpeterse/nvim-pqf",
    opts = {
      signs = {
        error = "",
        warning = "",
        info = "",
        hint = "",
      },
    },
  },
}
