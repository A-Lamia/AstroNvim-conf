local macro = require "macro"

require("util.map").set_keymaps {
  { "s", group = "Surround / Search / Split", icon = "" },
  {
    mode = "n",
    { "<M-f>", macro.toggle_fold, desc = "Fold toggle" },

    -- Movement
    { "<M-o>", "o<ESC>", desc = "Create space down" },
    { "<M-O>", "O<ESC>", desc = "Create space up" },
    { "<C-d>", "<C-d>zz", desc = "Center scroll up" },
    { "<C-u>", "<C-u>zz", desc = "Center scroll down" },

    -- Search
    { "n", macro.better_search "n", desc = "Next search with center and unfold" },
    { "N", macro.better_search "N", desc = "previous search with center and unfold" },

    -- Tab Navigation
    { "<S-l>", macro.focus_right_buffer, desc = "Focus next buffer" },
    { "<S-h>", macro.focus_left_buffer, desc = "Focus previous buffer" },

    -- Rename
    {
      silent = false,
      { "yr", group = "Replace", icon = "" },
      { "yrw", "yiw:s/\\C\\<<C-R>0\\>/", desc = "Replace word strict" },
      { "yre", "yiw:s/\\C<C-R>0/", desc = "Replace word loose" },
      { "yrg", macro.replace.under_cursor, desc = "global replace" },
    },

    --

    { "d.", "viwhd", desc = "Delete extra space" },

    { "U", "<cmd>redo<CR>", desc = "Redo" },
  },
  {
    mode = "v",
    { "r", "y:s/\\C\\<<C-R>0\\>/", silent = false },
  },
  {
    mode = "i",
    { "<M-o>", "<C-o>o" },
    { "<M-O>", "<C-o>O" },
    { "<M-l>", "<cmd>><cr>", desc = "indent" },
    { "<M-h>", "<cmd><<cr>", desc = "indent" },
  },
}
