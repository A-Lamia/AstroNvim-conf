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
  {
    "Maan2003/lsp_lines.nvim",
    key = {
      {
        "<leader>uD",
        desc = "Disable lsp lines",
        function()
          require("lsp_lines").toggle()
        end,
      },
    },
    event = "User AstroFile",
    config = function()
      require("lsp_lines").setup()
    end,
  },

  {
    "p00f/clangd_extensions.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function()
      return {
        server = require("astronvim.utils.lsp").config "clangd",
        extensions = { autoSetHints = false },
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "rust" },
    opts = function()
      return {
        server = require("astronvim.utils.lsp").config "rust_analyzer",
        -- tools = { inlay_hints = { auto = false } },
      }
    end,
  },
}
