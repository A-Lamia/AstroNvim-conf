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
  },

  { "folke/trouble.nvim" },

  {
    "RishabhRD/nvim-cheat.sh",
    dependencies = {
      "RishabhRD/popfix",
    },
  },

  { "gennaro-tedesco/nvim-jqx" },

  -- Renaming --
  --------------
  { "windwp/nvim-spectre" },

  -- Structual Search and Replace
  {
    "cshuaimin/ssr.nvim",
    ft = "<leader>r",
    opts = {
      min_width = 50,
      min_height = 5,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_all = "<leader><cr>",
      },
    },
  },

  -- Text Manipulation --
  -----------------------

  {
    "echasnovski/mini.ai",
    event = "User AstroFile",
    config = function() require("mini.ai").setup() end,
  },

  {
    "kylechui/nvim-surround",
    event = "User AstroFile",
    opts = {
      keymaps = {
        normal = "sa",
        normal_cur = "sv",
        normal_line = "ss",
        normal_curl_line = "sS",
        visual = "s",
        delete = "sd",
        change = "sr",
      },
      aliases = {
        ["u"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
    },
  },

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
    -- dev = true,
    ft = "gdshader",
    cmd = {
      "GodotRun",
      "GodotRunLast",
      "GodotStart",
    },
    config = function()
      local quickgd = require "quickgd"
      quickgd.setup()
      quickgd.treesitter()
      quickgd.cmp()
    end,
  },

  { "folke/neodev.nvim" },

  { "sbdchd/neoformat" },

  ------ fun ------
  -----------------

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    config = true,
  },
}
