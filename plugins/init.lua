return {
  { "goolord/alpha-nvim", enabled = false },

  { "jayp0521/mason-nvim-dap.nvim", enabled = false },

  {
    "wsdjeg/vim-fetch",
    lazy = false
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
  },

  {
    "gen740/SmoothCursor.nvim",
    cond = vim.g.neovide,
    opts = {
      fancy = {
        enable = true,
      },
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
    "jinh0/eyeliner.nvim",
    lazy = false,
    opts = {
      highlight_on_key = true,
      dim = true,
    }
  },

  {
    "folke/todo-comments.nvim",
    init = function() table.insert(astronvim.file_plugins, "todo-comments.nvim") end,
  },

  {
    "A-Lamia/true-zen.nvim",
    init = function() table.insert(astronvim.file_plugins, "true-zen.nvim") end,
    dependencies = {
      "folke/twilight.nvim",
      opts = {
        context = 20,
      }
    },
    opts = {
      modes = {
        narrow = {
          folds_style = "invisible",
        },
      },
      integrations = {
        twilight = false
      },
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
    dependencies = { "RishabhRD/popfix" },
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

  -- Text manipulation --

  {
    "kylechui/nvim-surround",
    enabled = false,
    init = function() table.insert(astronvim.file_plugins, "nvim-surround") end,
    config = true,
  },

  {
    "machakann/vim-sandwich",
    init = function() table.insert(astronvim.file_plugins, "nvim-surround") end,
    config = true
  },

  -- git --
  {
    "sindrets/diffview.nvim",
    init = function() table.insert(astronvim.git_plugins, "diffview.nvim") end
  },

  -- fun --
  { "eandrju/cellular-automaton.nvim" },

  --- Languages ---
  -----------------

  { "folke/neodev.nvim" },

  { "sbdchd/neoformat" },

  { "tikhomirov/vim-glsl" },

  { "habamax/vim-godot" },
}
