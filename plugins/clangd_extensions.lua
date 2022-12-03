require("clangd_extensions").setup {
  server = astronvim.lsp.server_settings "clangd",
  extensions = { autoSetHints = false },
}
