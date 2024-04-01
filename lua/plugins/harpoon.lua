return {
  "ThePrimeagen/harpoon",
  enabled = false,
  branch = "harpoon2",
  -- opts = {},
  config = function()
    local harpoon = require "harpoon"
    -- harpoon:setup()

    require("util.map").set_keymaps {
      n = {
        ["gt"] = {
          function()
            harpoon:list():append()
          end,
          desc = "Tags current buffer",
        },
        ["gp"] = {
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Grapple tag popup menu",
        },
      },
    }
  end,
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
  },
}
