local macro = require "user.util.macro"
local buffer = require "astronvim.utils.buffer"

return {
  n = {
    -- Disable keymaps
    ["gh"] = false,
    ["s"] = false,
    ["Q"] = false,
    -- Movement
    ["<M-o>"] = { "o<ESC>" },
    ["<M-O>"] = { "O<ESC>" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
    ["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },
    ["<S-l>"] = { function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-h>"] = { function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<M-l>"] = { function() buffer.move(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<M-h>"] = { function() buffer.move(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    -- Rename
    ["yrw"] = { "yiw:s/\\C\\<<C-R>0\\>/" },
    ["yrW"] = { "yiW:s/\\C\\<<C-R>0\\>/" },
    ["yre"] = { "ye:s/\\C\\<<C-R>0\\>/" },
    ["yrE"] = { "yE:s/\\C\\<<C-R>0\\>/" },
    ["yrb"] = { "yt(:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "y:%s/<C-R>0/" },
    ["<F2><F2>"] = { "y:%s/<C-R>0/" },
    -- delete
    ["d."] = { "viwhd" },
    ---------
    ["<leader>u1"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
  },
  v = {
    ["r"] = { "y:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "'<'>%s/\\C<C-R>0/" },
    ["<F2><F2>"] = { "'<'>s/\\C<C-R>0/" },

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
