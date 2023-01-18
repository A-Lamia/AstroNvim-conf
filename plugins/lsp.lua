return {
  -- {"neovim/nvim-lspconfig",}
  { "lvimuser/lsp-inlayhints.nvim", config = true },
  -- {
  --   "Maan2003/lsp_lines.nvim",
  --   init = function() table.insert(astronvim.file_plugins, "lsp_lines.nvim") end,
  --   config = function() require("lsp_lines").setup() end,
  -- },

  {
    "p00f/clangd_extensions.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function()
      return {
        server = astronvim.lsp.server_settings "clangd",
        extensions = { autoSetHints = false }
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "rs" },
  },
}
