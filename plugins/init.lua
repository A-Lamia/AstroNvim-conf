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
    config = function() require("neodim").setup() end,
  },

  {
    "jinh0/eyeliner.nvim",
    config = function() require "user.plugins.eyeliner" end,
  },

  {
    "Maan2003/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end,
  },

  {
    "folke/twilight.nvim",
    config = function() require "user.plugins.twilight" end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end,
  },

  {
    "pocco81/true-zen.nvim",
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
    config = function() require("hlslens").setup() end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    config = function() require("hop").setup() end,
  },

  -- { "ggandor/leap.nvim",
  --   requires = "tpope/vim-repeat",
  --   config = function() require "user.plugins.leap" end
  -- },

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
    config = function() require("nvim-surround").setup() end,
  },

  -- git --
  { "sindrets/diffview.nvim" },

  -- fun --
  { "eandrju/cellular-automaton.nvim" },

  --- Languages ---
  ----------------
  { "folke/neodev.nvim" },

  { "sbdchd/neoformat" },

  { "tikhomirov/vim-glsl" },

  { "habamax/vim-godot" },
}
