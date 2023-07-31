local border = require "user.util.border"

return {
  ------ disable ------
  ---------------------

  { "goolord/alpha-nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  ------ Visuals ------
  ---------------------

  {
    "wsdjeg/vim-fetch",
    lazy = false,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    -- lazy = false,
  },

  {
    "kvrohit/mellow.nvim",
    -- lazy = false,
  },

  {
    "gen740/SmoothCursor.nvim",
    cond = vim.g.neovide == nil,
    lazy = false,
    opts = {
      autostart = true,
      fancy = { enable = true },
    },
  },

  {
    "zbirenbaum/neodim",
    event = "User AstroFile",
    opts = {
      alpha = 0.75,
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "User AstroFile",
    config = true,
  },

  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      return require("astronvim.utils").extend_tbl(opts, {
        window = {
          winblend = vim.g.winblend,
        },
      })
    end,
  },

  ------ movement ------
  ----------------------

  {
    "jinh0/eyeliner.nvim",
    -- enabled = false,
    lazy = false,
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },

  {
    "TheSafdarAwan/find-extender.nvim",
    enabled = false,
    keys = { "f", "F", "F", "T", "t", "t", "T" },
    config = true,
  },

  --- Functionality ---
  ---------------------

  -- tagbar, needs ctags to work.
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    config = function()
      require("astronvim.utils").set_mappings {
        n = {
          ["<leader>u3"] = { "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },
        },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("astronvim.utils").set_mappings {
        n = {
          ["<leader>u2"] = { "<cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
        },
      }
    end,
  },

  {
    "RishabhRD/nvim-cheat.sh",
    dependencies = {
      "RishabhRD/popfix",
    },
  },

  { "gennaro-tedesco/nvim-jqx" },

  -- Renaming --
  --------------
  ---
  {
    "windwp/nvim-spectre",
    cmd = { "Spectre" },
    keys = {
      {
        "<F3>",
        function()
          local spectre = require "spectre"
          local buffer_name = require("user.util.fn").get_buffer_name()
          if buffer_name ~= "spectre" then
            spectre.open()
          else
            spectre.close()
          end
        end,
        desc = "Toggle Spectre",
      },
    },
    config = true,
  },

  -- Structual Search and Replace
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>r",
        function() require("ssr").open() end,
        desc = "Structual Search And Replace",
      },
    },
    opts = {
      border = border.default[vim.g.border],
    },
  },

  {
    "AckslD/muren.nvim",
    enabled = false,
    lazy = false,
    cmd = { "MurenToggle", "MurenFresh" },
    keys = {
      {
        "<leader>rr",
        "<cmd>MurenToggle<cr>",
        desc = "Replace",
      },
      {
        "<leader>rf",
        "<cmd>MurenFresh<cr>",
        desc = "Replace Fresh",
      },
    },
    config = true,
  },

  {
    "hiphish/rainbow-delimiters.nvim",
    lazy = false,
  },

  -- Text Manipulation --
  -----------------------

  ------ git ------
  -----------------

  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
  },

  --- Languages ---
  -----------------

  {
    "QuickGD/quickgd.nvim",
    dev = true,
    ft = { "gdshader", "gdshaderinc" },
    cmd = {
      "GodotRun",
      "GodotRunLast",
      "GodotStart",
    },
    init = function()
      vim.filetype.add {
        extension = {
          gdshaderinc = "gdshaderinc",
        },
      }
    end,
    config = true,
  },

  { "sbdchd/neoformat" },

  ------ fun ------
  -----------------

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    keys = {
      {
        "<leader>u4",
        "<cmd>CellularAutomaton make_it_rain<cr>",
        desc = "Make It Rain",
      },
    },
    config = true,
  },
}
