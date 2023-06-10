return {
  "CRAG666/code_runner.nvim",
  -- lazy = false,
  keys = {
    "<leader>a",
  },
  -- cmd = {
  --   "RunCode",
  -- },
  config = function()
    require("code_runner").setup {
      -- mode = "toggleterm",
      focus = false,
      filetype = {
        odin = "odin run .",
      },
    }
    require("astronvim.utils").set_mappings {
      n = {
        ["<leader>a"] = { ":RunCode<cr>", desc = "Runs code based on file type." },
      },
    }
  end,
}
