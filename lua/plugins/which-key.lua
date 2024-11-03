return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      triggers = {
        { "s", mode = { "n", "v" } },
        { "<leader>", mode = { "n", "v" } },
      },
    })
  end,
}
