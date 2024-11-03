return {
  {
    "NeogitOrg/neogit",
    branch = "master",
    cmd = {
      "Neogit",
      "NeogitResetState",
    },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      { "ibhagwan/fzf-lua", enabled = false }, -- optional
    },
    config = true,
  },
}
