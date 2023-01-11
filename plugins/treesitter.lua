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
      "Wansmer/sibling-swap.nvim",
      opts = {
        keymaps = {
          ['sl'] = 'swap_with_right',
          ['sh'] = 'swap_with_left',
          -- ['sL'] = 'swap_with_right_with_opp',
          -- ['sH'] = 'swap_with_left_with_opp',
        }
      }
    },
  },
}
