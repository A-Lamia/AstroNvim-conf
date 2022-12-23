local macro = require "user.util.macro"

return {
  n = {
    -- Disable keymaps
    ["gh"] = false,

    -- Movement
    ["<M-o>"] = { "o<ESC>" },
    ["<M-O>"] = { "O<ESC>" },

    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    ["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
    ["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },

    -- Rename
    ["yrw"] = { "yiw:s/\\C\\<<C-R>0\\>/" },
    ["yrW"] = { "yiW:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "y:%s/<C-R>0/" },
    ["<F2><F2>"] = { "y:s/<C-R>0/" },
    ["<F3>"] = { "<cmd>lua require('spectre').open()<cr>" },
    ["<F3><F3>"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
    ["<leader>r"] = { function() require("ssr").open() end, desc = "SSR" },

    --
    ["<C-p>"] = { "<cmd>Telescope fd<CR>", desc = "Activates Telescope fd" },
    ["<C-f>"] = { "<cmd>Telescope live_grep<CR>", desc = "Activates Telescope live_grep" },
    ["<leader>n"] = { "<cmd>TZAtaraxis<CR>", desc = "Centers and mutes code" },

    ["<leader>u1"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
    ["<leader>u2"] = { "<cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
    ["<leader>u3"] = { "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },

    -- Others
    ["<F12>"] = { "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Toggle Tagbar" },
    ["<leader>uD"] = { ":lua require('lsp-inlayhints').toggle()<cr>", desc = "Toggle inlay hints" },

    -- Grapple
    ["gt"] = { ":GrappleToggle<cr>", desc = "Tags current buffer" },
    ["gp"] = { ":GrapplePopup tags<cr>", desc = "Grapple tag popup menu" },
  },
  v = {
    ['r'] = { "y:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "'<'>%s/\\C<C-R>0/" },
    ["<F2><F2>"] = { "'<'>s/\\C<C-R>0/" },
    -- ["\\"] = { ToggleKeySet, desc = "Toggles Key Set" },

    -- Rename
    ["<leader>n"] = { "<cmd>'<,'>TZNarrow<CR>", desc = "Focus selected code." },
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
