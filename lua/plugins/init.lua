local border = require "util.border"

return {

  {
    "dev/spotlight.nvim",
    enabled = false,
    lazy = false,
    dev = true,
    opts = {
      on_init = function()
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { link = "SpotlightNormal" })
        vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "SpotlightTitle" })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "SpotlightBorder" })
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { link = "SpotlightNormal" })
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "SpotlightTitle" })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "SpotlightBorder" })
      end,
      on_open = function()
        pcall(require("astroui.status").heirline.refresh_colors)
      end,
      on_close = function()
        pcall(require("astroui.status").heirline.refresh_colors)
      end,
    },
  },

  ------ disable ------
  ---------------------

  { "goolord/alpha-nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  { "NvChad/nvim-colorizer", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },

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
    opts = function()
      require("util.map").set {
        "<leader>u3",
        "<cmd>TagbarToggle<CR>",
        desc = "Toggle Tagbar",
        mode = "n",
      }
      return {}
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    opts = function()
      require("util.map").set {
        "<leader>u2",
        "<cmd>TroubleToggle<CR>",
        desc = "Toggle Trouble",
      }
      return {}
    end,
  },

  {
    "siawkz/nvim-cheatsh",
    cmd = { "Cheat", "CheatList" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      position = "bottom",
      height = 20,
      width = 100,
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
          local buffer_name = require("util").get_buffer_name()
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
    enabled = false,
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
    enabled = false,
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
    dependencies = {
      "hrsh7th/nvim-cmp",
      opts = {
        sources = {
          { name = "quickgd", priority = 750 },
        },
      },
    },
  },

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
