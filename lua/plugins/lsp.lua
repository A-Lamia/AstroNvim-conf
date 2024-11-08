local cwd = vim.fn.getcwd()
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        clangd = { capabilities = { offsetEncoding = "utf-8" } },
        gdscript = {
          -- cmd = { "ncat", "127.0.0.1", "-P", "6008" },
          cmd = { "ncat", "127.0.0.1", "6008" },
          root_dir = require("lspconfig.util").root_pattern("project.godot", ".git", ".godot"),
        },
        gopls = {
          cmd = { "C:/Users/Abdul/AppData/Local/nvim-data/mason/bin/gopls.cmd" },
          root_dir = require("lspconfig.util").root_pattern("go.mod", "go.work", ".git"),
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        lua_ls = {
          root_dir = require("lspconfig.util").root_pattern(".git", cwd),
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
            },
          },
        },
        ols = {
          cmd = { "ols" },
          filetypes = { "odin" },
          root_dir = require("lspconfig.util").root_pattern("ols.json", ".git", "main.odin"),
          single_file_support = true,
        },
        nushell = {
          cmd = { "nu", "--lsp", "--no-config-file" },
          filetypes = { "nu" },
          root_dir = require("lspconfig.util").root_pattern(".git", "config.nu", "env.nu"),
          single_file_support = true,
        },
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              disableTaggedHints = true,
              analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                  reportUndefinedVariable = "none",
                  reportUnusedExpression = "none",
                  reportOptionalMemberAccess = "none",
                },
              },
            },
          },
        },
        ruff = {
          cmd = { "ruff", "server" },
          init_options = {
            settings = {
              args = {
                "--ignore=F821",
              },
            },
          },
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.renameProvider = false
          end,
        },
        sqls = {
          on_attach = function(...)
            require("sqls").on_attach(...)
          end,
        },
        asm_lsp = {
          filetypes = { "asm", "vmasm", "s" },
          root_dir = require("lspconfig.util").root_pattern(
            ".asm-lsp.toml",
            ".git",
            "main.asm",
            cwd
          ),
        },
      },
      servers = { "gdscript", "ols", "gopls", "nushell" },

      features = {
        autoformat = false,
        diagnostics_mode = 2,
      },

      diagnostics = {
        update_in_insert = false,

        virtual_lines = {
          only_current_line = true,
        },
      },

      formatting = {
        format_on_save = {
          enabled = false,
        },
        disabled = { "lua_ls" },
      },

      on_attach = function(client, bufnr)
        local border = require "util.border"
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = border.default[vim.g.border],
        })
        vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = border.default[vim.g.border],
          })
        vim.diagnostic.config {
          float = { border = border.default[vim.g.border] },
        }
      end,
      capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              commitCharactersSupport = false,
              deprecatedSupport = true,
              documentationFormat = { "markdown", "plaintext" },
              insertReplaceSupport = true,
              insertTextModeSupport = {
                valueSet = { 1 },
              },
              labelDetailsSupport = true,
              preselectSupport = false,
              resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } },
              snippetSupport = true,
              tagSupport = { valueSet = { 1 } },
            },
            completionList = {
              itemDefaults = {
                "commitCharacters",
                "editRange",
                "insertTextFormat",
                "insertTextMode",
                "data",
              },
            },
            contextSupport = true,
            insertTextMode = 1,
          },
        },
      },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    -- pin = true,
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
      vim.diagnostic.config {
        virtual_text = false,
        virtual_lines = {
          only_current_line = true,
        },
      }
    end,
  },

  {
    "p00f/clangd_extensions.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function()
      return {
        server = require("astrolsp.config").config.clangd,
        extensions = { autoSetHints = false },
      }
    end,
  },
}
