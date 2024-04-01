return {
  "stevearc/conform.nvim",
  enabled = true,
  opts = {
    format_after_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}
