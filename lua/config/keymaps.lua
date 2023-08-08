local macro = require "util.macro"

require("util.map").set_keymaps {
  n = {
    -- Movement
    -- ["j"] = { "v:count == 0 ? 'gj' : 'j'", desc = "Move cursor down" },
    -- ["k"] = { "v:count == 0 ? 'gk' : 'k'", desc = "Move cursor up" },
    ["<M-o>"] = { "o<ESC>", desc = "Create space down" },
    ["<M-O>"] = { "O<ESC>", desc = "Create space up" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    -- Search
    ["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
    ["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },

    ["<S-l>"] = {
      function()
        require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
      end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function()
        require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
      end,
      desc = "Previous buffer",
    },
    ["<M-l>"] = {},
    ["<M-h>"] = {},

    -- Rename
    ["yr"] = { name = " Replace" },
    ["yrw"] = { "yiw:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
    ["yrW"] = { "yiW:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
    ["yre"] = { "ye:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
    ["yrE"] = { "yE:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
    --
    ["<F2>"] = { "y:%s/<C-R>0/", opts = { silent = false } },
    ["<F2><F2>"] = { "y:%s/<C-R>0/", opts = { silent = false } },

    -- delete
    ["d."] = { "viwhd", desc = "Delete extra space" },

    --
    ["U"] = { "<cmd>redo<CR>", desc = "Redo" },

    -- Toggles
    ["<leader>u1"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
  },
  v = {
    ["r"] = { "y:s/\\C\\<<C-R>0\\>/", opts = { silent = false } },
    ["<F2>"] = { "'<'>%s/\\C<C-R>0/", opts = { silent = false } },
    ["<F2><F2>"] = { "'<'>s/\\C<C-R>0/", opts = { silent = false } },

    -- Rename
  },
  i = {
    ["<M-o>"] = { "<C-o>o" },
    ["<M-O>"] = { "<C-o>O" },
    ["<M-l>"] = { "<cmd>><cr>", desc = "indent" },
    ["<M-h>"] = { "<cmd><<cr>", desc = "indent" },
  },
  c = {
    -- ["<CR>"] = { function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>' end }
  },
}
