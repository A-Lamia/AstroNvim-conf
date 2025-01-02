return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        ui = {
          border = vim.g.border,
        },
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "lua_ls",
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
