return {
  ------ disable ------
  ---------------------

  { "goolord/alpha-nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  ------ Visuals ------
  ---------------------

  {
    "wsdjeg/vim-fetch",
    lazy = false
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
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      dark_variant = "moon",
      disable_italics = "true",
      disable_float_background = "true",
    },
  },
  {
    "gen740/SmoothCursor.nvim",
    cond = vim.g.neovide == nil,
    lazy = false,
    opts = {
      autostart = true,
      fancy = { enable = true }
    }
  },

  {
    "zbirenbaum/neodim",
    init = function() table.insert(astronvim.file_plugins, "neodim") end,
    opts = {
      alpha = 0.75
    }
  },

  {
    "folke/todo-comments.nvim",
    init = function() table.insert(astronvim.file_plugins, "todo-comments.nvim") end,
    config = true,
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
    }
  },

  {
    "phaazon/hop.nvim",
    enabled = false,
    lazy = false,
    config = function()
      local hop = require('hop')
      hop.setup()
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end
  },

  {
    "ggandor/leap.nvim",
    enabled = false,
    lazy = false,
    dependencies = {
      {
        "ggandor/flit.nvim",
        opts = {
          multiline = false,
        }
      }
    }
  },

  --- Functionality ---
  ---------------------

  {
    "cbochs/grapple.nvim",
    lazy = false,
    config = function()
      require("grapple").setup({
        setup = require("grapple.scope").fallback({
          require("grapple").resolvers.lsp_fallback,
          require("grapple").resolvers.git_fallback,
          require("grapple").resolvers.static
        })
      })
    end
  },

  -- tagbar, needs ctags to work.
  { "preservim/tagbar" },

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
    opts = {
      min_width = 50,
      min_height = 5,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_all = "<leader><cr>",
      }
    }
  },

  -- Text Manipulation --
  -----------------------

  {
    "echasnovski/mini.ai",
    init = function() table.insert(astronvim.file_plugins, "mini.ai") end,
    config = function()
      require("mini.ai").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    init = function() table.insert(astronvim.file_plugins, "nvim-surround") end,
    opts = {
      keymaps = {
        normal = "sa",
        normal_cur = "sv",
        normal_line = "ss",
        normal_curl_line = "sS",
        visual = "s",
        delete = 'sd',
        change = 'sr',
      },
      aliases = {
        ["u"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
    }
  },

  ------ git ------
  -----------------

  {
    "sindrets/diffview.nvim",
    init = function() table.insert(astronvim.git_plugins, "diffview.nvim") end
  },

  --- Languages ---
  -----------------

  { "folke/neodev.nvim" },

  { "sbdchd/neoformat" },

  { "tikhomirov/vim-glsl" },

  { "habamax/vim-godot" },

  ------ fun ------
  -----------------

  { "eandrju/cellular-automaton.nvim" },
}
