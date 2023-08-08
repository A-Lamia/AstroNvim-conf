return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "neocmake",
        "html",
        "cssls",
        "jsonls",
        "lua_ls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "prettierd",
        "stylua",
        -- "ruff",
        "ruff-lsp",
      },
    },
    config = function(_, opts)
      local mason_null_ls = require "mason-null-ls"
      local null_ls = require "null-ls"
      mason_null_ls.setup(opts)
      mason_null_ls.setup {
        prettierd = function()
          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            extra_filetypes = { "json", "markdown", "css" },
          })
        end,
      }
    end,
  },
}
