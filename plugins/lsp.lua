return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust_analyzer",
      },
    },
  },
  -- {"neovim/nvim-lspconfig",}
  { "lvimuser/lsp-inlayhints.nvim", config = true },
  {
    "Maan2003/lsp_lines.nvim",
    event = "User AstroFile",
    config = function() require("lsp_lines").setup() end,
  },

  {
    "p00f/clangd_extensions.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function()
      return {
        server = astronvim.lsp.server_settings "clangd",
        extensions = { autoSetHints = false },
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "rs" },
    opts = function()
      return {
        server = astronvim.lsp.server_settings "rust_analyzer",
      }
    end,
  },
}
