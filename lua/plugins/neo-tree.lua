return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  branch = "main",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", (opts or {}), {
      sources = {
        "filesystem",
      },
      add_blank_line_top = true,
      hide_root_node = true,
      retain_hidden_root_indent = true,
      enable_git_status = true,
      source_selector = {
        winbar = false,
      },
      git_status_async = true,
      window = {
        position = "right",
      },
      -- log_level = "trace",
      -- log_to_file = true,
    })
  end,
}
