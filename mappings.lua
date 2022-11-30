-- local unmap = vim.keymap.del
local keyset = require("user.util.keyset")


local color = require("user.util.theme").setup()
local normal = vim.api.nvim_get_hl_by_name("Normal", true)

local function debug()
  print(color.nav_icon_bg .. " " .. color.folder_icon_bg)
end

return {
  n = {
    -- Disable keymaps
    -- ["f"] = false,
    ["gh"] = false,
    -- Hop keymaps
    ["\\"] = { keyset.toggle, desc = "Toggles Key Set" },
    ["<F4>"] = { function() debug() end, desc = "Toggles Key Set" },
    -- ["j"] = { function() keyset.command("HopChar1AC", "<Down>", "n") end,
    --     desc = "Default Move down or if toggled HopChar1AC"
    -- },
    -- ["k"] = { function() keyset.command("HopChar1BC", "<Up>", "n") end,
    --     desc = "Default Move up or if toggled HopChar1BC" },
    -- ["h"] = {
    --     function() keyset.command("HopChar1CurrentLineBC", "<Left>", "n") end,
    --     desc = "Move down or if toggled HopChar1CurrentLineBC",
    -- },
    -- ["l"] = {
    --     function() keyset.command("HopChar1CurrentLineAC", "<Right>", "n") end,
    --     desc = "Default Move down or if toggled HopChar1CurrentLineBC",
    -- },

    ["<M-o>"] = { "o<ESC>" },
    ["<M-O>"] = { "O<ESC>" },

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
    ["<leader>uD"] = { ":lua require('lsp_lines').toggle()<cr>", desc = "Toggle diagnostics lines" },

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
    -- ["<F3>"] = { "<cmd>lua require('spectre').open_visual()<CR>" },
    -- ["<leader>n"] = { "<cmd>'<,'>TZNarrow<CR>", desc = "Focus selected code." },

    -- Hop
    -- ["j"] = { function() KeySet("HopLineAC", "j", "v") end, desc = "Default Move down or if toggled HopChar1AC" },
    -- ["k"] = { function() KeySet("HopLineBC", "k", "v") end, desc = "Default Move up or if toggled HopChar1BC" },
    -- ["h"] = {
    -- function() KeySet("HopChar1CurrentLineBC", "h", "v") end,
    -- desc = "Default Move down or if toggled HopChar1CurrentLineBC",
    -- },
    -- ["l"] = {
    -- function() KeySet("HopChar1CurrentLineAC", "l", "v") end,
    -- desc = "Default Move down or if toggled HopChar1CurrentLineBC",
    -- },
  },
  V = {

  },
  i = {
    ["<M-o>"] = { "<C-o>o" },
    ["<M-O>"] = { "<C-o>O" },

    ["<M-l>"] = { "<cmd>><cr>", desc = "indent" },
    ["<M-h>"] = { "<cmd><<cr>", desc = "indent" },
  },
}
