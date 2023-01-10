return {
  "nvim-treesitter/nvim-treesitter",
  config = true,
  dependencies = {
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
      }
    },
    {
      "Wansmer/sibling-swap.nvim"
    },
  },
}
