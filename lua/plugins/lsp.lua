return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        clangd = { capabilities = { offsetEncoding = "utf-8" } },
        gdscript = { cmd = { "ncat", "120.0.0.1", "6008" } },
        gopls = {
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
        lus_ls = {
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
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
              },
            },
          },
        },
        ruff_lsp = {
          on_attach = function(client, buffer)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.renameProvider = false
          end,
        },
        rust = {
          settings = {
            rust = {
              inlayHints = {
                bindingModeHints = {
                  enable = false,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
                closureReturnTypeHints = {
                  enable = "never",
                },
                lifetimeElisionHints = {
                  enable = "never",
                  useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = "never",
                },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
            },
          },
        },
        sqls = {
          on_attach = function(...)
            require("sqls").on_attach(...)
          end,
        },
        tsserver = {
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
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
      servers = { "gdscript", "ols" },
      handlers = {
        rust_analyzer = false,
      },
      features = {
        diagnostics_mode = 2,
      },
      diagnostics = {
        update_in_insert = false,
        virtual_lines = {
          only_current_line = true,
        },
      },
      formatting = {
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
    },
  },
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
        server = require("astrolsp.config").config.clangd,
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
        server = require("astrolsp.config").config.rust_analyzer,
        tools = { inlay_hints = { auto = false } },
      }
    end,
  },
}
