return {
  "CRAG666/code_runner.nvim",
  cmd = "RunCode",
  keys = {
    {
      "<leader>a",
      "<cmd>RunCode<cr>",
      desc = "Run Code",
    },
  },
  opts = {
    -- mode = "toggleterm",
    focus = false,
    filetype = {
      odin = "odin run .",
      cpp = {
        "cd $dir &&",
        "xmake run",
      },
    },
  },
}
