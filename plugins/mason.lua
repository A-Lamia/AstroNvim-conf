return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "html",
        "neocmake",
        "jsonls",
        "pyright",
        "lua_ls"
      },
    },
  },
}
