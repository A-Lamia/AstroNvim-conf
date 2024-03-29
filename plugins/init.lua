local border = require "user.util.border"

return {

  {
    "dev/spotlight.nvim",
    enabled = false,
    lazy = false,
    dev = true,
    -- opts = {},
    config = function()
      require("spotlight").setup()
    end,
  },

  ------ disable ------
  ---------------------

  { "goolord/alpha-nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  { "NvChad/nvim-colorizer", enabled = false },

  ------ Visuals ------
  ---------------------

  {
    "wsdjeg/vim-fetch",
    lazy = false,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    -- lazy = false,
  },

  {
    "kvrohit/mellow.nvim",
    -- lazy = false,
  },

  -- {
  --   "ziontee113/color-picker.nvim",
  --   cmd = { "PickColor", "PickColorInsert" },
  --   config = true,
  -- },

  {
    "uga-rosa/ccc.nvim",
    event = "User AstroFile",
    keys = { { "<leader>uC", "<cmd>CccPick<cr>", desc = "Toggle colorizer" } },
    opts = { highlighter = { auto_enable = true } },
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
    enabled = false,
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

  {
    "echasnovski/mini.ai",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    opts = function()
      local treesitter = require("mini.ai").gen_spec.treesitter
      return {
        n_lines = 500,
        custom_textobjects = {
          c = treesitter { a = "@class.outer", i = "@class.inner" },
          f = treesitter { a = "@function.outer", i = "@function.inner" },
          k = treesitter { a = "@block.outer", i = "@block.inner" },
          o = treesitter {
            a = { "@conditional.outer", "@loop.outer" },
            i = { "@conditional.inner", "@loop.inner" },
          },
        },
      }
    end,
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
        function()
          require("ssr").open()
        end,
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
