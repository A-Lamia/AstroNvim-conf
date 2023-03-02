local macro = require "user.util.macro"
local buffer = require("astronvim.utils.buffer")
local astro_utils = require("astronvim.utils")

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
    ["<S-h>"] = { function() buffer.nav( -(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },

    ["<M-l>"] = { function() buffer.move(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<M-h>"] = { function() buffer.move( -(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },

    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },

    -- Rename
    ["yrw"] = { "yiw:s/\\C\\<<C-R>0\\>/" },
    ["yrW"] = { "yiW:s/\\C\\<<C-R>0\\>/" },
    ["yre"] = { "yie:s/\\C\\<<C-R>0\\>/" },
    ["yrE"] = { "yiE:s/\\C\\<<C-R>0\\>/" },

    ["<F2>"] = { "y:%s/<C-R>0/" },
    ["<F2><F2>"] = { "y:%s/<C-R>0/" },
    ["<F3>"] = { "<cmd>lua require('spectre').open()<cr>" },
    ["<F3><F3>"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
    ["<leader>r"] = { function() require("ssr").open() end, desc = "SSR" },

    -- Telescope
    ["<C-p>"] = { "<cmd>Telescope fd<CR>", desc = "Activates Telescope fd" },
    ["<C-S-p>"] = { "<cmd>Telescope commands<CR>", desc = "Activates Telescope commands" },
    ["<C-f>"] = { "<cmd>Telescope live_grep<CR>", desc = "Activates Telescope live_grep" },
    -- ["<C-b>"] = { "<cmd>Telescope file_browser<CR>" },
    -- ["<C-z>"] = { "<cmd>Telescope undo<CR>" },

    --
    ["<leader>n"] = { "<cmd>ZenMode<CR>", desc = "Centers and mutes code" },

    ["<leader>u1"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
    ["<leader>u2"] = { "<cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
    ["<leader>u3"] = { "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },

    ["sj"] = { "<cmd>TSJToggle<CR>", desc = "Treesj toggle" },

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
