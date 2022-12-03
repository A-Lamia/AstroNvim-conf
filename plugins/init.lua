return {

  --- disabled ---
  ----------------

  --- CLI ---
  -----------
  { "wsdjeg/vim-fetch" },

  --- Style and UI ---
  --------------------
  {
    "folke/tokyonight.nvim",
  },

  {
    "gen740/SmoothCursor.nvim",
    config = function() require "user.plugins.SmoothCursor" end,
  },

  {
    "zbirenbaum/neodim",
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "neodim") end,
    config = function() require("neodim").setup() end,
  },

  {
    "jinh0/eyeliner.nvim",
    config = function() require "user.plugins.eyeliner" end,
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    module = "lsp-inlayhints",
    config = function() require "user.plugins.lsp-inlayhints" end
  },

  -- {
  --   "Maan2003/lsp_lines.nvim",
  --   opt = true,
  --   setup = function() table.insert(astronvim.file_plugins, "lsp_lines.nvim") end,
  --   config = function() require("lsp_lines").setup() end,
  -- },

  {
    "folke/twilight.nvim",
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "twilight.nvim") end,
    config = function() require "user.plugins.twilight" end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "todo-comments.nvim") end,
    config = function() require("todo-comments").setup {} end,
  },

  {
    "A-Lamia/true-zen.nvim",
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "true-zen.nvim") end,
    config = function() require "user.plugins.true-zen" end,
  },

  {
    "anuvyklack/windows.nvim",
    requires = "anuvyklack/middleclass",
    config = function() require("windows").setup() end,
  },

  --- Functionality ---
  ---------------------

  {
    "kevinhwang91/nvim-hlslens",
    keys = { "/", "?" },
    config = function() require("hlslens").setup() end
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    config = function() require("hop").setup() end,
  },

  {
    "cbochs/grapple.nvim",
    config = function() require "user.plugins.grapple" end
  },

  -- tagbar, needs ctags to work.
  { "preservim/tagbar" },

  { "folke/trouble.nvim" },

  { "RishabhRD/popfix" },

  { "RishabhRD/nvim-cheat.sh" },

  { "gennaro-tedesco/nvim-jqx" },

  -- Renaming --
  --------------
  { "windwp/nvim-spectre" },

  -- Structual Search and Replace
  {
    "cshuaimin/ssr.nvim",
    module = "ssr"
  },

  -- Text manipulation --
  {
    "kylechui/nvim-surround",
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "nvim-surround") end,
    config = function() require("nvim-surround").setup() end,
  },

  -- git --
  {
    "sindrets/diffview.nvim",
    opt = true,
    setup = function() table.insert(astronvim.git_plugins, "diffview.nvim") end
  },

  -- fun --
  { "eandrju/cellular-automaton.nvim" },

  --- Languages ---
  ----------------
  {
    "p00f/clangd_extensions.nvim",
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.clangd_extensions" end,
  },

  { "simrat39/rust-tools.nvim" },

  { "folke/neodev.nvim" },

  { "sbdchd/neoformat" },

  { "tikhomirov/vim-glsl" },

  { "habamax/vim-godot" },
}
