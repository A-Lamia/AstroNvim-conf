return {
  "echasnovski/mini.files",
  enabled = true,
  keys = {
    {
      "<leader>e",
      function()
        if vim.bo.filetype == "minifiles" then
          require("mini.files").close()
        else
          require("mini.files").open()
        end
      end,
      desc = "Open Explorer",
    },
    {
      "<leader>o",
      function()
        local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
        if vim.bo.filetype == "minifiles" then
          require("mini.files").close()
        else
          require("mini.files").open(dir)
        end
      end,
      desc = "Open Explorer in Current Dir",
    },
  },
  version = false,
  opts = {},
}
